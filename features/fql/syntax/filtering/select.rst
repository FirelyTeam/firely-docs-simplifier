Select
======

The select clause in FQL does what you expect it to do. It is a projection from the original structure to the defined field list in the clause.

Field list
----------

In the select statement you define a field list. Fields are separated by a comma. And a field can have several forms:

Simple field name
~~~~~~~~~~~~~~~~~

You can just define a field name just like you would do in SQL.

.. code:: text

       from Patient 
       select
           name

Of course this does not produce a single value. The field 'name' is actually a FhirPath expression. That means that if there is more than one name in the resource, they will all go to the output.

Name is also a tree in itself, because it contains sub fields. This query will therefore also produce a set of name-trees in the output.

All fields
~~~~~~~~~~

You can use the ``*`` field to select all fields in a select statement:

.. code:: text

   from Patient
   select *

FhirPath field
~~~~~~~~~~~~~~

As long as you describe an actual path, you can use FhirPath as a field designator: The following syntaxes are valid:

.. code:: text

   from Patient
   select
       meta.profile,
       name[0].family
       name.given,
       name.given[0]
       

Note that a FhirPath statement can have more than one result. Since ``name.given`` can have multiple values, your select set will result in an array for the field ``given`` as well. It will not give you the ``name`` structure.

JSON like field definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can expclitly set the name of a field by using JSON format:

.. code:: text

   ...
   select
       lastname: name[0].family,
       firstname: name[0].given

This allows you to set the name of a field. But it also allows defining full fhirpath expressions:

.. code:: text

   ...
   select
       firstname: name.given.first()
