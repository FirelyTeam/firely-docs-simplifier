Name
----

Every rule has its own name. You can provide your own name. It must be a single word, but it may contain hyphens or underscores.

If you do not provide a name, it will be generated with a generic tally name: ``rule-1``, ``rule-2``, etc.

Example
~~~~~~~

See below a hypothetical file ``company.rules.yaml``.

::

   - name: acme-publisher
     predicate: StructureDefinition.publisher = 'ACME'

Within this series, the rule has the name ``acme-publisher``. And in the Quality Control engine, it will be identified as ``myrules.acme-publisher``, based on the series name ``company`` and the rule name ``acme-publisher``.

Identifier
~~~~~~~~~~

The name and the series where the rule belongs to, together define the rule identifier.

The name property is the identifier for a rule. It's not allowed to have multiple rules with the same name.

The name property is optional, and will be generated when not provided.
