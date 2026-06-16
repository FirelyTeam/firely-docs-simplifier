Embedded Rendering
==================

.. important::

    *This feature is available for anyone with a registered Simplifier account.*

Simplifier can render FHIR content that you embed directly in your own website using an ``iframe``. Three types of content can be embedded:

- **Resource rendering** – a single resource rendered as a tree, XML or JSON.
- **Table rendering** – the result of an FQL query rendered as a table.
- **Snippet rendering** – the FHIR content of a snippet.

For all embed types you can hide the Simplifier header by adding ``&header=false`` to the URL. Removing the header requires an Enterprise license.

You can adjust the ``height`` and ``width`` of the ``iframe`` to suit your page.

Resource rendering
------------------

Use the following URL format to render a single resource::

    https://simplifier.net/embed/<command>?scope=<project or package>&canonical=<resource canonical>

The ``<command>`` is one of the rendering widgets also available in guides:

- ``render`` – renders the resource as a tree.
- ``xml`` – renders the resource as XML.
- ``json`` – renders the resource as JSON.

Parameters:

- ``scope`` – the source of the resource, either a project or a package (for example ``package:hl7.fhir.r4.core@4.0.1``).
- ``canonical`` – the canonical URL of the resource. For resources in a package you may instead reference them by ``name``.
- ``header`` – set to ``false`` to hide the Simplifier header (requires an OEM license).

For example, the URL below renders the tree of the ``Patient`` resource from the FHIR R4 core package::

    https://simplifier.net/embed/render?scope=package:hl7.fhir.r4.core@4.0.1&name=Patient

To embed this rendering in your own website, use the following HTML::

    <iframe src="https://simplifier.net/embed/render?scope=package:hl7.fhir.r4.core@4.0.1&name=Patient" height="400px" width="100%"></iframe>

Below you see the result:

.. raw:: html

  <iframe src="//simplifier.net/embed/render?scope=package:hl7.fhir.r4.core@4.0.1&name=Patient" height="400px" width="100%"></iframe>

Table rendering
---------------

Tables are generated with FQL (the FHIR Query Language). Create your query in the `FQL Playground <https://simplifier.net/fql>`_ and generate a permanent link via the **Share** menu. The results are cached but stay live: when the underlying data changes, the cache expires and the table refreshes.

The resulting embed URL has the following format::

    https://simplifier.net/embed/fql/<hash>

Parameters:

- ``styled`` – set to ``false`` to remove the default styling of the output table.
- ``header`` – set to ``false`` to hide the Simplifier header (requires an OEM license).

To embed an FQL table, use the following HTML::

    <iframe src="https://simplifier.net/embed/fql/8ddbd5d8d16e00d" height="400px" width="100%"></iframe>

Snippet rendering
-----------------

Use the following URL format to render the FHIR content of a snippet::

    https://simplifier.net/embed/snippet?user=<username>&key=<snippet urlkey>&format=<format>

Parameters:

- ``user`` – the username of the snippet owner.
- ``key`` – the URL key of the snippet.
- ``format`` – the output format.
- ``header`` – set to ``false`` to hide the Simplifier header (requires an OEM license).

For example, the URL ``https://simplifier.net/embed/snippet?user=mharthoorn&key=28`` renders the FHIR content of a snippet. To embed it in your own website, use the following HTML::

    <iframe src="https://simplifier.net/embed/snippet?user=mharthoorn&key=28" height="400px" width="100%"></iframe>
