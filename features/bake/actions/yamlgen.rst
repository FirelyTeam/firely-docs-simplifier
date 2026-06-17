YamlGen
-------

The yamlgen action runs the yamlgen parser on all provided files. You should only provide actual yamlgen files (\*.gen.yaml). Other files will produce an error.

The yamlgen parse will produce a series of files that are copied to the output.

Example:

::

     - files: *.gen.yaml
       action: yamlgen
       copy: /generated-resources

The above example runs all yamlgen scripts in the root, and places the generated resources in the ``generated-resources`` folder.

More information
----------------

For full information on the yamlgen resource, see:

https://simplifier.net/docs/yamlgen
