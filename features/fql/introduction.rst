Introduction
============

What is FQL
-----------

FQL is a query language that allows you to retrieve, filter and project data from any data source containing FHIR Resources. It brings the power of three existing languages: **SQL, JSON and FhirPath**. The primary use case for FQL is to provide users who write Implementation Guides in Simplifier with a tool to generate up-to-date tables of data that can only be found inside resources.
To execute an FQL query in your documentation, use the ``<fql>`` tag. This XML-based syntax allows for better integration with Simplifier's advanced rendering features.

**Basic Usage:**

.. code:: xml

       <fql>
           from Patient
           select name.given
       </fql>


Although the primary goal is to make tables from FHIR data, FQL can be used in a much broader scope and can cast data into almost any form. FQL is also implemented in `Firely Terminal <https://simplifier.net/downloads/firely-terminal>`__, a command line tool that is your swiss army knife for operating with FHIR resources. You can execute FQL queries on your own projects, using a statement like this:

::

   > fhir query "from Patient select name.given"

Language
--------

FQL is designed to give as much power to the user as possible without bringing complexity: a non-technical user should be able to use it for simple use cases, while an advanced user should not be limited. FQL tries to be as easy to enter as possible, while allowing more complexity when the author needs it. In fact, FQL hopes to solve the more complex problems with the simplest possible language. It is a query language, but within that scope it tries to be as complete (*Turing complete*) as possible, without overdoing it.

Built on familiar languages
---------------------------

FQL borrows from and merges two well known and widely adopted languages, SQL and JSON, and uses FhirPath to fill the functional gaps. FhirPath is very effective at solving the more complex problems, while its simplest form stays compatible with SQL and JSON.

**SQL** is generally much easier to learn than languages like GraphQL or CQL, and is the simplest way to instruct a data source to start providing data. FQL adopts much of SQL's basic paradigm. SQL is limited in two areas, though: querying non-tabular data (for that gap we use FhirPath) and structuring non-tabular data (for that gap we use JSON).

**JSON** is powerful, terse and expressive in defining structures. In FQL you can use JSON-like structures in any select clause, though we use the original JSON without names in quotes, to more closely match SQL.

**FhirPath** is expressive and terse in drilling into tree structures. Every expression in FQL, for example in the where clause, is a FhirPath expression. Every field is also a FhirPath statement, as long as it is in a 'path'-like form. If you use the JSON format of first defining a field name, you can use a full FhirPath expression as the value.

Multi-source paradigm
---------------------

When writing a query there are two situations in terms of context: the context is known and understood, or it is not. For a known context, FQL uses the simplest form: you just start with your query.

For other cases, FQL lets you mention the context explicitly, by referencing a FHIR server (get data from anywhere, though performance might suffer), a package (it is up to the tool that runs the query to resolve this), or a project (the project has to be named, and it is up to the tool to resolve it).

Where a package is globally and uniquely defined and should not be open to interpretation, referencing a project is meant for locally defined scopes. It is up to the implementing tool to define what a project means.

Source
------

FQL is able to collect any data from any FHIR resource and map it to a new tree of (key, type, value) nodes. A lot of query languages are only good at reading data from tables. Other languages are capable of reading trees, but are hard to learn. FQL tries to bridge that gap.
