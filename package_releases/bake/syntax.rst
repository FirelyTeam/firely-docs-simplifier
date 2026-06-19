.. _bake_syntax:

Writing a bake script
=====================

A bake script is written in YAML. This page covers the building blocks: the YAML basics, the structure of a script, buckets, pipes, and how errors are handled.

YAML
----

YAML is a very simple but expressive configuration language. Here are the basics you need to write **Bake** scripts.

**Key-value pairs**:

::

   color: blue

**Child properties**: you can define child or sub properties.

::

   car:
      wheels: 4
      color: blue
      roof: yes

**Lists**:

::

   cars:
     - Volvo
     - Volkwagen
     - Chrysler

**JSON**: each item in a list can be a value or another YAML structure with its own properties and sub-properties. You can also write objects inline, as JSON.

::

   people:
     - firstname: John
       lastname: Smith

::

   people:
      - { firstname: John, lastname: Smith }

There is more to YAML, but this is enough to get you started. For more, see the `YAML specification <https://yaml.org/spec/1.2.2/>`__.

Structure
---------

A bake script consists of one or more **pipes**. Each pipe consists of one or more steps, and a step is either a filter or an action. A script is written in YAML, and the basic format looks like this:

::

   pipe:
     - filter: value
     - action: value

   pipe:
     - filter: value
     - filter: value
     - action: value

The words ``pipe``, ``filter`` and ``action`` are just there to show the structure. In practice a pipe looks something like this:

::

   copy-examples:
       - files: examples/*.xml
       - transform: json
       - move: package/examples/

Here the ``files`` step is a filter that selects input files, the ``transform`` action converts files from xml to json, and ``move`` defines where those files end up in the target.

**Source and target**: a bake script starts with a source (a physical or virtual folder with files and subfolders) and ends in a target (another folder where all transformed, filtered and generated content is saved).

**Defining actions and filters**: every action and filter has a name. If an action requires configuration, use the action as the key and the configuration as the value (for example ``- move: /package/examples``). If an action does not need configuration, use the general ``action`` key (for example ``- action: snapshot``).

Buckets
-------

A bake script works with 'buckets' to get and store files.

**Input and output**: every bake pipe starts with an **Input** bucket, which contains all the files in your project (though Bake can work with any file system as a source). Every bake ends with an **Output** bucket, normally the contents of the package you are creating.

**Step source and target**: every step has a source and a target. The first step in a pipe has the Input bucket as its source; the last step has the Output as its target.

**Unconnected buckets**: buckets that are not the target of any step will be empty. If another step uses them as a source it will not produce an error, but they will be empty. If you define a target bucket that is not picked up by any other step, those files will not end up in the Output and will be lost when the bake is done.

Pipes
-----

**Implicit pipes**: by default, steps in the same pipe are chained automatically. The example above works just as well written like this:

::

   json-snapshot-output:
       - filter: *.xml
       - transform: json
       - action: snapshot
       - copy: /package

All steps in between are connected with automatically created buckets, so the target of the previous step is the source of the next.

**Explicit pipes**: for any step you can explicitly define the source or the target. This lets you collect different sets of files in one place to apply the same processing.

::

   Get-xml-files:
       - source: input
       - filter: *.xml
       - target: xml-bucket

   Transform-to-json:
       - source: xml-bucket
       - transform: json
       - target: json-bucket

   Create-Snapshots:
       - source: json-bucket
       - action: snapshot
       - target: snapshot-bucket

   Generate-Output:
       - source: snapshot-bucket
       - copy: /package
       - target: output

Usually this is not necessary, because you can achieve the same with less text using implicit pipelines. Buckets become useful when you want data to cross from one pipeline to the next, or have some data skip a step.

Error handling
--------------

To give you maximum control over the quality of the output, each action requires you to provide precisely the files it needs. A file of the wrong type will usually produce an error. For example, if you give an example (instance) Patient to a snapshot action, it will skip the file and produce an error.

**Skip or fail**: in some cases an error or warning is neither convenient nor helpful. For example, when running the JSON transform you just want to make sure all files are JSON, so it ignores files that are already JSON without producing an error.
