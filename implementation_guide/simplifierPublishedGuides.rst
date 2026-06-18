Published Guides
----------------

.. important::

    `This is a feature for all paid plans <https://simplifier.net/pricing>`_.


Until now a guide was rendered directly from the source. This limited users to only have one live version online. If they wanted more they had to export their guide as a static website. And host it themselves using the Export guide option. 
With Published guides you can publish a guide in Simplifier as a snapshot (disconnected from the source). These publications are versioned, so you can publish as many as you like. It makes it possible to have ballotable and final publications without effort.

Full process of publishing as we see it:

* You have (generally) one editable version of your Implementation Guide in your project. This is, just like for the resources, the head of the development branch.

* Once you're happy with the conformance resources you release a FHIR package.Then you change the scope for your editable IG to the package version you have just released and check if everything looks peachy.

* If so, you make a release of your Implementation Guide (Publish). You may also want to make it the new default IG (where people go if they have the IG url without a version number or ``current``).

* Then you switch the scope of your editable IG back to the project (``current``) and edit away on the next release of both.

You may want to choose to keep the version numbers between the FHIR package and IG the same, but there are a few nuances differing between their release processes:

* The IG version number is currently just a string. We may choose for Simplifier-created IGs to enforce semver there for consistency.
  
* You can choose to make an IG version overwritable (you can also do this after as first publishing as read-only). Package versions are of course final and can only be unlisted.

     * You could for example spot a typo in your IG release and overwrite it with a new IG release (with the same version number still) still pointing to the same package as scope.
     * You could spot an issue with the released package version, release a new package version (with a new version number) and publish an IG with the scope pointing to the new package version but still under the same IG version. This makes your IG URL/version number also more stable to share with others than a package version number.

The Publish Guide wizard is very self explanatory, you can make your guide Public or Private, Read-only or Overwritable and you can choose to set this guide as the default as mentioned above. Project admins can later make changes to the initial settings. 