Resource overview
=================

Almost all overview tabs of any resource can be rendered in your Implementation Guide. StructureDefinitions have their own ``tree`` statement for this, other resources use the ``render`` statement.

StructureDefinition
-------------------

The recommended way to reference resources is by their Canonical, this will ensure that the links will keep working when the guide is exported or duplicated. It is possible to link to resources by their filepath, but this is not recommended.

For the Canonical example we'll use the US Core patient. Note that the scope for this Help section is set to the latest release of the US Core package.

Differential
~~~~~~~~~~~~

Example based on canonical referene: {{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, diff}}

The exact same parameters can be used for rendering by canonical: {{tree:http://hl7.org/fhir/StructureDefinition/Patient, diff}}

Below we'll only continue to show the file example.

Hybrid
~~~~~~

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, hybrid}}

Snapshot (default)
~~~~~~~~~~~~~~~~~~

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, snapshot}}

As Pretext
~~~~~~~~~~

You can render the raw content of your resources or files as pretext using the ``{{source: } }`` placeholder. The Intellisense feature will automatically list all available files in your project. This displays the file in its original upload format, preserving indentation and line breaks, and works for any file type supported by Simplifier.

.. _example-resources:

Example resources.
~~~~~~~~~~~~~~~~~~

The recommended way to link to other resources is by resource id. This will ensure that the links will keep working even when the guide is exported or duplicated. The rendering will work with Link, xml and json:

{ {Link/xml/json: ResourceType/id}} (without the space between the curly brackets)

For example {{link: Patient/child-example}}

Or the json rendering of the example resource: {{json: Patient/child-example}}

It is also possible to render the content or your resources and other files as pretext. You do this by using {{source: } }. The Intellisense will show you all the files available for this placeholder. It will render resources in the format they are uploaded, this can also be used for other filestypes Simplifier supports.
