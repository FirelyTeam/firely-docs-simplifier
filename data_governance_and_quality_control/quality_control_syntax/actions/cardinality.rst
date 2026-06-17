Cardinality
-----------

The ``cardinality`` evaluator will check if a filter produces an amount of files that is between a specified range. You can separate the number with a dash ``-`` or a double dot ``..``.

::

   - category: ValueSet
     cardinality: 10-50

::

   - files: input/*.yaml
     cardinality: 2..8
