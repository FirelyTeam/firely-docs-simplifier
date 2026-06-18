.. _ig_help_guide-setup:

Guide setup
===========

These sub-pages cover how your guide is wired together: page topics and scope, guide-wide variables, reusable templates, and page layout. Setting these up well saves you repeating yourself across pages and keeps the guide consistent as it grows.

Yaml headers
------------

On every page you can setup a yaml header to be used across the page itself and for linking to other pages.

An example of a Yaml header is:

::

   ---
   topic: myPageName
   subject: Patient
   expand:2
   ---

Topics
~~~~~~

You can use the yaml header to set the topic and scope of the page.

You can link to your page using the set topic, with the scope you can set what resource the page is about.

This example gives the page the topic ``myPageName`` this can be used in other pages to link to this page. Linking this way ensures that the link keeps working if the guide gets published or exported.

Page scope
~~~~~~~~~~

The subject is set to the Patient resource in the guide's scope. You can also set this by using ``name`` with the resource name or ``canonical`` using the resource canonical. Setting the scope of the guide page this way will save you the work of repeating the canonical in every rendering, table etc. This is very useful when using Templating.

Tree rendering options
~~~~~~~~~~~~~~~~~~~~~~

The expand option in the header sets the level of tree expansion for this page. ``expand: 2`` indicates that all trees rendered on this page are expanded to the second level by default. ``expand: yes`` will set the page to fully expand the trees by default.

The scope of the Yaml header can also be used in FQL queries. The exception currently (January 2024) is for FQL queries used inside another table or tabs. For this there is a workaround explained in the following short clip.

Global Variables
----------------

The ``variables.yaml`` file in the root of your guide acts like an invisible page. Instead of holding content, it holds variables you define once and reuse across the rest of your guide.

You can also use it to configure guide-wide settings. A common one is the tree ``expand:`` option, which controls how far resource trees are expanded by default. For example, ``expand: yes`` expands every level, while ``expand: 3`` expands all resources down to the third level.

Templating (beta)
-----------------

.. raw:: html

   <div class="alert alert-warning">The templating feature is in Beta release(January 2024), be careful using this in production environments. Templating is also working for FQL tables, except not for FQL tables placed inside custom tables and tabs. <a href="https://simplifier.net/docs/fql">FQL documentation can be found here. </a></div>

Using a Hidden Page as a Template for Resource Pages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With the ``{ { page: }}`` placeholder, you can introduce templating into your Implementation Guide. This allows you to create a standardized structure for rendering your resource pages efficiently.

**Step 1: Create a Hidden Template Page**


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

**Step 2: Configure the Yaml Header on Resource Pages**


To use the template, set the subject, canonical, or name in the YAML header of the resource page. For example:

::

   ---
   topic: myPageName
   subject: Patient
   expand: 2
   ---

**Step 3: Apply the Template on Resource Pages**


On any resource page where you want to use the template, include the following placeholder using the topic you gave your templating page:

::

   { {page: yourTemplatingPage}}

Or you can use the page location:

::

   { {page: Home/IG folder/pagename}}

The ``{ {page: yourTemplatingPage} }`` placeholder will render the hidden template page, filling in the placeholders (e.g., ``{ {tree}}``, ``{ {xml}}``, ``{ {json}}``) with data from the resource page's scope, as defined in its YAML header.

Page Layout
-----------

.. raw:: html

   <div class="alert alert-warning">Note this is only available for paid Simplifier Team plans and up, for more information <a href="https://simplifier.net/pricing">see our pricing page</a></div>

When you have access to the master template you can use several of our placeholders to customize the layout of your IG pages. The placeholders can retrieve different kinds of information usable in the header, table of contents, footer and everything in between.

Variable Placeholders
~~~~~~~~~~~~~~~~~~~~~

The placeholders can be used in your guide by removing the space between the curly brackets.

The **variable** placeholders will retrieve the accompanying fields from the IG Settings:

**{{variable:scope} }**

**{{variable:guide-fhir-version} }**

**{{variable:guide-title} }**

**{{variable:guide-description} }**

**{{variable:guide-version} }**

**{{publish-date, format:yyy-MM-ddd} }**

TOC Placeholders
~~~~~~~~~~~~~~~~

There are several placeholders to help customize your table of contents and navigation bar:

**{{breadcrumbs} }**

**{{dropdown-navigation} }**

**{{dropdown-navigation-with-title} }**

**{{tree-navigation} }**

All the options are explained in more detail in our documentation here.
