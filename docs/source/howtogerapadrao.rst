
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

In case of error, processing stops at once, until there is intervention by the user 
who should read carefully the messages displayed on the screen to decide which 
action to take according to the options available. 

Example: 
    Cancel or Continue 

After processing is completed, it is recommendable to check the log file.


Checking the local website 
==========================

In this phase, the local website is checked to make sure it is working correctly. 

Execute the next steps, only if the local website is working properly.

Check if the errors are about content, which must be fixed, using SciELO PC Programs.

Check if the errors are about the website application or processing.


Preparing the test or public website 
====================================

Checking images, translations and PDF files
-------------------------------------------

#. Check the existence of images of the journals: plogo.gif and glogo.gif in \\scielo\\web\\htdocs\\img\\revistas\\<acronym>\\

#. Check the existence of secondary pages: \*.htm in \\scielo\\web\\htdocs\\revistas\\<acronym>\\

#. Check the existence of images of the articles in \\scielo\\web\\htdocs\\img\\revistas\\<acronym>\\<vol-num>\\

#. Check the existence of PDF files of the articles in \\scielo\\web\\bases\\pdf\\<acronym>\\<vol-num>\\

#. Check the existence of the translation files of the articles in \\scielo\\web\\bases\\translation\\<acronym>\\<vol-num>\\




Sending files to a server with FTP. 
If it is Windows with no FTP service, read Copy of files 
Copying files 
============.

When a journal is to be included, the files plogo.gif and glogo.gif should be copied 
to the structure 
\\htdocs\\img\\revistas\\<acronym>\\ 
and also.htm* files of secondary pages to 
\\htdocs\\revistas\\<acronym>\\ 
for each journal being processed, image directories of the issue should be copied 
\\htdocs\\img\\revistas\\<acronym>\\<vol-num>\\ 
and also PDF files of the bases area (default) to 
\\bases\\pdf\\<acronym>\\<vol-num>\\ 
for each journal being processed, the directories below 
\\scielo\\serial para \\scielo\\web\\serial 
should be copied 

Sending files to a server with FTP 
=================================.

Preferably, work should be done with other two more servers. One for testing, and 
one for the public. 
If the configuration is for just one server, then the server or test and public site 
mean the same. 
Here, the transfer of journal files from the local website to the test server is carried out 
and the files below are executed: 

Sending bases 
____________˜
This procedure sends the bases to the test site server where GeraSciELO.bat is run 
to create the site. 
To be executed, this procedure is transferred by FTP: 
- file scilista.txt to the serial directory in the server; and 
Thus, we should guarantee that scilista.txt contains all the issues to be included in 
the test site. 

EnviaBasesSciELO.bat, with the following parameter: 
Parameter 1: path to production area 
Parameter 2: FTP logfile 
Parameter 3: logfile (log) 
Parameter 4: creates / adds (in/to the log) 
Example: 
    EnviaBasesScielo.bat \\scielo transf\\EnviaBases2Teste.txt log\\20011002.log cria

 
Parameter 2 in this procedure refers to the FTP logon file which should be set up 
with the information from the server, preferably soon after installation of the 
SciELO Web. The content of this file is comprises the following: 
server IP 
user and FTP password 
directory containing the databases of each issue (equivalent to serial) 
The shortcut for this procedure uses logon file transf\\EnviaBasesLogOn.txt with 
the following syntax: 
    EnviaBasesSciELOPadrao.bat 


Remember to configure the logon file used for 
this procedure before executing. The example 
used by EnviaBasesScieloPadrao.bat is found in 
\\scielo\\web\\proc\\transf with the name 
EnviaBasesLogOn-Example.txt. 

Sending images and pdf 
______________________

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

