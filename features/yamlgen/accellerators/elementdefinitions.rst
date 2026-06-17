Element Definitions
-------------------

Element Definitions are one of the most occurring structures in a FHIR authoring project. But they are also one of the most verbose. It takes a lot of typing to get it right.

For that reason, YamlGen has special syntax for element definitions. If you start a yaml key with a dot, it defines an element definition, but you write it as if it were a field.

The following syntax:

::

   preferredPharmacy[Extension]:
     .url:
       min: 1

will produce this as output:

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

Paths
~~~~~

You can define full chains of paths, by denotating them with a dot:

::

     .name.given:

will result in:

::

   "differential": {
           "element":  [
               {
                   "id": "Patient.name.given",
                   "path": "Patient.name.given"
               }
           ]
       }

Slices
~~~~~~

You can define slices using a colon:

::

     .name:slice1.given

will result in:

::

   "differential": {
       "element":  [
           {
               "id": "Patient.name:slice1.given",
               "path": "Patient.name.given"
           }
       ]
   }

Type slices
~~~~~~~~~~~

You can define type slices using the same type notation used else where in YamlGen: using square brackets:

::

     .birth[Date]:

will result in:

::

   "differential": {
           "element":  [
               {
                   "id": "Patient.birth[x]",
                   "path": "Patient.birth",
                   "type":  [
                       {
                           "code": "Date"
                       }
                   ]
               }
           ]
       }
