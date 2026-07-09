.. _published_guides:

Publishing your guide
---------------------

.. important::

    This feature is available on all paid plans. `See the pricing page for details. <https://simplifier.net/pricing>`_

By default, a guide is rendered live from its source, so you have a single live version online. **Publishing** a guide creates a versioned *snapshot*: a static version, disconnected from the source. You can publish as many versions as you like, which makes it effortless to keep, for example, a ballotable and a final publication side by side. (If you would rather host the guide yourself, you can still export it as a static website with the Export option.)

Publishing a guide goes hand in hand with :ref:`releasing a FHIR package <package_management>`. A typical flow looks like this:

#. You keep one editable version of your guide in your project, the head of your development branch (just like your resources).
#. When you are happy with the conformance resources, you :ref:`release a FHIR package <package_management>`. You then point your editable guide's scope at that released package version and check that everything looks right.
#. If so, you publish a release of your guide. You can also make it the new default guide, which is where people land when they open the guide URL without a version number (or with ``current``).
#. You then switch your editable guide's scope back to the project (``current``) and continue editing the next release of both.

You may want to keep the guide and package version numbers in sync, but a few things differ between the two release processes:

- The guide version number is currently just a string. We may enforce semver for Simplifier-created guides for consistency.
- A guide version can be **overwritable** or **read-only** (you can switch a read-only release to overwritable later). Package versions are always final and can only be unlisted. For example:

  - You could spot a typo in a guide release and overwrite it with a new release under the same version number, still pointing at the same package.
  - You could spot an issue in a released package, release a new package version, and publish a guide whose scope points at the new package, still under the same guide version. This keeps your guide URL and version number stable to share with others.

The Publish Guide wizard walks you through the options: Public or Private, Read-only or Overwritable, and whether to set the guide as the default. Project admins can change these settings later.

See also :ref:`Package Releases <package_releases>` for publishing and distributing the FHIR packages your guide is built on.
