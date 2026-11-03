<#
.SYNOPSIS
    Regenerates generated/dependencies.rstinc from the .deps.json files of Simplifier Release builds.

.DESCRIPTION
    A .deps.json file in the build output of a project lists every NuGet package the build ships,
    with its exact version. The .deps.json files of the Release builds of the projects that are
    deployed (the Simplifier web app and the Clovis.Silo Orleans silo) are passed to SPDXtoRST
    (https://github.com/FirelyTeam/SPDXtoRST), which looks up the license of each package and
    writes the rst include file, with a Version column.

    Simplifier.Bcl and Simplifier.QualityControl come in as NuGet packages, so their dependencies
    are part of these .deps.json files. Packages that only ship content files (the FHIR specification
    zips) are not in a .deps.json, so they are passed separately, see -ContentPackages.

    The .deps.json files of the Release builds of the test projects are passed as the UnitTest
    section: packages only the tests use are listed under "For unit testing".

    Licenses are read from the .nuspec files in the local NuGet package cache first, so run this
    script on the machine that made the builds.

    Requires a Release build of the release you document (the production branch), e.g.
    dotnet build Simplifier.Test/Simplifier.Test.csproj -c Release -p:ViteBuild=false
    and dotnet build Clovis.Silo/Clovis.Silo.csproj -c Release, and the .NET SDK to run SPDXtoRST.

.EXAMPLE
    ./tools/Update-Dependencies.ps1

.EXAMPLE
    ./tools/Update-Dependencies.ps1 -SimplifierPath K:\dev\Firely\simplifier -SpdxToRstPath K:\dev\Firely\SPDXtoRST
#>
[CmdletBinding()]
param(
    # Folder of the simplifier repository clone that holds the builds.
    [string] $SimplifierPath = (Join-Path $PSScriptRoot '..\..\simplifier'),

    # Projects that are deployed.
    [string[]] $Projects = @('Simplifier', 'Clovis.Silo'),

    # Test projects whose packages are listed under "For unit testing".
    [string[]] $TestProjects = @('Simplifier.Test'),

    # Packages that ship only content files (copied by the project itself), which .deps.json does not list.
    [string[]] $ContentPackages = @('Hl7.Fhir.Specification.Data.STU3', 'Hl7.Fhir.Specification.Data.R4',
        'Hl7.Fhir.Specification.Data.R4B', 'Hl7.Fhir.Specification.Data.R5'),

    # Folder of the SPDXtoRST project (a clone of FirelyTeam/SPDXtoRST).
    [string] $SpdxToRstPath = (Join-Path $PSScriptRoot '..\..\SPDXtoRST'),

    [string] $OutputFile = (Join-Path $PSScriptRoot '..\generated\dependencies.rstinc'),

    # Simplifier specific SPDXtoRST config, applied on top of SPDXtoRST's own config.json.
    [string] $ConfigFile = (Join-Path $PSScriptRoot 'dependencies.config.json')
)

$ErrorActionPreference = 'Stop'

$project = Join-Path $SpdxToRstPath 'SPDXtoRST.csproj'
if (-not (Test-Path $project)) {
    throw "SPDXtoRST project not found at '$project'. Clone https://github.com/FirelyTeam/SPDXtoRST or pass -SpdxToRstPath."
}

# Simplifier builds to artifacts\bin\<project>\release (UseArtifactsOutput).
function Find-DepsJson([string] $ProjectName) {
    $depsJson = Get-Item (Join-Path $SimplifierPath "artifacts\bin\$ProjectName\release\$ProjectName.deps.json") -ErrorAction SilentlyContinue

    if (-not $depsJson) {
        throw "No $ProjectName.deps.json found under '$SimplifierPath\artifacts\bin\$ProjectName\release'. Build $ProjectName in the Release configuration first."
    }

    Write-Host ("{0,-32} (built {1:yyyy-MM-dd HH:mm})" -f $depsJson.Name, $depsJson.LastWriteTime)
    $depsJson.FullName
}

$files = @(foreach ($p in $Projects) { Find-DepsJson $p })

# The content packages go in as a small SPDX file, with the versions restore resolved for the first project.
$assets = Get-Content (Join-Path $SimplifierPath "artifacts\obj\$($Projects[0])\project.assets.json") -Raw | ConvertFrom-Json
$spdxPackages = @(foreach ($name in $ContentPackages) {
    $library = $assets.libraries.PSObject.Properties.Name | Where-Object { $_ -like "$name/*" } | Select-Object -First 1
    if (-not $library) {
        throw "$name not found in the restore output of $($Projects[0])."
    }
    @{ SPDXID = "SPDXRef-nuget-$name"; name = $name; versionInfo = $library.Split('/')[1] }
})
$contentSpdx = Join-Path ([IO.Path]::GetTempPath()) 'Simplifier.content.spdx.json'
@{ packages = $spdxPackages } | ConvertTo-Json -Depth 3 | Set-Content $contentSpdx
$files += $contentSpdx

$testFiles = @(foreach ($p in $TestProjects) { Find-DepsJson $p })
$sections = @('--section', "UnitTest=$($testFiles -join [IO.Path]::PathSeparator)")

$branch = git -C $SimplifierPath branch --show-current 2>$null
$commit = git -C $SimplifierPath describe --tags 2>$null
if ($commit) {
    Write-Host "simplifier clone is on '$branch' at $commit. Make sure the builds above are from the release you document."
}

Write-Host 'Running SPDXtoRST...'
$output = [IO.Path]::GetFullPath($OutputFile)
dotnet run --project $project --configuration Release -- @files @sections --config ([IO.Path]::GetFullPath($ConfigFile)) --show-version --output $output
if ($LASTEXITCODE -ne 0) {
    throw "SPDXtoRST failed with exit code $LASTEXITCODE."
}

Write-Host "Updated $output"
