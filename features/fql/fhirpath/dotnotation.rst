Dot notation
------------

FQL is all about getting data from the inside of a tree structure, into a new form, most of all table form. And it uses the power of FhirPath to do that. FhirPath is a language developed as part the FHIR standad, to get values out of FHIR resources. And FHIR Resources are trees.

Descending
~~~~~~~~~~

FhirPath uses a syntax very common to many programming language: it uses dots do drill into (or descend into a structure. The official term for this is dereferencing. Look at this FhirPath statement

::

   Patient.name.given

It drills from the root of the tree, the ``Patient``, into the ``name`` of the patient, and after that into the given part of the name.

Multiple branches
~~~~~~~~~~~~~~~~~

Since each descention, can result into more than one branch (a patient can have more than one name), each descent, leads to more values. So ``Patient.name`` gives you back all the names of the patient, and ``name.given`` gives you back all given names of the patient name. And so ``Patient.name.given`` gives you all givens of all names of patient.

Optional Resource name
~~~~~~~~~~~~~~~~~~~~~~

In any FhirPath statement it is optional to add the root of the path - the resource name. So the following statements produce the same outcome:

::

   Patient.name.given
   name.given
