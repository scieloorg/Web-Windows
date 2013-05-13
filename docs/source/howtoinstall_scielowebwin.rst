=========================================
Installation of SciELO Website on Windows
=========================================

------------
REQUIREMENTS
------------

- knowledge in Apache Httpd and PHP configuration
- Windows
- Apache 2.2.3 or later
    - Apache Configurations
        - Create an specific virtual host for the scielo site application
- PHP 5.2.10 (required)
    - PHP Modules
        - libpng
        - soap
        - zlib
        - XSL
        - XML
    - PHP Configurations
        - short-open-tag = On
        - PHP must be working above de desired domain and directory.
            - sugested domain: scielo.local
            - sugested diretory: c:\\var\\www\scielo\\htdocs

Checking the info.php above the desired domain
==============================================

Save the following code into c:\\var\\www\\scielo\\htdocs\\info.php file.

.. code-block:: text

    <?php
        info_php();
    ?>

Check if the code is working accessing: http://scielo.local/info.php

The page presented by the code above is like:

.. warning::
    
     Before start installing SciELO, the PHP must be configured and working with Apache server, above the selected domain. It is not part of this installation guide to help install all the requirements.

-----------------------------
SciELO Web Installation Guide
-----------------------------

Configuring the Apache Virtual Host
===================================

    .. warning::

        * It was expected that a virtual host was already configured when preparing the requirements steps above. So, in most of the cases, will just be necessary to include the "ALIAS" and "CGI-BIN" configurations.

        * The virtual host sample below is a general sample on how to configure the SciELO Virtual Host. This configuration could change according each hosting services and their security polices.

        * Remember to fix all the paths if you are installing the SciELO Site in a different directory.

    .. code-block:: text

        <VirtualHost *:80>
            ServerAdmin scielo@scielo.local
            DocumentRoot "C:/var/www/scielo/htdocs/"
            ServerName scielo.local
            <Directory "C:/var/www/scielo/htdocs/">
                Options FollowSymLinks +Indexes
                AllowOverride None
                Order allow,deny
                Allow from all
                DirectoryIndex index.html index.php
                Satisfy all
            </Directory>
            Alias /pdf/ "C:/var/www/scielo/bases/pdf/" 
            Alias /translation/ "C:/var/www/scielo/bases/translation/"
            <Directory "C:/var/www/scielo/bases/pdf/">
                Options FollowSymLinks +Indexes
                AllowOverride None
                Order allow,deny
                Allow from all
                Satisfy all        
            </directory>
            ScriptAlias /cgi-bin/ "C:/var/www/scielo/cgi-bin/"
            <Directory "C:/var/www/scielo/cgi-bin/">
                AllowOverride None
                Options None
                Order allow,deny
                Allow from all
            </directory>
            ErrorLog logs/scielo-local-error.log
            CustomLog logs/scielo-local-access.log common 
        </VirtualHost>

Install SciELO Site
===================

    1. Creating the directories to receive the application

        .. code-block:: text

            c:\> md \var\www\scielo
            c:\> cd \var\www\scielo
            c:\var\www\scielo>

    2. Downloading packages from GitHub

        Link of versions available for SciELO Site: https://github.com/scieloorg/Web/tags
        
        Link of versions available for Windows Patch: https://github.com/scieloorg/Web-Windows/tags

    3. Firts, extract the SciELO Site package at c:\\var\\www\\scielo>

        The created directory structure at c:\\var\\www\\scielo> must be 

        .. code-block:: text

            <package_name>\bases\
            <package_name>\bases-work_modelo\
            <package_name>\bases_modelo\
            <package_name>\cgi-bin\
            <package_name>\docs\
            <package_name>\htdocs\
            <package_name>\ignore.txt
            <package_name>\proc\
            <package_name>\serial_modelo\

        Move all the content from <package_name> to c:\\var\\www\\scielo>

        Remove the empty directory <package_name>

    4. Then, extract the SciELO Windows package at c:\\var\\www\\scielo>.

    .. warning::
    
        This extraction will overwrite some files from the SciELO Site package. You must accept all the files and dirctories replacements.    

    5. Some folders already exist. You must accept to overwrite them.

        .. image:: img/en/scielo025.png

    6. Some files already exist. You must accept to overwrite them. 

        .. image:: img/en/scielo026.png

        .. image:: img/en/scielo027.png

    7. Install the CISIS tool at the SciELO Site directories

        Download the `CISIS package <http://wiki.bireme.org/en/index.php/CISIS>`_ from the BIREME products website and extract it at c:\\var\\www\\scielo\\proc\\cisis>.

        The recommended version is **CISIS 1030**

        To check the CISIS version, after unzip the donwloaded file at c:\\var\\www\\scielo\\proc\\cisis>, run: 

        .. code-block:: text

            c:\var\www\scielo\proc\cisis> mx what

        The result must be:

        .. code-block:: text

            CISIS Interface v5.2b/GC/W/L/M/32767/10/30/I - Utility MX
            CISIS Interface v5.2b/.iy0/Z/4GB/GIZ/DEC/ISI/UTL/INVX/B7/FAT/CIP/CGI/MX/W
            Copyright (c)BIREME/PAHO 2006. [!http://www.bireme.br/products/cisis]

    8. Install the WWWISIS tool at the SciELO Site directories

        Download the `WWWISIS package <http://wiki.bireme.org/en/index.php/WWWISIS>`_ from the BIREME products website and extract it at c:\\var\\www\\scielo\\cgi-bin>.

        The recommended version is **WWWISIS 1030**

        To check the WWWISIS version, at c:\var\www\scielo\cgi-bin\, run:

        .. code-block:: text

            c:\var\www\scielo\cgi-bin$> wxis hello

        If you have already configured the virtual host, you can check WWWISIS version by accessing the url:

        .. code-block:: text

            http://scielo.local/cgi-bin/wxis.exe?hello
        
        where scielo.local is the website address

        The result must be:

        .. code-block:: text
        
            CISIS Interface v5.4.02_p5/GC/512G/W/L4/M/32767/10/30/I - XML !IsisScript WWWISIS 7.1d
            CISIS Interface v5.4.02_p5/.iy0/Z/GIZ/DEC/ISI/UTL/INVX/B7/FAT/CIP/CGI/MX/W
            Copyright (c)BIREME/PAHO 2008. [!http://www.bireme.br/products/cisis]
            Copyright (c)BIREME/PAHO 2008. [!http://bvsmodelo.bvsalud.org/php/index.php?lang=pt]
            Copyright (c)BIREME/PAHO 2008. [!http://bvsmodelo.bvsalud.org/php/level.php?lang=pt&component=28&item=1]

            WXIS release date: Sep 24 2008    


Configuration of scielo.def.php
=============================== 

    1. Creating scielo.def.php

        In C:\\var\\www\\scielo\\htdocs> there is a file named as scielo.def.php.template. 

        .. image:: img/en/scielo028.png

        Rename the file to scielo.def.php.

        .. image:: img/en/scielo029.png

        Click on Yes button to accept the change.

        .. image:: img/en/scielo030.png


    2. Edit scielo.def.php using your preferred text editor

    3. Changing vm.scielo.br to scielo.local

        Search for **vm.scielo.br** and replace all the occurences by **scielo.local** or for each other name previously configured at the virtualhost

    4. Changing application path

        Search for **/home/scielo/www/** and replace all the occurences by ** /var/www/scielo/** or for each other patch previously configured at the virtualhost

    5. Save all the changes made

    6. At this point, the website is probably working at: http://scielo.local/

    7. Set the paramenters to 0 "Zero" once this website will be only available for articles tests in a stage environmnet.

    .. code-block:: text

        [CACHE]
        ENABLED_CACHE=0

        [SOCKET]
        SOCK_PORT=
        ENABLE_ACCESS_LOG=0

        [services]
        journal_manager=0
        show_toolbox=0
        show_datasus=0
        show_reference=0
        show_requests=0
        show_login=0
        show_send_by_email=0
        show_cited_scielo=0
        show_cited_google=0
        show_similar_in_scielo=0
        show_similar_in_google=0
        show_article_references=0
        show_scimago=0
        show_article_wltranslation=0
        show_fapesp_projects=0
        show_press_releases=0
        show_clinical_trials=0
        show_ref_links=0
        show_meta_citation_reference=0
        show_ubio=0

    8. Save all the changes made

    9. The SciELO site is prepared to receive new production files for tests.

    See the other guides about how to send data to the production server, and for processing in the root level of this documentation.

-------------------------
Configuring Batch Scripts
-------------------------

GeraPadrao.bat
==============

Edit c:\\var\\www\\scielo\\proc\\GeraPadrao.bat


Fix the path according to the SciELO Site directory, for the lines below:: 

    call notepad \scielo\serial\scilista.lst
    ***
    rmdir /S /Q \scielo\web\bases-work
    rmdir /S /Q \scielo\web\bases\artigo
    rmdir /S /Q \scielo\web\bases\iah
    rmdir /S /Q \scielo\web\bases\issue
    rmdir /S /Q \scielo\web\bases\newissue
    ***
    md \scielo\web\bases-work
    ***
    call GeraScielo.bat \scielo \scielo\web log\GeraPadrao.log adiciona


.. code-block:: text

    call GeraScielo <path_data> <path_web_site> <log_file> adiciona

where
   
    <path_data>:    path which contains serial folder. e. g.: \\scielo

    <path_website>: path which contains the website application. e. g.: \\scielo\\web

    <log_file>:     path/name for the log file. e. g.: log\\2012-03-20.log

    [cria] is an optional parameter. Writing cria, the current log file is deleted and a new one is created.

considering the path \\var\\www\\scielo the changes must be:

.. code-block:: text

    GeraScielo \var\www\scielo \var\www\scielo log\GeraPadrao.log adiciona

Configuring EnviaImgPdfScieloPadrao.bat
=======================================

This procedure is basically a processing that send some files to the official server through an FTP account.

Fix the path according to the SciELO Site directory, for the lines below:: 

    notepad \scielo\serial\scilista.lst
    ***
    EnviaImgPdfScielo.bat \scielo transf\EnviaImgPdfLogOn.txt log\EnviaImgPdfScieloPadrao.log cria \scielo\web

.. code-block:: text

    EnviaImgPdfScielo.bat <path_data> <ftp_conf_file> <log_file> cria <path_webscielo>

where
   
    <path_data>:    path which contains serial folder. e. g.: \\scielo

    <ftp_conf_file>: path for the ftp credential file

    <path_website>: path which contains the website application. e. g.: \\scielo\\web

    <log_file>:     path/name for the log file. e. g.: log\\2012-03-20.log

considering the path \\var\\www\\scielo the changes must be:

.. code-block:: text

    GeraScielo \var\www\scielo transf\EnviaImgPdfLogOn.txt log\EnviaImgPdfScieloPadrao.log cria \var\www\scielo

Content of the sample file c:\var\www\scielo\proc\tranf\EnviaImgPdfLogOn-exemplo.txt::

    open server
    user
    password

    cd www
    prompt
    bin

Configuring EnviaTranslationScieloPadrao.bat
============================================

This procedure is basically a processing that send some files to the official server through an FTP account.

Fix the path according to the SciELO Site directory, for the lines below:: 

    notepad \scielo\serial\translation.lst
    ***
    EnviaTranslationScielo.bat \scielo transf\EnviaTranslationLogOn.txt log\EnviaTranslationScieloPadrao.log cria \scielo\web\bases


.. code-block:: text

    EnviaImgPdfScielo.bat <path_data> <ftp_conf_file> <log_file> cria <path_webscielo>

where
   
    <path_data>:    path which contains serial folder. e. g.: \\scielo

    <ftp_conf_file>: path for the ftp credential file

    <path_website>: path which contains the website application. e. g.: \\scielo\\web

    <log_file>:     path/name for the log file. e. g.: log\\2012-03-20.log

considering the path \\var\\www\\scielo the changes must be:

.. code-block:: text

    GeraScielo \var\www\scielo transf\EnviaTranslationLogOn.txt log\EnviaTranslationLogOn.log cria \var\www\scielo\bases

.. warning:: 

    There is a sample file for the ftp credentials at c:\var\www\scielo\proc\trans directory. You just need to copy the sample file and change the ftp account credentials.

Content of the sample file c:\var\www\scielo\proc\tranf\EnviaTranslationLogOn-exemplo.txt::

    open server
    user
    password

    cd www
    prompt
    bin

Configuring EnviaBasesScieloPadrao.bat
======================================

This procedure is basically a processing that send some files to the SciELO for bibliometric and access statistics processing.

Fix the path according to the SciELO Site directory, for the lines below:: 

    notepad \scielo\serial\translation.lst
    ***
    EnviaBasesScielo.bat \scielo transf\EnviaBasesLogOn.txt log\EnviaBasesScieloPadrao.log cria 


.. code-block:: text

    EnviaImgPdfScielo.bat <path_data> <ftp_conf_file> <log_file> cria

where
   
    <path_data>:    path which contains serial folder. e. g.: \\scielo

    <ftp_conf_file>: path for the ftp credential file

    <log_file>:     path/name for the log file. e. g.: log\\2012-03-20.log

considering the path \\var\\www\\scielo the changes must be:

.. code-block:: text

    EnviaBasesScielo \var\www\scielo transf\EnviaBasesLogOn.txt log\EnviaBasesScieloPadrao.log cria \var\www\scielo\bases

.. warning:: 

    There is a sample file for the ftp credentials at c:\var\www\scielo\proc\trans directory. You just need to copy the sample file and change the ftp account credentials.

Content of the sample file c:\var\www\scielo\proc\tranf\EnviaBasesScieloPadrao-exemplo.txt::

    open servidor
    user
    password

    prompt
    cd /usr/local/scielo/scielo-prod
    mkdir serial
    cd serial
    ascii
    put temp\scilista-envia.lst scilista.lst
    bin

Notes
=====

In some situations the Windows builtin FTP presents timeout problems when conecting to FTP servers. If this happens, we recomend to install a third party FTP client like cygwin. When using cygwin FTP client, some chages must be done in the ftp credential files, as following. 

Templates: 

* EnviaBasesLogOn.txt
* EnviaTranslationLogOn.txt
* EnviaImgPdfLogOn.txt

It depends on what is used to do the transference: ftp or cygwin\lftp.

Check the Envia*Scielo.bat files and look for the FTP command line to identify or change the client FTP.

**Builtin FTP Client**

    .. code-block:: text

        ftp -s:temp\Envia...

FTP credential files must follow this patterns.

    .. code-block:: text

        open <SERVER_ADDRESS_OR_NAME>
        <USER>
        <PASSWORD>
        prompt
        cd <SERIAL_PATH>
        ascii
        put temp\scilista-envia.lst -o scilista.lst