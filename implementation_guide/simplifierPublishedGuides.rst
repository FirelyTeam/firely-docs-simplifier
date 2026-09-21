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

.. _link_published_guide:

Link a guide to an existing published guide
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A published guide has a URL key of its own, and all versions published under that key form one series. Once you have published under a URL key, that key stays reserved. A guide is linked to at most one series: that link is what makes the published versions show up under the guide in the ``Guides`` tab, and what lets you publish new versions into the same series.

Simplifier makes the link for you the first time you publish. You have to make it yourself whenever the guide you are working in is not the guide that produced the series, for example:

- You had to register your guide again, after :ref:`repairing a broken link to guide.yaml <ig_broken_link>` or after deleting and recreating it from its ``guide.yaml``.
- You copied or moved your guide to another project and want to keep publishing it under the same URL.

To link them:

1. Open your guide in the IG editor, click ``Settings`` (the gear icon) and go to the ``Url Key`` tab.

2. Simplifier lists the published guides that are managed by the same team and are not linked to a guide. Click ``Link`` next to the one that belongs to your guide.

   .. image:: ../images/IGLinkPublishedGuide.png
      :scale: 75%

3. With the series linked, set ``Url Key`` on the same tab to the key of that series and click ``Save``, so your guide and its published versions share one URL again.

If you change a guide's URL key without linking, publishing starts a new series under the new key. The versions already published under the old key stay online and are not affected.
