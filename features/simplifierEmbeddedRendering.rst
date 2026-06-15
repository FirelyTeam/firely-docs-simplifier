Embedded Rendering
==================

.. important::

    *This feature is available for anyone with a registered Simplifier account.*

Simplifier enables rendering of profiles as a tree, XML or table. Users with an enterprise account can also embed rendering in their own website by using the following URL and copying it into their own code:: 

    https://simplifier.net/embed/render?id=[Name of your project]/[Name of your resource]

Note that this only works for public projects that are created by a user with an enterprise account.

For example, https://simplifier.net/embed/render?id=nictizstu3-zib2017/nl-core-patient shows embedded rendering of the nl-core-patient defined by Nictiz. You can copy this URL in your browser to see what the rendering looks like.

To embed the rendering in your own website, you could use the following HTML code::

    <iframe src=https://simplifier.net/embed/render?id=nictizstu3-zib2017/nl-core-patient height="345px" width="100%"></iframe>


For **Enterprise** customers it is possible to remove the Simplifier banner by adding `&header=false`. 

Below you see the result. You could adjust the height and width of the iframe as you like.

.. raw:: html 

  <iframe src="//simplifier.net/embed/render?id=nictizstu3-zib2017/nl-core-patient" height="345px" width="100%"></iframe>
 

