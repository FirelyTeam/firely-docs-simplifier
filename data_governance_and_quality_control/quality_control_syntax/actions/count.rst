Count
-----

The ``count`` action will check if your filter contains exactly the amount you specify.

::

   - file: /**/package.json
     count: 1

You can also use it to make sure a certain file type does not exist:

::

   - filter: /**/*.xml
     count: 0
