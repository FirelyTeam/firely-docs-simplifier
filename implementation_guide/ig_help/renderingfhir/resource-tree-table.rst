Resource Tree Table
-------------------

In your Ig you can render the tree the same as you see on Simplifier with the diff/hybrid/snapshot buttons.

To do this you use ``buttons`` for example like this:

{{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, buttons}}

You can also add these buttons inside your own generated table. For example using:

.. raw:: html

   <tabs>
       <tab title="Tree view">
           {{tree:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient, buttons}}
       </tab>
       <tab title="Detailed view">
           {{dict:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
       <tab title="XML">
           {{xml:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
       <tab title="JSON">
           {{json:http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient}}
       </tab>
   </tabs>

These tabs can be futher customized if your Organization has a Team plan or higher.
