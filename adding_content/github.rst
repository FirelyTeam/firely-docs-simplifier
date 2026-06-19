.. _GitHub:

GitHub integration
==================

.. important::

    `This feature is available from the Team plan and up <https://simplifier.net/pricing>`_.

The GitHub integration enables you to link Simplier projects to GitHub repositories. When linking the project with the repository, the
resources from the repository are fetched and added to your Simplifier project. The GitHub integration is part of the paid account plans of Simplifier. This page will elaborate further on how to perform the linking.

.. _gh_linking:

GitHub Linking
--------------
In order to perfom the inital setup link of a GitHub repository to a Simplifier project, the user needs to have admin rights in GitHub and Simplifier.
You can link a repository in GitHub to your Simplifier project by going to your project and selecting the ``Link repository`` button under the ``GitHub`` menu. 

You will be redirected to the GitHub login or, if you are already logged in to GitHub, straight to the page where you will be asked to authorize that Simplifier can access your repository.

Once this step is complete, you will be directed back to Simplifier, where Simplifier will ask you which repository you want to link and which branch within that repository. 

To link an Organization GitHub repository after an already made link, you should edit your Organization settings in GitHub. Log in to GitHub and go to the Settings tab in your Organization. Press the ``Remove Restrictions`` button under third-party access. Now you should see the repositories from that organization when you try to link a GitHub Repository.

.. _gh_settings:

Settings
--------
When connecting a GitHub repository you will be asked to choose a strategy about how to deal with resources that fail to import (most likely because they are not valid FHIR resources) and whether to remove resources from your project when they are removed from your repository.

.. _gh_updates:

Fetch Updates
-------------
After the linking is performed, any updates to your resources in the GitHub repository will be sent automatically to Simplifier. Based on the the linking settings, resources in your Simplifier project will be updated, added or deleted. 

.. _gh_sync:

GitHub Sync
-----------
GitHub Sync enables you to synchronize your Simplifier project with the linked GitHub repository. Images or css files that up until recently were not supported by Simplifier are now available. If you decided to skip the initial import after linking or you have old markdown, you are now able to access them in Simplifier by using the sync process. 

GitHub UpSync
-------------
It is not possible to upsync to Github directly. A workaround would be to sync your Simplifier work with your local folder using Forge or Firely Terminal and then commit that to Github. 

.. _gh_include:

GitHub Include/Exclude
----------------------
The include/exclude feature allows users to specify the folders or file types that should be fetched from GitHub into Simplifier. This also applies to the folders or file types that you would like to be excluded from the import. You are able to specify these rules right after the initial link to the repository, before the initial import or later by accessing the ``Settings`` option from the ``Github`` dropdown menu on the project page.
By default, everything is included. If include statements are added then everything else (not included in your include statement) will be excluded by default. Simplifier only imports xml, json, images, and markdown file types. Comments are also supported using the "#" character.
The syntax is the following:

  **Include examples**::
  
    FHIR/IG/*
   
    *.xml


  **Exclude examples**::
  
    !FHIR/*.img
   
    !*.cs
   
    !FHIR/examples/*


.. _gh_webhook:

Gitwebhook per Branch
---------------------
For our Team and Enterprise account users, we added the ability to filter files that are synced from GitHub. We followed the .gitignore logic, but expanded it slightly to work from a include perspective as well. After you've set up a GitHub link, you can specify rules to include or exclude certain files or folders from your GitHub repository.

  **Include all files under examples folder**::
  
    resources/examples/*

  **Include all files and folders under staging**::
  
    project/staging/*

  **Include all xml files**::

    *.xml

  **Exclude all json files under temp folder**::

    !temp/*.json

Note that if you only use exclude patterns (starting with a exclamation mark !), Simplifier will assume you want to include everything but those filters.

You can use the same globbing patterns you are used to in a .gitignore file.

.. _gh_multibranch:

GitHub multiple branch linking
------------------------------
We have created a way of allowing multiple branches from the same repository in GitHub to link to different projects in Simplifier. The GitHub API only allows one link per repository, so we created a multiplexer on our side to handle this.

.. _gh_ig:

GitHub webhook to manage Implementation Guides
----------------------------------------------
The GitHub webhook allows you to edit your Implementation Guide without using the editor itself. Your GitHub repository can contain an IG resource which states the structure of the IG and refers to all the included pages (also in the same repository).

To get started, you create a project and `establish a webhook <#github-linking>`_ to your GitHub repository.

-	Create an `Implementation Guide <../implementation_guide/create_your_first_ig.html>`_ and download this guide,  or download an Implementation Guide from a Simplifier project together with all the belonging content (guide.yaml, .md pages, images, etc.)

-	Push the resources to your GitHub repository. If you do not yet see your IG files in your Simplifier project you can go to the GitHub menu in Simplifier and click ``Reimport``.

- Your Simplifier project will now contain all IG files. Locate the guide.yaml file and open it in Simplifier.

-	Click on the ``Update`` menu followed by ``Edit: Create IG and start updating in IG Editor``. This will convert the guide.yaml to a Simplifier IG.

 .. image:: ../images/ConvertIG.png
    :scale: 75%

-	Choose the desired conversion settings of your IG.
-	The Implementation Guide editor will now open with your IG - leave it as-is. You will also find the IG in the Guides tab of your project.

From now on, you can edit the guide.yaml and the IG pages from within your GitHub repository. Your changes will be automatically pushed to Simplifier and your online Implementation Guide.

.. _gh_rights:

Github Rights explanation
-------------------------

An overview of the process:

  - When connecting a Simplifier user connects his GitHub account, we ask for the "write:repo_hook" (to create a webhook to get notified on changes) and "repo" permission (to be able to read the latest version of the files from the public or private repo).
  - Next the user can connect a branch from one of the repositories they have access to, to a Simplifier project. We generate a secret token when we link a project to a GitHub repository and use that to verify that the request to the web hook endpoint is indeed coming from GitHub.
  - When GitHub sends a request to Simplifier (on the push trigger on the connected branch) it creates a signature (hash) based on the secret we generated and the payload itself. When we receive the request, we use the same secret (stored in our database) to create a hash based on the payload. If the hash sent from GitHub and the one, we create match then the request is valid (coming from GitHub).
  - In our database we store information about the GitHub relations when they are created: RepositoryId, SecretToken, WebhookId and this is bound to the foreign key of the project in Simplifier. When a GitHub webhook comes in we use this to match which Simplifier project to update.

We would strongly prefer to only ask for read-only access on the specific repository you have connected, but this has not been possible with the GitHub API.

The only available Oauth scope to be able to read a private GitHub repository is repo, which indeed also grants us write rights: Scopes for OAuth Apps - GitHub Docs. This is a current limitation.

  - One way to limit the scope of access:
      - Create a GitHub user account that only has rights on the GitHub repos and branches that you want Simplifier to be able to access. While we currently only need read access on your repository's files, given the need to be able to create webhooks this likely still is of the access level admin.
      - Use this user to set up the GitHub connection between Simplifier and GitHub. In this way the impact of the GitHub apps access is limited to the necessary repository.



