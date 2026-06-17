Where
-----

The where clause can be used in several places. Following a ``from`` clause, a ``select`` clause and in a ``for`` expression. The function is the same: to filter rows of data that match the criteria.

From - where
~~~~~~~~~~~~

The where following a from clause is always at the root level of a query, and at is performed at the root node of a Fhir Resource. The effect is that it filters resources itself. And since a resource is translated into a ``row`` in *FQL* it determines how many rows will be in the result.

For - where
~~~~~~~~~~~

In the ``where`` clause in a ``for`` statement, you filter subtrees of data. This allows keeping in arrays paired. See more at section about for.

Expressions
-----------

A Where clause expects one or more FhirPath expressions that have a boolean outcome. In the following query the text ``name.given = 'Chalmers'`` is a FhirPath expression that filters any Patient that has at least one given name equal to 'Chalmers':

.. code:: text

   from
     Patient
   where
     name.given = 'Chalmers'
   select
     name.given[0], 
     name.family

Even though FhirPath does have boolean logic, FQL allows you to add multiple expressions separated by an ``and`` keyword. It's up to you if you use the FhirPath internal logic or the FQL variety.

.. code:: text

   from
     Patient
   where
     name.given = 'William' and name.family = 'Chalmers'
   select
     name.given[0], 
     name.family
