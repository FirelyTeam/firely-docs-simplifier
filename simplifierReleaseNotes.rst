.. _release_notes:

Release Notes
=============

This page contains the release notes of simplifier.net.


Simplifier 2026.6, November 3rd, 2026
-------------------------------------------
You can find the related news article on `Simplifier. <https://simplifier.net/organization/firely/news/247>`_

Private profiles and team members
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Team managers can now make the members of a team private on the new ``Team settings`` page, by turning off ``Show team members publicly``. Members of a private team are hidden from anyone outside that team: on the team tab, in the feed, on project pages, in the journal, in file history and on user profiles. Existing teams stay public until a manager changes this. See :ref:`hide_team_members`.
- Team owners now see the ``Last login`` of their team members, as a range such as "this month" or "over a year ago", so they can tell which members are still active.
- Users can now make their profile private in their account settings. A private profile page only opens for its owner and is no longer linked anywhere on Simplifier; the name is still shown, as plain text.
- The project log, import log, journal and organization news now show a user's display name instead of their username. Users can change their display name themselves under Account > Personal, and the logs follow when they do.

Mermaid diagrams
~~~~~~~~~~~~~~~~

- Mermaid diagrams now render in guides, both inline with the ``<mermaid>`` tag and from a Mermaid file (``.mmd`` or ``.mermaid``) with ``{{render:}}``.
- They also render in project readmes, issues and comments, and in embeds. Mermaid files are accepted on import. See :ref:`mermaid`.
- The guide editor has Mermaid snippets under ``Insert snippet``.
- New `Mermaid playground <https://simplifier.net/mermaid>`_, with share links, to try a diagram before it goes into a guide. Invalid syntax shows an error message.

.. note::
   Guides with a custom style copied before this release need one script line in their master template to show Mermaid diagrams. See :ref:`mermaid_custom_style`.

Security
~~~~~~~~

- Fixed a set of authorization issues found in our security review, where actions on projects, packages, guides, teams and organizations did not check every value sent with the request.
- The package publication API is now rate limited per user.
- NuGet and NPM packages have been reviewed and updated to address known vulnerabilities.

Other improvements & maintenance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- A ``guide.yaml`` config file can now be linked to an existing guide, for instance after the file was deleted and uploaded again. See :ref:`ig_broken_link`.
- Guide master templates can now load Simplifier's own rendering CSS and scripts through a placeholder, so a custom style picks up new and updated files without copying them over. See :ref:`stylesheet placeholders <stylesheet_placeholders>`.
- ``version=preview`` now works as an alias for the live guide, alongside ``version=current``. The versions page labels the live guide Preview. See :ref:`published_guides`.
- The homepage, Learn page, About page and footer have new text, built around creating Implementation Guides.
- The Firely Terminal download page now shows that Firely Terminal requires the .NET 10 SDK.
- Removed the Connectors feature, including the default connectors every user was subscribed to. The `FHIRPath playground <https://simplifier.net/fhirpath>`_ covers what the PathFhinder connectors did.
- Improved the performance of package lookups.

Bug fixes
~~~~~~~~~

- Fixed the ``Documentation`` box on a package page only linking a guide when the guide version for that package version was also the guide's default version. Each package version now links every guide version that belongs to it, with the version in the link text.

Simplifier 2026.5, September 29th, 2026
-------------------------------------------
You can find the related news article on `Simplifier. <https://simplifier.net/organization/firely/news/206>`_

Multiple versions of the same package in scope
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Dependency restore now keeps every version of a package that the dependency tree brings in, instead of only the latest. The ``Dependencies`` tab shows the direct dependencies and all resolved dependencies, which can list the same package in several versions, and shows the FHIR version of each dependency. See :ref:`view_dependencies`.
- Unpinned canonical references now resolve to the latest version of that resource in scope, while pinned references keep resolving to the version they name. "Latest" means by SemVer where all candidates are SemVer, by date where they are all dates, and alphabetically otherwise. References resolve in the project first. Rendering or linking a resource by name, by type and id, or by filepath behaves as before. See :ref:`canonical_resolution`.
- Unpinned references to core profiles, data types, logical models, operation definitions, capability statements and compartment definitions resolve to the core package of the project's FHIR version, even when a dependency brings the core package of another FHIR version into scope. Terminology, search parameters and the extensions published in the core package follow the latest-version rule.
- ``package.json`` now accepts npm-style aliases, so a project can depend on two versions of the same package directly, for example ``"uscore610@npm:hl7.fhir.us.core": "6.1.0"``. Restore, bake with FSH, generating the ImplementationGuide resource and the IG Publisher take the alias into account. See :ref:`package_aliases`.
- Packages can now be resolved by SemVer range: a link to ``1.3.x`` resolves to the highest package in the 1.3 series, both on the package page and on the :ref:`resolve page <canonical_resolving>`.
- The ``Dependencies`` tab of projects and packages now warns when dependencies could not be fully resolved, and explains when to restore.

Guides
~~~~~~

- The ``Guides`` tab has a new design, applied consistently to the project, organization, team and portal pages.
- A guide row now shows its versions inline, and links to the versions page when there are more than it can list.
- Improved memory usage during guide publishing.
- Improved FQL query memory usage.
- A failed guide publish now reports on the console instead of leaving it open.
- The ``{{pagelink:`` placeholder now also works in the master template editor, not just when editing pages.

Sunsetting DSTU2
~~~~~~~~~~~~~~~~

- DSTU2 is being retired. New projects can no longer be created as DSTU2, and for existing DSTU2 projects the Bake, File, Update and GitHub menus are disabled, import is blocked, and package creation is blocked.
- The Query menu, covering FQL, YamlGen and FHIRPath, is hidden for DSTU2, where it was never available.
- Existing DSTU2 resources can still be rendered and downloaded.

Other improvements & maintenance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Package contents can now be browsed and filtered the same way as a project, on the package overview and files tabs. This replaces the search tab, which only worked for public packages: searching within a package now works for private packages too.
- Downloading a package with snapshots now generates them on a console page the first time, and reports the resources that could not be snapshotted instead of skipping them silently. Later downloads are served straight away.
- FQL queries whose scope exceeds 10,000 resources now fail with a clear message instead of timing out.
- Removed the ``/validate`` page; the playground validator supersedes it.
- NuGet and NPM packages have been reviewed and updated to address known vulnerabilities.

Bug fixes
~~~~~~~~~

- Fixed validation results in the file editor not updating after a project dependency changed.
- Fixed the validator page reporting results as validated by the legacy validator when not logged in.
- Fixed ``%resource`` resolving to the wrong resource in FQL when a page's front matter sets ``%canonical``.
- Fixed FQL queries returning no results when a where clause combined a condition with a literal comparison, such as ``where name = id and url = '...'``.
- Fixed bake failing with "Sequence contains more than one element" when a generated resource had more than one name.
- Fixed the portal not listing a guide to its owner when the owner has no role on the managing team.
- Fixed restoring the dependencies of a package taking you to the introduction tab instead of back to the dependencies tab.
- Fixed dependency links on a package in a feed pointing outside that feed.
- Fixed the ATOM feed of a non-existing project showing a processing error instead of a 404.

Simplifier 2026.4, August 19th, 2026
-------------------------------------------
You can find the related news article on `Simplifier. <https://simplifier.net/organization/firely/news/204>`_

Firely .NET SDK 6
~~~~~~~~~~~~~~~~~

- Simplifier, Clovis and all dependent internal libraries moved to SDK 6 and were bumped to their latest versions.
- Validation of resources with parsing issues: resources that fail to parse are now still validated instead of being rejected outright, with the parsing issues reported first.
- Simplifier now accepts and renders examples of custom resources.
- The legacy validator has been removed.
- Snapshot generation now honours the ``elementdefinition-suppress`` extension on ``ElementDefinition.mapping`` and ``ElementDefinition.example``. See :ref:`Suppressing inherited mappings and examples <suppress-extension>`.

HTML sanitization
~~~~~~~~~~~~~~~~~

- Re-enabled guide page HTML sanitization. Enabling scripting in guide pages now requires the new ``CanEnableJsInGuidePages`` license flag.
- HTML sanitization has been refactored and is now configured through an explicit trust level per call site.
- Inline HTML is now properly sanitized.
- Link and image URLs are sanitized at every trust level: ``javascript:`` and ``data:text/html`` are blocked even in Markdown-only contexts.
- Form tags are no longer allowed in authored content.

Resource rendering
~~~~~~~~~~~~~~~~~~

- Comments are displayed in XML rendering again.
- The must-support flag is now rendered for ``elementdefinition-type-must-support``.
- The datatype constraint is now added to the "All slice" in the tree rendering.
- Improved ValueSet rendering of contact information by moving it to the bottom.
- ``OperationDefinition.parameter.part`` is now rendered properly.
- ``OperationDefinition`` ``inputProfile`` and ``outputProfile`` are now rendered in the overview.
- The ``valueset-deprecated`` extension is now rendered.

Other improvements & maintenance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Added an option to diff any two project or package files from a new compare menu on the file page menu.
- Guide editor IntelliSense for page placeholders now supports topics as well.
- Redesigned features page: we switched the official features page to the new one we have been developing over the last few sprints.
- NuGet and NPM packages have been reviewed and updated to address known vulnerabilities.
- Removed the unused ``Counters.UserId`` column.
- Documentation links now point to `docs.fire.ly <https://docs.fire.ly>`_ instead of a guide in Simplifier.

Bug fixes
~~~~~~~~~

- Fixed guide heading numbering of folders to render in a ``.0`` namespace, allowing inline child headings to align as siblings of the parent index.
- Fixed embedded rendering not working when referencing files by filepath.
- Fixed an issue where creating an account through a membership invite failed.
- Fixed the broken "history" button in the guide editor.
- Fixed an issue where pinned references were not respected when generating snapshots for an existing package.
- Fixed a minor scrolling bug on the new features page.
- Fixed a broken redirect after creating an endorsed project list.
- Fixed an issue where an extra column appeared in ValueSet designations.
- Fixed a display issue for code system values with multiple parents.
- Fixed the "Profiles Supported" section for CapabilityStatements in STU3.
- Fixed the endorsed project list description preview, which no longer allows HTML as only Markdown is permitted.
- Fixed an issue where parsing issues reported as warnings were shown as errors.
- Packages created in Simplifier now have ``index-version`` set to 1 in the ``.index.json`` file.
- Compound file extensions are now handled correctly during import.

Simplifier 2026.3, June 15th, 2026
-------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/200>`_

Simplifier 2026.2, April 16th, 2026
-------------------------------------------
- New HL7-style guide template added to the standard styles, available to everyone and fully customizable for paid plans.
- Revamped `trial page <https://simplifier.net/explore/trial>`_, updated `voucher <https://simplifier.net/vouchers>`_ colors to match Simplifier branding, and added a data modelling section to the `pricing page <https://simplifier.net/pricing>`_.
- Various bug fixes and minor improvements.

Simplifier 2026.1, March 19th, 2026
-------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/195>`_

Simplifier 2025.6, January 16th, 2026
---------------------------------------------
Various minor improvements and fixes based on feedback from previous release.

Simplifier 2025.5, December 18th, 2025
----------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/192>`_

Simplifier 2025.4, September 2nd, 2025
----------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/184>`_ 

Simplifier 2025.3, June 14th, 2025
------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/178>`_
The biggest change is the introduction of the 60-day trial for new users. Allowing users to experience the full set of features available in Simplifier's Professional plan.

Simplifier 2025.2, March 20th, 2025
-------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/175>`_

Simplifier 2025.1, February 21st, 2025
----------------------------------------------
You can find the full release notes on `Simplifier. <https://simplifier.net/organization/firely/news/168>`_

Older releases
~~~~~~~~~~~~~~

Release notes for releases prior to 2025.1 are available on the :ref:`older release notes page <release_notes_older>`.

.. toctree::
   :hidden:

   Older release notes <simplifierReleaseNotesOlder>
