Snapshot
--------

The snapshot action will create a snapshotted version of a resource (StructureDefinition). Only successful snapshots are copied to the output. The rest of the files are ignored.

Example:

::

     - action: snapshot

Typically, your pipe would like this:

::

   generate-snapshots:
     - category: StructureDefinition
     - action: snapshot
     - copy: /package

Pass
----

In case you would like resources that fail to get a snapshot to still be included in the output, set the **pass** property to true (yes also works in JSON).

::

     - action: snapshot
       pass: yes
