Two canonicals
^^^^^^^^^^^^^^

If you want to filter multiple resources by a small set of canonicals

.. code:: text

   from StructureDefinition
       where url in ('http://example.org/fhir/StructureDefinition/xxx' | 'http://example.org/fhir/StructureDefinition/yyy')
   select
       Name: name,
       Description: description,
       Version: version,
       Status: status,
       URL: url
