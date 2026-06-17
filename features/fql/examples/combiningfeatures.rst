Combining features
==================

Example
~~~~~~~

This query shows you the combination of several features: *where*, *select*, and *for*.

.. code:: text

   from
       Patient
   where
       name[0].family = 'Chalmers'
   select
       for name
       select greeting: 'Hello ' & given.first() & ' ' & family

Also note that if you move the ``for`` clause to a top level statement, you will not get rows per resource, but per name.

.. code:: text

   from
       Patient
   where
       name[0].family = 'Chalmers'
   for name select
   {
       greeting: 'Hello ' & given.first() & ' ' & family
   }

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.
