Creating new profiles
---------------------

If you want to define your own structures, whether they are resources or extensions, you can define them by just writing the intended name followed by their type in square brackets.

Regarding types, YamlGen follows the FHIR syntax here of how we define a type in a choice element.

Let's say you want to have a profile on Patient, that you are going to call \`nl-core-patient' (the actual name of the Dutch core Patient profile):

::

   nl-core-Patient[Patient]:

is equivalent to:

::

   StructureDefinition: 
     id: nl-core-Patient
     type: Patient
     name: nl-core-Patient
     kind: resource

For an extension, it's very similar:

::

   preferredPharmacy[Extension]:

is equivalent of:

::

   StructureDefinition: 
     id: preferredPharmacy
     type: Extension
     name: preferredPharmacy
     kind: complex-type

Using profiles by name
~~~~~~~~~~~~~~~~~~~~~~

You can use the profiles you defined this way, or any other profile by using their name, like this:

::

   nl-core-patient/1:
