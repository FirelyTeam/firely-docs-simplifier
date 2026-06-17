Path Shortcuts
--------------

Yaml can become verbose when you start nesting. To avoid this, YamlGen allows the use of paths, much like the ones that are used in FHIRpath. You can dot into the details directly:

::

   Patient/example:
     meta.profile: http://acme.org/fhir/Patient
     name.given: John

Which is the equivalent of:

::

   Patient:
     id: example
     meta:
       profile: http://acme.org/fhir/Patient
     name:
       given: John

Multiple sub keys
~~~~~~~~~~~~~~~~~

Do make sure that you don't do this with multiple sub keys! This:

::

     name.given: Marie
     name.family: Curie

is not the same as:

::

     name:
       given: Marie
       family: Curie
