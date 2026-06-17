Fields
------

The fields function can help discover the structure of a resource or a field in a resource.

The following example will show you from each patient a list of fields in that resource.

.. code:: text

   from Patient select fields()

If you want to only know the fields in a specific structure, you can do that like this:

.. code:: text

   from Patient select name.fields()
