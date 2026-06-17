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
