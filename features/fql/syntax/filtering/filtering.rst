.. _fql_syntax_filtering:

Filtering
=========

Pipelining
----------

A language is more readable and predictable and simpler to write, if execution of results happen from left to right (or: top to bottom). Therefore, FQL does not follow the the syntax order of SQL. A ``select`` can only happen *after* you acquire initial results. So, typically, the ``from`` clause and the ``where`` clause happen before the first ``select``. But using pipelining as a basic principle, you can sequentially use any filter clause, whether that's one or more ``select`` clauses, a ``where``, a ``take``, ``skip``, 'order by', a 'group by', or a top level\ ``for`` clause.


.. toctree::
   :maxdepth: 1
   :titlesonly:

   select
   groupby
   where
   newitem
   distinct
   for
