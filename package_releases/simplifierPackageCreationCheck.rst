.. _PackageCreationCheck:

Simplifier's Package Policy
===========================

At Simplifier, we frequently receive requests from users who have published a package and then realized they made an error. These mistakes can vary widely, including issues with the content, choosing package names that don't quite fit, or selecting incorrect version numbers. The desire to delete or amend a package immediately after publication is completely understandable. However, it's crucial to consider the broader impact such actions might have on the ecosystem as a whole.


The Impact of Deleting or Modifying Packages and Why We Never Delete Packages.
------------------------------------------------------------------------------

Once a FHIR package is published, it becomes an integral part of the healthcare IT ecosystem, essential for the interoperability of healthcare applications and systems. This ecosystem depends on the consistent availability of packages for functionality, compliance, and development processes. Removing or altering a FHIR package post-publication can lead to significant disruptions. Even if a package was released recently, it is possibly already integrated into other systems or indexed, making any changes problematic. 

Altering a package's name or version post-release can break dependencies and builds that rely on the original identifiers. Thus, any modifications to a published FHIR package necessitate careful consideration of their extensive implications.




Best Practices for Package Publishing
-------------------------------------

Embracing `Semantic Versioning <https://semver.org/>`_ (SemVer) in the release cycles of FHIR packages is highly recommended for several reasons, particularly due to the nature of healthcare IT systems which demand high reliability, predictability, and compatibility.

Embracing SemVer
^^^^^^^^^^^^^^^^

SemVer is designed to convey changes and stability through its version numbering system, including major, minor, patch, and prerelease segments. This structured approach aids in managing expectations and compatibility, ensuring a smoother ecosystem interaction.

SemVer provides a clear, structured way to release package versions. It follows a major.minor.patch(-prerelease) format, where:

    **Major versions** signal significant changes or reworks, akin to releasing under a new name.

    **Minor versions** introduce backward-compatible improvements or additions.

    **Patch versions** focus on backward-compatible (bug)fixes, ensuring safe updates between patches.

    **Prerelease tags** indicate that a version is not final, allowing for testing and feedback without full commitment.

Prereleases for Feedback
^^^^^^^^^^^^^^^^^^^^^^^^

Launching a version with a prerelease tag can gather valuable feedback before a final release, minimizing the need for immediate fixes post-launch.



Addressing Mistakes
---------------------------

Unlisting Packages
^^^^^^^^^^^^^^^^^^

While deletion is off the table, Simplifier offers unlisting as a way to mitigate a package's visibility without removing it from the ecosystem, preserving the ability for direct access by the package owners.

Releasing Corrected Versions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Publishing a new version with an incremented patch, minor, or major number, as appropriate, is the correct approach to addressing errors. This method fully utilizes the strengths of Semantic Versioning (SemVer) to clearly communicate the nature of the update to users.

Releasing Under a New Name
^^^^^^^^^^^^^^^^^^^^^^^^^^

If necessary, republishing the package under a different name is an option, though it comes with its own set of challenges in re-establishing the package's place in the ecosystem.



Exceptions to the Rule
----------------------

Despite our stringent policies, exceptions exist for the removal of packages containing abuse, malware, or illegal content, prioritizing the community's safety and legal obligations. For reporting these kinds of packages please `reach out to us <https://docs.fire.ly/projects/Simplifier/simplifierContact.html>`_. 


