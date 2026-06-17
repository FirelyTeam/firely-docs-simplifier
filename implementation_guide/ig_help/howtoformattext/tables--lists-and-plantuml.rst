Tables, lists and PlantUML
==========================

Tables and lists work the mostly the same as markdown, as shown in the examples below. For our paying customers it is possible to use FQL and PlantUML for rendering dynamic tables and Plant UML diagams. For more information on FQL, see the FQL tables page.

PlantUML can be used with the Plant UML syntax using plantuml placeholders:

.. raw:: html

   <plantuml>
   @startuml
   Bob -> Alice : hello
   @enduml
   </plantuml>

You can also upload standalone PlantUML files to your project. Supported file extensions include:

::

   .plantuml
   .pu
   .puml

You can render these with the ``render`` placeholder: ``{{render:filename.puml} }``

Tables
------

\|Header|Header|Header\| \|- \|content|content|content\| \|content|content|content\|

Unordered lists
---------------

- Item 1
- Item 2

  - Sub Item 2.1
  - Sub item 2.2

    - Sub sub item 2.2.1

- Item 3

or:

- Item
- Item

Ordered lists
-------------

Ordered lists with automatic numbering.

1. Item a
2. Item b
3. Item c
