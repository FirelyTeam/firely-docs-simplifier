Link Function
=============

The ``link( )`` function, makes a link from any kind of (understood) reference. It can optionally take a title as parameter for the generated link.

Resource link
-------------

You can create a link to the resource itself (or another resource), by providing it as the first parameter.

.. code:: text

   link(%context)
   link(%context, 'title')

The ``%context`` here is a FhirPath variable that refers to the current resource.

A canonical
-----------

You can create a link to a resource by it's canonical. The current scope will be used to provide the full context.

.. code:: text

   link(meta.profile)
   link(meta.profile, 'title')

A Reference type
----------------

You can create a link to a reference by adding the reference (complex value) as first parameter:

.. code:: text

   from Observation select link(performer)
   from Observation select link(performer, 'title')

NOTE
^^^^

We currently don't have an FQL link provider for anything else than to Simplifier itself. Links cannot yet point to your guide pages themselves. So this won't work for downloaded guides: all links will still point to Simplifier. We are working on a feature called DocBridges, that will allow you to create links to other targets like the pages within your guide.
