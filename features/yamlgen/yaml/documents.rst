Documents
---------

Root keys are unique in YAML, but only per *document*. In YAML you can start a new document with a tripple dash.

::

   Patient:
       id: 1

   ---

   Patient:
       id: 2

Resulting in:

.. code:: xml

   <Patient>
     <id value="1" />
   </Patient>

   <Patient>
     <id value="2" />
   </Patient>
