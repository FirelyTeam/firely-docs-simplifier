Examples
--------

Here are some example rules, that you might consider when writing your own rules:

Validating resources in a single folder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example validates all resources in a single folder. It also suppresses all parssing errors

::

   - action: validate
     files: /examples/*.xml
     suppress: https://simplifier.net/qc/errors/evaluation|PARSING

Checking canonical base URLs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example validates whether the canonicals for your conformance resources start with the right base URL:

::

   - name: canonical-starts-with
     filter: url.exists() and ImplementationGuide.exists().not()
     # Excluding IGs for now, since they have a Simplifier.net canonical
     status: "Checking if canonical URL starts with correct base"
     predicate: url.startsWith('https://fhir.hl7.org.uk/')
     error-message: "Canonical URL doesn't start with correct base"

Checking if Publisher and Contact are filled (correctly)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Quality Control is a powerfull way to check for consistent metadata on all of your resources. In this case we are validating if the values of publisher and contact are filled correctly and whether they match each other.

::

   - name: publisher-filled
     filter: (StructureDefinition or ValueSet or CodeSystem or 
     CapabilityStatement or SearchParameter or NamingSystem or 
     ConceptMap).exists()
     # Excluding IGs for now, since they don't have a way to set metadata
     status: "Checking if all resources have publisher filled"
     predicate: publisher.exists() and (publisher in ('HL7 UK' | 'NHS Digital'))
     error-message: "Publisher not filled (correctly)"

   - name: contact-filled
     filter: (StructureDefinition or ValueSet or CodeSystem or CapabilityStatement or          
     SearchParameter or NamingSystem or ConceptMap).exists()
     # Excluding IGs for now, since they don't have a way to set metadata
     status: "Checking if all resources have contact filled"
     predicate: contact.name.exists() and ('HL7 UK' in contact.name or 'NHS Digital' in contact.name)
     error-message: "Contact not filled (correctly)"

   - name: publisher-equals-contact
     filter: (StructureDefinition or ValueSet or CodeSystem or CapabilityStatement or SearchParameter or NamingSystem or ConceptMap).exists()
     # Excluding IGs for now, since they don't have a way to set metadata
     status: "Checking if publisher is one of the contacts"
     predicate: iif(publisher.exists() and contact.name.exists(), publisher in contact.name)
     error-message: "Resource has publisher not listed as one of the contacts"
