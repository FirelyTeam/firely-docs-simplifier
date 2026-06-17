Suppress
--------

Quality Control allows you to suppress specific validation errors when they are known to be irrelevant or incorrectly triggered. This can be useful, for example, to suppress an eld-1 error that does not apply to your use case.

Suppression is configured by specifying the error code you want to suppress. You can add this in your configuration to narrow down where you want the error suppressed.

::

   - category: resource
     action: validate
     suppress: eld-1

Note: Suppression currently applies to the entire error code. More fine-grained suppression (for example, targeting a specific element or constraint) is not yet supported.
