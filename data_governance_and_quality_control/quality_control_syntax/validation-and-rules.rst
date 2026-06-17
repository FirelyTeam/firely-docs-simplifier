Default Rules
-------------

Simplifier provides three default rule series: free, minimal, and recommended.

Free series
~~~~~~~~~~~

The free series is available to all users. It checks whether resources can be parsed as FHIR resources, whether they include an ``.id`` element, and whether a version is set. That last check was added specifically to support canonical pinning during release. For more information, see the canonical pinning documentation.

.. note::

   *(migration TODO)* The **free** rule set is rendered live on Simplifier.
   Review whether to add a static copy or screenshot here.


Minimal series
~~~~~~~~~~~~~~

The minimal series is a very small set of rules that we know everyone agrees on. The bulk validation rule is included in the **minimal** series.

Bulk validation is one of the most extensive forms of validation you can think of. So in that respect the mimal series is not small. It is however what the FHIR standard describes that resources should adhere to.

*This is a snapshot in time of the QC minimal rules and are subject to change:*

.. note::

   *(migration TODO)* The **minimal** rule set is rendered live on Simplifier.
   Review whether to add a static copy or screenshot here.


Recommended series
~~~~~~~~~~~~~~~~~~

The recommended series is a more opiniated set of rules that we defined, of what we believe a FHIR project should conform to. But we also acknowledge that these are more opiniated, and so we separated them. Here you can think of rules like that every resource should have an id.

*This is a snapshot in time of the QC recommended rules and are subject to change:*

.. note::

   *(migration TODO)* The **recommended** rule set is rendered live on Simplifier.
   Review whether to add a static copy or screenshot here.

