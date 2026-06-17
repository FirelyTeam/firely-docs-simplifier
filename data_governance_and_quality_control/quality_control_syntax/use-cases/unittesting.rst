Unit Testing
------------

Unit testing is a strategy from software engineering to make sure some errors do not occur and other errors do occur. Some errors are good. For errros that you do not want to occur, you can use regular validation. But lets say you have a profile that makes sure that any patient resource has not more than two identifiers. If you want to make sure that you properly implemented, you should be able to create an example Patient that has 3 identifiers, and then you want that example to fail on your profile. If you used regular validaton on that, you will always get errors returned that are actually good. And even more: it would be bad if the error wasn't there. For that you can add unit tests to your project, using the ``assert`` rule.

The assert rule
~~~~~~~~~~~~~~~

The assert rule checks for error systems or codes in the output of the validator. If the error is there, the assertion will pass as OK. If the error isn't there, it will report an error. You could see it as an error-inverter.

Example
~~~~~~~

The following rule will feed all resources in the ``invalid-examples`` folder, that end on ``.missingref.xml``. And it will make sure that there is an error code of ``4005`` in the output. The full error for missing references is ``http://hl7.org/fhir/dotnet-api-operation-outcome|4005``, but just the code is sufficient in most cases.

::

   - files: /invalid-examples/*.missingref.xml
     assert: 4005 
     # error code for missing references

Approach
--------

The general approach to create unit tests is to put all profiles and extensions in one folder, your good examples in one folder and your failing examples in another. This way you can run the regular validation on all but the failing examples. And run the unit test on those instead of the validator. This is an example of that approach:

::

   - action: validate
     files: /conformance-resources/*.*

   - action: validate
     files: /good-examples/*.json
       
   - assert: any
     files: /failing-examples/*-cardinality.json
