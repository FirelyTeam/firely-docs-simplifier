Flattening
==========

By default FQL produces one table row per resource. But there are clear cases where you don't want that.

Rows for deeper values
----------------------

To create a table from values deeper inside a resource, where it is not relevant for this specific result, to know to which resource the values belong, you can follow up with a ``for`` clause instead of starting with a ``select``.

Compare this:

.. code:: text

   from StructureDefinition
   select snapshot.element.constraint.human

This will result in one output row *per StructureDefinition*. While the following statement will put all the human readable constraints from all StructureDefinitions in one long table.

.. code:: text

   from StructureDefinition
   for
       snapshot.element.constraint 
   select
       human

Example output: from StructureDefinition for snapshot.element.constraint select human take 3

In some cases you want to display the array of a single resource as a table. For this purpose a top level ``for`` clause is also useful: the select field list will be grouped as one row with three columns for each page.

.. code:: text

   from ImplementationGuide
   for page.page
   select { 
       source,
       title,
       kind
   }

Example output (top pages from this very Guide): from ImplementationGuide for page.page select { source, title, kind }
