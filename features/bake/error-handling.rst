Error handling
--------------

In order to give you maximum control over the quality of the output, each action requires you to provide precisely the files that it needs. A file of the wrong type will usually produce an error.

For example, if you give an example (instance) Patient to a Snapshot action, it will skip the file and produce an error.

Skip or fail
~~~~~~~~~~~~

In some cases, giving a warning or error is neither convenient nor helpful. For example: when running the JSON transform, you just want to make sure that all files are JSON. So in this case it will ignore files that are already JSON, without producing an error.
