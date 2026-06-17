Group by
--------

FQL allows you to group results with a ``group by`` clause, which is quite similar to an SQL group by. But there are differences. However, the basic syntax of the group by clause is the same.

.. code:: text

     from Patient
     group by name.family
     select family

As you can see, the ``group by`` precedes the ``select`` statement, to allow concatenation or pipelining of results.

Aggregation
~~~~~~~~~~~

Aggregation functions already exists in FHIRpath, which is the inner language used by FQL to get values. And so a typical group function like \`count()' can be used on groups, like this:

.. code:: text

   from Patient
   group by name.family
   select family, group.count()

But because we are working with tree structured data, many more options open up, like doing a count over a full FHIRpath expression.

.. code:: text

   from Patient
   group by name.family
   select
     family,
     group.name.given.count()
