For clause
----------

For basic single field selections, a path like FhirPath statement is usually good enough. But sometimes you want to have a table result within your selection.

We already covered the ``for`` clause as top-level syntax under *filtering*:

.. code:: text

   from Patient
   for name select { given, family }

You can use this same syntax within your select clause. The result will be a sub table.

.. code:: text

   from Patient
   select 
       id,
       for name select { use, given, family }

In some cases, it is not useful to have a subtable, because not each rendering engine can render sub tables. The Simplifier rendering engine however can.

Joins
~~~~~

Often the ``for`` syntax is used in combination with a field level join, which causes the sub table to be joined with the main table.

.. code:: text

   from Patient
   select
       id,
       join for name select { use, given, family } 

See the topic about joins for more information.
