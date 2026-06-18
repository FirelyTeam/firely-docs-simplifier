.. _yamlgen_references-and-variables:

References and variables
========================

Variables
---------

You can use variables when creating examples with YamlGen. On the root level of your YAML document you define variables using a dollar sign:

::

   $lastname: Williams

You reference them like this:

::

   Patient/1:
       name:
         family: $lastname

which results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "1",
       "name":  [
           {
               "family": "Williams"
           }
       ]
   }

**Variable lists**: you can define a list of variables, and pick a random value from it with ``[#]``.

::

   $lastname:
       - John
       - James
       - William

::

   Patient/example:
       name.given: $lastname[#]

FhirPath
--------

You can also integrate FhirPath when you create examples. Use FhirPath in any value by enclosing it with ``<< >>``:

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
