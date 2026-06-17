Errors
------

The ``error`` and ``error-message`` properties allow you to customize error messages. For every issue encountered by this rule, the error will be defined by these two properties.

Error
~~~~~

The ``error`` property allows you to set the error code or system - and - code, separated with a vertical bar ``|``:

::

   - error: https://mysystem.org/errors|ERROR1
     ..

   - error: ERROR1
     ..

Error-message
~~~~~~~~~~~~~

The ``error-message`` allows you to define a custom error message. For some rules, like bulk validation this is not advised, but if you create your own rules like a predicate, it might help the receiver of the issue to have a more concrete explanation, other than that the predicate failed on a resource. For example:

::

   - predicate: id.exists()

The message that this rule would produce will look something like this: "Predicate failed for rule-3". You can improve this a lot by providing a custom message:

::

   - predicate: id.exists()
     error-message: This resource does not have an id

The quality control engine is always able to generate an error message. If no error message is provided, a standard error is generated.

Severity
~~~~~~~~

If you want to influence the level of an error, you can do this with the ``severity`` attribute. There are three possible values:

- ``info``
- ``warning``
- ``error``

For example:

::

   - predicate: id.exists()
     severity: warning

By default, all custom rules either produce an error, or a level that is encoded within the rule itself. For example, validation can produce errors, warnings and info messages. A predicate will by default always give an error level issue.

Do keep in mind that with the ``severity`` property *all* issues coming out of that rule, will be set to the severity level that you defined, regardless of what they were. So use it with care.
