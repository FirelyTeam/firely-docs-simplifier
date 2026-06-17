Structures
----------

In most cases FQL is used to create tables. FQL helps you by flatting a tree structure in several ways. But sometimes, you want to create a tree structure. For example, if your output is not a table. Or if you want to use sub tables. For that we have Json Structures.

Json Structures
~~~~~~~~~~~~~~~

This example shows you how you can use JSON syntax to structure tree shaped data:

.. code:: text

   from Patient
   select
       metadata: {
           id,
           meta.profile
       }

This will result in the following strucure:

::

       table 
           row   
               metadata
                   id
                   profile

when you define a named group, you can nest to any depth. Your 'position' in the resource you are getting data from, will not change . So with this example, you still access fields from the root of the resource. To descend into the resource, use a fhirpath expression, a ``for`` clause, or grouped unwrap.
