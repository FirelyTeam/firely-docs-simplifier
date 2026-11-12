.. _simplifier_api:

Simplifier API
==============

Simplifier.net has several APIs for working with the platform and your content programmatically. This section covers the parts that apply across Simplifier: authentication, the package server, and the account-level endpoints. Endpoints that belong to a specific feature are documented with that feature and linked from the overview below.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   authentication
   package-server

Try it in Postman
-----------------

To test the APIs, see `our Postman API documentation <https://www.postman.com/firelyteam/workspace/firely-server-public-test-collections/collection/19815841-0104b4f2-2cde-463c-b6c4-da3154458d41?action=share&creator=19815841&active-environment=19815841-1656f90a-6364-4084-af40-a865a95b98b1>`_
or run the Postman collection directly:

|Run in Postman|

.. |Run in Postman| image:: https://run.pstmn.io/button.svg
   :target: https://god.gw.postman.com/run-collection/19815841-0104b4f2-2cde-463c-b6c4-da3154458d41?action=collection%2Ffork&collection-url=entityId%3D19815841-0104b4f2-2cde-463c-b6c4-da3154458d41%26entityType%3Dcollection%26workspaceId%3D822b68d8-7e7d-4b09-b8f1-68362070f0bd

Available APIs
--------------

.. list-table::
   :header-rows: 1
   :widths: 25 35 40

   * - API
     - Base URL
     - What it is for
   * - :doc:`Authentication <authentication>`
     - ``https://api.simplifier.net/token``
     - Get a JWT token to call the other APIs.
   * - :ref:`Features API <features_api>`
     - ``https://api.simplifier.net``
     - Your plan's features, your projects, and the files in them.
   * - :doc:`Package Server API <package-server>`
     - ``https://packages.simplifier.net``
     - Find and download public and private FHIR packages.
   * - :ref:`Project FHIR API <simpl_endpoint>`
     - Shown under **API** on the project page
     - Read, create, update and search the resources in a project with a FHIR client.
   * - :ref:`Project ZIP API <simpl_endpoint>`
     - ``https://api.simplifier.net/<yourproject>/zip``
     - Download or upload a complete project as a ZIP file.

.. _features_api:

Features API
------------

The Features API returns information about your account: the features your plan gives you access to, the projects you have access to, and the files within them. It uses :doc:`JWT authentication <authentication>`.

* ``GET https://api.simplifier.net/myfeatures``

  Returns the features that this user has a right to use in their current plan.

* ``GET https://api.simplifier.net/api/v2/myprojects``

  Returns the Simplifier.net projects for the user.

* ``GET https://api.simplifier.net/api/v3/projects/{{project_urlkey}}/Files``

  Returns a list of files contained in the Simplifier.net project.
