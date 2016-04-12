===========================================
How to generate the content for the website
===========================================

Introduction
============

The next step after converting the articles is to generate the local website (http://scielo.local), which will present and search information inserted in the database.


Conventions
===========

All the examples in this topic show the directory structure for the standard 
installation of the SciELO website: 

* /var/www/scielo/serial (*) 
* /var/www/scielo/bases 
* /var/www/scielo/bases-work 
* /var/www/scielo/cgi-bin 
* /var/www/scielo/htdocs 
* /var/www/scielo/proc 

(*) data structure required for `SciELO PC Programs </projects/scielo-pc-programs/en/latest/>`_.  

Requirements
============

#. images of the articles must be in: /var/www/scielo/htdocs/img/revistas/<acronym>/v*n*
#. pdf files of the articles must be in: /var/www/scielo/bases/pdf/<acronym>/v*n*
#. translations files of the articles must be in: /var/www/scielo/bases/translations/<acronym>/v*n*
#. database of the articles, created by Converter, must be in: /var/www/scielo/serial/<acronym>/v*n*\base
#. title and issue database must be in: /scielo/serial/title and /var/www/scielo/serial/issue, respectively.


GeraPadrao.bat
==============

#. Open a DOS session

    .. image:: img/en/gerapadrao_dossession.png

#. Go to proc directory

    .. image:: img/en/gerapadrao_changedir.png

#. Execute:
    1. To update the website content

        .. code-block:: text

            GeraPadrao


        .. image:: img/en/gerapadrao_command.png

    2. To create a new content to the website


        .. code-block:: text

            GeraPadrao novo


        .. image:: img/en/gerapadrao_command_novo.png


#. Answer: continue or cancel


#. If continue, edit /var/www/scielo/serial/scilista.txt with the following format: 

    .. code-block:: text
        
        <journal_acronym> v*n*
        <journal_acronym> v*n*


Example:

    .. code-block:: text

        bjmbr v31n1pr
        bjmbr v31n1
        jbc 2011naheadpr
        jbc 2011nahead
        jbc v115n1
        jbca n100
        rv v10s1
        ra v10n10s1
        rs v11n1s0
        jed vserIIn10


#. Save and close this file
#. Enter to continue
#. End
#. Open http://scielo.local


Checking the result and log file
================================

Processing output is displayed on the screen (standard output) and is stored in the log file: /var/www/scielo/log/GeraPadrao.log or the file informed in GeraPadrao.

In case of error, processing stops, and wait for an user's intervention.
 
Example: 
    Cancel or Continue 

After processing is completed, it is recommendable to check the log file.


Checking the local website 
==========================

In this phase, the local website is checked to make sure it is working correctly. 

Execute the next steps, only if the local website is working properly.

Check if the errors are about content, which must be fixed, using SciELO PC Programs.

Check if the errors are about processing.

