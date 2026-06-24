.. _yamlgen_accelerators:

Accelerators
============

Accelerators are shortcuts that let you write FHIR resources more compactly.

Id accelerator
--------------

In FHIR every resource should have an id, and resource references start with a resource type, a slash, and an id (``Patient/4``, ``Patient/example``, ``Organization/f201``). YamlGen has adopted that syntax: you can define the id of a resource by adding a slash to the top-level key. So ``Patient/4:`` is identical to:

::

   Patient:
     id: 4

The following YAML produces a patient with id "4":

::

   Patient/4:
       name:
         given: John
         family: Williams

Path shortcuts
--------------

YAML can become verbose when you start nesting. To avoid this, YamlGen allows the use of paths, much like the ones used in FHIRPath. You can dot into the details directly:

::

   Patient/example:
     meta.profile: http://acme.org/fhir/Patient
     name.given: John

which is equivalent to:

::

   Patient:
     id: example
     meta:
       profile: http://acme.org/fhir/Patient
     name:
       given: John

**Multiple sub keys**: do not do this with multiple sub keys. This:

::

   name.given: Marie
   name.family: Curie

is not the same as:

::

   name:
     given: Marie
     family: Curie

Creating new profiles
---------------------

If you want to define your own structures, whether resources or extensions, you define them by writing the intended name followed by their type in square brackets. YamlGen follows the FHIR syntax for defining a type in a choice element. For example, a profile on Patient called ``nl-core-Patient``:

::

   nl-core-Patient[Patient]:

is equivalent to:

::

   StructureDefinition:
     id: nl-core-Patient
     type: Patient
     name: nl-core-Patient
     kind: resource

For an extension it is very similar:

::

   preferredPharmacy[Extension]:

is equivalent to:

::

   StructureDefinition:
     id: preferredPharmacy
     type: Extension
     name: preferredPharmacy
     kind: complex-type

**Using profiles by name**: you can use the profiles you defined this way, or any other profile, by using their name, for example ``nl-core-patient/1:``.

Element definitions
-------------------

Element definitions are one of the most common structures in a FHIR authoring project, and also one of the most verbose. For that reason YamlGen has special syntax: if you start a YAML key with a dot, it defines an element definition, but you write it as if it were a field.

::

   preferredPharmacy[Extension]:
     .url:
       min: 1

produces:

.. code:: json

   {
     "resourceType": "StructureDefinition",
     "id": "preferredPharmacy",
     "name": "preferredPharmacy",
     "differential": {
       "element": [
         {
           "id": "Extension.url",
           "path": "Extension.url",
           "min": 1,
         }
       ]
     }
   }

**Paths**: you can define full chains of paths by denoting them with a dot. ``.name.given:`` produces an element with id and path ``Patient.name.given``.

**Slices**: you can define slices using a colon. ``.name:slice1.given`` produces id ``Patient.name:slice1.given`` with path ``Patient.name.given``.

**Type slices**: you can define type slices using the square-bracket type notation. ``.birth[Date]:`` produces id ``Patient.birth[x]`` with path ``Patient.birth`` and type ``Date``.

Using extensions
----------------

You can use any extension by treating it as a regular field in a resource. The following example shows how to create, require and use an extension.

Define an extension:

::

   middlename[Extension]:
     url: http://acme.nl/middlename
     .value[string]:
       max: 1

Define a derived profile of Patient:

::

   dutch-patient[Patient]:
     url: http://acme.nl/dutch-patient
     .extension:middelname:
       max: 1

Create a Patient resource based on the profile and using the extension:

::

   dutch-patient/3:
     name:
       family: Doe
       middlename: van der

Custom accelerators
-------------------

Sometimes writing each part of a structure on a separate line is more verbose than necessary. YamlGen lets you define a custom accelerator on any FHIR type, which allows inlining those structures. You reference sub nodes using ``< >`` angle brackets.

**HumanName example**:

::

   syntax:
     HumanName: <given> | <family>

allows typing ``name: Adam | Everyman`` instead of:

::

   name:
      given: Adam
      family: Everyman

**Coding example**: you can also use an accelerator to skip defining sub nodes when only one standard node is used:

::

   Coding: <system> | <code>

which allows ``code: http://somesystem.nl|11331007`` instead of:

::

   code:
     system: http://somesystem.nl
     code: 11331007

Combined with variables this becomes extra powerful: ``code: $snomed|11331007``.

**More advanced**:

::

   syntax:
       cardinality: <min> .. <max>

   nl-core-patient[Patient]:
       .name:
           cardinality: 0 .. *

The syntax definition is currently limited to ``typename: <reference>`` or ``typename: <reference> <literal> <reference>``, but is planned to become more flexible.

**Nested**: you can nest custom accelerators.

::

   syntax:
       CodeableConcept: <coding>
       Coding: <system> | <code>

   Patient/2:
       maritalStatus: http://terminology.hl7.org/CodeSystem/v3-MaritalStatus|M

results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "2",
       "maritalStatus": {
           "coding":  [
               {
                   "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
                   "code": "M",
               }
           ]
       }
   }

You can `try this snippet <https://simplifier.net/yamlgen/8db4fa88fbeca67>`__ in the YamlGen playground.

**Multi-layer**: you can even nest three layers deep.

::

   syntax:
    CodeableConcept: <coding>
     Coding: <_system-code> = <display>
     _system-code: <system> | <code>

   Patient/2:
     maritalStatus: http://terminology.hl7.org/CodeSystem/v3-MaritalStatus|M = Married

**Recursive**: in the example below the 'virtual' field ``_givens`` is used as a temporary placeholder to split out several "given" sub fields by referencing itself to parse the remainder.

::

   syntax:
       HumanName: <_givens> | <family>
       _givens: <given> , <_givens>

   Patient/1:
       name: Johan Sebastian, Christian | Bach

which results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "1",
       "name":  [
           {
               "given":  [
                   "Johan Sebastian",
                   "Christian"
               ],
               "family": "Bach"
           }
       ]
   }
