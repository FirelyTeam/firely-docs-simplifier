Customizable IG design 
======================

.. important::

    `This feature is available from the Team plan and up <https://simplifier.net/pricing>`_.




Placeholders
^^^^^^^^^^^^
When you are customizing your stylesheet and editing the master HTML template you will notice we have some placeholders available in our templates. 

We have different types of placeholders.  

Information retrieved from the IG settings:
""""""""""""""""""""""""""""""""""""""""""""

* **guide-title** - Renders the guide title.
* **guide-version** - Renders the guide version.
* **guide-fhir-version** - Renders the FHIR version of the IG.

Customizable placeholders:
""""""""""""""""""""""""""
* **breadcrumbs** - Adds a site-wide table of contents. You can add this in the HTML template on the level of your choice. 
*  **index:root** - Adds the table of content, with the **levels:x** you can determine how much of the sub-sub folders and pages you want in your table. 


Internal IG content placeholders:
""""""""""""""""""""""""""""""""""


* **page-title** - Renders page title as specified in the IG's tree table. 
* **page** - Renders the navigation index on the right side.
* **page-withe-children** - Renders the index tree on the left side. 
* **footer** - Renders the Simplifier footer at the bottom of your IG pages. 
  
Style specific placeholders:
""""""""""""""""""""""""""""

In your Implementation guide you can select three differerent templates: the Ballotable(work in progress), TreeTable and Two Level Menu. If you have a Team plan and up you can customize these as you see fit. It will be worth noting that there a several placeholders specifically made for these templates. 
When using the TreeTable:

* **tree-navigation** - Adds a rendering of the tree to the left side of the IG page. 

.. image:: ../images/TreeIg.png
   :scale: 75%

When using the Two Level Menu:
""""""""""""""""""""""""""""""

* **dropdown-navigation** - Creates a navigation bar with all folders added as items. When a folder has a child page it will render as a dropdown menu. 
* **dropdown-navigation-with-title** - Creates a navigation bar similar to **dropdown-navigation** and adds the IG title as a 'home' button to the left of the navigation bar as seen in the image below. 

.. image:: ../images/TwoLevelIg.png
   :scale: 75%

Stylesheet specific placeholders: 
""""""""""""""""""""""""""""""""""
We do not recommend you alter these unless you have a specific desire to use an older style sheet for a specific version of your guide. 

* **content** - Provides the api for where we resolve the static files. Default templates are resolved from the webserver file server, if a CSS is available we resolve from there. 
* **style-folder** - Provides the folder of your custom style sheet.
* **version** - Specifies the specific version of you style sheet. By default it will select the latest version. 

Consolidated Metadata Table in Implementation Guides
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It's now easier to create a consistent table with all the metadata of resources within your Implementation Guides.
Just use the new ``{{metadata}}`` widget and a consistent table will be shown with the resource metadata.

.. note::

    A full metadata table with one single widget.

Do you want to customize which fields are included?
Just provide a list as the second attribute, for example:

.. code-block:: text

    {{metadata, url, version, publisher}}

CSS-editor
^^^^^^^^^^

For our Enterprise Licenses the feature "Custom Layout" is available. Here you can create your own custom master template (HTML) and choose your own layout (CSS). When you click on the dorpdown icon in the IG-editor, the CSS-editor will be opened. 

.. image:: ../images/IGEditorSettings.png   
   :scale: 75%

With this editor you can edit your Style Sheet to make overall changes in the overall look and feel of your IG. For example, you may change the color of the navigation bar to blue or add your own logo to it. It is also possible to reset your changes by going back to the original CSS or download the original CSS as a seperate file, so you can compare the differences with your own code.

Custom Preview for Your Own Styles in the IG Editor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Want your Implementation Guide to match your branding precisely?
The IG editor already allows you to adjust your own CSS and HTML templates.
Release 2026.1 adds the ability to set a custom preview image for your custom styles.
This preview appears in the list of available styles, so team members can quickly see which look and feel corresponds to which style.

To configure this, add a file called ``preview.png`` in:

.. code-block:: text

    guides/<your guide>/styles/<your style>/

For the best result, use an image size of 250 by 150 pixels.

Here below are a couple of examples that you can use to configure the lay-out of your IG:

.. code-block:: CSS

  /* Change menu bar font color (title, menu & submenu) */
  #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar a {
      color: white;
  }

.. code-block:: CSS
     
    /* Change menu bar background color (only main menu) */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar {
          background-color: red;
    }

.. code-block:: CSS

    /* Change menu bar font color (only main menu) */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar-nav > li > a {
        color: green;
    }

.. code-block:: CSS

    /* Change menu bar hoover item background color and font color (only main menu) */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar-nav > li > a:hover {
        background-color: black;
        color: red;
    }

.. code-block:: CSS

    /* Change menu bar background color (only submenu) */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar .dropdown-menu {
        background-color: yellow;
    }

.. code-block:: CSS

    /* Change menu bar font color (only submenu) */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header .navbar .dropdown-menu a {
      color: black;
    }

.. code-block:: CSS

    /* Set logo by using an external image */
    #ig-viewer .ig-view-content #ig-view-twolevelmenu .header a.navbar-brand {
        color: transparent;
        background: url('http://image.png');
        background-position: left center;
        background-size: contain;
        background-repeat: no-repeat;
    }
    
.. code-block:: CSS 

    /* Set the font color of your headers */
    h1, h2, h3, h4{
        color: #DF0101;
    }
    /* Set a background color to level 2 headers */
    h2{
        background-color: #eeecec;
        padding: 0.5em;
    }



