Standard YAML to FHIR
---------------------

YamlGen allows you to write standard yaml to generate FHIR resources. This means that if you know very basic yaml, you should be able to write most FHIR resources. Have a look at the following example in yaml:

::

   Patient:
     id: 1
     name:
       given: Marie
       family: Curie

This will result in the following resource in xml:

.. code:: xml

   <Patient>
     <id value="1" />
     <name>
       <given value="Marie" />
       <family value="Curie" />
     </name>
   </Patient>

Alternatively in json, it would produce:

.. code:: json

   {
       "_id": "1",
       "name": {
           "given": "Marie",
           "family": "Curie"
       }
       
   }

If you compare the yaml example with the xml and json examples, it is clear that the yaml version is already more concise.
