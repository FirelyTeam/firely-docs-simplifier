.. _qc_syntax:

Quality Control syntax
======================

This specification describes how to write (and read) rules for the Simplifier Quality Control Engine.

Introduction
~~~~~~~~~~~~

*Simplifier.net* and *Firely Terminal* come with a Quality Control Engine, to help you improve the quality of your FHIR projects. The QC engine performs a series of rule checks. By default there are two a series (minimal and recommended) of default rules, that you can run on your project. But you can also define your own rules.

In order to follow one of the core principles of Simplifier: *eating your own dogfood*: You can use the same language (YAML)that we used for the default, to define your own rules. This way we share the experience and have to deal with the same challenges that you would face as a user. The same reason why we write all our documentation in the Simplifier Implementation Guide editor.

Project rule files
~~~~~~~~~~~~~~~~~~

You can add ``*.rules.yaml`` files to your project. In order for Simplifier to pick them up, they should however be placed in the root. All rules files in the root, will be exposed in the Quality Control menu of your project, so that any authorized user can run them. You get all the power of the FHIR Compute Cloud behind Simplifier to run these checks.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   structure
   validation-and-rules
   rulefiles
   use-cases/use-cases
   genericproperties/genericproperties
   actions/actions
   examples
   fhir-actions/fhir-actions
