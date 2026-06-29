A typical example
=================

This is a typical example of a package creation script, with each step explained. We have broken the script up into single pipelines and describe what each one does.

**1. Get active resources.** Move all files that contain a FHIR conformance resource (profiles, extensions, etc.) with the status 'active'. We put these files into a temporary bucket called 'staging', which helps us group files that we need later. We also define the destination folder: 'package', where all conformance resources in a FHIR package should end up.

::

   move-active-resources:
     - category: Conformance
     - filter: status='active'
     - move: /package/
     - target: staging

**2. Examples.** Take all FHIR resources of the category 'Instance' (so no conformance or terminology resources), like an example Patient or Organization. We add these to the staging bucket too, but move them into a subfolder of the package called 'examples'.

::

   move-examples:
     - category: Instance
     - move: /package/examples
     - target: staging

**3. YamlGen.** Take all YamlGen script files that can generate resources, let YamlGen run these scripts to generate the resources, and move them into a folder called 'generated'. This also goes into the staging bucket.

::

   yaml-gen:
     - files: /**/*.gen.yaml
     - action: yamlgen
     - move: /package/generated/
     - target: staging

**4. Run FSH files.** Just as with YamlGen, FSH generates FHIR resources. This pipeline runs the Sushi tool on the FSH scripts and puts the generated resource files into the same 'generated' subfolder.

::

   sushi:
     - files: /**/*.fsh
     - action: sushi
     - move: /package/generated/
     - target: staging

**5. JSON transform.** The FHIR package spec states that all resource files in a FHIR package should be formatted as JSON, to make it simpler for other tool builders to ingest package content. This pipeline takes all resources in the ``staging`` bucket and transforms them to JSON if they are not JSON yet. Note that we no longer define a temporary bucket, so this pipeline puts all content into the real output: your package.

::

   to-json:
     - source: staging
     - category: Resource
     - transform: json

**6. Adding a package manifest.** A package is not valid if it does not contain a package manifest. So we take the ``package.json`` file from your source folder (or Simplifier project) and add it to the package folder.

::

   manifest:
     - files: package.json
     - move: /package

**7. Adding a package index.** Not all client tools know how to generate an index of your package content, so the FHIR package specification states that a package *should* have an index file to make it easy to assess its contents. We take all files in the output (they are not deleted from the output) and give them to the ``create-package-index`` action, which analyses all resources in the output and generates an index file with metadata about them.

::

   index-file:
     - source: output
     - files: /package/**/*.json
     - action: create-package-index
     - move: /package

**8. Done.** Your package is ready to go.
