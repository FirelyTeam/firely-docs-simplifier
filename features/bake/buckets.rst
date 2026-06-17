Buckets
-------

A bake script works with 'buckets' to get and store files.

Bake: Input and Output
~~~~~~~~~~~~~~~~~~~~~~

Every bake pipe starts with an **Input** bucket. This contains all the files in your project. But Bake can work with any file system as a source. And every bake ends with an **Output** bucket. Normally the contents of the package you are creating.

Step: Source and target
~~~~~~~~~~~~~~~~~~~~~~~

Every step in a bake has a **Source** and a **Target**. The first step in a pipe, logically has the **Input** bucket as source. The last step in a pipe has the **Output** as **Target**.

Unconnected buckets
~~~~~~~~~~~~~~~~~~~

Buckets that not are the target of any step will be empty. If another step use them as source, it will not produce an error, but they will be empty.

If you define a target bucket, that is not picked up by any other step, the files won't end up in the **Output** and the contents of the bucket will be lost when the bake is done.
