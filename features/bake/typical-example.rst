A typical example
=================

This is a typical example of a package creation script, with each step explained. So we have broken the script up in single pipelines, and we descripe what each pipeline does.

.. _1-get-active-resources:

1. Get active resources
^^^^^^^^^^^^^^^^^^^^^^^

Here we move all files that contain a FHIR conformance resource (profiles, extensions, etc.), which have the status 'Active'. And we put these files to a temporary bucket called 'staging'. This bucket helps us group files that we need later. We also define the destination folder for the files: 'package', which is where all conformance resources in a FHIR package should end up in.

::

   move-active-resources:
     - category: Conformance
     - filter: status='active'
     - move: /package/
     - target: staging

.. _2-examples:

2. Examples
^^^^^^^^^^^

Here we take all FHIR resources of the category 'Instance' (so, no conformance or terminology resources), but just simple resources like an example Patient or Organization. We also add these to the staging bucket, but we move them into a subfolder of the package, called 'examples'.

::

   move-examples:
     - category: Instance
     - move: /package/examples
     - target: staging

.. _3-yamlgen:

3. YamlGen
^^^^^^^^^^

Here we take all YAMLGen script files that can generate resources. We let YamlGen run these scripts to generate the resources. We move them into a folder called 'generated'. This also goes into the 'staging' bucket.

::

   yaml-gen:
     - files: /**/*.gen.yaml
     - action: yamlgen
     - move: /package/generated/
     - target: staging

.. _4-run-fsh-files:

4. Run FSH files
^^^^^^^^^^^^^^^^

Just as with the YAMLgen, FSH will generate FHIR resources. This pipeline will run the SUSHI tool to run the FSH script and let it generate resources, and we will put the generated resource files into the same subfolder 'generated'.

::

   sushi:
     - files: /**/*.fsh
     - action: sushi
     - move: /package/generated/
     - target: staging

.. _5-json-transform:

5. JSON transform
^^^^^^^^^^^^^^^^^

The FHIR package spec states that all resources files in a FHIR package should be formatted as .JSON to help make it simpler for other tool builders to ingest package content. This pipeline takes all resources in the ``staging`` bucket, and transforms them to JSON, if they are not JSON yet.

As you can see we no longer define a temporary bucket to collect them. So this pipeline puts all content into the *real* output: your package.

::

   to-json: 
     - source: staging
     - category: Resource
     - transform: json

.. _6-adding-a-package-manifest:

6. Adding a package manifest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A package is not valid if it does not contain a package manifest. So we take the package.json file from your source folder, or Simplifier project and add it to the package folder. As you

::

   manifest:
     - files: package.json
     - move: /package

.. _7-adding-a-package-index:

7. Adding a package index
^^^^^^^^^^^^^^^^^^^^^^^^^

Not all client tools know how to generate an index of your package content. So to make that easier, we defined in the FHIR package specification, that a package *SHOULD* have an index file, to be able quickly assess what it's contents are.

We take all files in the output (note, they do not get deleted from the output!) and we give them to a action called ``create-package-index``, which will analyse all resources in the output and generate an index file with metadata about these resources:

::

   index-file:
     - source: output
     - files: /package/**/*.json
     - action: create-package-index
     - move: /package

.. _8-done:

8. Done.
^^^^^^^^

And now your package is ready to go.
