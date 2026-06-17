Unique Filenames
----------------

In the end, most files in your project will end up in a package, once you publish. In a package all files are moved to the ``/package`` folder. If files come from different folders but they have the same name, there will be a collision once they are moved there. Or rather: one will overwrite the other.

Quality Control can help you discover these name clashes. The ``unique-filenames`` evaluator will give an error if it finds duplicate filenames.

Example
~~~~~~~

::

   - action: unique-filenames
     files: /**
