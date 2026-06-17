Custom Accellerators
====================

Sometimes, having to write each part of a structure on a separate line is more verbose than necessary. YamlGen lets you define a custom accelerator on any FHIR type, which allows in lining of those structures.

Update: we removed Regex and replaced it with a simpler and more powerful syntax. Here you can reference sub nodes using ``< >`` angular brackets.

Example with HumanName
~~~~~~~~~~~~~~~~~~~~~~

The following example are three acelerators. Two for HumanName and one for coding

::

   syntax:
     HumanName: <given> | <family>

This allows typing:

::

      name: Adam | Everyman

instead of

::

     name:
        given: Adam
        family: Everyman

Example with Coding
~~~~~~~~~~~~~~~~~~~

You can also use a syntax accelerator to skip defining sub nodes if only one standard node is used:

::

     Coding: <system> | <code>

And the third one allows:

::

     code: http://somesystem.nl|11331007

instead of

::

     code: 
       system: http://somesystem.nl
       code: 11331007

Combined with variables this can become extra powerful:

::

     code: $snomed|11331007

More advanced example:
~~~~~~~~~~~~~~~~~~~~~~

::

   syntax:
       cardinality: <min> .. <max>

   nl-core-patient[Patient]:
       .name:
           cardinality: 0 .. *

Note
~~~~

The syntax definition is currently limited to either

- ``typename: <reference>``
- ``typename: <reference> <literal> <reference>`` But is planned to become more flexible in the future.
