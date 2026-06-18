.. _fql_examples:

Examples
========

Combining features
------------------

This query shows you the combination of several features: *where*, *select*, and *for*.

.. code:: sql

   from
       Patient
   where
       name[0].family = 'Chalmers'
   select
       for name
       select greeting: 'Hello ' & given.first() & ' ' & family

Also note that if you move the ``for`` clause to a top-level statement, you will not get rows per resource, but per name.

.. code:: sql

   from
       Patient
   where
       name[0].family = 'Chalmers'
   for name select
   {
       greeting: 'Hello ' & given.first() & ' ' & family
   }

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.

Profiles in your project
------------------------

Lists the name and canonical from all profiles available in your project (including referenced packages):

.. code:: sql

   using scope
   from
     StructureDefinition
   select
     name, url

About profiles in a use case
----------------------------

You can use a capability statement to define a subset of resources that are relevant to your use case.

**All capability statements**: this query shows the list of all profiled resources that are referenced by any capability statement in this project. It is similar to a flatmap of all *profile* elements in all *CapabilityStatements*.

.. code:: sql

   from CapabilityStatement
   for profile
   select display, reference

**One specific CapabilityStatement**: if you want the list from only one specific CapabilityStatement, you can filter it by its canonical or id.

.. code:: sql

   from CapabilityStatement
   where url = 'http://myusecase'
   for profile
   select display, reference

List all canonicals
-------------------

Listing all canonicals in this project:

.. code:: sql

   from StructureDefinition
   select url

All Profiles or Examples
------------------------

**Details from all Profiles**: lists the name, description and status of every profile (the non-extension StructureDefinitions).

.. code:: sql

   from StructureDefinition
   where type != 'Extension'
   select name, description, status

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.

**Details from all Extensions**: the same, but for extensions, including the context they apply to.

.. code:: sql

   from StructureDefinition
   where type = 'Extension'
   select title , description, status, context.expression

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.

Finding ValueSet compositions
-----------------------------

Lists all systems that are used for more than one composition in valuesets, and their frequency. (Note that ``group by`` and ``with`` are available only in FQL 3 and later.)

.. code:: sql

   from ValueSet
   group by
     compose.include.system
   select
     system,
     frequency: group.count(),
   where
     frequency > 1
   order by
     frequency desc
   with
     header

Two canonicals
--------------

If you want to filter multiple resources by a small set of canonicals:

.. code:: sql

   from StructureDefinition
       where url in ('http://example.org/fhir/StructureDefinition/xxx' | 'http://example.org/fhir/StructureDefinition/yyy')
   select
       Name: name,
       Description: description,
       Version: version,
       Status: status,
       URL: url
