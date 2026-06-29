.. _ig_page_setup:

Page setup and reuse
====================

This page covers how individual guide pages are wired together: page headers, guide-wide variables, reusable templates, links, images, and formatting. Setting these up well saves you repeating yourself and keeps the guide consistent as it grows.

Page headers
------------

The YAML header of a page (the part between the ``---`` lines) sets properties that affect the whole page:

::

   ---
   topic: MyPatientPage
   subject: Patient
   expand: 2
   ---

- **topic**: a stable name you can link to from other pages (see `Linking to pages`_). Linking by topic keeps working even when the guide is published, exported, or copied.
- **subject** (or ``name`` / ``canonical``): sets the page's resource scope. When set, the ``tree``, ``xml``, ``json`` (and other) widgets on the page no longer need a canonical parameter, which makes pages much easier to write and maintain. This is especially useful with templating.
- **expand**: ``1``, ``2``, ... expands resource trees to that depth; ``yes`` expands fully. Works for StructureDefinitions and example instances.
- **lang**: sets the page language; all language-aware renderers pick it up automatically.

Any property that a rendering widget understands (such as ``buttons``, ``diff``, ``hybrid``) can also be set in the header.

Global variables
----------------

The ``variables.yaml`` file in the root of your guide acts like an invisible page: instead of content, it holds variables you define once and reuse across the guide. You can also use it for guide-wide settings, such as the tree ``expand:`` option (for example ``expand: yes`` to expand every level, or ``expand: 3`` for the third level).

Templating
----------

.. note::

   Templating is a beta feature. Be careful using it in production. It also works for FQL tables, except for FQL tables placed inside custom tables or tabs.

With the ``{{page:}}`` placeholder you can render a hidden page as a template, so all your resource pages share one consistent layout.

1. **Create a hidden template page** (not available in legacy guides) and give it a topic. Use widgets without a scope, for example a tabbed tree/XML/JSON view. The preview on the template page itself shows errors because it has no scope; that is expected and does not affect pages that apply the template.

   ::

      ---
      topic: yourTemplatingPage
      ---

2. **Set the scope on each resource page** via its YAML header (``subject``, ``canonical``, or ``name``).

3. **Apply the template** on a resource page with the ``{{page:}}`` placeholder, referencing the template's topic (or its location):

   ::

      {{page: yourTemplatingPage}}
      {{page: Home/IG folder/pagename}}

   The placeholder renders the template, filling its widgets (``{{tree}}``, ``{{xml}}``, ``{{json}}``, ...) from the resource page's scope.

.. _pagelinkingTopic:

Linking to pages
----------------

Use the ``pagelink`` placeholder to link to another page in your guide. Linking by **topic** is recommended: it keeps working even when a page's URL key or folder structure changes, or when the guide is exported or copied.

Set a topic in the page's YAML header:

::

   ---
   topic: yourpagename
   ---

Then link to it:

- Standard: ``{{pagelink:yourpagename}}``
- Custom text and hint: ``{{pagelink:yourpagename, text:Link Title, hint:Mouseover Text}}``
- To a specific section, add an anchor. Give the target heading a custom id (``# Target Heading {#your-anchor-name}``), then link with ``{{pagelink:path/to/page.md, anchor:your-anchor-name}}``.

Linking to resources and examples
---------------------------------

The recommended way to link to a resource or example is by resource id, so the link keeps working when the guide is exported or duplicated. Always provide the resource type. The ``link``, ``xml``, and ``json`` widgets all work this way:

::

   {{link: Patient/child-example}}
   {{json: Patient/child-example}}

To link to a profile, use its canonical URL: ``{{link:http://hl7.org/fhir/StructureDefinition/Patient}}`` (add ``, title:'Base Patient'`` for custom link text). The profile's package must be in your IG scope.

Images
------

Upload an image to a project and render it with the ``render`` widget, selecting the project and image URL key (Intellisense helps you pick them):

::

   {{render:demo/simplifier-logo-png}}

You can also use standard markdown image syntax for external images.

Formatting, tables, and lists
-----------------------------

Standard markdown works for text formatting, tables, and lists. For example, a table:

::

   |Header|Header|Header|
   |-|-|-|
   |content|content|content|

And lists::

   - Item 1
   - Item 2
     - Sub item 2.1

   1. First
   2. Second

For dynamic tables, use :ref:`FQL tables <ig_rendering_fhir>`; for diagrams, see :doc:`PlantUML <simplifierPlantUML>`.
