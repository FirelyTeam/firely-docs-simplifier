Types
-----

In normal cases, the data you are querying contains all type information, and so within FQL there is no need to set the type of a field.

Use
~~~

Types become useful, since the places where you use FQL, has special rendering for some types. Like a ``canonical`` will become a link to the actual resource.

Defining a type for a field
~~~~~~~~~~~~~~~~~~~~~~~~~~~

In those cases where you do need to set the type of a field, you can specify the type using quare brackets following the field name. If you do not use a field name, you will have to add that field name.

In the following example, the field ``text`` is set to type ``markdown``.

.. code:: sql

       from
           Patient
       select
           id,
           name.given,
           text[markdown]: '### This is a title'

Common types
~~~~~~~~~~~~

- ``markdown``: renders the content through a markdown parser.
- ``canonical``: will render as a link to the resource
- ``script``: will render as a (source) code block

Sub table types
~~~~~~~~~~~~~~~

The Simplifier rendering engine has defined several types to make it possible to render data as known HTML tables:

- ``rows``: will render a table within a table
- ``cols``: will render a transposed table where each record becomes a column.
- ``ul``: unordered list (bullets)
- ``ol``: ordered list (numbered)

Do realize that in FHIR, specifically
