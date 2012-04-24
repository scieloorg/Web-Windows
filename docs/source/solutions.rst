============================
How to solve common problems
============================

Website home page
-----------------

As accessing http://teste.scielo.local, the website present unexpected presentation.

Edit the php.ini file.  

    .. image:: img/en/scielo063.png

This file is located on PHP standard directory.

    .. image:: img/en/scielo064.png

Open this file, using WordPad or Notepad, then search for short_open_tag

    .. image:: img/en/scielo065.png


    .. image:: img/en/scielo066.png

Change short_open_tag = Off to short_open_tag = On

    .. image:: img/en/scielo067.png

Save the file

    .. image:: img/en/scielo068.png

Restart Apache.

    .. image:: img/en/scielo069.png

Open http://teste.scielo.local.

    .. image:: img/en/scielo070.png


Alphabetic list
---------------

Access http://teste.scielo.local

Click on Alphabetic list link

    .. image:: img/en/scielo071.png

If the website look like the image below:

    .. image:: img/en/scielo072.png

or if the message 

    .. code-block:: text

        Warning: DOMDocument::loadXML() [domdocument.loadxml]: Premature end
        of data in tag LIST line 39 in Entity, line: 42 in C:\SciELO\www\htdocs
        \class.XSLTransformerPHP5.php on line 29


This error is related to missing databases. They must be generated using `GeraPadrao <howtogerapadrao.html>`_.


Table of contents page does not load
------------------------------------

This error is related to author identification in the markup file. Check the authors.


Article or abstract page does not load
--------------------------------------

This error can be related to:
    - missing databases (related, cited, etc)
    - authors were not correctly identified or have special characters in their names.



