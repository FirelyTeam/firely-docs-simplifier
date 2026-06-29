.. _adding_content:

Adding and syncing content
==========================

A Simplifier project is, in effect, a small FHIR server. There are several ways to get FHIR content into it, ranging from a one-off manual upload to fully automated synchronization. Pick the approach that fits how your team works:

- :doc:`Web interface <upload-resources>`: add resources directly in Simplifier, through the IG **Editor**, the **File manager**, or by uploading individual resources. Best for quick, ad-hoc changes.
- :doc:`FHIR API and project ZIP <api>`: every project exposes a FHIR API (and a downloadable ZIP) you can use to read and manage its contents programmatically. Best for scripted or custom integrations.
- :doc:`GitHub <github>`: a webhook keeps a GitHub branch synced one-way into the project. Best when git is your source of truth and you want changes to flow in automatically on push. For :doc:`other git hosts <other-git-repositories>` such as Azure DevOps or GitLab, use a Firely Terminal pipeline.
- :doc:`Forge <forge>`: syncs an entire local folder to a linked project (not just the profiles Forge created), with a conflict-resolution wizard. Best for data modelers working in Forge.
- :doc:`Firely Terminal <firely-terminal>`: fast command-line sync that also runs on macOS and in CI/CD pipelines. Best for automation and power users.

However you add resources, you can control how Simplifier renders them: :doc:`metadata expressions <metadata-expressions>` let you define automatically which fields Simplifier uses as a resource's title, description, URL key, workflow, and file path.

**Agree on a team workflow.** Changes in Simplifier do not automatically propagate to your git repository; syncing always requires explicit steps. Treat the git repository as the source of truth:

- Make changes locally, commit and push to git, then sync or publish them to Simplifier.
- If you edit in the Simplifier IG editor, first sync or download those changes back to your local repository and commit them.
- Agree on conflict-resolution rules up front (for example, always **TakeLocal** if you work with a git repository).

.. toctree::
   :maxdepth: 1
   :titlesonly:

   upload-resources
   api
   forge
   firely-terminal
   github
   other-git-repositories
   metadata-expressions
