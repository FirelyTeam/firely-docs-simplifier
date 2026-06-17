.. _qc_genericproperties:

Generic properties
==================

There is a set of properties that is applicable to each rule, like ``name`` and ``status``, ``error`` and ``error-message``.

::

   # fields that are applicable to all rules:
   - name: id-mandatory
     code: CS100 # not sure, maybe we should have one naming system where the 
     names are the codes.
     status: "Message during processing"
     error: "message when failed. Can contain placeholders"

Some rules apply to most but not all rules, like ``filter``.

Properties
~~~~~~~~~~

See the pages below for an elaboration about each property:

.. toctree::
   :maxdepth: 1
   :titlesonly:

   filters/filters
   errors
   name
   status
