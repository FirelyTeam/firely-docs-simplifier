The Structure of a Bake script
------------------------------

Pipes and Steps
~~~~~~~~~~~~~~~

A bake script consists of one or more **pipes**. Each pipe consists of one or more steps, and a step is either a filter or an action.

Basic Syntax
~~~~~~~~~~~~

A script is written in YAML, and the basic format looks like this:

::

   pipe:
     - filter: value
     - action: value
     
   pipe:
     - filter: value
     - filter: value
     - action: value

Of course the words ``pipe``, ``filter`` and ``action`` are just there to show you the structure. In practice, a pipe will look something like this:

::

   copy-examples:
       - files: examples/*.xml
       - transform: json
       - move: package/examples/

In this example, the ``files`` step is a filter that takes a selection of the input files. The ``transform`` action converts all files from ``xml`` to ``json``. And the ``move`` command defines where those files end up in the target.

Source and target
-----------------

A bake script starts with a source: a physical or virtual folder with files and subfolders. And ends in a target: another folder where all transformed, filtered and generated content is saved.

Defining actions and filters
----------------------------

Every action and filter has a name. If an action requires configuration, you can use the action as the key, and the configuration as the value:

::

     - move: /package/examples

If an action does not need configuration, you can use the general ``action`` key:

::

     - action: snapshot
