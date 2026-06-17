Assert
------

The *Assert* command will validate each resource in your filter, but instead of generating issues that come from the validation, it will do the opposite. It will only check if the specified errors actually occur. This is useful for unit testing. By default assert will use the Firely .NET SDK validator, this can be switched to the Legacy or java validator by setting the flavor in the assert.

Specific codes
~~~~~~~~~~~~~~

::

   - file: invalid-patient.json
   - assert: R103

This will assert that a specific error with code R103 comes out of validating that file.

Any
~~~

If you want to just make sure that any error has occurred, you can use the ``any`` qualifier:

::

   - files: invalid-resources/*.json
     assert: any

Severity
~~~~~~~~

You can also specify the severity of the errors you expect:

::

   - files: files-with-warnings/*.json
     assert: warning
