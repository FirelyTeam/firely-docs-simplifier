Nested values
-------------

One of the core abilities of FQL is to help you get tree shaped data in a table format. To get data on the top level of resource, like the ``birthDate`` of a ``Patient``, you can use the same syntax to point to that field as you would have in SQL.

.. code:: text

   from 
     Patient
   select 
     birthDate

But for values that are deeper in the tree, a different syntax is needed. With in the world of programming languages, the most common form is dot-notation or dereferencing, which describes a path from the toplevel of the tree into the node that you need. An example would be the fields of the name of a patient. The following query will produce a table of the birth date, first name and the last name of a patient:

.. code:: text

   from Patient,
   select
       birthDate,
       name.given,
       name.family
