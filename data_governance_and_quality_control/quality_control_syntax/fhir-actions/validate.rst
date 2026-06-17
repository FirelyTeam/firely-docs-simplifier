Validate
~~~~~~~~

The validate action, validates all resources against the base profiles and their stated base claims, set in ``meta.profile``.

::

   - category: resource
     action: validate

In Quality Control, you can choose which validator is used to validate your resources. Simplifier supports multiple validator engines, allowing you to align validation behavior with your needs.

By default, all validation in Simplifier uses the Firely .NET SDK validator. You can override this per validation action by selecting a different validator flavor.

Available validator flavors:

::

   - flavor: firely   # Default – Firely .NET SDK validator
   - flavor: netsdk   # Legacy .NET validator
