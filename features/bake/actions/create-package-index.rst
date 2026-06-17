Create-Package-Index
--------------------

The **create-package-index** creates a json index file for a FHIR package. The file contains meta data for all conformance resources.

Usage:

::

     - action: create-file-index

Practical
~~~~~~~~~

Usually this step should be performed when your output is ready. So either do it on a final staging bucket, or on the output bucket itself. The following example, takes the **output** bucket, builds a package index file from it, and adds that file to the output.

::

     - source: output
     - action: create-index-file
     - target: output

(Note that the last option is optional, since it's default that the last step saves to **output**)
