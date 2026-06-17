Dependencies
------------

The ``dependencies`` command will evaluate all dependencies from your project. Including deep dependencies: dependencies from other dependencies.

It can give errors

- if there is a problem with the version matching,
- if dependencies are not found, for example because you have a typo in the name or a version that does not exist.

It will also give you warnings for

- using multiple FHIR versions
- if there is a newer version available
- if there is a pre-release version in your dependencies.

Example
^^^^^^^

::

   - name: package-dependencies-validation
     action: dependencies
     status: Checking the package dependencies
     file: package.json
