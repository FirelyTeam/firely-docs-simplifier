.. _qc_actions:

Actions
=======

These are the actions you can use in a rule. Most are generic (file and count based); the FHIR-specific ones are described under :ref:`FHIR actions <qc_fhir-actions>`.

Include
-------

By default, running a ruleset file does not run any other rules, to give you maximum control. Sometimes you want to also run a set of rules defined elsewhere; for example, a 'check broken links' ruleset that first runs all the default rules. The ``include`` action does this. You can also create a batch file that includes all your other rule set files.

::

   - include: default

   - include: myrules

   - include: some-directory/myrules.rules.yaml

It is not a problem to reference the same file multiple times, because rules are indexed by their name.

Unique
------

The ``unique`` action takes all resources (within the filter, if provided) and checks whether each of them has a value that is unique compared to that same value on all the other resources.

::

   - filter: StructureDefinition
     unique: url

The ``action`` key is optional here, because it is implied by the ``unique`` property.

Assert
------

The ``assert`` action validates each resource in your filter, but instead of reporting the issues from validation, it does the opposite: it checks whether the specified errors actually occur. This is useful for unit testing. By default it uses the Firely .NET SDK validator; you can switch the flavor.

**Specific codes**: assert that a specific error code comes out of validating the file.

::

   - file: invalid-patient.json
   - assert: R103

**Any**: assert that any error occurred.

::

   - files: invalid-resources/*.json
     assert: any

**Severity**: assert the severity of the expected errors.

::

   - files: files-with-warnings/*.json
     assert: warning

Suppress
--------

The ``suppress`` property suppresses specific validation errors when they are known to be irrelevant or incorrectly triggered, for example an ``eld-1`` error that does not apply to your use case. Suppression currently applies to the entire error code; more fine-grained suppression is not yet supported.

::

   - category: resource
     action: validate
     suppress: eld-1

Exists
------

The ``exists`` action checks whether the filter you specified results in at least one file.

::

   - action: exists
     files: /**/*.xml

It can be combined with other filters, such as a predicate:

::

   - filter: id.exists()
   - action: exists

Count
-----

The ``count`` action checks whether your filter contains exactly the amount you specify. You can also use it to make sure a certain file type does not exist (``count: 0``).

::

   - file: /**/package.json
     count: 1

Min
---

The ``min`` action checks whether there are at least a certain number of files in your filter.

::

   - category: Example
     min: 10

Max
---

The ``max`` action checks whether there are at most a certain number of files in your filter.

::

   - category: ValueSet
     max: 30

Cardinality
-----------

The ``cardinality`` action checks whether a filter produces a number of files within a specified range. Separate the numbers with a dash ``-`` or a double dot ``..``.

::

   - category: ValueSet
     cardinality: 10-50

::

   - files: input/*.yaml
     cardinality: 2..8

Unique filenames
----------------

When you publish, most files end up in the ``/package`` folder. If files come from different folders but have the same name, one will overwrite the other. The ``unique-filenames`` action reports an error if it finds duplicate filenames.

::

   - action: unique-filenames
     files: /**
