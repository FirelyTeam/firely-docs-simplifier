.. _release_notes:

Release Notes
=============

This page contains the release notes of simplifier.net.


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
