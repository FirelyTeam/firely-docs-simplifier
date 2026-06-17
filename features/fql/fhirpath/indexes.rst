Indexes
-------

Just as the dot notation gives you all branches that match the name after the dot (see dot notation), an index limits what you get. Take a look at this expression:

::

       Patient.name.given

It gives you all gives names of all names of a patient. But what if we only want th first given name of the first name of a patient?

Zero is first
~~~~~~~~~~~~~

There is one thing you need to know, before we continue: in the world of computer languages, we refer to the first element in any collection as element zero. If you find this confusing, think of your age. The first year of your life, your age is zero. The moment you become one, is when year zero has ended. And that's how we look at indexes too.

Providing an index
~~~~~~~~~~~~~~~~~~

In FhirPath you can describe which element you want in a collection, by using square brackets. So the First name of a patient is

::

       Patient.name[0]

And the first given name of that first name is:

::

       Patient.name[0].given[0]
