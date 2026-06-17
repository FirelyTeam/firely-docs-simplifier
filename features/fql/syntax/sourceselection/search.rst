Search
------

.. note::

   This is experimental syntax and subject to change.

In order to reduce bandwidth, we try to do as much heavy lifting as possible on the server. The from clause can be translated to a specific FHIR endpoint, but the field (paths) in a where clause cannot. For now we have solved this with a specific \`search' clause.

Search clause
-------------

A search clause allows ``field=value`` expressions where a field is any known fhir search parameter. You can provide more than one parameter using an ``and`` operator.

.. code:: text

   using 'https://vonk.fire.ly'
   from Patient 
   search 
       name='Chalmers' and _id=123
   select
       name.given[0],
       name.family

The query above, will do the following search request to the FHIR server, before actually executing the query on the resulting data:

::

       https://vonk.fire.ly/Patient?name=Chalmers&_id=123

Note
----

Since a Fhir Server is allowed to ignore unknown and unimplemented parameters, this statement can produce unpredictable results. It's recomendable to repeat your filter in the actual where clause, where you can use FhirPath expressions that are guaranteed and accurate.
