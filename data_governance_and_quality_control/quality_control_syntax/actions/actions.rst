.. _qc_actions:

Actions
=======

Explicit
~~~~~~~~

Each rule directive has an action. You can specify this explicitly:

::

   - action: validate

Implicit
~~~~~~~~

With many rules it's implicit which rule is applied. IN the following example, the action is implied by the 'predicate' property,

::

   - action: predicate
   - predicate: id.exists()

So the line with ``action: predicate`` provides no new information and can be left out:

::

   - predicate: id.exists()

In the sub pages you can find the full list of all actions:


.. toctree::
   :maxdepth: 1
   :titlesonly:

   include
   unique
   assert
   suppress
   exists
   count
   min
   max
   cardinality
   unique-filenames
