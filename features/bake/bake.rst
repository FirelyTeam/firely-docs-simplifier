.. _bake:

Bake syntax
===========

The **Bake** system is an important part of making high quality packages, and other FHIR resource publications. With a bake script you can define the internal structure and content of your publication.

What Bake can do
~~~~~~~~~~~~~~~~

**Bake** gives you precise control of where your files go and what they look like. It has actions to:

- **generate** content, like Sushi, YamlGen
- **filter** content, like resources that are matured
- **move** content, into the correct folders
- **format** content, like adding snapshots to structure definitions

Usage
~~~~~

**Bake** is available in Simplifier and Firely Terminal for licensed users.

.. toctree::
   :maxdepth: 1
   :titlesonly:

   yaml
   structure
   buckets
   pipes
   creating-a-package
   typical-example
   error-handling
   filters/filters
   actions/actions
   flow-actions/flow-actions
