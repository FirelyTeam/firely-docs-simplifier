.. _qc_examples:

Examples
========

Here are some example rules you might consider when writing your own.

**Validating resources in a single folder**: this validates all resources in a single folder, and suppresses all parsing errors.

::

   - action: validate
     files: /examples/*.xml
     suppress: https://simplifier.net/qc/errors/evaluation|PARSING

**Checking canonical base URLs**: this validates whether the canonicals for your conformance resources start with the right base URL.

::

   - name: canonical-starts-with
     filter: url.exists() and ImplementationGuide.exists().not()
     status: "Checking if canonical URL starts with correct base"
     predicate: url.startsWith('https://fhir.hl7.org.uk/')
     error-message: "Canonical URL doesn't start with correct base"

**Checking if publisher and contact are filled correctly**: Quality Control is a powerful way to check for consistent metadata on all of your resources. Here we validate whether ``publisher`` and ``contact`` are filled correctly and match each other.

::

   - name: publisher-filled
     filter: (StructureDefinition or ValueSet or CodeSystem or CapabilityStatement or SearchParameter or NamingSystem or ConceptMap).exists()
     status: "Checking if all resources have publisher filled"
     predicate: publisher.exists() and (publisher in ('HL7 UK' | 'NHS Digital'))
     error-message: "Publisher not filled (correctly)"

   - name: contact-filled
     filter: (StructureDefinition or ValueSet or CodeSystem or CapabilityStatement or SearchParameter or NamingSystem or ConceptMap).exists()
     status: "Checking if all resources have contact filled"
     predicate: contact.name.exists() and ('HL7 UK' in contact.name or 'NHS Digital' in contact.name)
     error-message: "Contact not filled (correctly)"

   - name: publisher-equals-contact
     filter: (StructureDefinition or ValueSet or CodeSystem or CapabilityStatement or SearchParameter or NamingSystem or ConceptMap).exists()
     status: "Checking if publisher is one of the contacts"
     predicate: iif(publisher.exists() and contact.name.exists(), publisher in contact.name)
     error-message: "Resource has publisher not listed as one of the contacts"

**Validating a match between name and id**: when your profiling guidelines specify conventions, you can enforce them. Here a convention was decided for the ``name`` and ``id`` of a ValueSet.

::

   - name: valueset-id-matches-name
     filter: ValueSet.exists()
     predicate: id = name.substring(0,6) + '-' + name.substring(6)
     status: "Checking if all ValueSet ids match the names, including a dash"
     error-message: "ValueSet id must match name with a dash"

**Validating correct id naming for extensions**: you can filter to specific resources, like checking the ``id`` value only for extensions.

::

   - name: extension-starts-with
     filter: StructureDefinition.exists() and StructureDefinition.type = 'Extension'
     status: "Checking whether extension starts with Extension-UKCore"
     predicate: id.startsWith('Extension-UKCore')
     error-message: "Resource does not start with Extension-UKCore"

Unit testing
------------

Unit testing is a strategy from software engineering to make sure some errors do not occur, and other errors *do* occur. Some errors are good. For errors you do not want, you use regular validation. But say you have a profile that requires a Patient to have no more than two identifiers. To check that you implemented it properly, you want to create an example Patient with three identifiers and have that example fail. With regular validation those errors would always be returned (and it would be bad if they were not). For that you can add unit tests using the ``assert`` action.

**The assert rule**: ``assert`` checks for error systems or codes in the output of the validator. If the error is there, the assertion passes; if it is not, it reports an error. You can see it as an error-inverter. The following rule feeds all resources in ``invalid-examples`` ending in ``.missingref.xml`` and makes sure error code ``4005`` is in the output (the full error is ``http://hl7.org/fhir/dotnet-api-operation-outcome|4005``, but the code alone is usually sufficient).

::

   - files: /invalid-examples/*.missingref.xml
     assert: 4005
     # error code for missing references

**Approach**: the general approach is to put all profiles and extensions in one folder, your good examples in another, and your failing examples in a third. Run regular validation on all but the failing examples, and run the unit test (assert) on the failing ones.

::

   - action: validate
     files: /conformance-resources/*.*

   - action: validate
     files: /good-examples/*.json

   - assert: any
     files: /failing-examples/*-cardinality.json
