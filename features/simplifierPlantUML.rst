PlantUML Support in Guides
=================================

Simplifier allows you to create and display diagrams within your guides using PlantUML. You can embed diagrams directly in the editor or upload existing files for rendering. In the `PlantUML playground <https://simplifier.net/plantuml>`_ you can also check if the rendering looks as expected before adding it to your guide.

In-Line Diagrams
-----------------

To embed a diagram directly, use the standard PlantUML syntax within your content.

Example:

.. code-block:: plantuml

   @startuml
   Bob -> Alice : hello
   @enduml

File-Based Diagrams
--------------------

You can also upload standalone PlantUML files to your project. Supported file extensions include:

* ``.plantuml``
* ``.pu``
* ``.puml``

Rendering Diagrams
-------------------

To display an uploaded diagram in your guide, use the ``{{render}}`` placeholder.

Syntax:

.. code-block:: rst

   {{render:filename.puml}}