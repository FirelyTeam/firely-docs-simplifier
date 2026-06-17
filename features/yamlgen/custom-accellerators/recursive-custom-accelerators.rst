Recursive custom accelerators
-----------------------------

In the below example the 'virtual' field ``_givens`` is used as a temporary placeholder to split out several "given" sub fields by referencing itself to parse the remainder.

::

   syntax:
       HumanName: <_givens> | <family>
       _givens: <given> , <_givens>

   Patient/1:
       name: Johan Sebastian, Christian | Bach

Which results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "1",
       "name":  [
           {
               "given":  [
                   "Johan Sebastian",
                   "Christian"
               ],
               "family": "Bach"
           }
       ]
   }
