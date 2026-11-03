.. _mermaid:

Mermaid Support
===============

Simplifier renders `Mermaid <https://mermaid.js.org>`_ diagrams: flowcharts, sequence diagrams, class diagrams and the other diagram types Mermaid supports, written as text. You can write a diagram directly on a guide page, or keep it as a file in your project and show it wherever you need it. In the `Mermaid playground <https://simplifier.net/mermaid>`_ you can check that a diagram looks as expected before you add it, and share it with a link.

In-Line Diagrams
----------------

To write a diagram directly on a guide page, put it in a ``<mermaid>`` tag.

Example:

.. code-block:: text

   <mermaid>
   sequenceDiagram
     Client->>Server: GET Patient/123
     Server-->>Client: Patient
   </mermaid>

The ``Insert snippet`` menu of the IG editor has Mermaid examples to start from.

File-Based Diagrams
-------------------

You can also add Mermaid files to your project, like any other file. Supported file extensions are:

* ``.mmd``
* ``.mermaid``

The page of a Mermaid file in your project shows the diagram.

Rendering Diagrams
------------------

To display a Mermaid file in your guide, use the ``{{render}}`` placeholder.

Syntax:

.. code-block:: text

   {{render:diagrams/flow.mmd}}

The same placeholder shows the diagram in the summary text on a project's ``Introduction`` page, and in issues and comments. A diagram in a tab that is closed when the page loads is drawn when the tab opens.

When a diagram has a syntax error, Simplifier shows the error message instead of the diagram.

.. _mermaid_custom_style:

Mermaid in a custom style
-------------------------

The default guide styles load Mermaid from release 2026.6. If your guide uses a :doc:`custom style <customize_your_ig>` that you copied before that, its master template does not load Mermaid yet, and your diagrams show as text. Add this line to the ``<head>`` of the master template, next to the other scripts:

.. code-block:: html

   <script src="{{content}}/styles/dependencies/mermaid@11.15.0/mermaid.min.js"></script>
