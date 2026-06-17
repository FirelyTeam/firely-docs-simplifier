From
----

The From clause is in essence a filter on resource type.

.. code:: text

   from Patient
   select 
       id,
       name.family,
       name.given

The above statement effectively selects *all* patient records in scope, which could be all patients of the entire server.

Bandwidth
~~~~~~~~~

When requesting data from a FHIR server, the ``from`` clause is also mapped to a search query to reduce bandwith and increase performance, like this:

.. code:: text

   using 'https://vonk.fire.ly'
   from Patient
   select 
       ...

The ``from Patient`` clause here is translated to a FHIR search request URL to the FHIR server: ``http://server.org/fhir/Patient``.
