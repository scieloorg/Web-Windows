rem @echo off
rem GeraNewcodeAux
rem Parametro 1: path producao SciELO
rem Parametro 2: path diretório temporário

call batch\VerifPresencaParametro.bat %0 @%1 path producao Scielo
call batch\VerifPresencaParametro.bat %0 @%2 diretorio temporario

call batch\InformaLog.bat %0 x Gera SERAREA PARA CADA IDIOMA	

rem call batch\VerifExisteBase.bat %1\code\newcode

rem call batch\GeraInvertido.bat %1\code\newcode fst\newcode.fst %1\code\newcode

call batch\Iso2Master.bat gizmo\subject.iso %2\subject

%CISIS_DIR%\mx %2\subject lw=999 "pft='call batch\GeraSerareaLANG.bat %2\subject ',mfn,' ..\bases-work\title\title ..\bases-work\title\serarea',mpu,v1^l,mpl,' %2'/" now > %2\GeraSerareaLANG.bat
call %2\GeraSerareaLANG.bat 
