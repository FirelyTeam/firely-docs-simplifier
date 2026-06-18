.. _ig_help_renderingfhir:

Rendering FHIR
==============

There are several placeholders for rendering FHIR resources, the recommended way is by the resource canonical.

Use the following format (without the spaces):

::

   { { command : resource-canonical-url | version } } 

   { { command : package-name @ package-version / resource-filepath } }

See the following sub pages for different examples:

Intellisense
------------

Simplifier has an intellisense that can help you find the resource you want to render. This is automatically triggered after you typed in the command you want to use, like for example {{tree:

There are three intellisense modes that you can use:

- Canonical (default): shows all the canonical urls in your guide's defined scope
- Files: shows all the files in your scope together with all the package dependencies you might have
- Global: shows all the public projects and packages from Simplifier

To toggle between these three intellisense modes you can either:

- use the buttons on the bottom right of the editor
- press F1 to bring up the help menu and go to 'Change intellisense mode'
- or just press CTRL+I on your keyboard

*This intellisense modes only change the way intellisense works, every valid syntax to render a FHIR resource works regardless of what you have selected here.*

Resource overview
-----------------

Almost all overview tabs of any resource can be rendered in your Implementation Guide. StructureDefinitions have their own ``tree`` statement for this, other resources use the ``render`` statement.

StructureDefinition
~~~~~~~~~~~~~~~~~~~

The recommended way to reference resources is by their Canonical, this will ensure that the links will keep working when the guide is exported or duplicated. It is possible to link to resources by their filepath, but this is not recommended.

For the Canonical example we'll use the US Core patient. Note that the scope for this Help section is set to the latest release of the US Core package.

Differential
^^^^^^^^^^^^

Example based on canonical referene: {{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, diff}}

The exact same parameters can be used for rendering by canonical: {{tree:http://hl7.org/fhir/StructureDefinition/Patient, diff}}

Below we'll only continue to show the file example.

Hybrid
^^^^^^

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, hybrid}}

Snapshot (default)
^^^^^^^^^^^^^^^^^^

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, snapshot}}

As Pretext
^^^^^^^^^^

You can render the raw content of your resources or files as pretext using the ``{{source: } }`` placeholder. The Intellisense feature will automatically list all available files in your project. This displays the file in its original upload format, preserving indentation and line breaks, and works for any file type supported by Simplifier.


Example resources.
^^^^^^^^^^^^^^^^^^

The recommended way to link to other resources is by resource id. This will ensure that the links will keep working even when the guide is exported or duplicated. The rendering will work with Link, xml and json:

{ {Link/xml/json: ResourceType/id}} (without the space between the curly brackets)

For example {{link: Patient/child-example}}

Or the json rendering of the example resource: {{json: Patient/child-example}}

It is also possible to render the content or your resources and other files as pretext. You do this by using {{source: } }. The Intellisense will show you all the files available for this placeholder. It will render resources in the format they are uploaded, this can also be used for other filestypes Simplifier supports.

Metadata
--------

The ``metadata`` widget renders a table of metadata fields for the referenced resource, for example:

{{metadata:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, render-metadata-title}}

The supported fields depend on the resource type:

- **Conformance resources**: ``url``, ``version``, ``publisher``, ``status``, ``experimental``, ``description``, ``purpose``, ``useContext``, ``contact``
- **MessageDefinition**: ``title``, ``event``, ``category``
- **StructureDefinition**: ``context`` (for extensions)

The widget behaves as follows:

- If no fields are specified, all non-empty fields are rendered in the default order defined by the FHIR specification.
- If fields are specified, only those fields are rendered (when non-empty) in the order they were listed.
- When the optional ``render-metadata-title`` flag is set, a title is also displayed containing the Resourcetype + ``name`` of the resource.

FQL Tables
----------

With the introduction of FQL it is now possible to create dynamic tables in your IG. FQL tables retrieve information from the resources in the select scope. In the table we will render information retrieved from the US Core Patient resource.

.. raw:: html

   <fql>
   from
       StructureDefinition
   where
       type = 'Patient'
   select
       Profile: id, Description: description, Status: status, URL: url
   order by
       name
   </fql>

For more information on the FQL syntax, please see https://simplifier.net/docs/fql

It is also possible to use the ``{{render} }`` placeholder to use FQL files. You simply store your FQL queries in a ``.fql`` file and do ``{{render:my-query.fql, output:inline} }``

Resource XML
------------

You can render the XML of a resource. We remove the narrative before parsing the XML, because there is no added value of seeing that in it's source form.

{{xml:`http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}} <http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}>`__

Resource Tree Table
-------------------

In your Ig you can render the tree the same as you see on Simplifier with the diff/hybrid/snapshot buttons.

To do this you use ``buttons`` for example like this:

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, buttons}}

You can also add these buttons inside your own generated table. For example using:

.. raw:: html

   <tabs>
       <tab title="Tree view">
           {{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, buttons}}
       </tab>
       <tab title="Detailed view">
           {{dict:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
       <tab title="XML">
           {{xml:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
       <tab title="JSON">
           {{json:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
   </tabs>

These tabs can be futher customized if your Organization has a Team plan or higher.

Resource JSON
-------------

You can render the JSON of a resource. We remove the narrative before parsing the JSON, because there is no added value of seeing that in it's source form.

{{json:`http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}} <http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}>`__

Resource Narrative
------------------

To render the resource narrative we have added the narrative placeholder. The example below will render the narrative from the US core patient. Make sure that the resource you want to render is in the scope of your Implementation Guide.

{{narrative:`http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}} <http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}>`__

When the narrative is empty the placeholder will still work, but simply not render anything.

Structure Definition Table
--------------------------

This is the table for the **us-core-patient-2** resource in the **demo** project. You can find the resource on https://simplifier.net/demo/us-core-patient-2. Notice that the path in the URL is exactly the same as the placeholder.

{{table:`http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}} <http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}>`__

Dictionary
----------

To show the extended details of all elements of a profile, you can generate a table. It's called dictionary in the official specification.

{{dict:`http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}} <http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}>`__

NamingSystems
-------------

The namingsystems statement will render all NamingSystems of an entire project in a table. For example, for project https://simplifier.net/core-ns-stu3:

{{namingsystems:core-ns-stu3}}
