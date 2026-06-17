Source
------

The **source** action determines where files come from for the next step in a pipe. It basically determines the set of files that you work with.

Usage:

::

     - source: temp-bucket

Default
~~~~~~~

By default, the source is set implicitly to the **input** bucket (usually your project).

::

     - source: input

Note
~~~~

Be aware that if you set a source half way a pipe, the files before that might end up lost.

In the following example, the json resources get lost in a temporary bucket. In the next step, the files from the staging bucket are used to create snapshots and after that placed in the (default) **output** bucket.

::

     - files: /*.xml
     - transform: json
     - source: staging
     - action: snapshot
