=========================
Configuring Batch Scripts
=========================

--------------
GeraPadrao.bat
--------------

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


.. _paperboy_config:

--------
PaperBoy
--------

Paperboy is a Python utilitary developed to replace the scripts:

    * EnviaImgPdfScieloPadrao.bat
    * EnviaTranslationSciELOPadrao.bat
    * EnviaBasesScieloPadrao.bat
    * EnviaXmlScieloPadrao.bat

This utilitary was developed to address ftp incompatibilities with windows and
Linux servers.

Installing
----------

Install guide: https://github.com/scieloorg/paperboy


Configuring
-----------

After install the paperboy you must create a config.ini file to configure the
source and destiny resources, and the ssh account that will be used to send data
to the server.

Access the directory \\var\\www\\scielo\\proc

Creating config.ini file
````````````````````````

Create a text file named paperboy_config.ini in the **proc** directory, the file
must follow the bellow format:

.. code-block:: text

    [app:main]
    source_dir=c:/var/www/scielo
    cisis_dir=c:/var/www/scielo/proc/cisis
    scilista=c:/var/www/scielo/serial/scilista.lst
    destiny_dir=/var/www/scielo
    ssh_server=localhost
    ssh_port=22
    ssh_user=anonymous
    ssh_password=anonymous

**source_dir:** Absolute path to the directory where the SciELO Local website was installed.

**cisis_dir:** Absolute path to the directory where CISIS utilitary was installed

**scilista:** Absolute path to the scilista file with the list of issues that should be
add, updated or deleted from the website

**destiny_dir:** Absolute path to the directory where the SciELO Site was installed in the server.

**ssh_server:** Domain of the SFTP or FTP server, where the SciELO Site was installed

**ssh_port:** 22 to use SFTP or 21 to use FTP.

**ssh_user:** A valid SFTP or FTP username 

**ssh_password:** A valid SFTP or FTP password for the given username

Creating envia.bat file
```````````````````````

Create a text file named paperboy_envia.bat in the **proc** directory.

.. code-block:: text

    set PAPERBOY_SETTINGS_FILE=/var/www/scielo/proc/paperboy_config.ini
    paperboy -m -o /var/www/scielo/proc/log/paperboy_envia.log

Running
-------

Run the script **paperboy_envia.bat** to update the SciELO Site server.

.. code-block:: text

    paperboy_envia.bat

-------------
Delorean2Isis
-------------

This script is used to download the SciELO databases managed in the SciELO Manager
to the local website for covertion pourpose. It is necessary when your Collection
is using the new catalog manager "SciELO Manager".

Installing
----------

Downloading and unzipping
`````````````````````````
Download the package (`delorean2isis-master.zip <http://github.com/scieloorg/delorean2isis/archive/master.zip>`_)
and unzip it at c:.

Unzip the package in c:/::

    cd /
    unzip delorean2isis-master.zip
    rename delorean2isis-master delorean2isis

Installing requirements
```````````````````````

Python 2.7 must be previously installed

.. code-block:: text

    cd c:/delorean2isis
    pip install -r requirements.txt

Creating config.py file
```````````````````````

Create a text file named config.py in the **c:/delorean2isis** directory, the file
must follow the bellow format:

.. code-block:: text

    #coding:utf-8
    #!/usr/bin/python

    API_URL = 'http://localhost:8000/api/v1/'
    API_USER = ''
    API_KEY = ''
    DELOREAN_URL = 'http://localhost:6543/generate/'
    ISIS_PATH = ""
    DATABASES = ["title", "issue"]
    DATABASE_FST = {'title': 'tit_issn', 'issue': 'issue'}

You can copy the c:/delorean2isis/config.py.template to c:/delorean2isis/config.py
to have a fresh and new config.py file.

**API_URL:** URL for the SciELO Manager API (ask it to the SciELO Team).

**API_USER:** Your SciELO Manager username.

**API_KEY:** Your SciELO Manager Token. Login to the SciELO Manager and access the 
user informations to have your API_KEY. It will be available in the  label "API Token".

**DELOREAN_URL:** URL for the Delorean utilitary (ask it to the SciELO Team).

**ISIS_PATH:** Full path to the ISIS utilitary

**DATABASES:** Databases that will be downloaded. (Do not change this item)

**DATABASES_FST:** Databases that will be downloaded. (Do not change this item)

.. rint::

    Ask the values of the parameters API_URL and DELOREAN_URL for the SciELO Team.

Creating a bash file to run deloreans2isis
``````````````````````````````````````````

Create a bash file named **sincroniza.bat** in the **c:/delorean2isis**
directory. This file must contain the following content.

.. code-block:: text

    cd c:/delorean2isis
    python delorean2isis.py -c <collection_slug> -o c:/var/www/scielo/proc/serial


**-c** Collection slug in the SciELO Manager.

**-o** Full path to the SciELO serial folder. If you used the SciELO patterns
while installing the SciELO Site and SciELO utilitaries, the serial folder should
be in c:/var/www/scielo/proc/serial.


.. hint::

    Ask the collection_slug for the SciELO Team.


Running
-------


Run the script **sincroniza.bat** to update the SciELO Site server.

.. code-block:: text

    cd c:/delorean2isis
    sincroniza.bat


Notes
-----

* Maybe you want to include a link for the sincroniza.bat file in a appropriate place, avoiding the uses to know it is available in c:/deloreans2isis. For exemple: Include a link in the desktop.
