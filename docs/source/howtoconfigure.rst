
Processing scripts
==================
    - GeraPadrao.bat and GeraScielo.bat
    - EnviaBasesScieloPadrao.bat and EnviaBasesScielo.bat
    - EnviaImgPdfScieloPadrao.bat and EnviaImgPdfScielo.bat
    - EnviaTranslationScieloPadrao.bat and EnviaTranslationScielo.bat

Processing to generate the website
==================================

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




EnviaImgPdfLogOn.txt and EnviaTranslationLogOn.txt
--------------------------------------------------

    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        cd <PROC_PATH>
        prompt
        bin


EnviaBasesLogOn.txt
-------------------


    .. code-block:: text

        open <USER>:<PASSWORD>@<SERVER_ADDRESS_OR_NAME>
        prompt
        cd serial
        ascii
        put temp\scilista-envia.lst -o scilista.lst
        bin

