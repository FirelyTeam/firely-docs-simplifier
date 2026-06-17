FhirPath Filters
================

This filter allows you to filter a resource on a FhirPath predicate. That means that only files for which the FhirPath statement is true, remain in your selection.

- Any FhirPath statement that results in an unambiguous true or false
- Any FhirPath statement that results in a single value (if the value is there, it's a match)

QC currently supports FhirPath v2.0.0. For more information about FhirPath, see the `FhirPath standard <http://hl7.org/fhirpath/>`__.

Examples:
~~~~~~~~~

An example true/false expression.

::

   This will select all files that have an id.
   - filter: id.exists()

An example of a existence match:

::

   # Resources that have a meta.profile field:
   - meta.profile

Resource types are a valid FhirPath expression. So This wil select all Patient resources.

::

   - filter: Patient
