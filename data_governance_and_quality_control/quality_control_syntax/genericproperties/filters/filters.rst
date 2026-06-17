.. _qc_genericproperties_filters:

Filters
=======

There are several filters that you can use to select to which files in your project a rule should apply. These filter properties are applicable to most rules, but not all. These are the most common filters:

- :doc:`fhirpathfilters`: filter: filters resources using a fhirpath predicate
- :doc:`filefilters`: filters on file name and path pattern(s) with wildcards
- :doc:`categoryfilters`: filters on a category of resources.

Multiple filters
----------------

You can specify more than one filter, per rule. Only files (resources) that fall in both filters will be part of the rule evaluation.

Example
~~~~~~~

This example will filter in all examples that have a profile:

::

   - action: validate
     files: examples/*-example.xml
     filter: meta.profile

.. toctree::
   :maxdepth: 1
   :titlesonly:

   filefilters
   fhirpathfilters
   categoryfilters
