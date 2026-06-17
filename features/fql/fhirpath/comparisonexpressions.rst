Comparison expressions
~~~~~~~~~~~~~~~~~~~~~~

You can compare fields to a value, and the result will evaluate to ``True`` or ``False``. For example, this equation tells you whether the family name of a patient is 'John'.

::

   Patient.name[0].family = 'John'

You can use expressions like this inside of functions. The combination makes them very powerful. The following expression, gives you all the patient name entries, where the family name is 'John'.

::

   Patient.name.where(family = 'John')
