Category Filters
================

Category filters allow you to get a group of resources that spans more or less than a single resource type.

- profile: all structure definitions that define a resource
- extension: all structureDefinitions that define an extension
- conformance: all conformance resources: valuesets, code systems, structuredefinitions, etc...
- example: all resources that are not conformance resources

Example usage:

::

   - status: "Create a snapshot for all extensions"
     action: snapshot
     category: extension
