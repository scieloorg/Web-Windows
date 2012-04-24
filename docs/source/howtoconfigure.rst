=====================================
Configuration of GeraPadrao and Envia
=====================================

Scripts
=======

    - GeraPadrao.bat and GeraScielo.bat
    - EnviaBasesScieloPadrao.bat and EnviaBasesScielo.bat
    - EnviaImgPdfScieloPadrao.bat and EnviaImgPdfScielo.bat
    - EnviaTranslationScieloPadrao.bat and EnviaTranslationScielo.bat

Configuration of GeraPadrao.bat
===============================

Edit \\scielo\\web\\proc\\GeraPadrao.bat.
GeraPadrao.bat is a short cut to GeraScielo.bat.

Edit GeraPadrao.bat to set the parameters for GeraScielo.bat.

GeraScielo.bat
--------------

    .. code-block:: text

        GeraScielo <path_data> <path_web_site> <log_file> [cria]



    where
       
        <path_data>:    path which contains serial folder. e. g.: \\scielo

        <path_website>: path which contains the website application. e. g.: \\scielo\\web

        <log_file>:     path/name for the log file. e. g.: log\\2012-03-20.log

        [cria] is an optional parameter. Writing cria, the current log file is deleted and a new one is created.



Configuration for EnviaImgPdfScieloPadrao.bat and EnviaTranslationScieloPadrao.bat
==================================================================================

EnviaImgPdfLogOn.txt and EnviaTranslationLogOn.txt
--------------------------------------------------

Templates: EnviaImgPdfLogOn-exemplo.txt and EnviaTranslationLogOn-exemplo.txt

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
        cd <PROC_PATH>
        prompt
        bin

Using cygwin\lftp package
`````````````````````````

    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        cd <PROC_PATH>
        prompt
        bin

EnviaImgPdfScieloPadrao.bat
---------------------------

It is a shortcut to EnviaImgPdfScielo.bat

Parameters:
    - Parameter 1: path to production area which contains serial folder 
    - Parameter 2: FTP logon file
    - Parameter 3: logfile (log)
    - Parameter 4: cria or add (cria for new log file content or add for appended log file content) 
    - Parameter 5: path of htdocs, which contains img folder

Example:

    .. code-block:: text

        EnviaImgPdfScielo.bat \\scielo transf\\EnviaImgPdfLogOn.txt log\\20011002.log cria \\scielo\\web\\htdocs


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

        EnviaTranslationSciELO.bat \\scielo transf\\EnviaTranslationSciELOLogOn.txt log\\20011002.log cria \\scielo\\web\\htdocs



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
                                   
        EnviaBasesScielo.bat \\scielo transf\\EnviaBasesLogOn.txt log\\20011002.log cria


