FQL Playground
==============

FQL is a query language that allows you to retrieve, filter and project data from any data source containing FHIR Resources. It brings the power of three existing languages: SQL, JSON and FhirPath.

`Find our full documentation and examples on FQL on Simplifier. <https://simplifier.net/docs/fql>`_

On Simplifier we have the `FQL playground <https://simplifier.net/fql>`_ available where you can try running your own queries in a scope of your choice. 

.. image:: ../images/FQLPlayground.png
   :scale: 75%
      
As a scope you can select any publicly available package or project. You can run one of our example queries to get a quick understanding of all the possibilities with FQL. 

.. image:: ../images/FQLExamples.png
   :scale: 75%
      
You can also share the query you made with other Simplifier users or embed your query output in another website. 

.. image:: ../images/FQLShare.png
   :scale: 75%
      
It is also possible to upload .fql files to your project and render them in implementation guides. This allows you to keep your queries in your project and share them with your team.

Syntax:

.. code-block:: rst

   {{render:filename.fql}}