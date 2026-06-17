About profiles in a use case
============================

You can use a capability statement to define a sub set of resources that are relevant to your use case.

All capability statements
-------------------------

This query will show you the list of all profiled resources that are referenced by any capability statement in this project. This is similar to a flatmap of all *profile* elements in all *CapabilityStatements*.

.. code:: text

   from CapabilityStatement
   for profile
   select display, reference

One specific CapabilityStatement
--------------------------------

If you want to have the list from only one specific CapabilityStatement, you can filter it by it's canonical or id:

.. code:: text

   from CapabilityStatement 
   where url = 'http://myusecase'
   for profile
   select display, reference
