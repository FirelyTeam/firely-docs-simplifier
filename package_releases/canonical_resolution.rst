.. _canonical_resolution:

How references are resolved
===========================

A project's scope is its own resources plus every package in its resolved dependencies. The scope
can hold more than one version of the same package: when one dependency brings in ``1.2.0`` of a
package and another brings in ``2.0.0``, both stay in scope instead of one being dropped. The same
canonical URL can then be defined more than once. This page explains which definition Simplifier
uses when it validates, renders and generates snapshots.

To see what is in scope, open the ``Dependencies`` tab of your project or package (see
:ref:`view_dependencies`).

Pinned references
-----------------

A canonical reference that carries a version, such as
``http://example.org/fhir/StructureDefinition/bp|1.0.0``, resolves to exactly that version.

The version after the ``|`` must be written out in full. Ranges such as ``|1.3.x`` are not
supported in a canonical reference.

To pin the references in a package when you publish it, see :ref:`pin_canonical_references`.

Unpinned references
-------------------

A reference without a version, such as ``http://example.org/fhir/StructureDefinition/bp``, is
resolved in this order:

#. **Your project's own resources.** If the project itself defines the canonical, that definition
   is used.
#. **The core specification of your FHIR version.** Core profiles and data types, such as
   ``http://hl7.org/fhir/StructureDefinition/Patient``, come from the core package of your
   project's FHIR version, even when a core package of another FHIR version is also in scope.
#. **The most recent version in scope.** Otherwise, of all versions of the resource in the
   resolved dependencies, the most recent one is used.

"Most recent" is decided on the resource's ``version`` element, not on the version of the package
it is in. A ``version`` is free text, so Simplifier follows the FHIR guidance on
`choosing the most recent version <https://build.fhir.org/ig/FHIR/ig-guidance/pinning.html#choosing-the-most-recent-version>`_:

- When all candidate versions are SemVer, the highest wins: ``1.10.0`` is more recent than
  ``1.9.0``.
- When all are dates (a year, optionally followed by month and day, with or without dashes), the
  latest wins. ``2024-01-05`` and ``20240105`` are the same day.
- Otherwise the versions are compared alphabetically, ignoring case. That is not always what the
  authors meant, but the same scope always gives the same answer.

When another FHIR version is in scope
-------------------------------------

A package for one FHIR version can depend on packages for another. For example, US Core 9.0.0 is
an R4 guide, but through its own dependencies it also brings ``hl7.fhir.r5.core`` into scope.

Core profiles and data types still come from your project's FHIR version. Other resources that
both FHIR versions define, such as value sets, code systems and search parameters, follow the
"most recent version" rule, so they can resolve to the other FHIR version's definition.

The ``Dependencies`` tab marks a package whose FHIR version differs from your project's with a
``Mismatch`` tag. When you see one, check whether you need that package, and pin the references
where the choice matters.
