For
---

The ``for`` clause allows you to create a table structure from data within a resource or a set of resources. As a result you are no longer bound to one row per resource.

Compare the following two queries:

This first query creates one row per patient, and if that patient has multiple given-names, they will be concatenated into a single field

::

   from Patient
   select 
       name.given

In this second query, you get one row per given-name. If a patient has multiple names or multiple givens in one name, you get a row for each occurence:

::

   from Patient
   for name 
   select
       given
