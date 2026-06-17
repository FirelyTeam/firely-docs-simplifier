Finding ValueSet compositions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lists all systems that are used for more than one composition in valuesets and their frequency. (note that ``group by`` and ``with`` is available only in FQL 3 and later)

.. code:: text

   from ValueSet 
   group by 
     compose.include.system
   select
     system,
     frequency: group.count(),
   where
     frequency > 1
   order by
     frequency desc
   with
     header
