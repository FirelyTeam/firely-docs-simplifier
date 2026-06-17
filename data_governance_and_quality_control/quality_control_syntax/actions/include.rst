Include
-------

If you run a ruleset file (a ``*.rules.yaml``), by default, no other rules will be run. This is done to give you maximum control, and allow you to run individual rule sets,

There is a 'Run all Qualiy Control checks' command in Simplifier.

But, there are situations where you would like to run an aditional set of rules, that you have defined elsewhere (in another file). Imagine you have a ruleset to 'check broken links', but want to run all the default rules as a first step. You can achieve this by using the 'include' action.

This way you can also create a batch file, in which you include all your other rule set files. In most cases this is unneeded complexity, because your project is probably only in a good state if all the rules have validated. So only use this if the default setup does not work for you.

Include action
~~~~~~~~~~~~~~

You include the default rule set or any other ruleset in a , you can speficy this in a single directive.

::

   - include: <name>

For example, this will include the default ruleset:

::

   - include default

And this will include the custom ruleset file ``myrules.rules.yaml``

::

   - include myrules

Alternatively these will do the same:

::

   - include myrules.rules.yaml

   - include some-directory/myrules.rules.yaml

It is not an issue to have multiple references to the same file, because rules will be indexed by their name.

::

   note: there are currently anonymous rules, which get a generated name. we must be sure that they stay unique if they are parsed multiple times.
