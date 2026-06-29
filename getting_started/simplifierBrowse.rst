Searching on Simplifier
========================

One of the core strengths of Simplifier is providing users with the best governance possible. 
The search bar allows users to search within jurisdictions and organizations for resources 
to help prevent unnecessary duplication. Users can easily search within organizations or 
nationalities for existing profiles and specify the attributes they want to find.

How Search Ranking Works
------------------------

To ensure you find the most relevant standards first, Simplifier evaluates results 
based on four ranking pillars:

* **Quality**: Higher-quality resources are prioritized over incomplete ones.
* **Popularity**: Items that are frequently visited by the community rise to the top.
* **Authority**: Projects from trusted organizations are given more weight.
* **Substance**: The engine prioritizes the "type" and "status" of a result. For example, 
  an **Organization** or a **Project** will rank higher than a single example resource, 
  and **Active** resources are prioritized over **Retired** ones.

Using Search and Filters
------------------------

Pressing the **down arrow** while in the search bar or clicking the **magnifying glass icon** will give you an overview of all the search and filter options. These tools allow you to 
refine the high-authority results found by the ranking engine.

**Example: Searching for the UK Core** Let's start with an example of how to search for the latest publication of the UK core profiles.

From the available filters, start by selecting the ``Organization`` entity, followed by the ``Nationality`` attribute set to UK. 

.. image:: ../images/SearchExample1.png
   :scale: 75%


This gives you a list of all the available organizations in the UK. In the UI, you can directly click on projects or packages to see what one of those organizations has published. Clicking on packages from HL7 UK gives you a list of the published packages available on Simplifier. 

.. image:: ../images/SearchExample2.png
   :scale: 75%


Let's give another example: 

You want to find all the R4 MedicationStatement resources available in the US. You can select your FHIR version, nationality, category, and resource type as shown in the screenshot below. 

.. image:: ../images/SearchExample3.png
   :scale: 75%


You can perform a similar search to find all profiles created by a specific organization or even multiple organizations. See, for example, a search for available ValueSets published by different HL7 organizations.


.. image:: ../images/SearchExample4.png
   :scale: 75%



Below you will find more examples on how to search for specific content on Simplifier.



Searching for specific resources 
--------------------------------

Set your ``FHIR version`` + ``Category`` (Profiles) + ``Resource`` (Resource type) + any other filters like Nationality.



Searching for packages
----------------------

``Packages`` + ``Organization``
``Packages`` + ``Nationality`` only works when a jurisdiction is added to a package. See, for example, what happens when you set the nationality to UK, DK, or US.



Searching for projects
----------------------

Select ``projects`` + any further filter you want, such as nationality, organization, and/or FHIR version.