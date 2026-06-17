Manifest Evaluator
------------------

The manifest evaluator, will check for the validity of your package manifest.

The most typical form is:

::

   - action: manifest
     file: package.json

if your filter is broader, it will ignore files that are not named ``package.json``.

The manifest evaluator, will check for mandatory fields and whether values are correct.

This evaluator will *not* check for your package dependencies. There is a separate command ``dependencies`` for that.
