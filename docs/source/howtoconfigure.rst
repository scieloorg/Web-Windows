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


---------------------------------------
Configuring EnviaImgPdfScieloPadrao.bat
---------------------------------------

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

--------------------------------------------
Configuring EnviaTranslationScieloPadrao.bat
--------------------------------------------

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

--------------------------------------
Configuring EnviaBasesScieloPadrao.bat
--------------------------------------

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

-----
Notes
-----

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
        bin

**CGYWIN FTP Client**

    .. code-block:: text

        cgywin\lftp\lftp.exe -f temp\Envia...

FTP credential files must follow this patterns.

    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        prompt
        cd serial
        ascii
        put temp\scilista-envia.lst -o scilista.lst
        bin
