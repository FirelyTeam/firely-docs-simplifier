Id accelerator
--------------

In FHIR every resource should have an id and the way to define a resource with an id is standardized.

In FHIR resource references start with a resource type, followed by a slash, followed by an id:

::

   Patient/4
   Patient/example
   Organization/f201

YamlGen has adopted that syntax. You can define the id of a resource by adding a slash at the top level key.

This means that the following key:

::

   Patient/4:

is identical to this yaml:

::

   Patient:
     id: 4

The following yaml will produce a patient with id "4":

::

   Patient/4:
       name:
         given: John
         family: Williams

Like this:

.. code:: json

   {
       "_id": "4",
       "name": {
           "given": "John",
           "family": "Williams"
       }
       
   }
