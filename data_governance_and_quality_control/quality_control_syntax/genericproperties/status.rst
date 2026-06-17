Status
------

Provides a textual feedback in the user interface and the log, while running the Quality Control. It tells the user/reader what rule directive is being executed. A rule will always have a default status description, but you can provide your own, to be more explicit or to mention the purpose of the rule.

Example
~~~~~~~

::

   - predicate: id.exists()
     status: "All resources must have an id according to our organization"
