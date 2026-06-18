.. _ig_help_howtoformattext:

How to format text?
===================

This Implementation Guide tool uses markdown for formatting text. Below you can see the most common option for writing Markdown.

Headings
--------

Create headings with one or more ``#`` characters:

::

   # Title level 1
   ## Title level 2
   ### Title level 3
   #### Title level 4
   ##### Title level 5
   ###### Title level 6

Paragraphs
----------

You can create a paragraph by just writing text. To create a new paragraph just leave an empty row

Like this.

Text formatting
---------------

You have several inline formatting options:

- *italics* or **bold** or **Italics and bold**
- Strike through [STRIKEOUT:like this]

Verbatim
--------

::

   This is a 
   piece of code 
   in a block

Horizontal line
---------------

In markdown you create a horizontal line with three or more dashes (``---``), which renders like this:

--------------

Or

--------------

Read more
---------

Want to learn more? Here is a nice `introduction into markdown <https://commonmark.org/help/tutorial/>`__.

Links and images
----------------

Links
~~~~~

Inline
^^^^^^

A `link <http://example.com>`__.

Reference
^^^^^^^^^

Some text with `a link <http://example.com/>`__ and another `link <http://example.org/>`__.

Profile Reference
"""""""""""""""""

To reference a profile from your project or a package dependency in your Simplifier IG, use the profile's canonical URL within the double-curly brace syntax. **Note:** The package dependency must be available in your IG scope.

- **Standard Link:** ``{{link:http://hl7.org/fhir/StructureDefinition/Patient} }``
- **Custom Title:** ``{{link:http://hl7.org/fhir/StructureDefinition/Patient, title:'Base Patient'} }``

Linking within your Guide
^^^^^^^^^^^^^^^^^^^^^^^^^

**Recommended pagelink**

To ensure your links remain robust even if a page's URL key or folder structure changes, use topics for internal referencing.

Define a topic by adding a header to the top of your page:

::

   ---
   topic: yourpagename
   ---

Use the following syntax to reference that topic (removing the spaces between the closing braces):

- **Standard Link:** ``{{pagelink:yourpagename} }``
- **Custom Text and Hint:** ``{{pagelink:yourpagename, text:Link Title, hint:Mouseover Text} }``

This method ensures your links continue to work if the IG is exported, duplicated, or hosted outside of Simplifier.

Anchor Support in pagelink
^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``{{pagelink} }`` placeholder now supports anchors, allowing for direct linking to specific sections across different pages and folders.

**Syntax:** ``{{pagelink:path/to/page.md, anchor:your-anchor-name} }``

**How to use:**

1. **Create the Anchor:** In your target page, add a custom ID to a heading: ``# Target Heading {#your-anchor-name}``
2. **Link to it:** Use the ``anchor:`` parameter within the pagelink placeholder to jump directly to that section.

Images
~~~~~~


Inline
^^^^^^

|alt text|

Â 


Reference
^^^^^^^^^

|image1|

Â 

Render images from within IG
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Upload images to a project and display the image with the render statement, by selecting the project and image URL key. The intellisense can help selecting the right project and image URL key. Just start typing the first letters.

Â 

{{render:demo/simplifier-logo-png}}

.. |alt text| image:: http://hl7.org/fhir/assets/images/fhir-logo-www.png
.. |image1| image:: http://hl7.org/fhir/assets/images/fhir-logo-www.png

Tables, lists and PlantUML
--------------------------

Tables and lists work the mostly the same as markdown, as shown in the examples below. For our paying customers it is possible to use FQL and PlantUML for rendering dynamic tables and Plant UML diagams. For more information on FQL, see the FQL tables page.

PlantUML can be used with the Plant UML syntax using plantuml placeholders:

.. raw:: html

   <plantuml>
   @startuml
   Bob -> Alice : hello
   @enduml
   </plantuml>

You can also upload standalone PlantUML files to your project. Supported file extensions include:

::

   .plantuml
   .pu
   .puml

You can render these with the ``render`` placeholder: ``{{render:filename.puml} }``

Tables
~~~~~~

\|Header|Header|Header\| \|- \|content|content|content\| \|content|content|content\|

Unordered lists
~~~~~~~~~~~~~~~

- Item 1
- Item 2

  - Sub Item 2.1
  - Sub item 2.2

    - Sub sub item 2.2.1

- Item 3

or:

- Item
- Item

Ordered lists
~~~~~~~~~~~~~

Ordered lists with automatic numbering.

1. Item a
2. Item b
3. Item c

Table of contents
-----------------

Index for the whole IG:

{{index:root}}

Index for the current page:

{{index:current}}

You can also show the index of a different page, by using the URL key of that page:

{{index:Home}}
