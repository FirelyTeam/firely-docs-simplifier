Files
-----

The files filter accepts a file pattern as configuration. Any file that goes through the filter and matches the pattern, is moved to the target (the next bucket). All other files are ignored.

Example:

::

     - files: *.xml

Wildcards
~~~~~~~~~

You can use wildcards like most operating systems accept them: a star or question mark.

::

     - files: /examples/*-example-*.xml

Glob wildcards
~~~~~~~~~~~~~~

The files filter also accepts globbing-wildcards to allow any number of subdirectories (including no subdirectory):

::

     - files: /**/*.json

The above example captures all json files in the source, no matter what folder.

Single file:
~~~~~~~~~~~~

You can use a single file: a pattern with no wild cards:

::

       - files: package.json
         copy: /package

The above example copies the package.json file to the output package folder.
