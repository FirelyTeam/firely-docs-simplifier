.. _simpl_endpoint:

API Endpoint
^^^^^^^^^^^^

Simplifier.net has multiple APIs available for interacting with the platform and your content on it:

.. contents::
  :depth: 2
  :local:

To test these APIs you can see `our Postman API documentation <https://www.postman.com/firelyteam/workspace/firely-server-public-test-collections/collection/19815841-0104b4f2-2cde-463c-b6c4-da3154458d41?action=share&creator=19815841&active-environment=19815841-1656f90a-6364-4084-af40-a865a95b98b1>`_ 
or directly run the following Postman collection:

|Run in Postman|

.. |Run in Postman| image:: https://run.pstmn.io/button.svg
   :target: https://god.gw.postman.com/run-collection/19815841-0104b4f2-2cde-463c-b6c4-da3154458d41?action=collection%2Ffork&collection-url=entityId%3D19815841-0104b4f2-2cde-463c-b6c4-da3154458d41%26entityType%3Dcollection%26workspaceId%3D822b68d8-7e7d-4b09-b8f1-68362070f0bd

Authentication
""""""""""""""

JWT authentication
==================

The Simplifier API endpoints are available for Simplifier users based on JWT authentication. 

First retrieve a JWT token from Simplifier. This works with a POST at 
https://api.simplifier.net/token with your account details in the message body 
in JSON format. Header should be ``Content-Type: application/json``. 
A ``token`` and ``refreshToken`` will be returned.

::
  
  POST https://api.simplifier.net/token 
  
  Header:
  Content-Type: application/json

  Body:
    {
      "Email": "youremail@example.com",
      "Password": "your password"
    }
    
Next, you can use this token with an authorization header that includes 
your retrieved token as shown below. The token is valid for a limited time.

::
  
  GET https://api.simplifier.net/<yourproject>/zip
  
  Header:
  Authorization: Bearer <access_token> 

Once your token is expired you can use the ``refreshToken`` to retrieve new
token and refreshToken pair. The refreshToken has a much longer expiry time.

::
  
  POST https://api.simplifier.net/token/refresh
  
  Header:
  Content-Type: application/json

  Body:
    {
      "Token": <token>,
      "RefreshToken": <refreshToken>
    }

Your outstanding refreshTokens are visible at https://simplifier.net/myrefreshtokens,
where you can choose to revoke them if you no longer wish them to be valid.

Basic Auth
==========

The ZIP and FHIR API endpoints alternatively also support authentication with 
Basic Auth directly. However, going forward we recommend the JWT authentication instead.

Features API
""""""""""""

The Simplifier Features API allows you to retrieve feautures for your account on the
platform, like the feautures your plan gives you access to, the projects you have 
accesss to and the files within them.

The currently supported calls include:

* GET https://api.simplifier.net/myfeatures
  
  Return the features that this user has a right to use in their current plan.

* GET https://api.simplifier.net/api/v2/myprojects
  
  Return the Simplifier.net projects for the user.
  
* GET https://api.simplifier.net/api/v3/projects/{{project_urlkey}}/Files
  
  Return a list of files contained in the Simplifier.net project.


Package Server API
""""""""""""""""""

To get :ref:`FHIR Packages <package_management>` via the API, you can use the Simplifier package server API. It serves both publicly published packages, created in Simplifier or beyond, and privately published FHIR packages.

The API for **public FHIR packages** is documented and can be tested directly on `SwaggerHub <https://app.swaggerhub.com/apis-docs/firely/Simplifier.net_FHIR_Package_API>`_. The API endpoint of the Simplifier FHIR package Server is: https://packages.simplifier.net. The Simplifier package server is the backend for `the official FHIR Package Registry <https://registry.fhir.org/>`_ and is also available as https://packages.fhir.org.

The API for **private FHIR packages** is exactly the same as the public API, but requires authentication. You can use the JWT token you retrieved in the previous section to authenticate your requests. Additionally, it uses the :ref:`package feed <package_feeds>` Urlkey as the base URL for the API, for example ``https://packages.simplifier.net/feeds/mySimplifierPackageFeedUrlkey/`` for a package feed with the URL key ``mySimplifierPackageFeedUrlkey``.

**Note**: It is not possible to create a package using the API. For more information on how to create a package please read our `documentation <../data_governance_and_quality_control/simplifierPackages.html#publish-packages>`_ on packages. 

NPM compatible endpoint
=======================

Besides the regular package endpoint, there is also a more limited NPM compatible endpoint, which allows you to install FHIR package using any NPM client. Keep in mind that this will mix the FHIR packages with your regular NPM packages and does not support FHIR-specific features, like searching on canonicals or FHIR versions.

::
  
  https://packages.simplifier.net/<package-name>/-/<package-name>-<package-version>.tgz


The above example, then becomes:

::
  
  https://packages.simplifier.net/hl7.fhir.r3.core/-/hl7.fhir.r3.core-3.0.2.tgz


Project FHIR API
""""""""""""""""

The endpoint of a Simplifier.net project can be used to search for resources in the project 
or to read, create and update resources with a FHIR client. History 
searches are also supported. To retrieve the endpoint of a project in Simplifier 
click on ``API`` in the top right menu when visiting either the 
:ref:`project <project-page>` or :ref:`resource <resource-page>` page. 
The below image shows the location.

.. image:: ../images/ProjectApiLocation.png
   :scale: 75%

It supports all the API operations like reading, creating or deleting a resource and search.

You can also use this to point `Firely Server <https://docs.fire.ly/projects/Firely-Server/en/latest/>`_ 
to a Simplifier.net project via the FHIR API to import the conformance resources. 
Either via a (manual) import operation or by configuration
of the project's endpoint and authentication in the appsettings.

Project ZIP API
"""""""""""""""
The project ZIP API is available at project level. You can use the ZIP endpoint 
for synchronization of a complete project. With an HTTP tool you can use 
GET or PUT on https://api.simplifier.net/<yourproject>/zip to retrieve or
update your project in zipped form.

.. image:: ../images/ProjectApiLocation.png
   :scale: 75%

Global FHIR API
"""""""""""""""

.. TODO: Should we keep the global API?

Using the global Simplifier FHIR API, users can search for all resources in Simplifier. For example, the request ``GET https://stu3.simplifier.net/open/Patient`` can be used to retrieve all (STU3) Patient resources from Simplifier. The global Simplifier endpoint of your resource is available at the resource page beneath the API icon. All resources have a globally unique GUID.

.. image:: ../images/ResourceGlobalEndpoint.PNG
   :scale: 75%

Search Parameters 
=================

It is possible to use search parameters and search result parameter to filter the results from Simplifier. All parameters, with the exception of 'description', follow the STU3 FHIR specification. The following parameters are implemented:

Search paramters

=============  ==========  =============================================================   ================================
Name           Type        Description                                                     Expression
=============  ==========  =============================================================   ================================
url            uri         The uri that identifies the structure definition                StructureDefinition.url
type           token       Type defined or constrained by this structure                   StructureDefinition.type
status         token       The current status of the structure definition                  StructureDefinition.status
publisher      string      Name of the publisher of the structure definition               StructureDefinition.publisher
jurisdiction   token       Intended jurisdiction for the structure definition              StructureDefinition.jurisdiction
kind           token       (primitive-type | complex-type | resource | logical) |br|       StructureDefinition.kind
                           Only accepted value is "logical", the rest of the |br|
                           values will return non-logical model resources. |br|
                           (So this parameter will distinguish between |br|
                           profiles and logical models)
description    string      Will look at the publication description used in |br|           StructureDefinition.description
                           Simplifier (set either manually by user or generated |br| 
                           automatically using the FHIRpath metadata expressions |br|
                           written in project settings), not the description |br|
                           value inside the Confromance Resources. |br|                
=============  ==========  =============================================================   ================================

Search result parameters

=============  ============================================================================================    
Name           Description                                           
=============  ============================================================================================    
_sort          Only default "lastUpdated" is implemented.     
_count         Default value is "false". The parameter _count is defined as a hint to 
               Simplifier regarding how many resources should be returned in a single page.       
_summary       The _summary parameter requests the server to return
               a subset of the resource. 
=============  ============================================================================================    

.. |br| raw:: html

   <br />

Examples

* type |br|

::

  GET https://stu3.simplifier.net/<yourproject>/Patient
  
* description |br|

::

  GET https://stu3.simplifier.net/<yourproject>/StructureDefinition?description:contains=<searchedterm>

* _summary |br|

::

  GET https://stu3.simplifier.net/<yourproject>/StructureDefinition?_summary=true
