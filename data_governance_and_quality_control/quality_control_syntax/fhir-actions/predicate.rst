Predicate
---------

The predicate rule, gives an error for each resource where the predicate evaluates to false.

The value should contain a FHIR Path expression.

Example:
~~~~~~~~

::

   - action: predicate
     predicate: id.exists()
     error: This resource does not have an id
