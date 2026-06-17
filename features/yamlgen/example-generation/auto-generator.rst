Auto Generator
==============

G## Auto Generator

You can use YamlGen to auto generate FHIR resource data. This works with an accelerator named ``$auto``. This is a pseudo-field, that generates data on the level where it is placed. It takes one or more generator names.

Simple example:
~~~~~~~~~~~~~~~

The following script takes the 'example' values from the Patient profile for address:

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

You can place the $auto pseudo-field on any level that is not an actual value.

The following generators exist:

- **example** - takes example values from the profile
- **random** - generates random values
- **fixed** - puts the fixed values from the profile
- **code** - fills in a random code from the referenced valueset or codesystem
- **empty** - generates empty values

They are consumed in order, so you would use the ones that always produce a value, the last: This will create a full example:

::

   Patient/1:
       $auto: code, example, fixed, random, empty
