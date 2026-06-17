Category
--------

The category filter allows you to filter super-sets and subset of known FHIR resource types.

Example usage:

::

     - category: profile

Categories
~~~~~~~~~~

These are the categories you can choose from:

- **Conformance**: all conformance resources: StructureDefinitions, ..
- **Terminology**: all terminology resources: codesystems, valuesets,...
- **Instance**: all instance resources (Patient, Organization, etc.).
- **Profile**: all Resource structure definitions.
- **Extension**: structure definitions that describe an extension.
- **Type**: all structure definitions that describe a type.
- **Resource**: all files that are resources.

Resources
~~~~~~~~~

You can also choose any resource type as category:

::

     - category: StructureDefinition

or

::

     - category: Patient
