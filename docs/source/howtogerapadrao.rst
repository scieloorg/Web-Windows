Generating the local website 
============================

All the examples in this topic show the directory structure for the standard 
installation of the SciELO website: 

\\scielo\\serial (*) 
\\scielo\\web\\bases 
\\scielo\\web\\bases-work 
\\scielo\\web\\cgi-bin 
\\scielo\\web\\htdocs 
\\scielo\\web\\proc 

(*) data structure resulting from the marking/conversion process. 

Informing issues available on the website 
-----------------------------------------

Edit file \\scielo\\serial\\scilista.txt with the following format: 

| <journal acronym> <vXXnYY> 

where each line represents an issue to be included in the database on the local site. 

Example: 

| bjmbr v34n10 
| bjmbr v34n11 
| rbz v30n3s1 
| ce v43n281-282 

In case an issue is to be excluded, it should be included in the file scilista.txt with a 
space at the end of the line, followed by the word "del" as shown below: 

| bjmbr v15n1 del 

Executing the processing 
------------------------

This procedure adds the issues that are listed at \\scielo\\serial\\scilista.txt to the site 
and updates the following bases: 

- title 
- issue 
- newissue 
- article 
- iah 

- Open a DOS session and move to directory \\scielo\\web\\proc 
- Choose type of processing (see About types of processing) 

About types of processing 
.........................

There are two types of processing: 

#. Add new issues to the collection and/or update them 
    There are two ways to execute this procedure: 
    #. Execute GeraSciELO.bat 
    #. Execute GeraPadrao.bat 
#. Create a new site 
    #. Execute GeraPadrao.bat with a parameter which value is "novo"  

Execute GeraScielo.bat
...................... 
This procedure includes or updates issues in the collection.
 
This file requires 4 (four) mandatory parameters as follows: 

- Parameter 1: SciELO path to production area 
- Parameter 2: SciELO production web area path (\\scielo\\web\\) 
- Parameter 3: processing logfile (log) 
- Parameter 4: create / add in/to the log) 

Example: 
    GeraScielo.bat \\scielo \\scielo\\web log\\20010930.log cria 

Execute GeraPadrao.bat 
......................

This procedure includes or updates issues in the collection. 

It is a shortcut to execute file GeraScielo.bat with all the parameters required for 
execution. 

File GeraPadrao.bat should be customized in case the directory structure is 
different from the local site standard. 

Example: 
    GeraPadrao.bat 

Execute GeraPadrao.bat with ‘new’ parameter 
...........................................

This procedure re-creates the site, that is, it deletes all the issues inserted into the 
site so far and creates a new site with the issues listed at \\scielo\\serial\\scilista.txt 
only. 

If the new site contains journal titles from the current site, it is necessary, before it 
is executed, to copy files title.mst and title.xrf from \\scielo\\serial\\title\\ to the 
directory \\scielo\\web\\bases\\title\\ considering that a Title already contains the 
titles for the new site. 

Example: 

    GeraPadrao.bat novo

Checking the processing output 
------------------------------

Processing output is displayed on the screen (standard output) and is stored in a 
file. 

In case of error, processing stops at once, until there is intervention by the user 
who should read carefully the messages displayed on the screen to decide which 
action to take according to the options available. 

Example: 
    Cancel or Continue 

After processing is completed, it is advisable to check the logfile created to check 
for any errors. 

The field name is given by the file that was executed. (GeraSciELO.bat ou 
GeraPadrao.bat). 

If processing is executed by GeraScielo.bat, the logfile will have the same name as 
the third parameter of the command. 

Example: 
    if the following was typed on the command line 
    
    GeraScielo.bat \\scielo \\scielo\\web log\\20010930.log create 

    the logfile can be found in log\\20010930.log. 

If processing is executed by GeraPadrao.bat, the logfile will always have the same 
standard name (GeraPadrao.log). 

Example: 

if the following is typed on the command line 
    GeraPadrao.bat 

the logfile can be found in log\\GeraPadrao.log 

Before GeraPadrao.bat is run, the processing logfile should be moved or renamed 
immediately before this is done, thus maintaining the history of each execution. 

In case the file is not renamed or moved to another area, processing will 
accumulate the history information in that file. 

Checking the local website 
..........................
In this phase, the local site is checked to make sure it is working correctly. The 
next phases can only be continued if this is the case, otherwise the corrections 
required should be made first. 

Preparing the test or public website 
------------------------------------
If FTP is available on the public or test server, read Copying files. 
When a journal is to be included, the files plogo.gif and glogo.gif should be copied 
to the structure 

\\htdocs\\img\\revistas\\<acronym>\\ 

and also.htm* files of secondary pages to 

\\htdocs\\revistas\\<acronym>\\ 

for each journal being processed, image directories of the issue should be copied 

    \\htdocs\\img\\revistas\\<acronym>\\<vol-num>\\ 

and also PDF files of the bases area (default) to 

    \\bases\\pdf\\<acronym>\\<vol-num>\\ 
for each journal being processed, the directories below 
\\scielo\\serial para \\scielo\\web\\serial 
should be copied 
Sending files to a server with FTP. 
If it is Windows with no FTP service, read Copy of files 
Copying files 
.............

When a journal is to be included, the files plogo.gif and glogo.gif should be copied 
to the structure 
\\htdocs\\img\\revistas\\<acronym>\\ 
and also.htm* files of secondary pages to 
\\htdocs\\revistas\\<acronym>\\ 
for each journal being processed, image directories of the issue should be copied 
\\htdocs\\img\\revistas\\<acronym>\\<vol-num>\\ 
and also PDF files of the bases area (default) to 
\\bases\\pdf\\<acronym>\\<vol-num>\\ 
for each journal being processed, the directories below 
\\scielo\\serial para \\scielo\\web\\serial 
should be copied 

Sending files to a server with FTP 
..................................

Preferably, work should be done with other two more servers. One for testing, and 
one for the public. 
If the configuration is for just one server, then the server or test and public site 
mean the same. 
Here, the transfer of journal files from the local site to the test server is carried out 
and the files below are executed: 

Sending bases 
____________˜
This procedure sends the bases to the test site server where GeraSciELO.bat is run 
to create the site. 
To be executed, this procedure is transferred by FTP: 
- file scilista.txt to the serial directory in the server; and 
Thus, we should guarantee that scilista.txt contains all the issues to be included in 
the test site. 

EnviaBasesSciELO.bat, with the following parameter: 
Parameter 1: path to production area 
Parameter 2: FTP logfile 
Parameter 3: logfile (log) 
Parameter 4: creates / adds (in/to the log) 
Example: 
    EnviaBasesScielo.bat \\scielo transf\\EnviaBases2Teste.txt log\\20011002.log 
cria

 
Parameter 2 in this procedure refers to the FTP logon file which should be set up 
with the information from the server, preferably soon after installation of the 
SciELO Web. The content of this file is comprises the following: 
server IP 
user and FTP password 
directory containing the databases of each issue (equivalent to serial) 
The shortcut for this procedure uses logon file transf\\EnviaBasesLogOn.txt with 
the following syntax: 
    EnviaBasesSciELOPadrao.bat 


Remember to configure the logon file used for 
this procedure before executing. The example 
used by EnviaBasesScieloPadrao.bat is found in 
\\scielo\\web\\proc\\transf with the name 
EnviaBasesLogOn-Example.txt. 

Sending images and pdf 
______________________

This procedure transfers the images and pdfs of journal articles listed in the file 
scilista.txt. 
This procedure makes available images and pdfs. It has nothing to do with creating 
the site, but with viewing articles images and pdfs. 
EnviaImgPdfSciELO.bat with the following Parameter: 
- Parameter 1: path to production area 
- Parameter 2: FTP logon file 
- Parameter 3: logfile (log) 
- Parameter 4: creates / adds (in/to log) 
- Parameter 5: path to server test area 

Example: 
    EnviaImgPdfScielo.bat \\scielo transf\\EnviaImgPdfLogOn.txt log\\20011002.log cria \\scielo\\web\\htdocs 

The command EnviaImgPdfSciELO.bat is similar to EnviaBasesSciELO.bat with the 
addition of Parameter 5. 

The shortcut for this procedure is: 
    EnviaImgPdfSciELOPadrao.bat 
The example used by EnviaImgPdfScieloPadrao.bat can be found in 
\\scielo\\web\\proc\\transf with the name EnviaImgPdfLogOn-Example.txt. 

Sending article translations 
____________________________
This procedure transfers the HTML and PDF of the translations of journal articles 
listed in the file scilista.txt. 

This procedure makes translations available in HTML and PDF. It has nothing to 
do with process to create the site, but with viewing of article translations. 

EnviaTranslationSciELO.bat, with the following Parameters: 
- Parameter 1: path to production area 
- Parameter 2: FTP logon file 
- Parameter 3: logfile (log) 
- Parameter 4: creates / adds (in/to log) 
- Parameter 5: path to server test area 

Example: 
    EnviaTranslationSciELO.bat \\scielo transf\\EnviaTranslationSciELOLogOn.txt log\\20011002.log creates \\scielo\\web\\htdocs 
The command EnviaTranslationSciELO.bat is similar to EnviaBasesSciELO.bat 
with the addition of Parameter 5. 
The shortcut for this procedure is: 
    EnviaTranslationSciELOPadrao.bat 

The example used by EnviaImgPdfScieloPadrao.bat can be found in 
\\scielo\\web\\proc\\transf with the name EnviaTranslationLogOn-Example.txt. 

Creating a test or public site 
------------------------------

Test or public site on Windows 
..............................

On the public server, execute process for creating the site. Read more in Creating a 
Local Site 

Test or public site on Linux 
All the examples in this topic show the directory structure for the standard SciELO 
server installation as follows: 
/home/scielo 
In the standard installation there is the www directory which in turn contains the 
following structure: 
/www 
/bases 
/bases-work 
/cgi-bin 
/htdocs 
/proc 
17SciELO Processing Procedures  Creating a test or public site 
/serial 
The bases subdirectory hosts the subdirectories of each database processed as 
below: 
/bases 
 /artigo 
 /ftp 
 /iah 
 /issue 
 /lattes 
 /medline 
 /newissue 
 /title 
The bases-work subdirectory hosts the sub-directories of each database during 
processing in addition to individual directories for each journal. 
The serial subdirectory contains the directories of all journals which in turn have 
all the original numbers used in processing (this data may be discarded after 
processing is carried out and approved). 
The proc subdirectory contains all batch, executable files, FSTs for inversion, 
CISIS formats, etc, used during processing. 
Processing in the test server compares to processing on the LOCAL SITE since 
process execution of GeraScielo.bat or GeraPadrao.bat assumes there is an equal 
directory structure on the database directory of SciELO test (/home/scielo/www). 
4.2.1 About processing types 
There are two types of processing: 
1.
2.
Adding new issues and/or updating them in the collection 
a) There are two ways of executing this procedure: 
♦ Execute GeraSciELO.bat 
♦ Execute GeraPadrao.bat 
Creating a new site 
a) Execute ReinicializaSitePadrao.bat 
18SciELO Processing Procedures  Creating a test or public site 
4.2.1.1 Executing file GeraScielo.bat 
This procedure inserts or updates issues in the collection. 
This file requires four (4) mandatory parameters as follows: 
Parameter 1: path to production area 
Parameter 2: path to server test area 
Parameter 3: processing logfile (log) 
Parameter 4: creates / adds (in/to log) 
Example: 
./GeraScielo.bat .. .. log/20011003.log adds 
where: 
'..' represents directory www (one level up from the current directory) 
! 
The two first parameters are found on the same 
level (www) since the routine will look for 
directories serial, bases and bases-work. 
4.2.1.2 Executing file GeraPadrao.bat 
This procedure inserts or updates issues into the collection. 
This is a shortcut for file GeraScielo.bat with all the parameters required for 
execution. 
File GeraPadrao.bat should be customized in case the directory structure is 
different from the SciELO server standard. 
Example: 
./GeraPadrao.bat 
4.2.1.3 Executing file ReinicializaSitePadrao.bat 
This procedure re-creates the site, that is, it deletes all the issues included so far in 
the site and creates a new site with the issues found in at \\scielo\\serial\\scilista.txt. 
only. 
19SciELO Processing Procedures  Creating a test or public site 
It is run in two stages, one by ReinicializaSitePadrao.bat and the other by 
GeraPadrao.bat, in this order. 
In directory proc, run command ReinicializaSitePadrao.bat: 
Example: 
./ReinicializaSitePadrao.bat 
ReinicializaSitePadrao.bat is the shortcut to run the two procedures: 
ReinicializaSite.bat and ExtraiRevistasArtigo.bat using the standard parameters of 
SciELO installation. 
a) ReinicializaSite.bat with the following parameters: 
Parameter 1: path to production area 
Parameter 2: path to server test area 
Parameter 3: processing logfile (log) 
Parameter 4: creates / adds (in/to log) 
Example: 
./ReinicializaSite.bat .. .. log/ExtraiRevistasArtigo.log creates 
b) ExtraiRevistasArtigo.bat with the following parameters: 
Parameter 1: path to production area 
Parameter 2: path to server test area 
Parameter 3: processing logfile (log) 
Parameter 4: creates / adds (in/to log) 
Example: 
./ExtraiRevistasArtigo.bat .. .. log/ExtraiRevistasArtigo.log creates 
c) Execute GeraPadrao.bat 
Example: 
./GeraPadrao.bat 
At the end of this process, the logfile is checked (see explanation in item Checking 
processing output). 
20SciELO Processing Procedures  Creating a test or public site 
4.3 Checking the test site 
At this stage, the test site is checked to make sure it is working properly. The 
following stages can only follow if they are in fact working properly, otherwise the 
corrections required should be made. 
4.4 Processing Links 
If the test site is operating properly, SciELO data may be exported to other 
databases to create links between outside databases and SciELO. 
The procedure that creates the links is centralized at BIREME, and those 
interested should contact Scielo to ask for their collections to be processed. 
The request is assessed and the applicant is supplied with the data to use the 
procedures described below. 
4.4.1 Sending data to BIREME 
This procedure creates and sends data to the BIREME’s server (data supplied after 
approval of request). 
BIREME processes the data sent creating the links. 
As a reply a database called NLINKS is sent which is used in the procedure 
“Receiving Outside Databases” 
Envia2Medline.bat 
This procedure sends artigo.iso and bib4cit.iso files by FTP to the server described 
in the file specified by parameter 2. 
Parameter 1: path to production area 
Parameter 2: FTP instruction file 
Parameter 3: processing logfile (log) 
Parameter 4: creates / adds (in/to log) 
Example: 
21SciELO Processing Procedures  Creating a test or public site 
Envia2Medline.bat .. transf/Envia2MedlineBRME.txt log/envia2medline.log 
creates 
Parameter 2 in this procedure refers to the FTP logon file which should be duly 
configured with information from the server, preferably soon after SciELO Web 
installation. The content of this file is as follows: 
Server IP 
FTP user and password 
directory where databases of each journal can be found (equivalent to serial) 
There is also a shortcut for this procedure as shown below: 
Envia2MedlinePadrao.bat 
! 
Remember to configure the logon file used for 
this procedure before executing. The example 
used by Envia2MedlinePadrao.bat can be found 
in \\scielo\\web\\proc\\transf with the name 
Envia2MedlineLogOn-Example.txt. 
4.4.2 Receiving Outside Databases 
GeraBasesExternas.bat 
This procedure consults outside databases which create information sources for 
SciELO, completing or extending its data. 
Parameter 1: database subdirectory of server test area 
Parameter 2: processing logfile (log) 
Parameter 3: creates / adds (in/to log) 
Example: 
GeraBasesExternas.bat ../bases log/20011001.log adds 
From the databases created, the following is of note: 
LATTES database – maintains the links between the curricula of CNPq 
researchers and scientists and the database of authors of scientific articles in 
SciELO. 
This part of the procedure creates the LATTES database from reading the text file 
(format .seq) found at: 
../bases/lattes/lattes.seq 
22SciELO Processing Procedures  Creating a test or public site 
NLinks database – maintains the links between the references of SciELO 
scientific articles and the bibliographical records of MedLine, LiLACS and 
Adolec databases. 
This part of the procedure creates the NLINKS database based on file nlinks.iso 
received from BIREME (see Sending data to BIREME) at: 
../bases/medline/nlinks.iso 
The shortcut to GeraBasesExternas.bat with all the parameters required is called: 
GeraBasesExternasPadrao.bat 
At the end of the procedures, the test site can be checked, and, if approved, carry 
out processing output in the public site. 
4.5 Updating Databases (exclusive for public 
site) 
The procedures below may be executed independently. 
Unless there is only one server, that is, the test and public server are the same, 
AtualizaScieloLattesMedlinePadrao.bat should be run to execute the procedures 
below in sequence. 
4.5.1 AtualizaScieloLattesMedlinePadrao.bat 
This procedure updates the data previously processed in the public area of SciELO 
and internally executes five stages, 2 for control and 3 for updating. It is in fact an 
automatic copy from one area to another in the server. 
A processing summary is shown below: 
Stage Description
Manutencao.bat places the system in the updating mode. In this mode, any attempt 
to access data results in a message indicating the updating that is 
taking place.
AtualizaLattesOnLine.bat updates the LATTES database on the official site.
23SciELO Processing Procedures  Creating a test or public site 
Stage Description
AtualizaMedlineOnLine.bat updates the NLinks database on the official site.
AtualizaScieloOnLine.bat updates the database processed on the official site.
Manutencao.bat puts the system in online mode, that is, with data available for 
access.
The parameters required for each stage are described below: 
4.5.2 Manutencao.bat 
Parameter 1: path to the database directory of the official site 
Parameter 2: processing logfile (log) 
Parameter 3: add / create (in/to log) 
Parameter 4: On / Off (system mode flag) 
Examples: 
a) to put in updating mode: 
./Manutencao.bat /home/scielo/www/bases log/AtualizaPadrao.log adiciona 
On 
b) to put in online mode: 
./Manutencao.bat /home/scielo/www/bases log/AtualizaPadrao.log adiciona 
Off 
4.5.3 AtualizaLattesOnLine.bat 
Parameter 1: path to the database directory of the test site 
Parameter 2: path to the database directory of the official site 
Parameter 3: processing logfile (log) 
Parameter 4: add / create (in/to log) 
Example: 
./AtualizaLattesOnLine.bat ../bases /home/scielo/www/bases 
log/AtualizaPadrao.log add 
4.5.4 AtualizaMedlineOnLine.bat 
Parameter 1: path to the database directory of the test site 
Parameter 2: path to the database directory of the official site 
Parameter 3: processing logfile (log) 
24SciELO Processing Procedures  Creating a test or public site 
Parameter 4: adds / creates (in/to log) 
Example: 
./AtualizaMedlineOnLine.bat ../bases /home/scielo/www/bases 
log/AtualizaPadrao.log add 
4.5.5 AtualizaScieloOnLine.bat 
Parameter 1: path to the database directory of the test site 
Parameter 2: path to the database directory of the official site 
Parameter 3: processing logfile (log) 
Parameter 4: add / create (in/to log) 
Example: 
./AtualizaScieloOnLine.bat ../bases /home/scielo/www/bases 
log/AtualizaPadrao.log add 
255 Final Considerations 
All executable files (batch files/shell files) with suffix "Padrao" can be customized 
and were created with the purpose of facilitating SciELO management processing. 
Because they can be customized, any changes become the responsibility of those 
who made them. 
All customized directories in executable files with suffix "Padrao" must necessarily 
show the directory structure of each installation whether LOCAL SITE or SERVER. 
All files with file transfer instructions via FTP protocol used as parameters for 
executable files must show the configuration of the server to be accessed (IP, user 
identification, ftp password, and directory structure). 
266 Bibliographic 
references 
1. PACKER, Abel Laerte. SciELO: metodología para la preparación, 
almacenamiento, diseminación y evaluación de revistas científicas 
electrônicas. In: Congreso Regional de Información en Ciencias de la Salud, 
4 [online]. San José, 1998. Available from internet: 
<http://www.bireme.br/cgi-bin/crics4w/text0?id=crics4-mr3-co3>. 
2. PACKER, Abel Laerte; et al. SciELO: uma metodologia para publicação 
eletrônica. Ciência da Informação [online]. 1998, v. 27, n. 2 [cited 2005 Set 
21]. Available from: 
http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0100-
19651998000200002&tlng=en&lng=en&nrm=iso. ISSN 0100-1965. 
277 Glossary 
Affiliation. Institution to which the author belongs or to which 
he/she is subordinated.
Analytical. Part of a document, such as the article of a periodical or 
the chapter of a book.
Application. Program used to execute tasks in connection with an 
application, such as the creation or edition of texts, drawings, 
animations, layout, etc. E.g.: text processor, database manager, 
Internet browser, etc.
Backup. Procedure used to duplicate one or more files and/or 
directories in another storing device (tape or disc), thus producing 
a backup copy that may be restored in the event of accidental 
deletion or physical damage to the original data.
Bibliograhic Database. Electronic version of a catalog or 
bibliographic index.
28SciELO Processing Procedures  Glossary 
Bibliographic Description. Description of a bibliographic item by 
using attributes such as author, title, edition, size, etc. 
Browser. Internet page navigator, such as Internet Explorer and 
Netscape Navigator.
CDS/ISIS – MicroISIS. Software programs developed and maintained 
by UNESCO to treat bibliographic data.  
CGI. The Common Gateway Interface is a standard for interfacing 
external applications with information servers, such as HTTP or 
Web servers.
Controlled or structured vocabulary. Colection of related terms, 
organized according to a methodology, in order to facilitate the 
access to the information previously indexed with those terms.
Cooperating Center. Institution that participates in the VHL and/or 
contributes bibliographic records to Bireme.
Database. Collection of data that are structured to be easily 
accessed and handled. It is formed by units called records whose 
attributes are represented by fields. For example, in a file called 
"customer base", each customer is a record, with several fields 
such as "NAME", "CUSTOMER CODE", "TELEPHONE" etc.
DeCS Server. Application developed by Bireme using the IsisScript 
language to manage the database of health descriptors (DeCS).
Descriptor. Embodies a concept accepted in a controlled vocabulary 
(like a thesaurus.) 
DTD SciELO. Describes the article structure and other periodic texts 
of scientific, identifying and defining of necessary form its 
structure and the bibliographical elements constituent, the context 
29SciELO Processing Procedures  Glossary 
where they appear, its obligatoriness and its attributes. The DTD is 
used for the description and computerized treatment of texts.
Editorial Committee. Group of professionals and specialists of the 
publication area of a periodical whose objective is to establish the 
rules and editorial conventions and to evaluate the contributions 
received by the publication to guarantee a certain quality 
standard.
Electronic Format. Any form of storage, retrieval or presentation of 
information that may be transmitted on-line or recorded in 
magnetic or optical media.
Field. See Database.
File. In computing, a set of data that may be saved into some type 
of storing device. The data files are created by applications, such 
as a text processor for example.
Glossary. Vocabulary for specific or controlled use, used in 
publications to clarify the meaning of technical or restricted terms 
which are not widely used. 
Guide. Defines the processes needed for the production of a source 
of information or phases of a methodology.
Indexing. Procedure to identify and describe the content of a 
document with terms that reflect the corresponding subject 
matters to allow the document to be retrieved later. 
ISO Format (of files). Standard established by the ISO to allow the 
exchange of data between institutions, networks and users.
30SciELO Processing Procedures  Glossary 
LILACS Format. A bibliographic description format established by 
BIREME, based on the UNISIST Reference Manual for Machinereadable Bibliographic Descriptions.
Manual. Set of steps and operations, whether automatic or manual, 
required to provide users with instructions on a certain application, 
program or methodology.
Methodology. Set of rules and conventions used to standardize a 
process or the production of a source of information.
National Coordinating Center. Institution that cooperates with the 
VHL and whose primary role is the coordination of a region’s 
cooperating centers. 
PDF. File format developed by Adobe whose objective is to 
maintain the presentation format of a document designed for 
printing when this document is stored in digital media. 
PubMed. Service of the National Library of Medicine that includes 
over 15 million citations from MEDLINE and other life science 
journals for biomedical articles back to the 1950s. PubMed includes 
links to full text articles and other related resources.
Quotation. Excerpt originally written by a third person. Quotations 
appear between inverted commas in a publication, with a mention 
to the author.
Scientific production. Collation (gathering and analysis) of all the 
literature on a certain theme or literature produced by a specific 
author for the purpose of analysis, especially of a quantitative 
nature.  
SGML. Metalanguage standard of the ISO (International Organization 
for Standardization) used for the definition of languages of marking 
31SciELO Processing Procedures  Glossary 
of electronic texts, making possible the interchange and the 
distribution of documents in the most varied formats, from one 
same source of data.
 of a character, a set of 
characters or a paragraph for viewing or printing purposes. See
Style. Element which defines the form
template.
File which contains the definition of the styles of a 
publication. See also template.
Stylesheet. 
ountries or 
between developing countries and developed countries to enable 
s 
Technical Cooperation. Exchange between developing c
cooperation in certain areas, such as the exchange of specialists 
and faculty members, development or transfer of technology, 
exchange of information, exchange of information and experience
to improve sanitary conditions.
definition of the type of 
document that will be used, with style, predefined text, etc.
Template. File which contains the basic 
a VHL which allows user topic-based navigation.
Thematic area. Specific set of information on the subject matter of 
 depth applied 
to the document upon its bibliographic description.
Treatment Level. Codified definition of the degree of
ntents via the 
TCP/IP protocol. Internet browsers use the URL to access Web 
URL. Standard defined for the addressing of data co
pages.  
. Was created in 1978 for the elaboration of 
articles, including the norms for the bibliographical references and 
was supportted of the National Library.
Vancouver Group
32SciELO Processing Procedures  Glossary 
XML. Language created to allow the arrangement of data in a
structured and hierarchical manner, thus facilitating data 
communication between different systems and platforms.
33
