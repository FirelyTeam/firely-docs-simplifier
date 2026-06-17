Pipes
-----

Implicit pipes
~~~~~~~~~~~~~~

By default steps are chained automatically when they are in the same pipe: The example given earlier works just as well, written like this:

::

   json-snapshot-output:
       - filter: *.xml
       - transform: json
       - action: snapshot
       - copy: /package

All steps in between are connected with automatically created buckets that connect the steps. So the target of the previous step is the source of the next step.

Explicit pipes
~~~~~~~~~~~~~~

For any step, you can explicitly define the **Source** or the **target**. This allows you to collect different sets of files in one place to apply the same processing on it.

::

   Get-xml-files:
       - source: input
       - filter: *.xml
       - target: xml-bucket

   Transform-to-json:
       - source: xml-bucket
       - transform: json
       - target: json-bucket

   Create-Snapshots:
       - source: json-bucket
       - action: snapshot
       - target: snapshot-bucket

   Generate-Output:
       - source: snapshot-bucket
       - copy: /package
       - target: output

Usually this is not necessary, because you can achieve the same with less text using implicit pipelines. When you want to have data cross from one pipeline to the next, or have some data skip a step, buckets can become very useful.

::

     - source: input
       files: *.xml
       target: xml-files-bucket

In the previous example, the input is chosen as the source of the action. this is optional, since that is already the defualt. And the target is a bucket with the name ``xml-files-bucket``. The action makes sure that every xml file (in the root), is copied to the xml-files-bucket.
