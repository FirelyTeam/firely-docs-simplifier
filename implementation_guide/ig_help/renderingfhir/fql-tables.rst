FQL Tables
----------

With the introduction of FQL it is now possible to create dynamic tables in your IG. FQL tables retrieve information from the resources in the select scope. In the table we will render information retrieved from the US Core Patient resource.

.. raw:: html

   <fql>
   from
       StructureDefinition
   where
       type = 'Patient'
   select
       Profile: id, Description: description, Status: status, URL: url
   order by
       name
   </fql>

For more information on the FQL syntax, please see https://simplifier.net/docs/fql

It is also possible to use the ``{{render} }`` placeholder to use FQL files. You simply store your FQL queries in a ``.fql`` file and do ``{{render:my-query.fql, output:inline} }``
