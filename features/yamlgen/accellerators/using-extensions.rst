Using extensions
----------------

You can use any extension by treating them as a regular field in a resource.

In the following example you can see how to create, require and use an extension:

Define an extension:

::

   middlename[Extension]:
     url: http://acme.nl/middlename
     .value[string]: 
       max: 1

Define a derived profile of Patient:

::

   dutch-patient[Patient]:
     url: http://acme.nl/dutch-patient
     .extension:middelname:
       max: 1

Create a Patient resource based on the profile and using the extension:

::

   dutch-patient/3:
     name: 
       family: Doe 
       middlename: van der
