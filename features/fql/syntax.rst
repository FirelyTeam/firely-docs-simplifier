.. _fql_syntax:

Syntax
======

Filtering
---------

A language is more readable, more predictable and simpler to write if results are computed from left to right (top to bottom). Therefore, FQL does not follow the syntax order of SQL. A ``select`` can only happen *after* you acquire initial results. So, typically, the ``from`` clause and the ``where`` clause happen before the first ``select``. But using pipelining as a basic principle, you can sequentially use any filter clause, whether that is one or more ``select`` clauses, a ``where``, a ``take``, a ``skip``, an ``order by``, a ``group by``, or a top-level ``for`` clause.

Select
~~~~~~

The select clause in FQL does what you expect: it is a projection from the original structure to the field list defined in the clause. Fields are separated by a comma, and a field can take several forms:

**Simple field name**: you can define a field name just like you would in SQL.

.. code:: sql

   from Patient
   select
       name

This does not produce a single value. The field ``name`` is actually a FhirPath expression, so if there is more than one name in the resource, they all go to the output. ``name`` is also a tree in itself, because it contains sub fields, so this query produces a set of name-trees in the output.

**All fields**: use the ``*`` field to select all fields in a select statement.

.. code:: sql

   from Patient
   select *

**FhirPath field**: as long as you describe an actual path, you can use FhirPath as a field designator. The following syntaxes are valid:

.. code:: sql

   from Patient
   select
       meta.profile,
       name[0].family
       name.given,
       name.given[0]

Note that a FhirPath statement can have more than one result. Since ``name.given`` can have multiple values, your select set will result in an array for the field ``given`` as well. It will not give you the ``name`` structure.

**JSON-like field definitions**: you can explicitly set the name of a field by using JSON format.

.. code:: sql

   ...
   select
       lastname: name[0].family,
       firstname: name[0].given

This lets you set the name of a field, but it also allows defining full FhirPath expressions:

.. code:: sql

   ...
   select
       firstname: name.given.first()

Group by
~~~~~~~~

FQL allows you to group results with a ``group by`` clause, which is quite similar to an SQL group by, though there are differences. The basic syntax is the same:

.. code:: sql

   from Patient
   group by name.family
   select family

As you can see, the ``group by`` precedes the ``select`` statement, to allow concatenation or pipelining of results.

**Aggregation**: FhirPath already provides aggregation functions (FhirPath is the inner language FQL uses to get values), so a typical group function like ``count()`` can be used on groups:

.. code:: sql

   from Patient
   group by name.family
   select family, group.count()

Because we are working with tree-structured data, many more options open up, like doing a count over a full FhirPath expression:

.. code:: sql

   from Patient
   group by name.family
   select
     family,
     group.name.given.count()

Where
~~~~~

The where clause can be used in several places: following a ``from`` clause, following a ``select`` clause, and in a ``for`` expression. The function is the same in each: to filter rows of data that match the criteria.

**Following a from clause**: the where is at the root level of a query and is performed at the root node of a FHIR resource. It filters the resources themselves, and since a resource is translated into a ``row`` in FQL, it determines how many rows will be in the result.

**In a for clause**: you filter subtrees of data, which allows keeping paired arrays aligned. See the For section below for more.

A where clause expects one or more FhirPath expressions that have a boolean outcome. In the following query, ``name.given = 'Chalmers'`` is a FhirPath expression that filters any Patient that has at least one given name equal to 'Chalmers':

.. code:: sql

   from
     Patient
   where
     name.given = 'Chalmers'
   select
     name.given[0],
     name.family

Even though FhirPath has boolean logic, FQL also lets you add multiple expressions separated by an ``and`` keyword. It is up to you whether you use the FhirPath internal logic or the FQL variety.

.. code:: sql

   from
     Patient
   where
     name.given = 'William' and name.family = 'Chalmers'
   select
     name.given[0],
     name.family

From
~~~~

The from clause is in essence a filter on resource type.

.. code:: sql

   from Patient
   select
       id,
       name.family,
       name.given

The above statement effectively selects *all* patient records in scope, which could be all patients of the entire server.

**Bandwidth**: when requesting data from a FHIR server, the ``from`` clause is also mapped to a search query to reduce bandwidth and increase performance:

.. code:: sql

   using 'https://vonk.fire.ly'
   from Patient
   select
       ...

The ``from Patient`` clause here is translated to a FHIR search request URL to the FHIR server: ``http://server.org/fhir/Patient``.

Distinct
~~~~~~~~

If you have duplicate rows in your result set, you can remove the duplicates by adding a ``distinct`` clause. The following example produces a table with valueset references and their binding strength for one structure definition. With no further context it is not useful to see every duplicate reference, so the ``distinct`` removes those:

.. code:: sql

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

For
~~~

The ``for`` clause allows you to create a table structure from data within a resource or a set of resources. As a result you are no longer bound to one row per resource.

Compare the following two queries. This first query creates one row per patient, and if that patient has multiple given names, they are concatenated into a single field:

.. code:: sql

   from Patient
   select
       name.given

In this second query, you get one row per given name. If a patient has multiple names, or multiple givens in one name, you get a row for each occurrence:

.. code:: sql

   from Patient
   for name
   select
       given


Source selection
----------------

Search
~~~~~~

.. note::

   This is experimental syntax and subject to change.

In order to reduce bandwidth, we try to do as much heavy lifting as possible on the server. The ``from`` clause can be translated to a specific FHIR endpoint, but the field paths in a where clause cannot. For now we have solved this with a specific ``search`` clause.

**Search clause**: a search clause allows ``field=value`` expressions, where a field is any known FHIR search parameter. You can provide more than one parameter using an ``and`` operator.

.. code:: sql

   using 'https://vonk.fire.ly'
   from Patient
   search
       name='Chalmers' and _id=123
   select
       name.given[0],
       name.family

The query above will do the following search request to the FHIR server, before actually executing the query on the resulting data:

::

   https://vonk.fire.ly/Patient?name=Chalmers&_id=123

**Note**: since a FHIR server is allowed to ignore unknown and unimplemented parameters, this statement can produce unpredictable results. It is recommended to repeat your filter in the actual where clause, where you can use FhirPath expressions that are guaranteed and accurate.

Using
~~~~~

FQL allows defining a scope, but every implementation should bring a default scope. In an implementation guide, your project is your default scope, just like in `Firely Terminal <https://simplifier.net/downloads/firely-terminal>`__.

**Default scope**: to get to the default scope you do not have to do anything. The following query uses the default scope.

.. code:: sql

   from Patient select id

In a Simplifier guide, the default is your project (without package dependencies). The same applies to a project on Firely Terminal: it uses either your project or your current folder as the default scope. Firely Terminal allows an additional query when displaying the stack; in that case the default scope is just the stack.

.. code:: powershell

   > fhir stack "from Resource select id"

**Server scope**: to get resource content from a specific server, use the ``using 'url'`` clause.

.. code:: sql

   using 'https://vonk.fire.ly'
   from Patient select id

**Project scope**: within a project (a project on Simplifier, or simply a folder on your machine) you can use the ``project`` scope.

.. code:: sql

   using project
   from Patient select id

In most cases a project is the default scope, so you can leave out the using clause.

**Dependency scope**: a common case is a project with all its package dependencies included. You can achieve this with the ``scope`` clause.

.. code:: sql

   using scope
   from Patient select id

**Alias scopes**: FQL allows any other identifier (a simple name) to function as a scope alias, if a tool allows it. In Torinox, the url key of any of your own projects on Simplifier can be chosen as a scope.

.. code:: sql

   using myproject
   from Patient select id

**Package scopes**: this is not implemented yet, but we plan to allow any package that is a dependency in your project as a valid scope. It would probably look like this:

.. code:: sql

   using 'hl7.fhir.r3.core@latest'
   from Patient select id

The logic is probably going to be that a using string with an ``@`` sign is interpreted as a package, while a string that starts with ``http://`` or ``https://`` is treated as a FHIR server.

Limitations
~~~~~~~~~~~

Most implementations of FQL will not implement all scopes mentioned above. The default scope *should* work, but there are cases where a default scope has no meaning.

Field selection
---------------

Simple fields
~~~~~~~~~~~~~

The FQL syntax allows you to put JSON blocks almost anywhere in your select statement. This allows grouping of fields, but also renaming of existing fields in the original data.

**Renaming**: this example shows how you can set the column names containing the first and last name of a patient.

.. code:: sql

   from Patient
   select
       firstname: name.given,
       lastname: name.family

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.

Nested values
~~~~~~~~~~~~~

One of the core abilities of FQL is to help you get tree-shaped data in a table format. To get data on the top level of a resource, like the ``birthDate`` of a ``Patient``, you can use the same syntax to point to that field as you would in SQL.

.. code:: sql

   from
     Patient
   select
     birthDate

But for values that are deeper in the tree, a different syntax is needed. In the world of programming languages, the most common form is dot-notation or dereferencing, which describes a path from the top level of the tree into the node that you need. An example would be the fields of the name of a patient. The following query produces a table of the birth date, first name and last name of a patient:

.. code:: sql

   from Patient,
   select
       birthDate,
       name.given,
       name.family

Group unwrapping
~~~~~~~~~~~~~~~~

.. note::

   This syntax comes with FQL 3.

Group unwrapping helps you write shorter queries. When you need multiple nested values, group unwrapping helps you get multiple values from the same sub node. The following query produces a flattened list of the fields name.given and name.family.

.. code:: sql

   from Patient
   select name { given, family }

Other than the field names, it would produce the same result as writing:

.. code:: sql

   from Patient
   select
     name.given,
     name.family

Complex dereferencing
~~~~~~~~~~~~~~~~~~~~~

Note that although dereferencing in its basic form uses dot notation, you can actually use any FhirPath expression. The following will work:

.. code:: sql

   from Patient
   select
     name.where(use = 'official') { given, family }

But in many more complex cases, it might be easier to read when using a ``for`` expression. The following produces the same output:

.. code:: sql

   from Patient
   select
      for name where use = 'official'
      select { given, family }

See the For clause section for more information.

For clause
~~~~~~~~~~

For basic single field selections, a path-like FhirPath statement is usually good enough. But sometimes you want to have a table result within your selection.

We already covered the ``for`` clause as top-level syntax under Filtering:

.. code:: sql

   from Patient
   for name select { given, family }

You can use this same syntax within your select clause. The result will be a sub table.

.. code:: sql

   from Patient
   select
       id,
       for name select { use, given, family }

In some cases it is not useful to have a sub table, because not every rendering engine can render sub tables. The Simplifier rendering engine, however, can.

**Joins**: often the ``for`` syntax is used in combination with a field-level join, which causes the sub table to be joined with the main table. See the Field joins section for more information.

.. code:: sql

   from Patient
   select
       id,
       join for name select { use, given, family }

Field joins
~~~~~~~~~~~

Unlike SQL, FQL has to deal with the fact that FHIR data does not come in the shape of a table. Yet you need the same kind of output that an SQL statement would have produced. With SQL you know nested data will be in a different table, but with FHIR (or any tree-structured data) your nested data will often be part of the same resource. When you want to merge nested data in SQL, you use a table join. Because the data to join comes from within the resource itself, FQL has a join on the select level.

**Comparison to SQL**: in tree-shaped data, adding a subfield to your select-list requires no extra syntax other than 'dotting' into the tree. Where you would write this in SQL:

.. code:: sql

   select
     id
     PatientName.given,
   from
     Patient
     left join PatientName on PatientName.PatientId = Patient.id

In FQL you can simply write:

.. code:: sql

   from Patient
   select
      id,
      name.given

This assumes you have to deal with only one name. If you have multiple names, the FhirPath statement ``name.given`` will actually produce an array. In many cases you do not want an array as a result value. To fix that, you can either take only the first (``name.given[0]``) or do a join between the ``Patient`` and the array of ``given``:

.. code:: sql

   from Patient
   select
     id,
     join name.given

**Row ordering**: imagine you want to produce a row for your patients, with their name and identifier. It is possible that they have more than one identifier, which in this case should produce a separate row, with each row having a unique identifier but possibly a repeated first and last name.

.. code:: sql

   from Patient
   select
       name.family,
       name.given[0],
       join identifier.value

Since the resulting row is based on the resource, and the join is on a field inside that resource, you can place the join at any point in your select-list. So the following produces the same rows and values, just in a different order.

.. code:: sql

   from Patient
   select
       join identifier.value,
       name.family,
       name.given[0]

The order of the joins themselves does of course matter.

**Joining on multiple values**: it is quite common to join on more than one field, especially when you want to join on several values of a sub node. A good example is ``Patient.name``. To achieve a join over multiple values, you can use the unwrapping syntax (technically known as a group dereference):

.. code:: sql

   from Patient
   select
       identifier[0].value,
       join name { family, given[0] }

This query produces a row per pair of name values, repeating the identifier for each of those rows.

**Inner joins**: the ``join`` keyword is actually a shorthand for ``inner join``, so wherever you write ``join`` you can equally write ``inner join``. An inner join produces a row when both sides of the join have a value. In SQL that would produce rows where both tables 'meet', but with FQL the meeting already took place, since you are joining with values or sub values of the current row. The effect of an inner join is therefore mostly visible in that it skips rows that have no values for the field after the join. If you want a row regardless, use the ``left join``.

**Left joins**: a ``left join`` differs from an ``inner join`` in that it starts out with the left-side table of the join. With FQL that means a field join on a current row will always show the current row, regardless of whether there are values in the join field.

**Right joins**: for field joins there is no such thing as a right join. The explanation under inner joins helps to see why a ``right join`` on a field level has no meaning: if there is a field on the right side, there must be a row on the left side, since the field is part of that row.

Flattening
~~~~~~~~~~

By default FQL produces one table row per resource. But there are clear cases where you do not want that.

**Rows for deeper values**: to create a table from values deeper inside a resource, where it is not relevant for this specific result to know which resource the values belong to, you can follow up with a ``for`` clause instead of starting with a ``select``. Compare this:

.. code:: sql

   from StructureDefinition
   select snapshot.element.constraint.human

This results in one output row *per StructureDefinition*, while the following statement puts all the human-readable constraints from all StructureDefinitions in one long table.

.. code:: sql

   from StructureDefinition
   for
       snapshot.element.constraint
   select
       human

.. note::

   *(migration TODO)* Example output was rendered live on Simplifier:
   ``from StructureDefinition for snapshot.element.constraint select human take 3``.
   Consider adding a screenshot of the output table.

In some cases you want to display the array of a single resource as a table. For this purpose a top-level ``for`` clause is also useful: the select field list is grouped as one row with three columns for each page.

.. code:: sql

   from ImplementationGuide
   for page.page
   select {
       source,
       title,
       kind
   }

.. note::

   *(migration TODO)* Example output (top pages from this very Guide) was rendered live on Simplifier:
   ``from ImplementationGuide for page.page select { source, title, kind }``.
   Consider adding a screenshot of the output table.

Types
~~~~~

In normal cases, the data you are querying contains all type information, so within FQL there is no need to set the type of a field.

**Why types matter**: types become useful because the places where you use FQL have special rendering for some types. For example, a ``canonical`` becomes a link to the actual resource.

**Defining a type for a field**: in those cases where you do need to set the type of a field, you can specify the type using square brackets following the field name. If you do not use a field name, you will have to add one. In the following example, the field ``text`` is set to type ``markdown``.

.. code:: sql

   from
       Patient
   select
       id,
       name.given,
       text[markdown]: '### This is a title'

**Common types**:

- ``markdown``: renders the content through a markdown parser.
- ``canonical``: renders as a link to the resource.
- ``script``: renders as a (source) code block.

**Sub table types**: the Simplifier rendering engine has defined several types to make it possible to render data as known HTML tables:

- ``rows``: renders a table within a table.
- ``cols``: renders a transposed table where each record becomes a column.
- ``ul``: unordered list (bullets).
- ``ol``: ordered list (numbered).

Structures
~~~~~~~~~~

In most cases FQL is used to create tables, and it helps you by flattening a tree structure in several ways. But sometimes you want to create a tree structure: for example, if your output is not a table, or if you want to use sub tables. For that we have JSON structures.

**JSON structures**: this example shows how you can use JSON syntax to structure tree-shaped data.

.. code:: sql

   from Patient
   select
       metadata: {
           id,
           meta.profile
       }

This results in the following structure:

::

   table
       row
           metadata
               id
               profile

When you define a named group, you can nest to any depth. Your 'position' in the resource you are getting data from will not change, so with this example you still access fields from the root of the resource. To descend into the resource, use a FhirPath expression, a ``for`` clause, or a grouped unwrap.

.. _fql_fhirpath:

FhirPath
--------

FhirPath is a fundamental part of FQL. As you might have read, FQL is a combination of the power of SQL, JSON and FhirPath. But it is FhirPath that gets the values out of your data.

Whenever you select fields in FQL, you do that with FhirPath. In the following statement you see, with gradually increasing complexity, how values are extracted from a resource:

.. code:: sql

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

And for the last line there are actually three:

::

   identifier
   system
   value

The following sections describe how FhirPath works and how you can apply it.

Dot notation
~~~~~~~~~~~~

FQL is all about getting data from the inside of a tree structure into a new form, most of all table form, and it uses the power of FhirPath to do that. FhirPath is a language developed as part of the FHIR standard to get values out of FHIR resources, and FHIR resources are trees.

**Descending**: FhirPath uses a syntax common to many programming languages: it uses dots to drill into (descend into) a structure. The official term for this is dereferencing. The statement ``Patient.name.given`` drills from the root of the tree, the ``Patient``, into the ``name`` of the patient, and after that into the given part of the name.

**Multiple branches**: since each descent can result in more than one branch (a patient can have more than one name), each descent leads to more values. So ``Patient.name`` gives you back all the names of the patient, ``name.given`` gives you back all given names of the patient's name, and ``Patient.name.given`` gives you all givens of all names of the patient.

**Optional resource name**: in any FhirPath statement it is optional to add the root of the path, the resource name. So the following statements produce the same outcome:

::

   Patient.name.given
   name.given

Indexes
~~~~~~~

Just as the dot notation gives you all branches that match the name after the dot, an index limits what you get. The expression ``Patient.name.given`` gives you all given names of all names of a patient. But what if we only want the first given name of the first name of a patient?

**Zero is first**: in the world of computer languages, we refer to the first element in any collection as element zero. If you find this confusing, think of your age. In the first year of your life your age is zero. The moment you become one is when year zero has ended. That is how we look at indexes too.

**Providing an index**: in FhirPath you can describe which element you want in a collection by using square brackets. So the first name of a patient is ``Patient.name[0]``, and the first given name of that first name is:

::

   Patient.name[0].given[0]

Functions
~~~~~~~~~

Once you have a value, or a collection of values, you often want to do something more specific with it. So, besides getting data out of a resource, you might also want to change that data. For that, FhirPath has the concept of functions. Sometimes a function just limits the data you get, but often it helps you change it or tells you something about that data.

A function is called by using a dot after a FhirPath field name, followed by two round brackets ``(`` and ``)``. Between those brackets you might have to provide some additional information, depending on the function.

**The exists() function**: ``exists()`` tells you whether the value you are looking for is actually there. If it is, the function gives back ``True``; otherwise ``False``. So the following expression checks whether a patient record has a birthDate:

::

   Patient.birthDate.exists()

**The count() function**: ``count()`` is even more interesting: it tells you how many elements were found. Imagine a patient with two names, and for each name two given names, for example these four given names:

::

   Patient.name[0].given[0] = 'William'
   Patient.name[0].given[1] = 'John'

   Patient.name[1].given[0] = 'Bill'
   Patient.name[1].given[1] = 'Jack'

The expression ``Patient.name.given.count()`` will return the value ``4``.

**Optional parameters**: if you supply a value, or another expression, inside the brackets of a function, that is called a parameter. Some functions have mandatory parameters, and some have optional ones. Take for example the ``exists()`` function: you may provide an additional condition. The following expression checks whether the patient has a phone listed in their telecommunication channels.

::

   Patient.telecom.exists(system = 'phone')

**Evaluation**: since the primary design goal for FhirPath was validation (expressing how a resource *should* look), there are a lot of functions that tell you whether something is true.

Comparison expressions
~~~~~~~~~~~~~~~~~~~~~~

You can compare fields to a value, and the result evaluates to ``True`` or ``False``. For example, this equation tells you whether the family name of a patient is 'John':

::

   Patient.name[0].family = 'John'

You can use expressions like this inside functions. The combination makes them very powerful. The following expression gives you all the patient name entries where the family name is 'John':

::

   Patient.name.where(family = 'John')


Output helpers
--------------

Because **FQL** is primarily used for generating readable content, it has some basic syntax to specify rendering parameters.

Page Variables & Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FQL supports **Page Variables**. This allows for dynamic filtering and the use of FQL within **Page Templates** for easy reuse across multiple pages.

Output Formats
~~~~~~~~~~~~~~

Use the ``output`` attribute to display data in formats other than tables.

+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| Mode       | Tag Example                              | Description                                                                                                |
+============+==========================================+============================================================================================================+
| **Table**  | ``<fql output="table" headers="false">`` | Standard table; headers can now be toggled off.                                                            |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| **Inline** | ``<fql output="inline" delimiter=", ">`` | Renders values as text. The ``delimiter`` defines the character(s) used to separate each item in the list. |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| **Lists**  | ``<fql output="ul">`` or ``output="ol"`` | Renders a column as an unordered list (``ul``) or ordered list (``ol``).                                   |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+

With Clause
~~~~~~~~~~~

The with clause allows you to add keywords that are not interpreted by FQL, but are passed on to the rendering engine.

For Simplifier and Firely Terminal rendering, this responds to the ``header`` keyword, which adds headers to table output.

::

   from Patient
   select
     name.given[0], name.family[0]
   with
     header

Similarly, if you want to make sure there is no header in case it is set as the default, you can use:

::

   with
     no header

Although each rendering engine is free to interpret flags set in the with clause, there are two common flags that should generally be understood. They are known by at least Simplifier and Firely Terminal:

- ``header``: adds a header to the table.
- ``subheader``: adds headers to sub tables.
