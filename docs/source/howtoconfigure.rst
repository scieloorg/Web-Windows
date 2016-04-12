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

**ssh_server:** Domain of the server where the SciELO Site was installed

**ssh_port:** The SSH port (default 22)

**ssh_user:** A valid SSH username 

**ssh_password:** A valid SSH password for the given username

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

