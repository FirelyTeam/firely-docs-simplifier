Functions
---------

Once you have a value, or a collection of values, you often would like to do something more specific with that value. So, besides getting data (out) of a resource, you might also want to change that data. For that FhirPath has the concept of functions. Sometimes a function, just limits the data you get, but often it helps you chnage it or tells you something about that data.

Syntax
~~~~~~

A function is called by using a dot after a FhirPath field name follwed by two round brackets ``(`` and ``)``. Between those braces you might have to provide some additional information, depending on the function. Here is how it looks.

The exists() function
^^^^^^^^^^^^^^^^^^^^^

The function ``exists()`` tells you whether the value you are looking for is actually there. if it is, the function gives back the value ``True`` if found it, and ``False`` if it did not. So the following expression checks if a patient record has a birthDate:

::

   Patient.birthDate.exists()

The count() function
^^^^^^^^^^^^^^^^^^^^

And the follwoing function ``count()`` is even more interesting, it tells you how many elements where found. Imagine a patient with two names, and for each name, it has two given names. Take it for example a patient has the following four given names:

::

   Patient.name[0].given[0] = 'William'
   Patient.name[0].given[1] = 'John'

   Patient.name[1].given[0] = 'Bill'
   Patient.name[1].given[1] = 'Jack'

This expression

::

   Patient.name.given.count()

will return the value ``4``.

Optional parameters
~~~~~~~~~~~~~~~~~~~

If you supply a value, or another expression inside of the brackets of a function, that is called a parameter. Some functions have mandatory parameters, and some have optional. Take for example the ``exists()`` function, you may provide an additional condition. This function checks if the Patient has a phone listed in his telecomunication channels.

::

   Patient.telecom.exists(system = 'phone')

Evaluation
~~~~~~~~~~

Since the primary design goal for FhirPath was validation - expressing how a resource *should* look - there are a lot of functions that tell you whether something is true.
