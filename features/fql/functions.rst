.. _fql_functions:

Functions
=========

FQL ships with a few FhirPath functions that are specifically created and tailored to FQL. They are part of the FQL core infrastructure, so you can use them wherever you use FQL. This page describes two of them: the :ref:`link function <fql_functions_link>` and the :ref:`fields function <fql_functions_fields>`.

.. _fql_functions_link:

Link function
-------------

The ``link()`` function makes a link from any kind of (understood) reference. It optionally takes a title as a second parameter for the generated link. It works with three kinds of input:

**A resource**: link to the resource itself (or another resource) by providing it as the first parameter. The ``%context`` variable refers to the current resource.

.. code:: sql

   link(%context)
   link(%context, 'title')

**A canonical**: link to a resource by its canonical. The current scope is used to provide the full context.

.. code:: sql

   link(meta.profile)
   link(meta.profile, 'title')

**A reference**: link from a reference by passing the reference (a complex value) as the first parameter.

.. code:: sql

   from Observation select link(performer)
   from Observation select link(performer, 'title')

.. note::

   FQL currently only has a link provider for Simplifier itself, so links cannot yet point to your guide pages. For downloaded guides, all links will still point to Simplifier. We are working on a feature called DocBridges that will let you create links to other targets, such as the pages within your own guide.

.. _fql_functions_fields:

Fields
------

The ``fields()`` function helps you discover the structure of a resource, or of a field within a resource.

The following example shows, for each patient, a list of the fields in that resource:

.. code:: sql

   from Patient select fields()

To list only the fields within a specific structure, apply it to that field:

.. code:: sql

   from Patient select name.fields()
