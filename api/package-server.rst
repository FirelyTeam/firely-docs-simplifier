.. _package_server_api:

Package Server API
==================

To get :ref:`FHIR Packages <package_management>` via the API, use the Simplifier package server API. It serves both publicly published packages, created in Simplifier or beyond, and privately published FHIR packages.

Public packages
---------------

The API for **public FHIR packages** is documented and can be tested directly on `SwaggerHub <https://app.swaggerhub.com/apis-docs/firely/Simplifier.net_FHIR_Package_API>`_. The API endpoint of the Simplifier FHIR package server is https://packages.simplifier.net. The Simplifier package server is the backend for `the official FHIR Package Registry <https://registry.fhir.org/>`_ and is also available as https://packages.fhir.org.

Private packages
----------------

The API for **private FHIR packages** is exactly the same as the public API, but requires authentication. Use a :doc:`JWT token <authentication>` to authenticate your requests. Additionally, it uses the :ref:`package feed <package_feeds>` URL key as the base URL for the API, for example ``https://packages.simplifier.net/feeds/mySimplifierPackageFeedUrlkey/`` for a package feed with the URL key ``mySimplifierPackageFeedUrlkey``.

.. note::

   You cannot create a package using the API. To learn how to create a package, see :ref:`package_management`.

NPM compatible endpoint
-----------------------

Besides the regular package endpoint, there is also a more limited NPM compatible endpoint, which allows you to install FHIR packages using any NPM client. Keep in mind that this mixes the FHIR packages with your regular NPM packages and does not support FHIR-specific features, like searching on canonicals or FHIR versions.

::

  https://packages.simplifier.net/<package-name>/-/<package-name>-<package-version>.tgz

For example:

::

  https://packages.simplifier.net/hl7.fhir.r3.core/-/hl7.fhir.r3.core-3.0.2.tgz
