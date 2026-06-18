.. _qc_fhir-actions:

FHIR actions
============

These actions operate on the FHIR content of your resources.

Predicate
---------

The ``predicate`` action gives an error for each resource where the predicate (a FhirPath expression) evaluates to false.

::

   - action: predicate
     predicate: id.exists()
     error: This resource does not have an id

Same
----

The ``same`` action makes sure all values at a specific location in a resource are the same. You can provide any FhirPath expression, as long as it produces a single value. This is useful when the actual value is not fixed; for example, it is good practice for all resources in a project to have the same version, but that value changes over time.

::

   - category: profile
     same: version

Manifest
--------

The ``manifest`` action checks the validity of your package manifest: it checks for mandatory fields and whether values are correct. If your filter is broader, it ignores files that are not named ``package.json``. It does *not* check your package dependencies; use the ``dependencies`` action for that.

::

   - action: manifest
     file: package.json

Pinning
-------

Canonical pinning is a Simplifier feature that pins canonical references to a specific version during package creation, so references remain stable and unambiguous once a package is published. QC provides two complementary tools to verify that pinning will behave as expected before you create a package.

**Explicit version rule (free)**: included in the free, minimal and recommended rule sets. It flags resources that already carry an explicit ``version`` element, because Simplifier preserves that version rather than overwriting it with the package version. Use it to confirm that any pre-set versions are deliberate.

::

   - name: explicit-version
     predicate: version.exists() = false
     status: "Checking for resources with an explicit version"
     severity: info
     error: EXPLICIT_VERSION
     error-message: This resource has an explicit version, which Simplifier will not overwrite during package creation. Verify that this version is correct and intentional.

**Canonical pinning check (paid)**: the ``canonical-pinning`` action analyses all canonical references in your project and reports potential issues that could cause pinning to produce an unexpected result.

::

   - action: canonical-pinning

It produces the following messages, which you can suppress using the error code (for example ``suppress: https://simplifier.net/qc/errors/evaluation|PINNING_MISSING``):

+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Severity    | Error code                       | Message                                                                                                                                                                                        |
+=============+==================================+================================================================================================================================================================================================+
| ``info``    | ``PINNING_ALREADY_PINNED``       | This reference is already pinned, we will skip it.                                                                                                                                             |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``info``    | ``PINNING_MULTIPLE_OCCURRENCES`` | This reference points to a canonical that has been found multiple times in the scope. We will pin to version X.                                                                                |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``warning`` | ``PINNING_UNVERSIONED_FOUND``    | This resource has an unpinned canonical reference that was resolved to a resource that doesn't have a version. We will not pin it during package creation.                                     |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``warning`` | ``PINNING_MISSING``              | This resource has an unpinned canonical reference that cannot be resolved. We will not pin it during package creation. Make sure the package dependencies are set correctly.                   |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Validate
--------

The ``validate`` action validates all resources against the base profiles and their stated base claims, set in ``meta.profile``.

::

   - category: resource
     action: validate

By default, all validation uses the Firely .NET SDK validator, which provides comprehensive error detection and improved error messages. You can override this per validation action with the optional ``flavor`` parameter:

- ``firely`` (default): the Firely .NET SDK validator.
- ``netsdk``: the legacy .NET validator, for strictly matching older validation logic.

::

   - category: resource
     action: validate
     flavor: netsdk

**HL7 Java validator**: the HL7 Java validator runs as its own Quality Control action (currently for beta users). Add it as its own action. It is also available in the Validator Playground via the drop-down menu (also limited to beta users).

::

   - category: resource
     action: java-validate

Dependencies
------------

The ``dependencies`` action evaluates all dependencies from your project, including deep dependencies (dependencies of dependencies). It gives errors if there is a problem with version matching, or if dependencies are not found (for example a typo in the name, or a version that does not exist). It also warns when you use multiple FHIR versions, when a newer version is available, or when a pre-release version is in your dependencies.

::

   - name: package-dependencies-validation
     action: dependencies
     status: Checking the package dependencies
     file: package.json
