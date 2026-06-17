.. _ig_help_renderingfhir:

Rendering FHIR
==============

There are several placeholders for rendering FHIR resources, the recommended way is by the resource canonical.

Use the following format (without the spaces):

::

   { { command : resource-canonical-url | version } } 

   { { command : package-name @ package-version / resource-filepath } }

See the following sub pages for different examples:

.. toctree::
   :maxdepth: 1
   :titlesonly:

   intellisense
   resourceoverview
   metadata
   fql-tables
   resourcexml
   resource-tree-table
   resourcejson
   resource-narrative
   structuredefinitiontable
   dictionary
   namingsystems
