.. _qc_genericproperties:

Generic properties
==================

There is a set of properties that applies to most rules: a name, a status, filters, and error settings.

Name
----

Every rule has its own name. You can provide your own, but it must be a single word (it may contain hyphens or underscores). If you do not provide a name, one is generated with a generic tally name: ``rule-1``, ``rule-2``, and so on.

::

   - name: acme-publisher
     predicate: StructureDefinition.publisher = 'ACME'

**Identifier**: the name and the series the rule belongs to together define the rule identifier. In the example above, within the series ``company`` the rule is identified as ``company.acme-publisher``. The name is the identifier for a rule, so it is not allowed to have multiple rules with the same name.

Status
------

The ``status`` property provides textual feedback in the user interface and the log while running Quality Control. It tells the reader which rule directive is being executed. A rule always has a default status description, but you can provide your own to be more explicit.

::

   - predicate: id.exists()
     status: "All resources must have an id according to our organization"

Filters
-------

Filters select which files in your project a rule applies to. You can specify more than one filter per rule; only files that fall in all of them are evaluated.

**File filters**: filter any file based on a globbing pattern, as you know from your own file system. Use a double star ``**`` for any sequence of subdirectories. You can also pass a list of patterns, and exclude a pattern with an exclamation mark (quote it, or YAML will get confused).

::

   - action: validate
     files:
        - /*.json
        - "!package.json"
        - /*.xml

**FhirPath filters**: filter resources on a FhirPath predicate, so only files for which the statement is true remain in your selection. Any statement that resolves to a single value (or an unambiguous true/false) works; a resource type such as ``Patient`` is also a valid expression. QC currently supports FhirPath v2.0.0 (see the `FhirPath standard <http://hl7.org/fhirpath/>`__).

::

   - filter: id.exists()

**Category filters**: select a group of resources that spans more or less than a single resource type.

- ``profile``: all structure definitions that define a resource
- ``extension``: all structure definitions that define an extension
- ``conformance``: all conformance resources (value sets, code systems, structure definitions, etc.)
- ``example``: all resources that are not conformance resources

::

   - status: "Create a snapshot for all extensions"
     action: snapshot
     category: extension

Errors
------

The ``error`` and ``error-message`` properties let you customize the issue produced for every match of a rule.

**error**: set the error code, or a system and code separated with a vertical bar ``|`` (for example ``https://mysystem.org/errors|ERROR1`` or just ``ERROR1``).

**error-message**: define a custom error message. The engine can always generate a message, but a custom one is clearer. For example, ``predicate: id.exists()`` produces something like "Predicate failed for rule-3"; adding ``error-message: This resource does not have an id`` improves it.

**severity**: influence the level of an issue. The possible values are ``info``, ``warning`` and ``error``. Note that this sets *all* issues from that rule to the given level, regardless of what they were, so use it with care.

::

   - predicate: id.exists()
     severity: warning
