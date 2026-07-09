Upload resources
================

On the **Resources** tab you can find all the conformance and example resources for a project. If you have "Write" rights, you can add and manage resources in the following ways.

**File manager and File editor**: use the File manager or the File editor to upload resources into your project, either one at a time or in bulk as a ``.zip`` file. You can upload **.json** or **.xml** files, a single **resource** or multiple resources in a **bundle**, or a **.zip** containing multiple files.

**Fetch from another FHIR server**: do a simple GET or a FHIR search. A GET adds a single resource; a search lets you add multiple at once. Examples:

- A Patient resource with id "example": ``http://example.org/fhir/Patient/example``
- All Patient resources that conform to the DAF profile: ``http://example.org/fhir/Patient?profile=http://hl7.org/fhir/StructureDefinition/daf-patient``

**Copy/paste json or xml code**: paste your own **json** or **xml** to create a single resource or a bundle. If your code contains a **bundle**, you can upload it as a single resource or select the **split bundle** check box to upload all entries as separate resources.

Update a single resource
------------------------

On a resource's own page you can manage that one resource. The **Update** button in the menu lets you:

- **Upload a new version** of the resource.
- **FHIR Read**: fetch the resource from a FHIR server.
- **Edit it directly** in the online text editor.
