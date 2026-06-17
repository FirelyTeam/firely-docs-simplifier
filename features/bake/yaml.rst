YAML Syntax in general
----------------------

This is a (very) brief introduction to YAML as a configuration language. Because to write a bake script, you use the YAML. YAML is a very simple language, that nontheless allows you to be very expressive. Here are the basics of YAML that you need to understand to write **Bake** scripts.

Key-value pairs
^^^^^^^^^^^^^^^

::

   color: blue

Child properties
^^^^^^^^^^^^^^^^

You can define child/sub properties

::

   car:
      wheels: 4
      color: blue
      roof: yes

Lists
^^^^^

You can define lists:

::

   cars:
     - Volvo
     - Volkwagen
     - Chrysler
     - Ford
     - Mazda

Json
^^^^

You can write this:

::

   people:
     - firstname: John
       lastname: Smith 

also as inlined json:

::

   people:
      - { firstname: John, lastname: Smith }

https://en.wikipedia.org/wiki/YAML

And each item in a list can be either a value, or just another YAML structure, so it can have its own properties and sub-properties:

::

   cars:
     - car: Volvo
       color: green

     - car: Volkwagen
       color: blue
       wheels: 4

There is more to YAML, but this is enough to get you started with **Bake**. For more information there is more than enough you can find online.

- Yaml Specification: https://yaml.org/spec/1.2.2/
