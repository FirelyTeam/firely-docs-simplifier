File filters
============

You can filter any file bassed on a globbing pattern as you may now from your own computer file system:

Examples:
---------

A specific file:

::

   # this rule applies to exactly one file:
   - action: validate
   - file: example-patient.json

All xml files; make sure that all xml examples have a profile field:

::

   - predicate: meta.profile.exists()
     files: example/*.xml

Globbing
--------

With globbing you can use a double star ``**`` to define any sequence of subdirectories. This example

::

     /**/example.xml 

will include

::

     main\example.xml
     main\sub\example.xml
     main\sub\sub\example.xml

Multiple file filters
---------------------

The files filter also allows you to define multiple filters.

::

   - action: validate
     files: 
        - /*.json
        - /*.xml

Excluding files
---------------

When you want to exclude a pattern, just use an exclamation mark. If you want to exclude ``package.json`` from the example above, write it like the following. You have to add quotes, or YAML will get confused:

::

   - action: validate
     files: 
        - /*.json
        - "!package.json" 
        - /*.xml
