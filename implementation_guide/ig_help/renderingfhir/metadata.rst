Metadata
--------

The ``metadata`` widget renders a table of metadata fields for the referenced resource, for example:

{{metadata:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, render-metadata-title}}

The supported fields depend on the resource type:

- **Conformance resources**: ``url``, ``version``, ``publisher``, ``status``, ``experimental``, ``description``, ``purpose``, ``useContext``, ``contact``
- **MessageDefinition**: ``title``, ``event``, ``category``
- **StructureDefinition**: ``context`` (for extensions)

The widget behaves as follows:

- If no fields are specified, all non-empty fields are rendered in the default order defined by the FHIR specification.
- If fields are specified, only those fields are rendered (when non-empty) in the order they were listed.
- When the optional ``render-metadata-title`` flag is set, a title is also displayed containing the Resourcetype + ``name`` of the resource.
