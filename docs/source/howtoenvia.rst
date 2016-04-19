=================================================
How to transfer the data to the processing server
=================================================

Introduction
============

The next step after checking the local website is to transfer the databases and files to the processing server.


Pre-requirements
================

* :ref:`paperboy_config`

Conventions
===========

In the local server, all the examples in this topic show the directory structure for the standard 
installation of the SciELO website: 

* /var/www/scielo/serial (*) 
* /var/www/scielo/bases 
* /var/www/scielo/bases-work 
* /var/www/scielo/cgi-bin 
* /var/www/scielo/htdocs 
* /var/www/scielo/proc
* /var/www/scielo/serial

(*) data structure required for `SciELO PC Programs </projects/scielo-pc-programs/en/latest/>`_.  

In the processing server, all the examples in this topic show the directory structure for the standard 

* /var/www/scielo/
* /var/www/scielo/bases/
* /var/www/scielo/htdocs/
* /var/www/scielo/proc/
* /var/www/scielo/serial/


Preparing the data to the processing server
===========================================

Checking scilista.lst
--------------------

#. Check the existence of scilista.lst and its content, it means, list of the journal issues to add/remove/update.

Checking databases in serial
----------------------------

#. database of the articles, created by Converter, must be in: /scielo/serial/<acronym>/v*n*\base
#. title and issue databases must be in: /scielo/serial/title and /scielo/serial/issue, respectively.


Checking images, translations and PDF files
-------------------------------------------

#. Check the existence of images of the journals: plogo.gif and glogo.gif in /scielo/web/htdocs/img/revistas/<acronym>/
#. Check the existence of secondary pages: \*.htm in /scielo/web/htdocs/revistas/<acronym>/
#. Check the existence of images of the articles in /scielo/web/htdocs/img/revistas/<acronym>/<vol-num>/
#. Check the existence of PDF files of the articles in /scielo/web/bases/pdf/<acronym>/<vol-num>/
#. Check the existence of the translation files of the articles in /scielo/web/bases/translation/<acronym>/<vol-num>/


Transfering files to the processing server
==========================================

Transfering databases
---------------------

This procedure sends the databases from local server to the processing server by FTP.

From /scielo/web/proc, run EnviaBasesScieloPadrao.bat, which must be previously configured. 

    .. code-block:: text

        EnviaBasesSciELOPadrao.bat 


Transfering files
-----------------

This procedure transfers by SSH or FTP, from the local server to the homologation server, the images, pdfs, translations, xml's of the articles of the journal issues listed in scilista.txt file. 

    .. code-block:: text

        paperboy_envia.bat 


Processing output is displayed on the screen (standard output) and is stored in the log file: /scielo/web/log/paperboy_enviao.log.

After processing is completed, it is recommendable to check the log file.


Checking the transference 
=========================

In the processing server, check the folders:

Databases:
    - /var/www/scielo/serial and its subdirectories. There must be a structure like: <acronym>/<issue_id>/base/<issue_id>.mst and <acronym>/<issue_id>/base/<issue_id>.xrf
    - /var/www/scielo/serial/scilista.lst - contains the journals' issues to be processed

Images, HTML and PDF files:
    - /var/www/scielo/htdocs/img/revistas/<acronym>/<issue_id>/<img_files>
    - /var/www/scielo/htdocs/revistas/<acronym>/*.htm
    - /var/www/scielo/bases/pdf/<acronym>/<issue_id>/<pdf_files>

Translation files:
    - /var/www/scielo/bases/translation/<acronym>/<issue_id>/<html_files>
