Distinct
--------

If you have duplicate rows in your result set, you can remove the duplicates by adding a ``distinct`` clause.

Example
~~~~~~~

The following example produces a table with valueset references and their binding strength. This is a list for one structuredefinition. And with no further context it's not useful to see every duplicate reference. The distinct here removes those:

::

   from StructureDefinition
   where url = 'http://hl7.org/fhir/StructureDefinition/bodyweight'
   for snapshot.element
   select 
       path,
       join binding.where(valueSet.exists())
       {
           Strength: strength,
           URL: valueSet
       }
   distinct
