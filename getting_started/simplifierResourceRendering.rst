.. _resource-rendering:

Resource rendering
==================

Simplifier renders a StructureDefinition as a tree table: the ``Overview`` tab of a profile page shows it, and the ``{{tree:}}`` widget embeds the same table in an implementation guide (see :ref:`ig_rendering_fhir`). This page explains what the tree shows and what the icons, flags and labels in it mean.

.. |valueX| image:: ../images/tree-icons/valueX.png
.. |datatype| image:: ../images/tree-icons/datatype.png
.. |primitive| image:: ../images/tree-icons/primitive.png
.. |backboneElement| image:: ../images/tree-icons/backboneElement.png
.. |resource| image:: ../images/tree-icons/resource.png
.. |reference| image:: ../images/tree-icons/reference.png
.. |nameReference| image:: ../images/tree-icons/nameReference.png
.. |extension| image:: ../images/tree-icons/extension.png
.. |complexExtension| image:: ../images/tree-icons/complexExtension.png
.. |modifierExtension| image:: ../images/tree-icons/modifierExtension.png
.. |complexModifierExtension| image:: ../images/tree-icons/complexModifierExtension.png
.. |slice| image:: ../images/tree-icons/slice.png
.. |individualSlice| image:: ../images/tree-icons/individualSlice.png

.. _tree-views:

Tree views
""""""""""
A profile says two things at once: what it changed (its differential) and what the resulting resource looks like (its snapshot). The buttons at the top right of the tree switch between those perspectives.

.. list-table::
   :header-rows: 1
   :widths: 15 85

   * - Button
     - What you see
   * - ``diff``
     - Only the elements this profile changed, and the parent elements needed to reach them. An element counts as changed when the profile's own differential touches it, or when one of its descendants was touched. This is the closest view to the profile source.
   * - ``snap``
     - Every element available in the resulting resource, taken from the generated snapshot. Elements the profile removed (``max`` set to ``0``) are left out.
   * - ``hybrid``
     - The full snapshot, with everything this profile changed in black and everything it inherited in grey. Elements the profile removed stay visible with a line through them. This is the default view.

``show common`` is a separate toggle. By default the tree hides the elements that are the same in every resource and carry no information about the profile: ``id`` elements, the attributes inherited from ``Resource`` and ``DomainResource``, XML attributes, and extension roots the profile did not touch. Turn it on to show them anyway. The toggle has no effect in the ``diff`` view, where these elements are hidden already unless the profile constrained them, and it is disabled there.

Your choice of view and of ``show common`` is remembered in a browser cookie, so it carries over to the next profile you open.

.. note::

   In an implementation guide you can fix the view per widget (``{{tree:<canonical>, diff}}``) or give the reader the buttons (``{{tree:<canonical>, buttons}}``). See :ref:`the tree widget properties <ig_rendering_fhir>`.

What the colours mean
"""""""""""""""""""""
In the ``hybrid`` view, grey means inherited and black means set by this profile. The same distinction is applied to the flags and labels: a flag that this profile introduced is shown in red, and one that comes from the base definition is grey. In the ``diff`` view, the inherited parts are not greyed out but hidden altogether, so everything you see is the profile's own work.

Element icons
"""""""""""""
The icon in front of an element name tells you what kind of element it is. Hovering over an icon shows the same description.

.. list-table::
   :header-rows: 1
   :widths: 10 25 65

   * - Icon
     - Meaning
     - Shown for
   * - |primitive|
     - Primitive Data Type
     - An element of a primitive type such as ``string``, ``code`` or ``dateTime``.
   * - |datatype|
     - Data Type
     - An element of a complex type such as ``Identifier``, ``CodeableConcept`` or ``Period``.
   * - |backboneElement|
     - Element
     - A backbone element: a nested structure defined inside the resource itself, such as ``Patient.contact``.
   * - |resource|
     - Resource
     - The root of the tree, and elements that contain a resource.
   * - |valueX|
     - Choice of Types
     - A choice element such as ``value[x]`` or ``medication[x]``. Expand it to see the individual types.
   * - |reference|
     - Reference to another Resource
     - An element of type ``Reference``, ``canonical`` or another reference type.
   * - |nameReference|
     - Reference to another Element
     - An element that reuses the definition of another element through ``contentReference``.
   * - |extension|
     - Extension
     - A simple extension: one that carries a value.
   * - |complexExtension|
     - Complex Extension
     - An extension with sub-extensions instead of a single value.
   * - |modifierExtension|
     - Modifier Extension
     - A simple extension that changes the meaning of the element it is on.
   * - |complexModifierExtension|
     - Complex Modifier Extension
     - A modifier extension with sub-extensions.
   * - |slice|
     - Sliced
     - The element that introduces a slice: it holds the slicing rules, and the slices are listed underneath it.
   * - |individualSlice|
     - Slice
     - One named slice of a sliced element.

Flags
"""""
The second column holds the flags of the element. A flag in red was introduced by this profile; a grey flag is inherited.

.. list-table::
   :header-rows: 1
   :widths: 10 90

   * - Flag
     - Meaning
   * - ``S``
     - The element must be supported (``mustSupport``). The same flag appears when only a specific type of the element must be supported, through the ``elementdefinition-type-must-support`` extension.
   * - ``O``
     - The element carries `obligations <https://hl7.org/fhir/R5/obligations.html>`_. It is shown next to ``S``, and the details are in the element's description.
   * - ``Σ``
     - The element is part of the resource summary, so a server may return it in a search result even when the full resource is not requested.
   * - ``?!``
     - The element is a modifier element: ignoring it changes the meaning of the resource.
   * - ``C``
     - The element has invariants, or is affected by one. The invariants themselves are listed in the element's description.

Labels
""""""
Some elements show a small labelled box in the description column. Like the flags, a label is highlighted when this profile is the one that added it.

* **Binding** - the element is bound to a value set. The strength and the value set are in the description.
* **Fixed Value** - the element is fixed to one value.
* **Pattern** - the element must match a pattern.
* **Impose** - the element imposes another profile through the ``structuredefinition-imposeProfile`` extension.

.. _suppress-extension:

Suppressing inherited mappings and examples
"""""""""""""""""""""""""""""""""""""""""""
The ``Details`` and ``Mappings`` tabs render the profile's snapshot, so they also show everything the profile inherits from the profiles it is derived from. To keep an inherited mapping or example out of those views, add the `elementdefinition-suppress <http://hl7.org/fhir/StructureDefinition/elementdefinition-suppress>`_ extension to a matching entry in your profile's **differential**:

.. code:: json

   "mapping": [
     {
       "extension": [
         {
           "url": "http://hl7.org/fhir/StructureDefinition/elementdefinition-suppress",
           "valueBoolean": true
         }
       ],
       "identity": "rim",
       "map": "Patient"
     }
   ]

The entry you write must match the inherited one exactly: mappings are matched on both ``identity`` and ``map``, examples are matched on ``label``. An entry carrying the extension is never added to the snapshot itself, so if it matches nothing, the only effect is that it does not appear.

.. note::

   Simplifier supports the extension on ``ElementDefinition.mapping`` and ``ElementDefinition.example``. The FHIR specification also lists ``comment``, ``requirements``, ``alias``, ``label`` and ``code`` as contexts for this extension; there the extension has no effect and the inherited value stays in the snapshot.

The same rules apply wherever the Firely .NET SDK generates a snapshot, so the snapshots produced by :ref:`Bake <bake_steps>`, Forge and Firely Terminal behave the same way.
