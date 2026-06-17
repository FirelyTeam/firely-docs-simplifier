Creating a package
------------------

With FHIR, you publish your company, regional or national specification as a FHIR package, so that they can be read by others.

The project in which you are working on that specification, can contain a lot of data that does not need to, and should not go, into the publication (package).

Data that should go into a package:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Finished profiles in JSON format
- Relevant example resources
- Finished terminology resources

Data that should not go into a package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Source files, like yaml gen, FSH
- Test resources
- Unfinished profiles
- XML resources (generally)

What a bake script does
-----------------------

A Bake script helps you bake your publication: they generate, filter and transform your project data to it's final form.

Additionally
------------

You can also use bake scripts for different purposes, like just generating content when you push source files to your project.
