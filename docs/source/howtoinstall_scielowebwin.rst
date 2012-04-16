
Download
=========

#. Link to download Linux   ZIP file: https://github.com/scieloorg/Web/zipball/master
#. Link to download Windows ZIP file: https://github.com/scieloorg/Web-Windows/zipball/master

NOTE: Both must be extracted to the same path.

Installation
============

#. Create the path to install the SciELO Website.
    The default is c:\\scielo\\web.
    The example uses c:\\scielo_br.

    e. g.: c:\\scielo_br


Extract the zip file of SciELO Site for Linux
---------------------------------------------

#. Download the most recent version of SciELO Site for Linux, then extract it.

    .. image:: img/en/scielo020.png

#. Select the extracted content.

    .. image:: img/en/scielo021.png

#. Copy the selected content.

    .. image:: img/en/scielo022.png

#. Go to the directory where is the web structure. For instance, c:\\scielo_br\web\\.

    .. image:: img/en/scielo023.png

    Copying process.

    .. image:: img/en/scielo024.png



Extract the zip file of SciELO Site for Windows
-----------------------------------------------

#. Execute the same steps as SciELO Site for Linux, using the zip file for Windows.

#. Some folders already exist. You must accept to overwrite them.

    .. image:: img/en/scielo025.png

#. Some files already exist. You must accept to overwrite them. 

    .. image:: img/en/scielo026.png


    .. image:: img/en/scielo027.png

Configuration of the virtual host
=================================

#. Open httpd.conf file (Apache configuration file), with notepad or wordpad, to fix some parameters related to PHP.

    .. image:: img/en/scielo005.png


    .. image:: img/en/scielo006.png

#. Search for AddType, according to the two lines of the figure below.

    .. image:: img/en/scielo007.png

#. Add two lines, according to the figure.

    .. image:: img/en/scielo008.png

#. Search for httpd-vhosts.conf, according to the figure below.

    .. image:: img/en/scielo009.png

#. Remove the comment character.

    .. image:: img/en/scielo010.png

#. Save the file.

    .. image:: img/en/scielo011.png

#. Open httpd-vhosts.conf file, with Notepad or WordPad.

    .. image:: img/en/scielo012.png


    .. image:: img/en/scielo013.png


    .. image:: img/en/scielo014.png

#. Delete the content shown in the figure above, and let only the corresponding text of the figure below.

    .. image:: img/en/scielo015.png

#. Insert in the file, the virtual host model, according to the figure below.

    .. image:: img/en/scielo058.png

#. Fix the paths.

    .. image:: img/en/scielo017.png

#. Save the file.

    .. image:: img/en/scielo018.png

#. Restart Apache.

    .. image:: img/en/scielo019.png

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

    Replace /home/scielo/www/ by /scielo_br/.

    .. image:: img/en/scielo045.png


    .. image:: img/en/scielo046.png


    .. image:: img/en/scielo047.png

Changing SOCKET
---------------
   Find [SOCKET] word, according to the figure.

    .. image:: img/en/scielo060.png

   Delete 8899 number

    .. image:: img/en/scielo061.png

Saving scielo.def.php
---------------------

    .. image:: img/en/scielo062.png

hosts file
==========

The website domain does not exist yet. So, it has to be registered in the computer which hosts the website.

Open and edit the hosts file.

Use Wordpad/Notepad

    .. image:: img/en/scielo048.png

Click on Open button

    .. image:: img/en/scielo049.png

Go to C:\\Windows\\System32\\drivers\\etc

    .. image:: img/en/scielo050.png

List all the files

    .. image:: img/en/scielo051.png

Select the hosts file and click on OK button

    .. image:: img/en/scielo052.png


    .. image:: img/en/scielo053.png

The content of the hosts file is below:
 
    .. image:: img/en/scielo054.png

Check the computer's IP, using the ipconfig command.

    .. image:: img/en/scielo055.png

Use the IP shown, and insert it in the hosts file.

    .. image:: img/en/scielo056.png

Save the file.

    .. image:: img/en/scielo057.png


Errors or Warnings
==================

Error 1
-------

As accessing http://teste.scielo.local, the website present unexpected presentation.

Edit the php.ini file.  

    .. image:: img/en/scielo063.png

This file is located on PHP standard directory.

    .. image:: img/en/scielo064.png

Open this file, using WordPad or Notepad, then search for short_open_tag

    .. image:: img/en/scielo065.png


    .. image:: img/en/scielo066.png

Change short_open_tag = Off to short_open_tag = On

    .. image:: img/en/scielo067.png

Save the file

    .. image:: img/en/scielo068.png

Restart Apache.

    .. image:: img/en/scielo069.png

Open http://teste.scielo.local.

    .. image:: img/en/scielo070.png

Error 2
-------

Access http://teste.scielo.local

Click on Alphabetic list link

    .. image:: img/en/scielo071.png

This error is related to missing databases, which can be gotten from SciELO developers team.

    .. image:: img/en/scielo072.png


