.. _implementation_guide_management:

Implementation Guide management
===============================

.. _ig_storage:

IG Storage
----------

Since release 28.0 IG's all files belonging to an IG are saved in the same folder. No longer in the root of the project and not in different folders. The folder name will be the same as the IG name. 

To illustrate how this works, see the screen picture of an example IG containing three topics with one or more pages for each topic. 

.. image:: ../images/IGEditorStructure.png
   :scale: 75%

In the project's filemanager you can see the different folder structures for each guide. 

.. image:: ../images/IGFileStorage.png
   :scale: 75%

To Save your IG as a Resource, click on the ``Generate IG resource`` button in the left pane of the IG-editor. Note that it is the tree structure that is saved. Textual changes are save automatically.

.. image:: ../images/CreateIGResource.png
   :scale: 75%

.. _ig_export:

Export your IG
--------------

.. important::

    `This feature is available from the Professional plan and up <https://simplifier.net/pricing>`_.

To use your IG outside of Simplifier, click on the Export button next to your IG in the Guides section of your project. 

.. image:: ../images/ExportIG.png
   :scale: 75%

.. _ig_copy:

Create a copy of your IG
------------------------

Since the release of Simplifier 28.0 it is possible to create a copy of your Implementation guide. Due to the complexity of the feature it is currently (21-01-2022) a beta release. 

.. image:: ../images/CopyGuide.png
   :scale: 75%

A guide can be copied to the same project or to another project. The ``Target project:`` dropdown provides an list of all of your projects where you can create a copy of your IG. 

.. image:: ../images/TargetProject.png
   :scale: 75%

You can now have multiple version of your Implementation Guide live in the same project (or different projects). You could have one IG use a release package as the scope while the development version uses the live developement version of your project. 

.. _ig_migration:

Migrating your legacy Guide
---------------------------

Guides created before Simplifier 28.0 are still stored in the legacy way as separate markdown files. These guides first have to be migrated to the new way of storing guides. 

.. image:: ../images/LegacyGuides.png
   :scale: 75%

This functionality is also a beta release so please follow the warning and migration steps in the Migrate Guide window. In the Migrate Guide window a different target project can also be selected. Migrating a guide **does not** delete the legacy guide. 

After a guide is migrated or copied, please make sure all your internal page links and references are still working. 

.. _ig_convert:

Convert guide.yaml to a Simplifier webbased IG.
-----------------------------------------------

Sometimes you see an implementation guide on Simplifier that just simply blows you away and you want to see how this has been created. Luckily, you can create a copy of those guides in a project of your own and take a look at their IG editor content. 

Guides created after August 2021 are stored in the new folder based storing way. These implementation guides can still be converted to a Simplifier webbased IG in a (private) project using the guide.yaml file. 

Please follow these steps to create your own edition of a Simplifier IG. 

1. Download the project containing the desired guide as a .zip file.
   
2. Upload the .zip to (preferably private) project.
   
3. Go to ``manage`` > ``File manager``. 
   
4. Search for guide.yaml. 
   
5. Open desired guide.yaml for the guide you want to create. 
   
6. Click on ``Update`` followed by ``Edit: Create IG and start updating in IG Editor``.

7. Wait for the IG to be created and you are good to go. 

Convert ImplementationGuide resource to a Simplifier webbased IG
----------------------------------------------------------------

.. important::

    This feature only works for Legacy guides in order to ensure backwards compabibility and will therefore create a guide in the legacy way of Markdown files.

An ImplementationGuide resource can be converted to a Simplifier webbased IG. This comes in handy if you for example accidently deleted your IG or if you want to duplicate your IG in another project.

- Make sure that the project contains the ImplementationGuide resource and all the belonging content (.md pages, images, etc.)

-	Locate the an ImplementationGuide resource. 

-	Click on ``Update`` followed by ``Edit: Create IG and start updating in IG Editor``. This will convert the ImplementationGuide resource to a Simplifier IG. 

- Follow the configuration steps and locate the IG in the Guides tab.

**Note**: If you want to export and import a project through a .zip you have to make sure that the folder structure is the same as in the project, to make sure links between IG resources are still in tact. Zipping a containing folder will include the folder in the zip-file. To make sure no extra layer of folders is added, directly zip the resources within a folder instead.

.. _ig_GitHub:

Manage your IG using GitHub
---------------------------

The GitHub webhook allows managing your Implementation Guide, without using the editor itself. You can find more information on how to set this up in the `GitHub integration documentation <../data_governance_and_quality_control/simplifierGithub.html#github-webhook-to-manage-implementation-guides>`_.

Pre-Requisites
--------------

Below are the necessary pre-requisites needed for managing an implementation guide in Github

- Create An account on Simplifier.net with the ability to create an Implementation Guide

- Create a Github account

- Install Git on your local computer

----------------------------------------------------------------------------------------------

1. Introduction
---------------

This guide will provide step by step instructions on managing your implementation Guide using Github.

2. Setting up a Github Repository
---------------------------------

2.1 Create a Repository

   1. Log into your Github account.

   2. Click on the + icon in the top right corner and select New repository

   3. Enter a repository name, description, and choose visibility (Public or Private)

   4. Optionally, you can add a README file, a .gitignore file as well as the ability to choose a license.

   5. Click Create Repository

   .. image:: ../images/GithubNewRepository.png
      :scale: 75%

   .. image:: ../images/GithubCreateNewRepository.png
      :scale: 75%

3. Syncing A Simplifier Project with Github
-----------------------------------------

3.1 Download the Project

   - On your Simplifier project page, look for the Download icon and choose the option "zip project"

   - Download your project as a .zip file

   - Unzip your project and move it to directory of the locally cloned repository on your workstation


3.2 Commit Changes to Github

   - CD to the folder of the Cloned Repository

      Example: cd C:\Temp\Simplifier Docs Clone 2

   - Add files to the repository using Git Bash

   .. image:: ../images/addfilestoGitrepository.png
      :scale: 75%

   - Commit the Changes (add a note for the changes made)

.. image:: ../commitfilestoGitrepository.png
      :scale: 75%

   - Push the file changes to Github

.. image:: ../pushchangestoGitrepository.png
      :scale: 75%


4. Link Github repository to Simplifier project
-----------------------------------------------

   - Navigate to a Simplifier project 

In the tool bar on the top of the page you will see a Github icon that allows you to link a Git repository

.. image:: ../LinkGitrepositorytosimplifierproject.png
      :scale: 75%

You will then be prompted to Login with you Github account and grant Simplifier access to your repository

.. image:: ../Linksimplifierprojecttorepository.png
      :scale: 75%

Fill out the Repository Owner, Repository, Branch, Webhook and Delete strategy