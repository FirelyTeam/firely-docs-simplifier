Exists
------

The exists command, will check if the filter you specified results in at least one file.

This example checks if the provided file actually exists.

::

   - action: exists
     file: example-patient.xml

But you can also specify a filter

::

   - action: exists
     files: /**/*.xml

This will check if there is at least 1 xml file.

It's also possible to use it with other filters, like predicate:

::

   - filter: id.exists()
   - action: exists
