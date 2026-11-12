.. _api_authentication:

Authentication
==============

The Simplifier API endpoints are available for Simplifier users based on JWT authentication. The same token works for the :ref:`Features API <features_api>`, :doc:`private package feeds <package-server>`, and the :ref:`project FHIR and ZIP endpoints <simpl_endpoint>`.

JWT authentication
------------------

First retrieve a JWT token from Simplifier. This works with a POST at
https://api.simplifier.net/token with your account details in the message body
in JSON format. The header should be ``Content-Type: application/json``.
A ``token`` and ``refreshToken`` are returned.

::

  POST https://api.simplifier.net/token

  Header:
  Content-Type: application/json

  Body:
    {
      "Email": "youremail@example.com",
      "Password": "your password"
    }

Next, use this token in an authorization header, as shown below. The token is valid for a limited time.

::

  GET https://api.simplifier.net/<yourproject>/zip

  Header:
  Authorization: Bearer <access_token>

Once your token has expired, use the ``refreshToken`` to retrieve a new
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
where you can revoke them if you no longer want them to be valid.

Basic Auth
----------

The ZIP and FHIR API endpoints also support authentication with
Basic Auth directly. However, we recommend JWT authentication instead.
