
Introduction
============

The next step after converting the articles is to generate the local website (http://localhost), which will present and search information inserted in the database.


Requirements
============

#. images of the articles must be in: \\scielo\\web\\htdocs\\img\\<acronym>\\v*n*
#. pdf files of the articles must be in: \\scielo\\web\\bases\\pdf\\<acronym>\\v*n*
#. translations files of the articles must be in: \\scielo\\web\\bases\\translations\\<acronym>\\v*n*
#. database of the articles, created by Converter, must be in: \\scielo\\serial\\<acronym>\\v*n*\base
#. title and issue database must be in: \\scielo\\serial\\title and \\scielo\\serial\\issue, respectively.

Conventions
===========

All the examples in this topic show the directory structure for the standard 
installation of the SciELO website: 

* \\scielo\\serial (*) 

* \\scielo\\web\\bases 
* \\scielo\\web\\bases-work 
* \\scielo\\web\\cgi-bin 
* \\scielo\\web\\htdocs 
* \\scielo\\web\\proc 

(*) data structure required for `SciELO PC Programs </projects/scielo-pc-programs/en/latest/>`_.  


How to generate the content for the website
===========================================


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

    .. image:: img/en/gerapadrao_answer.png

#. If continue, edit \\scielo\\serial\\scilista.txt with the following format: 

    .. code-block:: text
        
        <journal_acronym> v*n*
        <journal_acronym> v*n*


    .. image:: img/en/gerapadrao_scilista.png

#. Save and close this file
#. Enter to continue
#. End
#. Open http://localhost


Checking the result and log file
================================

Processing output is displayed on the screen (standard output) and is stored in the log file: \\scielo\\web\\log\\GeraPadrao.log or the file informed in GeraPadrao.

In case of error, processing stops, and wait for an user's intervention.
 
Example: 
    Cancel or Continue 

After processing is completed, it is recommendable to check the log file.


Checking the local website 
==========================

In this phase, the local website is checked to make sure it is working correctly. 

Execute the next steps, only if the local website is working properly.

Check if the errors are about content, which must be fixed, using SciELO PC Programs.

Check if the errors are about the website application or processing.


Preparing the data to the processing server
===========================================

Checking scilsta.txt
--------------------

#. Check the existence of scilista.txt and its content, it means, list of the journal issues to add/remove/update.

Checking images, translations and PDF files
-------------------------------------------

#. Check the existence of images of the journals: plogo.gif and glogo.gif in \\scielo\\web\\htdocs\\img\\revistas\\<acronym>\\

#. Check the existence of secondary pages: \*.htm in \\scielo\\web\\htdocs\\revistas\\<acronym>\\

#. Check the existence of images of the articles in \\scielo\\web\\htdocs\\img\\revistas\\<acronym>\\<vol-num>\\

#. Check the existence of PDF files of the articles in \\scielo\\web\\bases\\pdf\\<acronym>\\<vol-num>\\

#. Check the existence of the translation files of the articles in \\scielo\\web\\bases\\translation\\<acronym>\\<vol-num>\\


Transfering files to the processing server
------------------------------------------

Transfering databases
`````````````````````
This procedure sends the databases from local server to the processing server by FTP.

From \\scielo\\web\\proc, run EnviaBasesScieloPadrao.bat, which must be previously configured. 

    EnviaBasesSciELOPadrao.bat 


Remember to configure the logon file used for 
this procedure before executing. The example 
used by EnviaBasesScieloPadrao.bat is found in 
\\scielo\\web\\proc\\transf with the name 
EnviaBasesLogOn-Example.txt. 

Transfering img and pdf
`````````````````````

This procedure transfers the images and pdfs of journal articles listed in the file 
scilista.txt. 
This procedure makes available images and pdfs. It has nothing to do with creating 
the site, but with viewing articles images and pdfs. 
EnviaImgPdfSciELO.bat with the following Parameter: 
- Parameter 1: path to production area 
- Parameter 2: FTP logon file 
- Parameter 3: logfile (log) 
- Parameter 4: creates / adds (in/to log) 
- Parameter 5: path to server test area 

Example: 
   EnviaImgPdfScielo.bat \\scielo transf\\EnviaImgPdfLogOn.txt log\\20011002.log cria \\scielo\\web\\htdocs 

The command EnviaImgPdfSciELO.bat is similar to EnviaBasesSciELO.bat with the 
addition of Parameter 5. 

The shortcut for this procedure is: 
    EnviaImgPdfSciELOPadrao.bat 
The example used by EnviaImgPdfScieloPadrao.bat can be found in 
\\scielo\\web\\proc\\transf with the name EnviaImgPdfLogOn-Example.txt. 

