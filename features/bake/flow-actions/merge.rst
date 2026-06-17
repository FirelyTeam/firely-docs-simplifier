Merge
-----

The **merge** action merges the content of one bucket into the active flow. This allows you to get the content from several buckets into one pipeline.

Example usage:

::

     - merge: temp-bucket

Usage case example:
~~~~~~~~~~~~~~~~~~~

In the following example, all xml files are transformed to json and placed in a staging bucket. After that the json files are collected from source, and then the staging bucket files are merged with those

::

   get all xml files:
     - files: //*/*.xml 
     - transform: json
     - target: staging


   get all json files:
     - files: //*/*.json
     - merge: staging
     - move: /package/  
