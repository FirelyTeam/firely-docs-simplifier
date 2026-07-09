Forge synchronization
=====================

Simplifier and our datamodelling tool Forge work hand in hand. With our new project synchronization feature this has become even easier. For more information on this feature please see our Forge documentation `here. <https://docs.fire.ly/projects/Forge/features/IntegrationwithSimplifier.html>`_

.. image:: ../images/Forge.PNG
   :width: 250px

When uploading resources from Forge to your Simplifier project directly we have limited collision detection. If the resource is changed both locally and on Simplifier since last synchronisation, we will ask you to resolve the conflict.
But there are certainly cases where you can accidentally overwrite each other’s work if you are really working on the same page in the IG editor at the same time or upload a new version of a resource directly.

We do keep the history of resources, but first you will have to notice that something got lost.

If you really want great collision detection it is probably best to connect your Simplifier project to a branch of a GitHub repository and collaborate in there (see :doc:`github`). The drawbacks could be:

  - Git can be a bit complicated to work with.
  - The synchronization is one-way, from GitHub to Simplifier. Editing of Implementation Guides currently happens in Simplifier, so whenever you want those changes back to GitHub you will need to synchronise them from Simplifier to your local computer (with Forge or Firely Terminal) and then commit the changes back to GitHub.
