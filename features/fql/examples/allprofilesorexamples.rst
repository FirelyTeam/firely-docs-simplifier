All Profiles or Examples
------------------------

Details from all Profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: text

   from StructureDefinition
   where type != 'Extension'
   select name, description, status

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.

Details from all Extensions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: text

   from StructureDefinition
   where type = 'Extension'
   select title , description, status, context.expression

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.
