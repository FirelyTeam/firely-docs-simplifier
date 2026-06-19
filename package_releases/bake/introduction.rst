Introduction
============

The **Bake** system is an important part of making high-quality packages and other FHIR resource publications. With a bake script you define the internal structure and content of your publication.

What Bake can do
----------------

Bake gives you precise control over where your files go and what they look like. It has actions to:

- **generate** content, like Sushi and YamlGen
- **filter** content, like resources that are matured
- **move** content into the correct folders
- **format** content, like adding snapshots to structure definitions

Bake is available in Simplifier and Firely Terminal for licensed users.

Creating a package
------------------

With FHIR, you publish your company, regional or national specification as a FHIR package, so that it can be read by others. The project you work in can contain a lot of data that does not need to (and should not) go into the publication. A bake script helps you bake your publication: it generates, filters and transforms your project data into its final form.

**Goes into a package**: finished profiles in JSON format, relevant example resources, and finished terminology resources.

**Stays out of a package**: source files (such as YamlGen and FSH), test resources, unfinished profiles, and (generally) XML resources.

You can also use bake scripts for other purposes, like generating content when you push source files to your project.
