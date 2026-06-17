Delete
------

The delete filter, is the inverse of the **files** filter. Where the files filter tells you which files you want to work with, the delete filter, filters out all files from the working set that do match the pattern, and places the rest in the target bucket.

Example
~~~~~~~

Imagine you have 3 files in the **input** bucket (your project):

::

     file1.xml
     file2.doc
     file3.json

The following action takes all files, then filters out the xml files, and saves those in the package folder of the **output**:

::

   copy-json-to-package:
     - delete: /*.xml
     - move: /package/

So only the json file is copied to the output. In this simple example, the following script has the same effect:

::

   copy-json-to-package:
     - files: /*.json
     - move: /package
