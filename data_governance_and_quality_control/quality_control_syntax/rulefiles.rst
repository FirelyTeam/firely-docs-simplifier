Files
-----

Default
~~~~~~~

Simplifier will provide a default rule set, accessible to every project: ``default.rules.yaml``. If you do not wish to use the default rules provided by Simplifier, you can provide your own version of default.rules.yaml.

Custom rule sets
~~~~~~~~~~~~~~~~

You can add other rule files, to your project, as long as their name follows this pattern: ``<name>.rules.yaml``. It does not matter where you place these files. They will all be discovered by the system, and exposed in the Quality Control menu of your project, to allow you to run them.

You can run every individual rule files in your project.

Running Individual sets
~~~~~~~~~~~~~~~~~~~~~~~

In Simplifier and in Firely Terminal you can run individual rule sets, in which case the default set and other sets will not be run. You can however include other rule sets in a Yaml Rule File. See the ``include`` action for more details.
