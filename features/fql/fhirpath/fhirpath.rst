.. _fql_fhirpath:

FhirPath
========

FhirPath is a fundamental part of FQL. As you might have read: FQL is a combination of the power of SQL, JSON and FhirPath. But it's FhirPath that get's you the values out of your data.

When ever you select fields in FQL, you do that with FhirPath. In the following statement, you see with gradually increasing complexity, how values are extracted from a resource:

.. code:: text

   from Patient
   select
       birthDate,
       name[0].given[0],
       LastName: name[0].family
       phone: telecom.where(system = 'phone').value

       identifier { system, value } 

The FhirPath expressions in the above FQL query are:

::

   birthDate
   name[0].given[0]
   name[0].family
   telecom.where(system = 'phone').value

And for the last line, there are actually three:

::

   identifier
   system
   value

In the following sections of this documentation, we'll describe how you can FhirPath works and how you can apply it.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   dotnotation
   indexes
   functions
   comparisonexpressions
