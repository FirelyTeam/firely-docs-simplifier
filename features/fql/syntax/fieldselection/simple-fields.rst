Simple fields
-------------

The FQL syntax allows you to put JSON blocks almost anywhere in your select statement. This allows grouping of fields, but also renaming of existing fields in the original data.

Renaming
~~~~~~~~

This example shows you how you can set the column names containing the first and last name of a patient:

.. code:: text

   from Patient
   select
       firstname: name.given,
       lastname: name.family

.. note::

   *(migration TODO)* This query was rendered with live results on Simplifier.
   Consider adding a screenshot of the output table.
