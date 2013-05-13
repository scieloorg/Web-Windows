==========================
Configuring GeraPadrao.bat
==========================

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


=======================================
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

============================================
Configuring EnviaTranslationScieloPadrao.bat
============================================






EnviaTranslationScieloPadrao.bat
--------------------------------

It is a shortcut to EnviaTranslationScielo.bat

Parameters:
    - Parameter 1: path to production area which contains serial folder 
    - Parameter 2: FTP logon file
    - Parameter 3: logfile (log)
    - Parameter 4: cria or add (cria for new log file content or add for appended log file content) 
    - Parameter 5: path of htdocs, which contains img folder

Example:

    .. code-block::text

        EnviaTranslationSciELO.bat \var\www\scielo transf\EnviaTranslationSciELOLogOn.txt log\20011002.log cria \var\www\scielo\htdocs



Configuration for EnviaBasesScieloPadrao.bat
============================================

EnviaBasesLogOn.txt 
-------------------

Template: EnviaBasesLogOn-exemplo.txt

It depends on what is used to do the transference: ftp or cygwin\lftp.

Check the Envia*Scielo.bat.


    .. code-block:: text

        ftp -s:temp\Envia...

Or
    .. code-block:: text

        cgywin\lftp\lftp.exe -f temp\Envia...


Using ftp command
`````````````````
    .. code-block:: text

        open <SERVER_ADDRESS_OR_NAME>
        <USER>
        <PASSWORD>
        prompt
        cd <SERIAL_PATH>
        ascii
        put temp\scilista-envia.lst -o scilista.lst
        bin

Using cgywin\lftp package
`````````````````````````
    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        prompt
        cd serial
        ascii
        put temp\scilista-envia.lst -o scilista.lst
        bin

EnviaBasesScieloPadrao.bat
--------------------------

EnviaBasesScieloPadrao.bat is a shortcut to EnviaBasesScielo.bat.

EnviaBasesSciELOPadrao.bat, with the following parameter:
    - Parameter 1: path to production area
    - Parameter 2: FTP logfile (see the file mentioned above)
    - Parameter 3: logfile (log)
    - Parameter 4: cria (optional)  

Example:
    
    .. code-block:: text
                                   
        EnviaBasesScielo.bat \var\www\scielo transf\EnviaBasesLogOn.txt log\20011002.log cria


