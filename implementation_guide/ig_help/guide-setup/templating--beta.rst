Templating (beta)
-----------------

.. raw:: html

   <div class="alert alert-warning">The templating feature is in Beta release(January 2024), be careful using this in production environments. Templating is also working for FQL tables, except not for FQL tables placed inside custom tables and tabs. <a href="https://simplifier.net/docs/fql">FQL documentation can be found here. </a></div>

Using a Hidden Page as a Template for Resource Pages
====================================================

With the ``{ { page: }}`` placeholder, you can introduce templating into your Implementation Guide. This allows you to create a standardized structure for rendering your resource pages efficiently.

Step 1: Create a Hidden Template Page
-------------------------------------

To start, create a hidden page (note: this feature is not available in legacy guides). Don't for get to set a page topic. This page will serve as your template and might look something like this:

::

   ---
   topic: yourTemplatingPage
   ---

.. raw:: html

   <tabs>
     <tab title="Tree View">
       {{tree, buttons}}
     </tab>
     <tab title="XML">
       This is the resource in XML:
       {{xml}}
     </tab>
     <tab title="JSON">
       This is the resource in JSON:
       {{json}}
     </tab>
   </tabs>

Tree Rendering: {{render}}

**note** The rendering on the right-hand side of this page will display errors because no scope is provided on the templating page itself. This is expected and will not affect the final rendering when the template is applied elsewhere

Step 2: Configure the Yaml Header on Resource Pages
---------------------------------------------------

To use the template, set the subject, canonical, or name in the YAML header of the resource page. For example:

::

   ---
   topic: myPageName
   subject: Patient
   expand: 2
   ---

Step 3: Apply the Template on Resource Pages
--------------------------------------------

On any resource page where you want to use the template, include the following placeholder using the topic you gave your templating page:

::

   { {page: yourTemplatingPage}}

Or you can use the page location:

::

   { {page: Home/IG folder/pagename}}

The ``{ {page: yourTemplatingPage} }`` placeholder will render the hidden template page, filling in the placeholders (e.g., ``{ {tree}}``, ``{ {xml}}``, ``{ {json}}``) with data from the resource page's scope, as defined in its YAML header.
