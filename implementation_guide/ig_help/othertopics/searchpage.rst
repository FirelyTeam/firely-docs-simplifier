Search page
~~~~~~~~~~~

You can create your own search page, by creating a Google Custom Search Engine at https://cse.google.com. Make sure you specify the URL of your IG as the domain to be searched.

Paste the code in your Search page, like the code below (replace the ``cx`` value with your own Custom Search Engine id):

.. code:: html

   <script async src="https://cse.google.com/cse.js?cx=YOUR-CSE-ID"></script>
   <div class="gcse-search"></div>

Your search page will only return results once Google has indexed your IG. This can take a moment after you have created it.
