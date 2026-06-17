.. _fql_syntax_output-helpers:

Output helpers
==============

Because **FQL** is primarily used for generating readable content, it has some basic syntax to specify rendering parameters.

.. _page-variables--templates:

Page Variables & Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~

FQL supports **Page Variables**. This allows for dynamic filtering and the use of FQL within **Page Templates** for easy reuse across multiple pages.

New Output Formats
~~~~~~~~~~~~~~~~~~

Use the ``output`` attribute to display data in formats other than tables.

+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| Mode       | Tag Example                              | Description                                                                                                |
+============+==========================================+============================================================================================================+
| **Table**  | ``<fql output="table" headers="false">`` | Standard table; headers can now be toggled off.                                                            |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| **Inline** | ``<fql output="inline" delimiter=", ">`` | Renders values as text. The ``delimiter`` defines the character(s) used to separate each item in the list. |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+
| **Lists**  | ``<fql output="ul">`` or ``output="ol"`` | Renders a column as an unordered list (``ul``) or ordered list(``ol``).                                    |
+------------+------------------------------------------+------------------------------------------------------------------------------------------------------------+

With Clause
-----------

The With Clause, allows you to add keywords that are not interpreted by FQL, but are passed on to the rendering engine.

For Simplifier and Firely Terminal rendering responds to the ``header`` keyword, which will add headers to table output.

::

   from Patient
   select
     name.given[0], name.family[0]
   with 
     header

Similarly, if you want to make sure no header in case that is set as default, you can use:

::

   with 
     no header

Common ``with`` flags
~~~~~~~~~~~~~~~~~~~~~

Although each rendering engine is free to interpret flags set in the with clause, there are two common flags, that should generally be understood. They are known by at least Simplifier and Firely Terminal:

- ``header``: adds a header to the table
- ``subheader``: adds headers to sub tables

.. toctree::
   :maxdepth: 1
   :titlesonly:

