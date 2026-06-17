Using
-----

FQL allows defining a scope, but a every implementation should bring a default scope. In an implementation guide, your project is your default scope, just like in `Firely Terminal <https://simplifier.net/downloads/firely-terminal>`__.

Default Scope
~~~~~~~~~~~~~

To get to the default scope, you don't have to do anything. The following query uses the default scope.

.. code:: text

   from Patient select id

In a Simplifier guide, the default is your project (without package dependencies). Same for a project on Firely Terminal. It will use either your project or your current folder as the default scope. But Firely Terminal allows an additional query when displaying the stack. In that case the default scope is of course just the stack.

.. code:: powershell

   > fhir stack "from Resource select id"

Server Scope
~~~~~~~~~~~~

To get resource content from a specific server, you can do that with the *using 'url'* clause:

.. code:: text

   using 'https://vonk.fire.ly'
   from Patient select id

Project Scope
~~~~~~~~~~~~~

Within a project, either a project on Simplifier, or on your machine, simply a folder, you can use the *project* scope:

.. code:: text

   using project
   from Patient select id

In most cases, a project is the default scope, so you won't have to add it explicitly - you can leave out the using clause.

The dependency scope
~~~~~~~~~~~~~~~~~~~~

A common case is to see a project with all its package dependencies included. You can achieve this with the *scope* clause:

.. code:: text

   using scope
   from Patient select id

Alias scopes
~~~~~~~~~~~~

FQL allows any other identifier (simple name) to function as a scope alias. If a tool allows it. In Torinox, the url key of any of your own projects on simplifier can be chosen as a scope:

.. code:: text

   using myproject
   from Patient select id

Package scopes
~~~~~~~~~~~~~~

This is not implemented yet, but we plan to allow any package that is a dependency in your project as a valid scope. It would probably look like this:

.. code:: text

   using 'hl7.fhir.r3.core@latest'
   from Patient select id

The logic is probably going to be that a using string with an ``@`` sign will be interpreted as a package, while a string that starts with ``http://`` or ``https://`` will be treated as a fhir server.

Limitations
-----------

Most implementations of FQL will not implement all scopes mentioned above. The default scope *SHOULD* work, but there are cases where a default scope has no meaning.
