Other git repositories
======================

For GitHub, Simplifier offers a :doc:`webhook <github>` that automatically syncs a branch into your project, one-way. For other git hosts, such as **Azure DevOps** or **GitLab**, there is no built-in webhook. You can set up the same automatic, one-way synchronization yourself using :doc:`Firely Terminal <firely-terminal>` in a CI/CD pipeline: on every push, the pipeline logs in to Simplifier, links the project, and syncs your resources.

Azure DevOps example
--------------------

The following ``azure-pipelines.yml`` installs Firely Terminal and syncs the repository to a Simplifier project on every push to ``main``. Store ``SIMPLIFIER_USERNAME``, ``SIMPLIFIER_PASSWORD`` and ``SIMPLIFIER_PROJECTURLKEY`` as pipeline variables, and mark the password as secret.

.. code:: yaml

   trigger:
   - main

   pool:
     vmImage: ubuntu-latest

   steps:
   - task: UseDotNet@2
     inputs:
       version: '6.x'

   - script: |
       echo "Install Firely.Terminal"
       if ! command -v fhir &> /dev/null; then
         dotnet tool install --global Firely.Terminal > /dev/null
       fi
     displayName: 'Install Firely.Terminal'

   - script: |
       echo "Check Firely Terminal Version"
       CHECK_FIRELY_TERMINAL_VERSION=$(fhir -v | tr '\n' ' ')
       echo "FIRELY_TERMINAL_VERSION: $CHECK_FIRELY_TERMINAL_VERSION"
     displayName: 'Check Firely Terminal Version'

   - script: |
       echo "Simplifier login and sync"
       fhir login email=$SIMPLIFIER_USERNAME password=$SIMPLIFIER_PASSWORD
       fhir project link $(SIMPLIFIER_PROJECTURLKEY) --strategy TakeLocal
       fhir project sync
     displayName: 'Simplifier login and sync'
     env:
       SIMPLIFIER_USERNAME: $(SIMPLIFIER_USERNAME)
       SIMPLIFIER_PASSWORD: $(SIMPLIFIER_PASSWORD)

The same approach works for GitLab CI or any other pipeline runner: install Firely Terminal, then run ``fhir login``, ``fhir project link`` and ``fhir project sync``. The ``--strategy TakeLocal`` option resolves conflicts in favor of the git repository, treating it as your source of truth.
