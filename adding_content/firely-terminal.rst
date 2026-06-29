Firely Terminal synchronization
===============================

`Firely Terminal <https://docs.fire.ly/projects/Firely-Terminal/>`_ is Firely's command-line tool for working with FHIR. You can use it to synchronize resources between your local project and Simplifier.

It is a good fit when you want synchronization that is:

- **Quick and effective** for everyday use from the command line.
- **Cross-platform**: it also runs on macOS (and Linux).
- **Automatable**: it runs in CI/CD pipelines, so you can sync or publish as part of an automated workflow (see :doc:`other git repositories <other-git-repositories>` for an Azure DevOps example).

Connect to your project
-----------------------

First, log in and link your local folder to a Simplifier project. You only have to do this once per folder. At link time you can already set a conflict-resolution strategy, so that later syncs resolve conflicts automatically without prompting.

.. code:: bash

   fhir login email=<your-email> password=<your-password>
   fhir project link <project-url-key> --strategy TakeLocal

The ``--strategy`` option determines how conflicts are resolved: ``TakeLocal`` always keeps your local version, ``TakeRemote`` always keeps the version on Simplifier.

Synchronize
-----------

Once the folder is linked, you can move resources between your local folder and Simplifier:

- ``fhir project sync``: synchronize your local folder with Simplifier, applying the conflict strategy you configured.
- ``fhir project push``: send your local resources to Simplifier.
- ``fhir project pull``: fetch the resources from Simplifier into your local folder.

.. code:: bash

   fhir project sync
   fhir project push
   fhir project pull

Conflicts
---------

If your source of truth is a git repository, you do not have to be afraid of conflicts: you can always overwrite what is on Simplifier by linking or syncing with ``--strategy TakeLocal``. Your committed git history remains the authoritative version, and Simplifier is brought in line with it.

If you would rather review conflicts and see exactly what changed before resolving them, use :doc:`Forge <forge>` instead. Forge has a conflict-resolution wizard that gives you more insight into each change.

Command reference
-----------------

For installation and the complete set of commands and options, see the `Firely Terminal command reference <https://docs.fire.ly/projects/Firely-Terminal/Command-Reference.html>`_.
