Sushi (FSH)
-----------

.. warning::

   This is experimental, so please use with caution.

You can run the Sushi compiler, in your bake pipeline. The following step generates all the resource files from a FSH script and will put then in the root folder of the output:

::

   run-sushi:
     - files: /**/*.fsh
     - action: fsh

If you just want to run it on a single script, do it like this:

::

   run-sushi:
     - files: myscript.fsh
     - action: fsh

A typical step would look something like this:

::

   run-sushi:
     - files: /**/*.fsh
     - action: fsh
     - move: /package/generated
