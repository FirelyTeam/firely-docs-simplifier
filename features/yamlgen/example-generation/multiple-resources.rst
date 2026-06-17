Multiple resources
------------------

*This part is still experimental and subject to change.*

You can generate multiple resources with the following syntax:

::

   Patient/#3:

will result in:

::

   {
       "resourceType": "Patient",
       "id": "1"
   }

   {
       "resourceType": "Patient",
       "id": "2"
   }

   {
       "resourceType": "Patient",
       "id": "3"
   }
