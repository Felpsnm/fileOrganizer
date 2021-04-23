@echo off

set dirFolders=C:\Users\%username%\Desktop
set dirFolders_a=%dirFolders%\Arquivos

set dir=%dirFolders%
set dow=C:\Users\%username%\Downloads
set doc=C:\Users\%username%\Documents
set pic=C:\Users\%username%\Pictures
set mus=C:\Users\%username%\Music

cd %dir%  

echo ---------------------------------------------------------------------------
::(�rea de Trabalho)Confere se as pastas existem e caso n�o existam cria elas

IF /i NOT EXIST "%dirFolders%\Aplicativos" md "%dirFolders%\Aplicativos" & echo A pasta Aplicativos ser� criada.  
echo.
  
IF /i NOT EXIST "%dirFolders%\Arquivos" md "%dirFolders%\Arquivos" & echo A pasta Arquivos ser� criada
echo.
echo ---------------------------------------------------------------------------
::(Arquivos)Confere se as pastas existem e caso n�o existam cria elas

cd %dirFolders_a%

IF /i NOT EXIST "%dirFolders_a%\Android" md "%dirFolders_a%\Android" & echo A pasta Android ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Batch" md "%dirFolders_a%\Batch" & echo A pasta Batch ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Isos" md "%dirFolders_a%\Isos" & echo A pasta Isos ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Javascript" md "%dirFolders_a%\Javascript" & echo A pasta Javascript ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\HTML" md "%dirFolders_a%\HTML" & echo A pasta HTML ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Access" md "%dirFolders_a%\Office Access" & echo A pasta Office Access ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Excel" md "%dirFolders_a%\Office Excel" & echo A pasta Office Excel ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office PowerPoint" md "%dirFolders_a%\Office PowerPoint" & echo A pasta Office PowerPoint ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Word" md "%dirFolders_a%\Office Word" & echo A pasta Office Word ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Partidas de Xadrez" md "%dirFolders_a%\Partidas de Xadrez" & echo A pasta Partidas de Xadrez ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Pdf" md "%dirFolders_a%\Pdf" & echo A pasta Pdf ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Pynthon" md "%dirFolders_a%\Pynthon" & echo A pasta Pynthon ser� criada
echo.
   
IF /i NOT EXIST "%dirFolders_a%\Roblox" md "%dirFolders_a%\Roblox" & echo A pasta Roblox ser� criada
echo.
 
IF /i NOT EXIST "%dirFolders_a%\Rtf" md "%dirFolders_a%\Rtf" & echo A pasta Rtf ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Torrents" md "%dirFolders_a%\Torrents" & echo A pasta Torrents ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Texto" md "%dirFolders_a%\Texto" & echo A pasta Texto ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Microsoft Installer" md "%dirFolders_a%\Microsoft Installer" & echo A pasta Microsoft Installer ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Winrar" md "%dirFolders_a%\Winrar" & echo A pasta Winrar ser� criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Xps" md "%dirFolders_a%\Xps" & echo A pasta Xps ser� criada
echo.

echo ---------------------------------------------------------------------------    

::IF /i NOT EXIST "%dir%\Atalhos" md "%dir%\Atalhos" & echo A pasta Atalhos ser� criada

::echo.

IF /i NOT EXIST "%dirFolders%\Imagens" md "%dirFolders%\Imagens" & echo A pasta Imagens ser� criada
echo. 

IF /i NOT EXIST "%dirFolders%\Livros" md "%dirFolders%\Livros" & echo A pasta Livros ser� criada
echo. 

IF /i NOT EXIST "%dirFolders%\�udios" md "%dirFolders%\�udios" & echo A pasta �udios ser� criada
echo. 

IF /i NOT EXIST "%dirFolders%\V�deos" md "%dirFolders%\V�deos" & echo A pasta V�deos ser� criada
echo.
 
echo ---------------------------------------------------------------------------

pause
set "folder= "
goto Area de Trabalho 
:://////////////////////////////////////////////////////////////////////////////
:Mover Arquivos

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move "%dir%\*.exe" "%dirFolders%\Aplicativos"
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move "%dir%\*.apk" "%dirFolders_a%\Android"

echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
move "%dir%\*.bat" "%dirFolders_a%\Batch"
move "%dir%\*.cmd" "%dirFolders_a%\Batch"
move "%dir%\*.masb" "%dirFolders_a%\Batch"
echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move "%dir%\*.iso" "%dirFolders_a%\Isos"
move "%dir%\*.img" "%dirFolders_a%\Isos"
move "%dir%\*.udf" "%dirFolders_a%\Isos"
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move "%dir%\*.js" "%dirFolders_a%\Javascript"
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move "%dir%\*.html" "%dirFolders_a%\HTML"
echo. 

echo Movendo arquivos para a Office Access...
echo.
move "%dir%\*.accdb" "%dirFolders_a%\Office Access"
move "%dir%\*.accdt" "%dirFolders_a%\Office Access"
move "%dir%\*.accde" "%dirFolders_a%\Office Access"
move "%dir%\*.accdr" "%dirFolders_a%\Office Access"
move "%dir%\*.mdb" "%dirFolders_a%\Office Access"
move "%dir%\*.snp" "%dirFolders_a%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move "%dir%\*.csv" "%dirFolders_a%\Office Excel"
move "%dir%\*.xls" "%dirFolders_a%\Office Excel"
move "%dir%\*.xlt" "%dirFolders_a%\Office Excel"
move "%dir%\*.xlm" "%dirFolders_a%\Office Excel"
move "%dir%\*.xlsx" "%dirFolders_a%\Office Excel"
move "%dir%\*.xlsm" "%dirFolders_a%\Office Excel"
move "%dir%\*.xltx" "%dirFolders_a%\Office Excel"
move "%dir%\*.xltm" "%dirFolders_a%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move "%dir%\*.ppt" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.pot" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.pps" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.pptx" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.pptm" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.potx" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.ppam" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.ppsx" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.ppsm" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.sldx" "%dirFolders_a%\Office PowerPoint"
move "%dir%\*.sldm" "%dirFolders_a%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move "%dir%\*.doc" "%dirFolders_a%\Office Word"
move "%dir%\*.dot" "%dirFolders_a%\Office Word"
move "%dir%\*.docx" "%dirFolders_a%\Office Word"
move "%dir%\*.docm" "%dirFolders_a%\Office Word"
move "%dir%\*.dotx" "%dirFolders_a%\Office Word"
move "%dir%\*.dotm" "%dirFolders_a%\Office Word"
move "%dir%\*.docb" "%dirFolders_a%\Office Word"
move "%dir%\*.wbk" "%dirFolders_a%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move "%dir%\*.pgn" "%dirFolders_a%\Partidas de Xadrez"
move "%dir%\*.pks" "%dirFolders_a%\Partidas de Xadrez"
move "%dir%\*.pgi" "%dirFolders_a%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move "%dir%\*.pdf" "%dirFolders_a%\Pdf"
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move "%dir%\*.py" "%dirFolders_a%\Pynthon"
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move "%dir%\*.rbxl" "%dirFolders_a%\Roblox"
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move "%dir%\*.rtf" "%dirFolders_a%\Rtf"
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move "%dir%\*.torrent" "%dirFolders_a%\Torrents"
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move "%dir%\*.txt" "%dirFolders_a%\Texto"
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move "%dir%\*.msi" "%dirFolders_a%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move "%dir%\*.7z" "%dirFolders_a%\Winrar"
move "%dir%\*.rar" "%dirFolders_a%\Winrar"
move "%dir%\*.zip" "%dirFolders_a%\Winrar"
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move "%dir%\*.xps" "%dirFolders_a%\Xps"
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move "%dir%\*.lnk" "%dirFolders%\Atalhos"
echo ___________________________________________________________________________

:: Movendo �udios
echo.
echo -Movendo arquivos para a pasta �udios...
echo.
echo ---------------------------------------------------------------------------
echo.
move "%dir%\*.3ga" "%dirFolders%\�udios"
move "%dir%\*.aac" "%dirFolders_a%\�udios"
move "%dir%\*.aiff" "%dirFolders_a%\�udios"
move "%dir%\*.amr" "%dirFolders_a%\�udios"
move "%dir%\*.ape" "%dirFolders_a%\�udios"
move "%dir%\*.arf" "%dirFolders_a%\�udios"
move "%dir%\*.asf" "%dirFolders_a%\�udios"
move "%dir%\*.asx" "%dirFolders_a%\�udios"
move "%dir%\*.cda" "%dirFolders_a%\�udios"
move "%dir%\*.dvf" "%dirFolders_a%\�udios"
move "%dir%\*.flac" "%dirFolders_a%\�udios"
move "%dir%\*.gp4" "%dirFolders_a%\�udios"
move "%dir%\*.gp5" "%dirFolders_a%\�udios"
move "%dir%\*.gpx" "%dirFolders_a%\�udios"
move "%dir%\*.logic" "%dirFolders_a%\�udios"
move "%dir%\*.m4a" "%dirFolders_a%\�udios"
move "%dir%\*.m4b" "%dirFolders_a%\�udios"
move "%dir%\*.m4p" "%dirFolders_a%\�udios"
move "%dir%\*.midi" "%dirFolders_a%\�udios"
move "%dir%\*.mp3" "%dirFolders_a%\�udios"
move "%dir%\*.ogg" "%dirFolders_a%\�udios"
move "%dir%\*.opus" "%dirFolders_a%\�udios"
move "%dir%\*.pcm" "%dirFolders_a%\�udios"
move "%dir%\*.rec" "%dirFolders_a%\�udios"
move "%dir%\*.snd" "%dirFolders_a%\�udios"
move "%dir%\*.sng" "%dirFolders_a%\�udios"
move "%dir%\*.uax" "%dirFolders_a%\�udios"
move "%dir%\*.wav" "%dirFolders_a%\�udios"
move "%dir%\*.wma" "%dirFolders_a%\�udios"
move "%dir%\*.wpl" "%dirFolders_a%\�udios"
move "%dir%\*.zab" "%dirFolders_a%\�udios"
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move "%dir%\*.bmp" "%dirFolders%\Imagens"
move "%dir%\*.cpt" "%dirFolders%\Imagens"
move "%dir%\*.dds" "%dirFolders%\Imagens"
move "%dir%\*.dib" "%dirFolders%\Imagens"
move "%dir%\*.dng" "%dirFolders%\Imagens"
move "%dir%\*.emf" "%dirFolders%\Imagens"
move "%dir%\*.gif" "%dirFolders%\Imagens"
move "%dir%\*.heic," "%dirFolders%\Imagens"
move "%dir%\*.ico" "%dirFolders%\Imagens"
move "%dir%\*.icon" "%dirFolders%\Imagens"
move "%dir%\*.jfif" "%dirFolders%\Imagens"
move "%dir%\*.jpeg" "%dirFolders%\Imagens"
move "%dir%\*.jpg" "%dirFolders%\Imagens"
move "%dir%\*.pcx" "%dirFolders%\Imagens"
move "%dir%\*.pic" "%dirFolders%\Imagens"
move "%dir%\*.png" "%dirFolders%\Imagens"
move "%dir%\*.psd" "%dirFolders%\Imagens"
move "%dir%\*.psdx" "%dirFolders%\Imagens"
move "%dir%\*.raw" "%dirFolders%\Imagens"
move "%dir%\*.tga" "%dirFolders%\Imagens"
move "%dir%\*.thm" "%dirFolders%\Imagens"
move "%dir%\*.tif" "%dirFolders%\Imagens"
move "%dir%\*.tiff" "%dirFolders%\Imagens"
move "%dir%\*.wbmp" "%dirFolders%\Imagens"
move "%dir%\*.zab" "%dirFolders_a%\Imagens"
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move "%dir%\*.epub" "%dirFolders%\Livros"
move "%dir%\*.mobi" "%dirFolders_a%\Livros"
echo.
echo ___________________________________________________________________________

:: Movendo V�deos
echo.
echo -Movendo arquivos para a pasta V�deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move "%dir%\*.264" "%dirFolders%\V�deos"
move "%dir%\*.3g2" "%dirFolders_a%\V�deos"
move "%dir%\*.3gp" "%dirFolders_a%\V�deos"
move "%dir%\*.arf" "%dirFolders_a%\V�deos"
move "%dir%\*.asf" "%dirFolders_a%\V�deos"
move "%dir%\*.asx" "%dirFolders_a%\V�deos"
move "%dir%\*.avi" "%dirFolders_a%\V�deos"
move "%dir%\*.bik" "%dirFolders_a%\V�deos"
move "%dir%\*.dash" "%dirFolders_a%\V�deos"
move "%dir%\*.dat" "%dirFolders_a%\V�deos"
move "%dir%\*.dvr" "%dirFolders_a%\V�deos"
move "%dir%\*.flv" "%dirFolders_a%\V�deos"
move "%dir%\*.h264" "%dirFolders_a%\V�deos"
move "%dir%\*.m2t" "%dirFolders_a%\V�deos"
move "%dir%\*.m2ts" "%dirFolders_a%\V�deos"
move "%dir%\*.m4v" "%dirFolders_a%\V�deos"
move "%dir%\*.mkv" "%dirFolders_a%\V�deos"
move "%dir%\*.mod" "%dirFolders_a%\V�deos"
move "%dir%\*.mov" "%dirFolders_a%\V�deos"
move "%dir%\*.mp4" "%dirFolders_a%\V�deos"
move "%dir%\*.mpeg" "%dirFolders_a%\V�deos"
move "%dir%\*.mpg" "%dirFolders_a%\V�deos"
move "%dir%\*.mts" "%dirFolders_a%\V�deos"
move "%dir%\*.ogv" "%dirFolders_a%\V�deos"
move "%dir%\*.prproj" "%dirFolders_a%\V�deos"
move "%dir%\*.rec" "%dirFolders_a%\V�deos"
move "%dir%\*.rmvb" "%dirFolders_a%\V�deos"
move "%dir%\*.swf" "%dirFolders_a%\V�deos"
move "%dir%\*.tod" "%dirFolders_a%\V�deos"
move "%dir%\*.tp" "%dirFolders_a%\V�deos"
move "%dir%\*.ts" "%dirFolders_a%\V�deos"
move "%dir%\*.vob" "%dirFolders_a%\V�deos"
move "%dir%\*.webm" "%dirFolders_a%\V�deos"
move "%dir%\*.wlmp" "%dirFolders_a%\V�deos"
move "%dir%\*.wmv" "%dirFolders_a%\V�deos"
echo.

IF %folder% EQU Adt goto Fim_Adt  
IF %folder% EQU Dow goto Fim_Dow 
IF %folder% EQU Doc goto Fim_Doc
IF %folder% EQU Pic goto Fim_Ima
IF %folder% EQU Mus goto Fim_Mus

:Area de Trabalho
::�rea de trabalho

cls

set folder=Adt

cd %dir%

echo.
echo �rea de Trabalho:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_AdT

echo ___________________________________________________________________________

echo.
echo Fim da �rea de Trabalho:
echo.

pause

goto Downloads

::------------------------------------------------------------------------------

:Downloads
::Downloads

cls

set folder=Dow
set dir=%dow%

cd %dow%

echo.
echo Downloads:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_Dow

echo ___________________________________________________________________________

echo.
echo Fim dos Downloads:
echo.

pause

goto Documentos
::------------------------------------------------------------------------------

:Documentos
::Documentos

cls

set folder=Doc
set dir=%doc%

cd %doc%

echo.
echo Documentos:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_Doc

echo ___________________________________________________________________________

echo.
echo Fim dos Documentos:
echo.

pause

goto Imagens
::------------------------------------------------------------------------------

:Imagens
::Imagens

cls

set folder=Pic
set dir=%pic%

cd %pic%

echo.
echo Imagens:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_Ima

echo ___________________________________________________________________________

echo.
echo Fim das Imagens:
echo.

pause

goto Musicas
::------------------------------------------------------------------------------
:Musicas
::M�sicas

cls

set folder=Mus
set dir=%mus%

cd %mus%

echo.
echo M�sicas:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_Mus

echo ___________________________________________________________________________

echo.
echo Fim das M�sicas:
echo.

pause

goto Delete_Folders
:://////////////////////////////////////////////////////////////////////////////

:Delete_Folders

cls

for /f %%A in ('dir %dirFolders%\Aplicativos ^| find "arquivo(s)"') do set apla=%%A
for /f %%B in ('dir %dirFolders%\Aplicativos ^| find "pasta(s)"') do set aplpsub=%%B
set /a aplp=%aplpsub%-2
IF %apla% GEQ 1 echo Tem %apla% arquivos na pasta Aplicativos
IF %aplp% GEQ 1 echo Tem %aplp% pastas na pasta Aplicativos  
IF %apla% EQU 0 IF %aplp% EQU 0 echo N�o tem arquivos na pasta Aplicativos & rd %dirFolders%\Aplicativos 

::pause
echo.

for /f %%A in ('dir %dirFolders%\Arquivos ^| find "arquivo(s)"') do set arqa=%%A
for /f %%B in ('dir %dirFolders%\Arquivos ^| find "pasta(s)"') do set arqpsub=%%B
set /a arqp=%arqpsub%-2
IF %arqa% GEQ 1 echo Tem %arqa% arquivos na pasta Arquivos
IF %arqp% GEQ 1 echo Tem %arqp% pastas na pasta Arquivos  
IF %arqa% EQU 0 IF %arqp% EQU 0 echo N�o tem arquivos na pasta Arquivos & rd %dirFolders%\Arquivos 

::pause
echo.

::In�cio da pasta Arquivos---------------------------------------------------------

for /f %%A in ('dir %dirFolders_a%\Android ^| find "arquivo(s)"') do set anda=%%A
for /f %%B in ('dir %dirFolders_a%\Android ^| find "pasta(s)"') do set andpsub=%%B
set /a andp=%andpsub%-2
IF %anda% GEQ 1 echo Tem %anda% arquivos na pasta Android
IF %andp% GEQ 1 echo Tem %andp% pastas na pasta Android 
IF %anda% EQU 0 IF %andp% EQU 0 echo N�o tem arquivos na pasta Batch & rd %dirFolders_a%\Android 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Batch ^| find "arquivo(s)"') do set bata=%%A
for /f %%B in ('dir %dirFolders_a%\Batch ^| find "pasta(s)"') do set batpsub=%%B
set /a batp=%batpsub%-2
IF %bata% GEQ 1 echo Tem %bata% arquivos na pasta Batch
IF %batp% GEQ 1 echo Tem %batp% pastas na pasta Batch 
IF %bata% EQU 0 IF %batp% EQU 0 echo N�o tem arquivos na pasta Batch & rd %dirFolders_a%\Batch 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Isos ^| find "arquivo(s)"') do set isoa=%%A
for /f %%B in ('dir %dirFolders_a%\Isos ^| find "pasta(s)"') do set isopsub=%%B
set /a isop=%isopsub%-2
IF %isoa% GEQ 1 echo Tem %isoa% arquivos na pasta Isos
IF %isop% GEQ 1 echo Tem %isop% pastas na pasta Isos 
IF %isoa% EQU 0 IF %isop% EQU 0 echo N�o tem arquivos na pasta Isos & rd %dirFolders_a%\Isos 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Javascript ^| find "arquivo(s)"') do set jvsa=%%A
for /f %%B in ('dir %dirFolders_a%\Javascript ^| find "pasta(s)"') do set jvspsub=%%B
set /a jvsp=%jvspsub%-2
IF %jvsa% GEQ 1 echo Tem %jvsa% arquivos na pasta Javascript
IF %jvsp% GEQ 1 echo Tem %jvsp% pastas na pasta Javascript 
IF %jvsa% EQU 0 IF %jvsp% EQU 0 echo N�o tem arquivos na pasta Javascript & rd %dirFolders_a%\Javascript 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\HTML ^| find "arquivo(s)"') do set htmla=%%A
for /f %%B in ('dir %dirFolders_a%\HTML ^| find "pasta(s)"') do set htmlpsub=%%B
set /a htmlp=%htmlpsub%-2
IF %htmla% GEQ 1 echo Tem %htmla% arquivos na pasta HTML
IF %htmlp% GEQ 1 echo Tem %htmlp% pastas na pasta HTML 
IF %htmla% EQU 0 IF %htmlp% EQU 0 echo N�o tem arquivos na pasta HTML & rd %dirFolders_a%\HTML

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Access" ^| find "arquivo(s)"') do set acca=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Access" ^| find "pasta(s)"') do set accpsub=%%B
set /a accp=%accpsub%-2
IF %acca% GEQ 1 echo Tem %acca% arquivos na pasta Office Access
IF %accp% GEQ 1 echo Tem %accp% pastas na pasta Office Access 
IF %acca% EQU 0 IF %accp% EQU 0 echo N�o tem arquivos na pasta Office Access & rd "%dirFolders_a%\Office Access"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Excel" ^| find "arquivo(s)"') do set exca=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Excel" ^| find "pasta(s)"') do set excpsub=%%B
set /a excp=%excpsub%-2
IF %exca% GEQ 1 echo Tem %exca% arquivos na pasta Office Excel
IF %excp% GEQ 1 echo Tem %excp% pastas na pasta Office Excel 
IF %exca% EQU 0 IF %excp% EQU 0 echo N�o tem arquivos na pasta Office Excel & rd "%dirFolders_a%\Office Excel"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office PowerPoint" ^| find "arquivo(s)"') do set powa=%%A
for /f %%B in ('dir "%dirFolders_a%\Office PowerPoint" ^| find "pasta(s)"') do set powpsub=%%B
set /a powp=%powpsub%-2
IF %powa% GEQ 1 echo Tem %powa% arquivos na pasta Office PowerPoint
IF %powp% GEQ 1 echo Tem %powp% pastas na pasta Office PowerPoint 
IF %powa% EQU 0 IF %powp% EQU 0 echo N�o tem arquivos na pasta Office PowerPoint & rd "%dirFolders_a%\Office PowerPoint"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Word" ^| find "arquivo(s)"') do set wora=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Word" ^| find "pasta(s)"') do set worpsub=%%B
set /a worp=%worpsub%-2
IF %wora% GEQ 1 echo Tem %wora% arquivos na pasta Office Word
IF %worp% GEQ 1 echo Tem %worp% pastas na pasta Office Word 
IF %wora% EQU 0 IF %worp% EQU 0 echo N�o tem arquivos na pasta Office Word & rd "%dirFolders_a%\Office Word"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Partidas de Xadrez" ^| find "arquivo(s)"') do set chea=%%A
for /f %%B in ('dir "%dirFolders_a%\Partidas de Xadrez" ^| find "pasta(s)"') do set chepsub=%%B
set /a chep=%chepsub%-2
IF %chea% GEQ 1 echo Tem %chea% arquivos na pasta Partidas de Xadrez
IF %chep% GEQ 1 echo Tem %chep% pastas na pasta Partidas de Xadrez 
IF %chea% EQU 0 IF %chep% EQU 0 echo N�o tem arquivos na pasta Partidas de Xadrez & rd "%dirFolders_a%\Partidas de Xadrez"

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Pdf ^| find "arquivo(s)"') do set pdfa=%%A
for /f %%B in ('dir %dirFolders_a%\Pdf ^| find "pasta(s)"') do set pdfpsub=%%B
set /a pdfp=%pdfpsub%-2
IF %pdfa% GEQ 1 echo Tem %pdfa% arquivos na pasta Pdf
IF %pdfp% GEQ 1 echo Tem %pdfp% pastas na pasta Pdf 
IF %pdfa% EQU 0 IF %pdfp% EQU 0 echo N�o tem arquivos na pasta Pdf & rd %dirFolders_a%\Pdf

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Pynthon ^| find "arquivo(s)"') do set pyna=%%A
for /f %%B in ('dir %dirFolders_a%\Pynthon ^| find "pasta(s)"') do set pynpsub=%%B
set /a pynp=%pynpsub%-2
IF %pyna% GEQ 1 echo Tem %pyna% arquivos na pasta Pynthon
IF %pynp% GEQ 1 echo Tem %pynp% pastas na pasta Pynthon 
IF %pyna% EQU 0 IF %pynp% EQU 0 echo N�o tem arquivos na pasta Pynthon & rd %dirFolders_a%\Pynthon

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Roblox ^| find "arquivo(s)"') do set roba=%%A
for /f %%B in ('dir %dirFolders_a%\Roblox ^| find "pasta(s)"') do set robpsub=%%B
set /a robp=%robpsub%-2
IF %roba% GEQ 1 echo Tem %roba% arquivos na pasta Roblox
IF %robp% GEQ 1 echo Tem %robp% pastas na pasta Roblox
IF %roba% EQU 0 IF %robp% EQU 0 echo N�o tem arquivos na pasta Roblox & rd %dirFolders_a%\Roblox

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Rtf ^| find "arquivo(s)"') do set rtfa=%%A
for /f %%B in ('dir %dirFolders_a%\Rtf ^| find "pasta(s)"') do set rtfpsub=%%B
set /a rtfp=%rtfpsub%-2
IF %rtfa% GEQ 1 echo Tem %rtfa% arquivos na pasta Rtf
IF %rtfp% GEQ 1 echo Tem %rtfp% pastas na pasta Rtf
IF %rtfa% EQU 0 IF %rtfp% EQU 0 echo N�o tem arquivos na pasta Rtf & rd %dirFolders_a%\Rtf

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Torrents ^| find "arquivo(s)"') do set tora=%%A
for /f %%B in ('dir %dirFolders_a%\Torrents ^| find "pasta(s)"') do set torpsub=%%B
set /a torp=%torpsub%-2
IF %tora% GEQ 1 echo Tem %tora% arquivos na pasta Torrents
IF %torp% GEQ 1 echo Tem %torp% pastas na pasta Torrents
IF %tora% EQU 0 IF %torp% EQU 0 echo N�o tem arquivos na pasta Torrents & rd %dirFolders_a%\Torrents

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Texto ^| find "arquivo(s)"') do set txta=%%A
for /f %%B in ('dir %dirFolders_a%\Texto ^| find "pasta(s)"') do set txtpsub=%%B
set /a txtp=%txtpsub%-2
IF %txta% GEQ 1 echo Tem %txta% arquivos na pasta Texto
IF %txtp% GEQ 1 echo Tem %txtp% pastas na pasta Texto
IF %txta% EQU 0 IF %txtp% EQU 0 echo N�o tem arquivos na pasta Texto & rd %dirFolders_a%\Texto

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Microsoft Installer" ^| find "arquivo(s)"') do set msia=%%A
for /f %%B in ('dir "%dirFolders_a%\Microsoft Installer" ^| find "pasta(s)"') do set msipsub=%%B
set /a msip=%msipsub%-2
IF %msia% GEQ 1 echo Tem %msia% arquivos na pasta Microsoft Installer
IF %msip% GEQ 1 echo Tem %msip% pastas na pasta Microsoft Installer
IF %msia% EQU 0 IF %msip% EQU 0 echo N�o tem arquivos na pasta Microsoft Installer & rd "%dirFolders_a%\Microsoft Installer"

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Winrar ^| find "arquivo(s)"') do set wina=%%A
for /f %%B in ('dir %dirFolders_a%\Winrar ^| find "pasta(s)"') do set winpsub=%%B
set /a winp=%winpsub%-2
IF %wina% GEQ 1 echo Tem %wina% arquivos na pasta Winrar
IF %winp% GEQ 1 echo Tem %winp% pastas na pasta Winrar
IF %wina% EQU 0 IF %winp% EQU 0 echo N�o tem arquivos na pasta Winrar & rd %dirFolders_a%\Winrar

::pause 
echo.

for /f %%A in ('dir %dirFolders_a%\Xps ^| find "arquivo(s)"') do set xpsa=%%A
for /f %%B in ('dir %dirFolders_a%\Xps ^| find "pasta(s)"') do set xpspsub=%%B
set /a xpsp=%xpspsub%-2
IF %xpsa% GEQ 1 echo Tem %xpsa% arquivos na pasta Xps
IF %xpsp% GEQ 1 echo Tem %xpsp% pastas na pasta Xps
IF %xpsa% EQU 0 IF %xpsp% EQU 0 echo N�o tem arquivos na pasta Xps, ela ser� apagada & rd %dirFolders_a%\Xps

::pause
echo.

::Fim da pasta Arquivos---------------------------------------------------------

::for /f %%A in ('dir %dirFolders%\Atalhos ^| find "arquivo(s)"') do set ataa=%%A
::for /f %%B in ('dir %dirFolders%\Atalhos ^| find "pasta(s)"') do set atapsub=%%B
::set /a atap=%atapsub%-2
::IF %ataa% GEQ 1 echo Tem %ataa% arquivos na pasta Atalhos
::IF %atap% GEQ 1 echo Tem %atap% pastas na pasta Atalhos  
::IF %ataa% EQU 0 IF %atap% EQU 0 echo N�o tem arquivos na pasta Atalhos & rd %dirFolders%\Atalhos 

::pause
echo.

for /f %%A in ('dir %dirFolders%\�udios ^| find "arquivo(s)"') do set auda=%%A
for /f %%B in ('dir %dirFolders%\�udios ^| find "pasta(s)"') do set audpsub=%%B
set /a audp=%audpsub%-2
IF %auda% GEQ 1 echo Tem %auda% arquivos na pasta �udios
IF %audp% GEQ 1 echo Tem %audp% pastas na pasta �udios  
IF %auda% EQU 0 IF %audp% EQU 0 echo N�o tem arquivos na pasta �udios & rd %dirFolders%\�udios 

::pause
echo.

for /f %%A in ('dir %dirFolders%\Imagens ^| find "arquivo(s)"') do set imaa=%%A
for /f %%B in ('dir %dirFolders%\Imagens ^| find "pasta(s)"') do set imapsub=%%B
set /a imap=%imapsub%-2
IF %imaa% GEQ 1 echo Tem %imaa% arquivos na pasta Imagens
IF %imap% GEQ 1 echo Tem %imap% pastas na pasta Imagens  
IF %imaa% EQU 0 IF %imap% EQU 0 echo N�o tem arquivos na pasta Imagens & rd %dirFolders%\Imagens

::pause
echo.

for /f %%A in ('dir %dirFolders%\Livros ^| find "arquivo(s)"') do set liva=%%A
for /f %%B in ('dir %dirFolders%\Livros ^| find "pasta(s)"') do set livpsub=%%B
set /a livp=%livpsub%-2
IF %liva% GEQ 1 echo Tem %liva% arquivos na pasta Livros
IF %livp% GEQ 1 echo Tem %livp% pastas na pasta Livros 
IF %liva% EQU 0 IF %livp% EQU 0 echo N�o tem arquivos na pasta Livros & rd %dirFolders%\Livros

::pause
echo.

for /f %%A in ('dir %dirFolders%\V�deos ^| find "arquivo(s)"') do set vida=%%A
for /f %%B in ('dir %dirFolders%\V�deos ^| find "pasta(s)"') do set vidpsub=%%B
set /a vidp=%vidpsub%-2
IF %vida% GEQ 1 echo Tem %vida% arquivos na pasta V�deos
IF %vidp% GEQ 1 echo Tem %vidp% pastas na pasta V�deos 
IF %vida% EQU 0 IF %vidp% EQU 0 echo N�o tem arquivos na pasta V�deos & rd %dirFolders%\V�deos

echo.
pause