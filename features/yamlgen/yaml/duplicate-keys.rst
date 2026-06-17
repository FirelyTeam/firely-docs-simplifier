Duplicate keys
--------------

YAML is very efficient, but has it's own quirks that you have to understand to use it.

In YAML every key is unique. This means that if you would use the same key twice, only the last key is taken into account. Have a look at the following example where we use the key Patient twice:

::

   Patient:
       id: 1

   Patient:
       id: 2

Because the key of each structure is called ``Patient``, this would just result in one patient with the last value overriding the previous one:

.. code:: xml

   <Patient>
     <id value="2" />
   </Patient>
