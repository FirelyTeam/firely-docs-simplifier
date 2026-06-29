.. _yamlgen_yaml:

YAML
====

YamlGen lets you write standard YAML to generate FHIR resources. If you know very basic YAML, you can write most FHIR resources.

Standard YAML to FHIR
---------------------

Have a look at the following example in YAML:

::

   Patient:
     id: 1
     name:
       given: Marie
       family: Curie

This results in the following resource in XML:

.. code:: xml

   <Patient>
     <id value="1" />
     <name>
       <given value="Marie" />
       <family value="Curie" />
     </name>
   </Patient>

Alternatively, in JSON it would produce:

.. code:: json

   {
       "_id": "1",
       "name": {
           "given": "Marie",
           "family": "Curie"
       }
   }

Comparing the YAML with the XML and JSON, the YAML version is clearly more concise.

YAML quirks
-----------

YAML is very efficient, but has its own quirks that you need to understand.

**Duplicate keys**: in YAML every key is unique, so if you use the same key twice, only the last one is taken into account. Because both structures below have the key ``Patient``, this results in a single patient with the last value overriding the first:

::

   Patient:
       id: 1

   Patient:
       id: 2

producing:

.. code:: xml

   <Patient>
     <id value="2" />
   </Patient>

**Comments**: you can use comments to document what you are making.

::

   # this is an example

   Patient:
     id: example

**Documents**: root keys are unique per *document*. You can start a new document with a triple dash, which lets you reuse a root key:

::

   Patient:
       id: 1

   ---

   Patient:
       id: 2
