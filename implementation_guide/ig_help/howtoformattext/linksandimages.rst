Links and images
================

Links
-----

Inline
~~~~~~

A `link <http://example.com>`__.

Reference
~~~~~~~~~

Some text with `a link <http://example.com/>`__ and another `link <http://example.org/>`__.

Profile Reference
^^^^^^^^^^^^^^^^^

To reference a profile from your project or a package dependency in your Simplifier IG, use the profile's canonical URL within the double-curly brace syntax. **Note:** The package dependency must be available in your IG scope.

- **Standard Link:** ``{{link:http://hl7.org/fhir/StructureDefinition/Patient} }``
- **Custom Title:** ``{{link:http://hl7.org/fhir/StructureDefinition/Patient, title:'Base Patient'} }``

Linking within your Guide
~~~~~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``{{pagelink} }`` placeholder now supports anchors, allowing for direct linking to specific sections across different pages and folders.

**Syntax:** ``{{pagelink:path/to/page.md, anchor:your-anchor-name} }``

**How to use:**

1. **Create the Anchor:** In your target page, add a custom ID to a heading: ``# Target Heading {#your-anchor-name}``
2. **Link to it:** Use the ``anchor:`` parameter within the pagelink placeholder to jump directly to that section.

Images
------

.. _inline-1:

Inline
~~~~~~

|alt text|

Â 

.. _reference-1:

Reference
~~~~~~~~~

|image1|

Â 

Render images from within IG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upload images to a project and display the image with the render statement, by selecting the project and image URL key. The intellisense can help selecting the right project and image URL key. Just start typing the first letters.

Â 

{{render:demo/simplifier-logo-png}}

.. |alt text| image:: http://hl7.org/fhir/assets/images/fhir-logo-www.png
.. |image1| image:: http://hl7.org/fhir/assets/images/fhir-logo-www.png
