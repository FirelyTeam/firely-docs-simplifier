Pinning
-------

Canonical pinning is a Simplifier feature that pins canonical references to a specific version during package creation. This ensures that references remain stable and unambiguous once a package is published.

QC provides two complementary tools to help you verify that pinning will behave as expected before you create a package.

--------------

Explicit Version Rule (free)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The below rule is included in the free, minimal and recommended QC rule sets. It flags resources that already carry an explicit ``version`` element, because Simplifier will preserve that version rather than overwrite it with the package version during package creation.

::

    -  name: explicit-version
       predicate: version.exists() = false
       status: "Checking for resources with an explicit version"
       severity: info
       error: EXPICIT_VERSION
       error-message: This resource has an explicit version, which Simplifier will not overwrite during package. Verify that this version is correct and intentional, as it will differ from the package version.

Use this rule to audit your project before publishing and confirm that any pre-set versions are deliberate.

--------------

Canonical Pinning Check (paid)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``canonical-pinning`` action analyses all canonical references in your project and reports potential issues that could cause pinning to produce an unexpected result. This action is a part of the paid plans.

::

   - action: canonical-pinning

Messages produced
^^^^^^^^^^^^^^^^^

+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Severity    | Error code                       | Message                                                                                                                                                                                        |
+=============+==================================+================================================================================================================================================================================================+
| ``info``    | ``PINNING_ALREADY_PINNED``       | This reference is already pinned, we will skip it.                                                                                                                                             |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``info``    | ``PINNING_MULTIPLE_OCCURRENCES`` | This reference points to a canonical that has been found multiple times in the scope. We will pin to version X.                                                                                |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``warning`` | ``PINNING_UNVERSIONED_FOUND``    | This resource has an unpinned canonical reference that was resolved to a resource that doesn't have a version. We will not pin it during package creation.                                     |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``warning`` | ``PINNING_MISSING``              | This resource has an unpinned canonical reference '[canonical url]' that cannot be resolved. We will not pin it during package creation. Make sure the package dependencies are set correctly. |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

You can suppress specific messages using the error code:

::

   - action: canonical-pinning
     suppress: https://simplifier.net/qc/errors/evaluation|PINNING_MISSING
