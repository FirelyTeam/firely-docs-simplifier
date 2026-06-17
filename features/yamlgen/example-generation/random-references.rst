Random references
-----------------

You can reference a random resource from the produced set resources, by just using ``#`` instead of the id-reference:

::

   Practitioner/#2:
     name: 
       given: James
       family: Madison

   Patient/#2:
     name:
       given: Walter
       family: White
     generalPractitioner: 
       reference: Practitioner/# 
