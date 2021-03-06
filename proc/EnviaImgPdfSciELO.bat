@echo off
rem EnviaImgPdfSciELO
rem Parametro 1: path da producao da SciELO
rem Parametro 2: arquivo de logOn FTP
rem Parametro 3: arquivo de log
rem Parametro 4: cria / adiciona
rem Parametro 5: path do site teste da SciELO
rem Parametro 6: outra opcao alem do FTP valores NO_FTP ou FTP_AND_COPY ou ONLY_FTP [opcional]

rem Inicializa variaveis
set INFORMALOG=log\EnviaImgPdfSciELO.log
set CISIS_DIR=cisis

rem Verifica parametros
call batch\VerifPresencaParametro.bat %0 @%1 path da producao da SciELO
call batch\VerifPresencaParametro.bat %0 @%2 arquivo de logOn FTP
call batch\VerifExisteArquivo.bat %2
call batch\VerifPresencaParametro.bat %0 @%3 arquivo de LOG
call batch\VerifPresencaParametro.bat %0 @%4 opcao do LOG: cria/adiciona
call batch\VerifPresencaParametro.bat %0 @%5 path do site de teste da SciELO

if "%4"=="cria" call batch\DeletaArquivo.bat %3
set INFORMALOG=%3

call batch\InformaLog.bat %0 dh ===Inicio===

call batch\VerifExisteArquivo.bat %1\serial\scilista.lst
call batch\CopiaArquivo.bat %1\serial\scilista.lst temp\scilista-imgpdf.lst

call batch\ImgPdfCriaDir.bat %5

if "@%6" == "@NO_FTP" goto DO_COPY


:DO_FTP
rem Gera arquivo de parametros do FTP
call batch\CopiaArquivo.bat %2 temp\EnviaImgPdf.txt
echo lcd %5>> temp\EnviaImgPdf.txt
%CISIS_DIR%\mx "seq=temp\scilista-imgpdf.lst " lw=9000 pft=@pft\EnviaImgPdf.pft now >> temp\EnviaImgPdf.txt
if errorlevel==1 batch\AchouErro.bat %0 mx criacao temp\EnviaImgPdf.txt
echo bye >> temp\EnviaImgPdf.txt

call batch\InformaLog.bat %0 x FTP das Imagens e Pdfs
ftp -s:temp\EnviaImgPdf.txt >> %INFORMALOG%
if errorlevel==1 batch\AchouErro.bat %0 ftp: temp\EnviaImgPdf.txt

if "@%6" == "@ONLY_FTP" goto END
if "@%6" == "@" goto END

:DO_COPY
%CISIS_DIR%\mx "seq=temp\scilista-imgpdf.lst " lw=9000 pft=@pft\EnviaImgPdfSemFTP.pft now >> temp\EnviaImgPdf.txt

:END
call batch\ImgPdfDelDirVazio.bat %5

call batch\InformaLog.bat %0 dh ===Fim=== LOG gravado em: %INFORMALOG%

