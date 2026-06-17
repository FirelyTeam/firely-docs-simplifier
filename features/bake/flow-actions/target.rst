Target
------

The **target** action determines where files come from for the next step in a pipe. It basically determines the set of files that you work with.

Usage:

::

     - target: temp-bucket

In this example, a temp-bucket is created and all the files from the previous step are placed in that bucket.

Default
~~~~~~~

By default, the target is set implicitly to the *output* bucket. (usually your project).

::

       target: output

Note
~~~~

Beware that if you do not pick up the contents of a bucket. they won't go to the **output** of the bake.
