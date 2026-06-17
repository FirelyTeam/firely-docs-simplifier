Variables
---------

It is possible to use variables when creating examples with YamlGen. On the root level of your yaml document you can define variables using a dollar sign. For example:

::

   $lastname: Williams

You can reference these variables as follows:

::

   Patient/1:
       name:
         family: $lastname

This will result in the following json:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "1",
       "name":  [
           {
               "family": "Williams"
           }
       ]
   }

Variable lists
~~~~~~~~~~~~~~

You can define a list of variables like this:

::

   $lastname:
       - John
       - James
       - William

And pick a random value from that list like this:

::

   $lastname[#]

Example usage:

::

   Patient/example:
       name.given: $lastname[#]
