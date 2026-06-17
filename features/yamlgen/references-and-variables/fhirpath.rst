FhirPath
--------

It is even possible to integrate FHIR path when you create examples. You can use FHIR path in any value by enclosing it with ``<< >>``.

For example:

::

   Patient:
       id: john
       name.given: <<id.upper()>>

will produce:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "john",
       "name":  [
           {
               "given":  [
                   "JOHN"
               ]
           }
       ]
   }
