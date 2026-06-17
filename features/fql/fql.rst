.. _fql:

FQL (Firely Query Language)
===========================

This Guide is the documentation for **FQL**, the Firely Query Language.

What is FQL
-----------

FQL is a query language that allows you to retrieve, filter and project data from any data source containing FHIR Resources. It brings the power of three existing languages: SQL, JSON and FhirPath.

Use case
--------

The primary use case for FQL is to provide users who write Imlementation Guides in Simplifier with a tool to generate up-to-date tables of data that can only be found inside resources.

Implementation Guides
~~~~~~~~~~~~~~~~~~~~~

To execute an FQL query in your documentation, use the ``<fql>`` tag. This XML-based syntax allows for better integration with Simplifier's advanced rendering features.

**Basic Usage:**

.. code:: xml

       <fql>
           from Patient
           select name.given
       </fql>

Firely Terminal
---------------

Although the primary goal is to make tables from FHIR data, FQL can be used in a much broader scope and can cast data into almost any form. FQL is also implemented in `Firely Terminal <https://simplifier.net/downloads/firely-terminal>`__ - a command line tool that is your swiss army knife for operating with FHIR resources. You can execute FQL queries on your own projects, using a statement like this:

::

   > fhir query "from Patient select name.given"

Status
------

The basics of FQL is now at version 3. We're still doing further exploration to achieve our primary goal: to give as much power to the user, without bringing complexity. The non technical user should be able to use it for simple use cases. While advanced user should not be limited.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   philosophy
   syntax/syntax
   fhirpath/fhirpath
   examples/examples
   functions/functions
