.. _yamlgen_example-generation:

Example generation
==================

YamlGen has several ways to speed up generation of randomized data. This can be useful for example generation or test data.

Auto generator
--------------

You can use YamlGen to auto-generate FHIR resource data with an accelerator named ``$auto``. This is a pseudo-field that generates data at the level where it is placed, and it takes one or more generator names. The following script takes the 'example' values from the Patient profile for address:

::

   Patient/1:
       address:
           $auto: empty

resulting in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "1",
       "address":  [
           {
               "use": "",
               "type": "",
               "text": "",
               "line":  [
                   ""
               ],
               "city": "",
               "district": "",
               "state": "",
               "postalCode": "",
               "country": ""
           }
       ]
   }

You can place the ``$auto`` pseudo-field on any level that is not an actual value. The following generators exist:

- **example**: takes example values from the profile
- **random**: generates random values
- **fixed**: puts the fixed values from the profile
- **code**: fills in a random code from the referenced valueset or codesystem
- **empty**: generates empty values

They are consumed in order, so you put the ones that always produce a value last. This creates a full example:

::

   Patient/1:
       $auto: code, example, fixed, random, empty

Random references
-----------------

You can reference a random resource from the produced set of resources by using ``#`` instead of the id reference:

::

   Practitioner/#2:
     name:
       given: James
       family: Madison

   Patient/#2:
     name:
       given: Walter
       family: White
     generalPractitioner:
       reference: Practitioner/#

Multiple resources
------------------

*This part is still experimental and subject to change.*

You can generate multiple resources with the following syntax:

::

   Patient/#3:

will result in:

::

   {
       "resourceType": "Patient",
       "id": "1"
   }

   {
       "resourceType": "Patient",
       "id": "2"
   }

   {
       "resourceType": "Patient",
       "id": "3"
   }
