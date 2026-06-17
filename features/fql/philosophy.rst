Philosophy
==========

These are the basic principles that were used when designing FQL.

Language
--------

FQL tries to be as easy entry as possible, while allowing more complex when the author needs it. In fact FQL hopes to solve the more complex problems with the simplest possible language. It is is a query language, but within that scope, tries to be as complete (*Turing complete*) as possible, without overdoing it.

Borowing
--------

FQL borrows from and merges two well known and widely adopted languages: SQL and JSON. Added to that we use FhirPath to fill the functional gaps. FhirPath is very effective in solving the more complex problems, while the simplest form is compatible with SQL and JSON.

SQL
~~~

Generally we see that SQL is much easier to learn than languages like GraphQL, CQL etc. SQL is the simplest way to instruct a data source to start providing data. FQL tries to use a lot of the basic paradigm of SQL. However, SQL is very limited limited in two areas:

1. querying non tabular data: for that gap, we we use FhirPath.

2. structuring non tabular data: for this gap we use JSON.

JSON
~~~~

JSON is very powerfull, terse and expressive in defining structures. In FQL, you can use JSON like structures in any select clause, although we use the original JSON wihtout names in quotes, to closer math SQL.

FhirPath
~~~~~~~~

FhirPath is very expressive and terse in drilling into tree structures. Every equation in FQL, for example in the where clause is a FhirPath expression. Every field is also a FhirPath statement, as long as it is a 'path' like form. If you use the JSON format of first defining a field name, you can use a full FhirPath expression as a value.

Multi source paradigm
---------------------

When writing a query, there are two use cases in terms of context: the case where the context is known and understood, and the case where it is not. For the first, FQL uses the simplest form (just start with your query) for known context,

FQL allows explicit mentioning the context in the language by either referencing a FHIR server (get data from anywhere, but performance might suffer), a Package (it's up to the tool that runs the query to resolve this context, or a Project. The project has to be named, but it's up to the tool to resolve it.

Where a package is globally uniquely defined and should not be open to interpretation, referencing a project is meant for locally defined scopes. It's up to the implementing tool to define what a project means.

Source
------

FQL is able to collect any data from any FHIR resource and map that to a new tree of (key, type, value) nodes. A lot of query languages are only good in reading data from tables. Other languages are capable of reading trees, but are hard to learn. FQL tries to bridge that gap.
