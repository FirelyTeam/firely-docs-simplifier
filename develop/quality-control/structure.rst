Structure
---------

A yaml rules file is named as follows: ``<name>.rules.yaml``. The
default ruleset is called ``default.rules.yaml``

Rulesets
~~~~~~~~~

A yaml ruleset file consists of entries, start with a dash, followed by
a series of indented key-value pairs: Notice that the comments here are
not part of the entry, just an description how to read it.

.. code-block:: yaml

   # comment for first entry

   - first: value
     second: value
     third: value

   # comment for second entry

   - first: value
     second: value
     third: value

.. figure:: /images/run-quality-control.png
    :alt: Simplifier.net project drop-down for running rulesets
    :align: right

    Executing a ruleset in Simplifier.net

Default rulesets
~~~~~~~~~~~~~~~~~

Simplifier will provide a few default rulesets, accessible to every project:
``minimal.rules.yaml`` and ``recommended.rules.yaml``.

Minimal ruleset
================

The minimal series a very small set of rules that we know everyone
aggrees on. This minimal series include the bulk validation rule, 
validating all resources against the FHIR specification and your profiles.

Additionally it validates whether all your canonical URLs are unique, 
another minimal requirement for a FHIR specification.

.. warning::

  The rules below are a snapshot in time of the QC minimal rules and are subject to change.

.. code-block:: yaml

   # This is the minimal rule series

   - action: parse
     name: parse-fhir-resources 
     status: "Checking if all FHIR Resource files can be parsed"
     files:
       - /**/*.xml
       - /**/*.json
       - "!package.json"

   - name: resource-validation
     status: "Validating resources against the FHIR standard and their profiles"  
     action: validate
     category: Resource
     suppress: 
       - 6005
       - eld-16
  
   - action: unique
     name: unique-canonicals
     status: "Checking if all StructureDefinitions have a unique canonical"
     filter: StructureDefinition
     unique: url 

*Minimal ruleset snapshot 05-2021*

Recommended ruleset
====================

The recommended series is a more opiniated set of rules that we defined,
including what we believe a FHIR project should conform too. On top of the
minimal rules checks are added to ensure:

- All your resources have an `id`, which is not required but good practice.
  This will allow you to refer to any resource uniquely, even if it does not
  have a canonical URL.
- That the snapshot of the resource is not provided in your source models.
  While providing a snapshot is surely allowed, it makes your resources larger 
  than necessary and snapshots will be computed again by many tools anyway. 

.. warning::

  The rules below are a snapshot in time of the QC recommended rules and are subject to change.

.. code-block:: yaml

   - include: minimal
  
   - name: id-mandatory
     status: "Checking if all resources have an id"
     predicate: id.exists()
     error-message: "Resource {{filepath}} must have an id"

   - name: no-snapshot
     status: "Checking that structure definitions do not have a pre-generated snapshot"
     filter: StructureDefinition
     predicate: snapshot.element.count() = 0
     error-message: You should not generate a snapshot in your source. Allow the tools to generate the snapshot.

*Recommended ruleset snapshot 05-2021*

Custom rulesets
~~~~~~~~~~~~~~~~

You can add other rule files to your project, as long as their name
follows this pattern: ``<name>.rules.yaml`` and they are placed in the root
of your project. They will all be discovered by the system, and
exposed in the Quality Control menu of your project, to allow you to run
them.

Running individual or multiple rulesets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In Simplifier and in :doc:`Firely Terminal<firely_terminal_docs:index>`
you can run individual rulesets, in which case the default set and 
other sets will not be run.

You can however *include* other rulesets in a Yaml Rule File, allowing
you to run multiple sets at once. See the
:doc:`include<rule-actions/include>` action for more details.