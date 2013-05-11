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

------------------
Installation Guide
------------------

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

Creating scielo.def.php
-----------------------

   In C:\\scielo_br\\htdocs there is a file named as scielo.def.template.php. 

   .. image:: img/en/scielo028.png

   Rename the file to scielo.def.php.

    .. image:: img/en/scielo029.png

    Click on Yes button to accept the change.

    .. image:: img/en/scielo030.png


Open scielo.def.php, by clicking on the file
--------------------------------------------    

    .. image:: img/en/scielo031.png

    If WordPad/Notepad was not set to open this file, click on Search button.

    .. image:: img/en/scielo032.png

    Go to C:\\Windows, search for Wordpad/Notepad, select one of them, then click on Open button.

    .. image:: img/en/scielo033.png

    Select one of them, then click on OK button.

    .. image:: img/en/scielo034.png

Open scielo.def.php, by WordPad or Notepad program
--------------------------------------------------
    
    .. image:: img/en/scielo035.png
        
    Click on Open button.

    .. image:: img/en/scielo036.png
        
    Go to C:\\scielo_br\\htdocs

    .. image:: img/en/scielo037.png
        
    Select the ALL THE TYPES, because the php extension is not known by WordPad.

    .. image:: img/en/scielo038.png

    Select scielo.def.php file, then click on Open button.

    .. image:: img/en/scielo039.png

Changing vm.scielo.br to site name
----------------------------------

    Search for vm.scielo.br and replace it by same name informed at virtual host configuration.

    .. image:: img/en/scielo040.png

    .. image:: img/en/scielo041.png

    Click on Replace all button.

    .. image:: img/en/scielo042.png

    Informed the change. Click on OK button.

    .. image:: img/en/scielo043.png

Changing application path
-------------------------

    Replace /home/scielo/www/ by /var/www/scielo/.

    .. image:: img/en/scielo045.png

    .. image:: img/en/scielo046.png

    .. image:: img/en/scielo047.png

Saving scielo.def.php
---------------------

    .. image:: img/en/scielo062.png


Testing the installation
------------------------

Before testing, be sure there are the databases generated.
