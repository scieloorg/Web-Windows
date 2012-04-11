
Processing scripts
==================
    - GeraPadrao.bat and GeraScielo.bat
    - EnviaBasesScieloPadrao.bat and EnviaBasesScielo.bat
    - EnviaImgPdfScieloPadrao.bat and EnviaImgPdfScielo.bat
    - EnviaTranslationScieloPadrao.bat and EnviaTranslationScielo.bat

Configuration of Processing to generate the website
===================================================

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


        .. image:: img/en/gerapadrao_command_gerascielo.png

Configuration of Transfering Img, PDF, translations
===================================================

EnviaImgPdfLogOn.txt and EnviaTranslationLogOn.txt
--------------------------------------------------

Templates: EnviaImgPdfLogOn-exemplo.txt and EnviaTranslationLogOn-exemplo.txt

    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        cd <PROC_PATH>
        prompt
        bin



Configuration of transfering databases
======================================

EnviaBasesLogOn.txt 
-------------------

Template: EnviaBasesLogOn-exemplo.txt

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
Parameter 1: path to production area
Parameter 2: FTP logfile (see the file mentioned above)
Parameter 3: logfile (log)
Parameter 4: cria (optional)                                     
Example:
    EnviaBasesScielo.bat \\scielo transf\\EnviaBasesLogOn.txt log\\20011002.log cria

