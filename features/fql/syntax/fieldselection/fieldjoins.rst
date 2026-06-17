Field joins
-----------

Unlike like SQL, FQL has to deal with the fact that FHIR data does not come in the shape of a table. Yet, you need the same kind of output that an SQL statement would have produced. With SQL you know nested data will be in a different table, but with FHIR or any tree structured data, your nested data will often be part of the same resource. When you want to merge nested data in SQL, you use a table join. Because the data to join comes from within the resource itself, FQL has a join on the select level.

Comparison to SQL
~~~~~~~~~~~~~~~~~

In tree shaped data Adding a subfield to your select-list, requires no extra syntax other than 'dotting' into the tree, where you would write this in SQL:

.. code:: SQL

   select
     id
     PatientName.given, 
   from 
     Patient
     left join PatientName on PatientName.PatientId = Patient.id

In FQL you can simply write:

.. code:: text

   from Patient
   select 
      id, 
      name.given

This is assuming you have to deal with only one name. If you have multiple names, the FHIRpath statement ``name.given`` will actually produce an array. In many cases, you don't want to have an array as a result value. To fix that, you can either only take the first ``name.given[0]`` or do a join between the ``Patient`` and the array of ``given``, like this:

.. code:: text

   from Patient
   select
     id,
     join name.given

Row ordering
~~~~~~~~~~~~

Imagine you want to produce a row for your patients, with their name and identifier. But it's possible that they have more than one identifier, which in this case should produce a separate row, with each row having a unique identifier, but possible a repeated first and last name.

.. code:: text

   from Patient
   select
       name.family,
       name.given[0],
       join identifier.value

Since the resulting row, is based on the resource, and the join is on a field inside that resource, you can place the join at any point in your select-list. So the following produces the same rows and values, just in a different order.

.. code:: text

   from Patient
   select
       join identifier.value,
       name.family,
       name.given[0]

The order of the joins themselves of course do matter.

Joining on multiple values
~~~~~~~~~~~~~~~~~~~~~~~~~~

It is quite common to join on more than one field. Especially when you want to join on several values of a sub node. A good example is ``Patient.name``. To achieve a join over multiple values, you can use the unwrapping syntax (technically known as a group dereference):

.. code:: text

   from Patient
   select
       identifier[0].value,
       join name { family, given[0] }

This query will produce a row per pair of name values, and repeating the identifier for each of those rows.

Inner Joins
~~~~~~~~~~~

The join keyword is actually a shorthand for ``inner join``. So where ever you write ``join`` you can equally write ``inner join``. An inner join produces a row when both sides of the join have a value.

For SQL that would produce rows where both tables 'meet', but with FQL, the meeting already took place, since you are joining with values or sub values of the current row. The effect of an inner join is therefore mostly visible in the sense that it will skip rows that has no values for the field after the join. If you want a row regardless, use the ``left join``. See below:

Left joins
~~~~~~~~~~

A ``left join`` differs from an ``inner join``, in that it starts out with the left side table of the join. With FQL that means that a field join on a current row, will always show the current row, regardless of whether there are values in the join field.

Right joins
~~~~~~~~~~~

For field joins there is no such thing as a right join. The explanation under ``inner join`` helps to see why a ``right join`` on a field level has no meaning: if there is a field on the right side, there must be a row on the left side since the field is part of that row.
