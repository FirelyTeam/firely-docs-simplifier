.. _bake_steps:

Steps
=====

Each step in a pipe is either a filter, an action, or a flow action. This page is the reference of all available steps.

Filters
-------

Files
~~~~~

The ``files`` filter accepts a file pattern as configuration. Any file that matches the pattern is moved to the target (the next bucket); all other files are ignored.

::

   - files: *.xml

**Wildcards**: you can use wildcards like most operating systems accept them, a star or a question mark.

::

   - files: /examples/*-example-*.xml

**Glob wildcards**: the ``files`` filter also accepts globbing wildcards to allow any number of subdirectories (including none). The example below captures all json files in the source, no matter what folder.

::

   - files: /**/*.json

**Single file**: you can use a single file, a pattern with no wildcards. The example below copies ``package.json`` to the output package folder.

::

   - files: package.json
     copy: /package

Filter
~~~~~~

The ``filter`` command accepts a FHIRPath predicate to filter files. Any file that contains a resource matching the predicate is passed through.

::

   - filter: status='active'

::

   - filter: id.exists()

The first example accepts all resources that have a ``status`` field with the value 'active'. Files excluded by this filter are: files that are not resources, files that do not have a status field, and files that have a status field with a value other than 'active'.

Category
~~~~~~~~

The ``category`` filter lets you filter supersets and subsets of known FHIR resource types.

::

   - category: profile

**Categories** you can choose from:

- **Conformance**: all conformance resources (StructureDefinitions, ...).
- **Terminology**: all terminology resources (code systems, value sets, ...).
- **Instance**: all instance resources (Patient, Organization, etc.).
- **Profile**: all resource structure definitions.
- **Extension**: structure definitions that describe an extension.
- **Type**: all structure definitions that describe a type.
- **Resource**: all files that are resources.

**Resource types**: you can also choose any resource type as a category, such as ``- category: StructureDefinition`` or ``- category: Patient``.

Delete
~~~~~~

The ``delete`` filter is the inverse of the ``files`` filter. Where ``files`` tells you which files you want to work with, ``delete`` filters out all files from the working set that match the pattern, and places the rest in the target bucket.

Imagine you have three files in the **input** bucket: ``file1.xml``, ``file2.doc`` and ``file3.json``. The following pipe takes all files, filters out the xml files, and saves the rest in the package folder of the **output**:

::

   copy-json-to-package:
     - delete: /*.xml
     - move: /package/

So only the json file is copied to the output. In this simple example, ``- files: /*.json`` followed by ``- move: /package`` has the same effect.

Actions
-------

Snapshot
~~~~~~~~

The ``snapshot`` action creates a snapshotted version of a resource (StructureDefinition). Only successful snapshots are copied to the output; the rest of the files are ignored.

::

   generate-snapshots:
     - category: StructureDefinition
     - action: snapshot
     - copy: /package

**Pass**: if you want resources that fail to get a snapshot to still be included in the output, set the ``pass`` property to true (``yes`` also works).

::

   - action: snapshot
     pass: yes

YamlGen
~~~~~~~

The ``yamlgen`` action runs the YamlGen parser on all provided files. You should only provide actual YamlGen files (``*.gen.yaml``); other files will produce an error. The parser produces a series of files that are copied to the output. The example below runs all YamlGen scripts in the root and places the generated resources in the ``generated-resources`` folder.

::

   - files: *.gen.yaml
     action: yamlgen
     copy: /generated-resources

For full information on the YamlGen resource, see https://simplifier.net/docs/yamlgen.

Sushi (FSH)
~~~~~~~~~~~

.. warning::

   This is experimental, so please use with caution.

You can run the Sushi compiler in your bake pipeline. The following step generates all the resource files from an FSH script and puts them in the root folder of the output:

::

   run-sushi:
     - files: /**/*.fsh
     - action: fsh

A typical step would look something like this:

::

   run-sushi:
     - files: /**/*.fsh
     - action: fsh
     - move: /package/generated

Transform
~~~~~~~~~

The ``transform`` action transforms xml resource files to json or vice versa. If a file is already in the required format, it passes through unchanged.

::

   - files: //*/*.xml
   - transform: json

Create-Package-Index
~~~~~~~~~~~~~~~~~~~~~

The ``create-package-index`` action creates a json index file for a FHIR package. The file contains metadata for all conformance resources.

Usually this step should be performed when your output is ready, so either on a final staging bucket or on the output bucket itself. The following example takes the **output** bucket, builds a package index file from it, and adds that file back to the output. (The last line is optional, since by default the last step saves to **output**.)

::

   - source: output
   - action: create-package-index
   - target: output

Flow actions
------------

Move
~~~~

The ``move`` action takes all files from the source, regardless of their current folder or subfolder, and places them in the provided target folder.

::

   move: /examples

Merge
~~~~~

The ``merge`` action merges the content of one bucket into the active flow. This allows you to get the content from several buckets into one pipeline.

::

   - merge: temp-bucket

In the following example, all xml files are transformed to json and placed in a staging bucket. After that, the json files are collected from the source, and then the staging bucket files are merged with those.

::

   get all xml files:
     - files: //*/*.xml
     - transform: json
     - target: staging

   get all json files:
     - files: //*/*.json
     - merge: staging
     - move: /package/

Source
~~~~~~

The ``source`` action determines where files come from for the next step in a pipe. It basically determines the set of files that you work with.

::

   - source: temp-bucket

**Default**: by default, the source is set implicitly to the **input** bucket (usually your project).

**Note**: be aware that if you set a source halfway through a pipe, the files before that might end up lost. In the following example the json resources get lost in a temporary bucket; in the next step the files from the staging bucket are used to create snapshots and are then placed in the (default) **output** bucket.

::

   - files: /*.xml
   - transform: json
   - source: staging
   - action: snapshot

Target
~~~~~~

The ``target`` action determines where the files from the current step are placed.

::

   - target: temp-bucket

In this example a ``temp-bucket`` is created and all the files from the previous step are placed in it.

**Default**: by default, the target is set implicitly to the **output** bucket (usually your project).

**Note**: be aware that if you do not pick up the contents of a bucket, they will not go to the **output** of the bake.
