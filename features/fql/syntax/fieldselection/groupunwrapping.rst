Group unwrapping
----------------

.. note::

   This syntax comes with FQL 3.

Group Unwrapping helps you write shorter queries. When you need multiple nested values, Group unwrapping helps you get multiple values from the same sub node.The following query produces a flattened list of the fields name.given and name.family.

.. code:: text

     from Patient 
     select name { given, family }

Other than the field names, it would produce the same result as writing

.. code:: text

     from Patient
     select
       name.given,
       name.family

Complex dereferencing
---------------------

Note that although derefercing in it's basic form uses dot notation, you can actually use any FhirPath expression. The following will work:

.. code:: text

     from Patient 
     select
       name.where(use = 'official') { given, family }

But in many more complex cases, it might be easier to read when using a ``for`` expression. The following produces the same output:

.. code:: text

     from Patient
     select 
        for name where use = 'official' 
        select { given, family }

See the documentation on for expressions for more information.
