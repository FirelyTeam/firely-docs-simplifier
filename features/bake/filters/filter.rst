Filter
------

The filter is a command that accepts a FHIRPath predicate to filter files. Any file that contains a resource that matches the predicate is passed through.

Examples:

::

       - filter: status='active'

::

       - filter: id.exists()

The above example accepts all resources that have a field called status that has a value 'active'. Files that are excluded in this filter are:

- files that are not resources
- files that do not have a status field
- files that have a status field but with a value other than 'active'
