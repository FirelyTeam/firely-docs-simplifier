Nested Custom Accellerators
---------------------------

You can nest custom accelerators like this:

::

   syntax:
       CodeableConcept: <coding>
       Coding: <system> | <code>


   Patient/2:
       maritalStatus: http://terminology.hl7.org/CodeSystem/v3-MaritalStatus|M

results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "2",
       "maritalStatus": {
           "coding":  [
               {
                   "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
                   "code": "M",
               }
           ]
       }
   }

You can `try it out this snippet <https://simplifier.net/yamlgen/8db4fa88fbeca67>`__ in the YamlGen playground.

Multi layer
~~~~~~~~~~~

You can even do in three layers:

::

   syntax:
    CodeableConcept: <coding>
     Coding: <_system-code> = <display>
     _system-code: <system> | <code>


   Patient/2:
     maritalStatus: http://terminology.hl7.org/CodeSystem/v3-MaritalStatus|M = Married

results in:

.. code:: json

   {
       "resourceType": "Patient",
       "id": "2",
       "maritalStatus": {
           "coding":  [
               {
                   "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
                   "code": "M",
                   "display": "Married"
               }
           ]
       }
   }
