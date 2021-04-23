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
::(Área de Trabalho)Confere se as pastas existem e caso não existam cria elas

IF /i NOT EXIST "%dirFolders%\Aplicativos" md "%dirFolders%\Aplicativos" & echo A pasta Aplicativos será criada.  
echo.
  
IF /i NOT EXIST "%dirFolders%\Arquivos" md "%dirFolders%\Arquivos" & echo A pasta Arquivos será criada
echo.
echo ---------------------------------------------------------------------------
::(Arquivos)Confere se as pastas existem e caso não existam cria elas

cd %dirFolders_a%

IF /i NOT EXIST "%dirFolders_a%\Android" md "%dirFolders_a%\Android" & echo A pasta Android será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Batch" md "%dirFolders_a%\Batch" & echo A pasta Batch será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Isos" md "%dirFolders_a%\Isos" & echo A pasta Isos será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Javascript" md "%dirFolders_a%\Javascript" & echo A pasta Javascript será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\HTML" md "%dirFolders_a%\HTML" & echo A pasta HTML será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Access" md "%dirFolders_a%\Office Access" & echo A pasta Office Access será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Excel" md "%dirFolders_a%\Office Excel" & echo A pasta Office Excel será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office PowerPoint" md "%dirFolders_a%\Office PowerPoint" & echo A pasta Office PowerPoint será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Office Word" md "%dirFolders_a%\Office Word" & echo A pasta Office Word será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Partidas de Xadrez" md "%dirFolders_a%\Partidas de Xadrez" & echo A pasta Partidas de Xadrez será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Pdf" md "%dirFolders_a%\Pdf" & echo A pasta Pdf será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Pynthon" md "%dirFolders_a%\Pynthon" & echo A pasta Pynthon será criada
echo.
   
IF /i NOT EXIST "%dirFolders_a%\Roblox" md "%dirFolders_a%\Roblox" & echo A pasta Roblox será criada
echo.
 
IF /i NOT EXIST "%dirFolders_a%\Rtf" md "%dirFolders_a%\Rtf" & echo A pasta Rtf será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Torrents" md "%dirFolders_a%\Torrents" & echo A pasta Torrents será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Texto" md "%dirFolders_a%\Texto" & echo A pasta Texto será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Microsoft Installer" md "%dirFolders_a%\Microsoft Installer" & echo A pasta Microsoft Installer será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Winrar" md "%dirFolders_a%\Winrar" & echo A pasta Winrar será criada
echo.

IF /i NOT EXIST "%dirFolders_a%\Xps" md "%dirFolders_a%\Xps" & echo A pasta Xps será criada
echo.

echo ---------------------------------------------------------------------------    

::IF /i NOT EXIST "%dir%\Atalhos" md "%dir%\Atalhos" & echo A pasta Atalhos será criada

::echo.

IF /i NOT EXIST "%dirFolders%\Imagens" md "%dirFolders%\Imagens" & echo A pasta Imagens será criada
echo. 

IF /i NOT EXIST "%dirFolders%\Livros" md "%dirFolders%\Livros" & echo A pasta Livros será criada
echo. 

IF /i NOT EXIST "%dirFolders%\µudios" md "%dirFolders%\µudios" & echo A pasta µudios será criada
echo. 

IF /i NOT EXIST "%dirFolders%\V¡deos" md "%dirFolders%\V¡deos" & echo A pasta V¡deos será criada
echo.
 
echo ---------------------------------------------------------------------------

pause
set "folder= "
goto Area de Trabalho 
:://////////////////////////////////////////////////////////////////////////////
:Mover Arquivos

cd %dir%

:: Movendo Aplicativos

echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
for %%a  in (*.exe) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders%\Aplicativos")
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 

echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
for %%a  in (*.apk) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Android")
echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
for %%a  in (*.bat *.cmd *.masb) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Batch")
echo. 

echo Movendo arquivos para a pasta Isos...
echo.
for %%a  in (*.iso *.img *.udf) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Isos")
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
for %%a  in (*.js) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Javascript")
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
for %%a  in (*.html) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\HTML")
echo. 

echo Movendo arquivos para a Office Access...
echo.
for %%a  in (*.accdb *.accdt *.accde *.accdr *.mdb *.snp) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Office Access")
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
for %%a  in (*.csv *.xls *.xlt *.xlm *.xlsx *.xlsm *.xltx *.xltm) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Office Excel")
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
for %%a  in (*.ppt *.pot *.pps *.pptx *.pptm *.potx *.ppam *.ppsx *.ppsm *.sldx *.sldm) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Office PowerPoint")
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
for %%a  in (*.doc *.dot *.docx *.docm *.dotx *.dotm *.docb *.wbk) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Office Word")
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
for %%a  in (*.pgn *.pks *.pgi) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Partidas de Xadrez")
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
for %%a  in (*.pdf) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Pdf")
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
for %%a  in (*.py) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Pynthon")
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
for %%a  in (*.rbxl) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Roblox")
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
for %%a  in (*.rtf) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Rtf")
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
for %%a  in (*.torrent) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Torrents")
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
for %%a  in (*.txt) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Texto")
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
for %%a  in (*.msi) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Microsoft Installer")
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
for %%a  in (*.7z *.rar *.zip) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Winrar")
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
for %%a  in (*.xps) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders_a%\Xps")
echo -------------------------------------------------------------------------

echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
for %%a  in (*.3ga *.aac *.aiff *.amr *.ape *.arf *.asf *.asx *.cda *.dvf *.flac *.gp4 *.gp5 *.gpx *.logic *.m4a *.m4b *.m4p *.midi *.mp3 *.ogg *.opus *.pcm *.rec *.snd *.sng *.uax *.wav *.wma *.wpl *.zab) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders%\Áudios")
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
for %%a  in (*.bmp *.cpt *.dds *.dib *.dng *.emf *.gif *.heic *.ico *.icon *.jfif *.jpeg *.jpg *.pcx *.pic *.png *.psd *.psdx *.raw *.tga *.thm *.tif *.tiff *.wbmp *.zab) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders%\Imagens")
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
for %%a  in (*.epub *.mobi) do (echo Arquivo movido: %%a && move "%%a" "Livros")
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
for %%a  in (*.264 *.3g2 *.3gp *.arf *.asf *.asx *.avi *.bik *.dash *.dat *.dvr *.flv *.h264 *.m2t *.m2ts *.m4v *.mkv *.mod *.mov *.mp4 *.mpeg *.mpg *.mts *.ogv *.prproj *.rec *.rmvb *.swf *.tod *.tp *.ts *.vob *.webm *.wlmp *.wmv) do (echo Arquivo movido: %%a && move "%%a" "%dirFolders%\Vídeos")
echo.

IF %folder% EQU Adt goto Fim_Adt  
IF %folder% EQU Dow goto Fim_Dow 
IF %folder% EQU Doc goto Fim_Doc
IF %folder% EQU Pic goto Fim_Ima
IF %folder% EQU Mus goto Fim_Mus

:Area de Trabalho
::Área de trabalho

cls

set folder=Adt

echo.
echo µrea de Trabalho:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_AdT

echo ___________________________________________________________________________

echo.
echo Fim da µrea de Trabalho:
echo.

pause

goto Downloads

::------------------------------------------------------------------------------

:Downloads
::Downloads

cls

set folder=Dow
set dir=%dow%

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
::Músicas

cls

set folder=Mus
set dir=%mus%

echo.
echo M£sicas:
echo.

echo %dir%

goto Mover Arquivos
::------------------------------------------------------------------------------
:Fim_Mus

echo ___________________________________________________________________________

echo.
echo Fim das M£sicas:
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
IF %apla% EQU 0 IF %aplp% EQU 0 echo NÆo tem arquivos na pasta Aplicativos & rd %dirFolders%\Aplicativos 

::pause
echo.

for /f %%A in ('dir %dirFolders%\Arquivos ^| find "arquivo(s)"') do set arqa=%%A
for /f %%B in ('dir %dirFolders%\Arquivos ^| find "pasta(s)"') do set arqpsub=%%B
set /a arqp=%arqpsub%-2
IF %arqa% GEQ 1 echo Tem %arqa% arquivos na pasta Arquivos
IF %arqp% GEQ 1 echo Tem %arqp% pastas na pasta Arquivos  
IF %arqa% EQU 0 IF %arqp% EQU 0 echo NÆo tem arquivos na pasta Arquivos & rd %dirFolders%\Arquivos 

::pause
echo.

::Início da pasta Arquivos---------------------------------------------------------

for /f %%A in ('dir %dirFolders_a%\Android ^| find "arquivo(s)"') do set anda=%%A
for /f %%B in ('dir %dirFolders_a%\Android ^| find "pasta(s)"') do set andpsub=%%B
set /a andp=%andpsub%-2
IF %anda% GEQ 1 echo Tem %anda% arquivos na pasta Android
IF %andp% GEQ 1 echo Tem %andp% pastas na pasta Android 
IF %anda% EQU 0 IF %andp% EQU 0 echo NÆo tem arquivos na pasta Batch & rd %dirFolders_a%\Android 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Batch ^| find "arquivo(s)"') do set bata=%%A
for /f %%B in ('dir %dirFolders_a%\Batch ^| find "pasta(s)"') do set batpsub=%%B
set /a batp=%batpsub%-2
IF %bata% GEQ 1 echo Tem %bata% arquivos na pasta Batch
IF %batp% GEQ 1 echo Tem %batp% pastas na pasta Batch 
IF %bata% EQU 0 IF %batp% EQU 0 echo NÆo tem arquivos na pasta Batch & rd %dirFolders_a%\Batch 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Isos ^| find "arquivo(s)"') do set isoa=%%A
for /f %%B in ('dir %dirFolders_a%\Isos ^| find "pasta(s)"') do set isopsub=%%B
set /a isop=%isopsub%-2
IF %isoa% GEQ 1 echo Tem %isoa% arquivos na pasta Isos
IF %isop% GEQ 1 echo Tem %isop% pastas na pasta Isos 
IF %isoa% EQU 0 IF %isop% EQU 0 echo NÆo tem arquivos na pasta Isos & rd %dirFolders_a%\Isos 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Javascript ^| find "arquivo(s)"') do set jvsa=%%A
for /f %%B in ('dir %dirFolders_a%\Javascript ^| find "pasta(s)"') do set jvspsub=%%B
set /a jvsp=%jvspsub%-2
IF %jvsa% GEQ 1 echo Tem %jvsa% arquivos na pasta Javascript
IF %jvsp% GEQ 1 echo Tem %jvsp% pastas na pasta Javascript 
IF %jvsa% EQU 0 IF %jvsp% EQU 0 echo NÆo tem arquivos na pasta Javascript & rd %dirFolders_a%\Javascript 

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\HTML ^| find "arquivo(s)"') do set htmla=%%A
for /f %%B in ('dir %dirFolders_a%\HTML ^| find "pasta(s)"') do set htmlpsub=%%B
set /a htmlp=%htmlpsub%-2
IF %htmla% GEQ 1 echo Tem %htmla% arquivos na pasta HTML
IF %htmlp% GEQ 1 echo Tem %htmlp% pastas na pasta HTML 
IF %htmla% EQU 0 IF %htmlp% EQU 0 echo NÆo tem arquivos na pasta HTML & rd %dirFolders_a%\HTML

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Access" ^| find "arquivo(s)"') do set acca=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Access" ^| find "pasta(s)"') do set accpsub=%%B
set /a accp=%accpsub%-2
IF %acca% GEQ 1 echo Tem %acca% arquivos na pasta Office Access
IF %accp% GEQ 1 echo Tem %accp% pastas na pasta Office Access 
IF %acca% EQU 0 IF %accp% EQU 0 echo NÆo tem arquivos na pasta Office Access & rd "%dirFolders_a%\Office Access"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Excel" ^| find "arquivo(s)"') do set exca=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Excel" ^| find "pasta(s)"') do set excpsub=%%B
set /a excp=%excpsub%-2
IF %exca% GEQ 1 echo Tem %exca% arquivos na pasta Office Excel
IF %excp% GEQ 1 echo Tem %excp% pastas na pasta Office Excel 
IF %exca% EQU 0 IF %excp% EQU 0 echo NÆo tem arquivos na pasta Office Excel & rd "%dirFolders_a%\Office Excel"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office PowerPoint" ^| find "arquivo(s)"') do set powa=%%A
for /f %%B in ('dir "%dirFolders_a%\Office PowerPoint" ^| find "pasta(s)"') do set powpsub=%%B
set /a powp=%powpsub%-2
IF %powa% GEQ 1 echo Tem %powa% arquivos na pasta Office PowerPoint
IF %powp% GEQ 1 echo Tem %powp% pastas na pasta Office PowerPoint 
IF %powa% EQU 0 IF %powp% EQU 0 echo NÆo tem arquivos na pasta Office PowerPoint & rd "%dirFolders_a%\Office PowerPoint"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Office Word" ^| find "arquivo(s)"') do set wora=%%A
for /f %%B in ('dir "%dirFolders_a%\Office Word" ^| find "pasta(s)"') do set worpsub=%%B
set /a worp=%worpsub%-2
IF %wora% GEQ 1 echo Tem %wora% arquivos na pasta Office Word
IF %worp% GEQ 1 echo Tem %worp% pastas na pasta Office Word 
IF %wora% EQU 0 IF %worp% EQU 0 echo NÆo tem arquivos na pasta Office Word & rd "%dirFolders_a%\Office Word"

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Partidas de Xadrez" ^| find "arquivo(s)"') do set chea=%%A
for /f %%B in ('dir "%dirFolders_a%\Partidas de Xadrez" ^| find "pasta(s)"') do set chepsub=%%B
set /a chep=%chepsub%-2
IF %chea% GEQ 1 echo Tem %chea% arquivos na pasta Partidas de Xadrez
IF %chep% GEQ 1 echo Tem %chep% pastas na pasta Partidas de Xadrez 
IF %chea% EQU 0 IF %chep% EQU 0 echo NÆo tem arquivos na pasta Partidas de Xadrez & rd "%dirFolders_a%\Partidas de Xadrez"

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Pdf ^| find "arquivo(s)"') do set pdfa=%%A
for /f %%B in ('dir %dirFolders_a%\Pdf ^| find "pasta(s)"') do set pdfpsub=%%B
set /a pdfp=%pdfpsub%-2
IF %pdfa% GEQ 1 echo Tem %pdfa% arquivos na pasta Pdf
IF %pdfp% GEQ 1 echo Tem %pdfp% pastas na pasta Pdf 
IF %pdfa% EQU 0 IF %pdfp% EQU 0 echo NÆo tem arquivos na pasta Pdf & rd %dirFolders_a%\Pdf

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Pynthon ^| find "arquivo(s)"') do set pyna=%%A
for /f %%B in ('dir %dirFolders_a%\Pynthon ^| find "pasta(s)"') do set pynpsub=%%B
set /a pynp=%pynpsub%-2
IF %pyna% GEQ 1 echo Tem %pyna% arquivos na pasta Pynthon
IF %pynp% GEQ 1 echo Tem %pynp% pastas na pasta Pynthon 
IF %pyna% EQU 0 IF %pynp% EQU 0 echo NÆo tem arquivos na pasta Pynthon & rd %dirFolders_a%\Pynthon

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Roblox ^| find "arquivo(s)"') do set roba=%%A
for /f %%B in ('dir %dirFolders_a%\Roblox ^| find "pasta(s)"') do set robpsub=%%B
set /a robp=%robpsub%-2
IF %roba% GEQ 1 echo Tem %roba% arquivos na pasta Roblox
IF %robp% GEQ 1 echo Tem %robp% pastas na pasta Roblox
IF %roba% EQU 0 IF %robp% EQU 0 echo NÆo tem arquivos na pasta Roblox & rd %dirFolders_a%\Roblox

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Rtf ^| find "arquivo(s)"') do set rtfa=%%A
for /f %%B in ('dir %dirFolders_a%\Rtf ^| find "pasta(s)"') do set rtfpsub=%%B
set /a rtfp=%rtfpsub%-2
IF %rtfa% GEQ 1 echo Tem %rtfa% arquivos na pasta Rtf
IF %rtfp% GEQ 1 echo Tem %rtfp% pastas na pasta Rtf
IF %rtfa% EQU 0 IF %rtfp% EQU 0 echo NÆo tem arquivos na pasta Rtf & rd %dirFolders_a%\Rtf

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Torrents ^| find "arquivo(s)"') do set tora=%%A
for /f %%B in ('dir %dirFolders_a%\Torrents ^| find "pasta(s)"') do set torpsub=%%B
set /a torp=%torpsub%-2
IF %tora% GEQ 1 echo Tem %tora% arquivos na pasta Torrents
IF %torp% GEQ 1 echo Tem %torp% pastas na pasta Torrents
IF %tora% EQU 0 IF %torp% EQU 0 echo NÆo tem arquivos na pasta Torrents & rd %dirFolders_a%\Torrents

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Texto ^| find "arquivo(s)"') do set txta=%%A
for /f %%B in ('dir %dirFolders_a%\Texto ^| find "pasta(s)"') do set txtpsub=%%B
set /a txtp=%txtpsub%-2
IF %txta% GEQ 1 echo Tem %txta% arquivos na pasta Texto
IF %txtp% GEQ 1 echo Tem %txtp% pastas na pasta Texto
IF %txta% EQU 0 IF %txtp% EQU 0 echo NÆo tem arquivos na pasta Texto & rd %dirFolders_a%\Texto

::pause
echo.

for /f %%A in ('dir "%dirFolders_a%\Microsoft Installer" ^| find "arquivo(s)"') do set msia=%%A
for /f %%B in ('dir "%dirFolders_a%\Microsoft Installer" ^| find "pasta(s)"') do set msipsub=%%B
set /a msip=%msipsub%-2
IF %msia% GEQ 1 echo Tem %msia% arquivos na pasta Microsoft Installer
IF %msip% GEQ 1 echo Tem %msip% pastas na pasta Microsoft Installer
IF %msia% EQU 0 IF %msip% EQU 0 echo NÆo tem arquivos na pasta Microsoft Installer & rd "%dirFolders_a%\Microsoft Installer"

::pause
echo.

for /f %%A in ('dir %dirFolders_a%\Winrar ^| find "arquivo(s)"') do set wina=%%A
for /f %%B in ('dir %dirFolders_a%\Winrar ^| find "pasta(s)"') do set winpsub=%%B
set /a winp=%winpsub%-2
IF %wina% GEQ 1 echo Tem %wina% arquivos na pasta Winrar
IF %winp% GEQ 1 echo Tem %winp% pastas na pasta Winrar
IF %wina% EQU 0 IF %winp% EQU 0 echo NÆo tem arquivos na pasta Winrar & rd %dirFolders_a%\Winrar

::pause 
echo.

for /f %%A in ('dir %dirFolders_a%\Xps ^| find "arquivo(s)"') do set xpsa=%%A
for /f %%B in ('dir %dirFolders_a%\Xps ^| find "pasta(s)"') do set xpspsub=%%B
set /a xpsp=%xpspsub%-2
IF %xpsa% GEQ 1 echo Tem %xpsa% arquivos na pasta Xps
IF %xpsp% GEQ 1 echo Tem %xpsp% pastas na pasta Xps
IF %xpsa% EQU 0 IF %xpsp% EQU 0 echo NÆo tem arquivos na pasta Xps, ela será apagada & rd %dirFolders_a%\Xps

::pause
echo.

::Fim da pasta Arquivos---------------------------------------------------------

::for /f %%A in ('dir %dirFolders%\Atalhos ^| find "arquivo(s)"') do set ataa=%%A
::for /f %%B in ('dir %dirFolders%\Atalhos ^| find "pasta(s)"') do set atapsub=%%B
::set /a atap=%atapsub%-2
::IF %ataa% GEQ 1 echo Tem %ataa% arquivos na pasta Atalhos
::IF %atap% GEQ 1 echo Tem %atap% pastas na pasta Atalhos  
::IF %ataa% EQU 0 IF %atap% EQU 0 echo NÆo tem arquivos na pasta Atalhos & rd %dirFolders%\Atalhos 

::pause
echo.

for /f %%A in ('dir %dirFolders%\µudios ^| find "arquivo(s)"') do set auda=%%A
for /f %%B in ('dir %dirFolders%\µudios ^| find "pasta(s)"') do set audpsub=%%B
set /a audp=%audpsub%-2
IF %auda% GEQ 1 echo Tem %auda% arquivos na pasta µudios
IF %audp% GEQ 1 echo Tem %audp% pastas na pasta µudios  
IF %auda% EQU 0 IF %audp% EQU 0 echo NÆo tem arquivos na pasta µudios & rd %dirFolders%\µudios 

::pause
echo.

for /f %%A in ('dir %dirFolders%\Imagens ^| find "arquivo(s)"') do set imaa=%%A
for /f %%B in ('dir %dirFolders%\Imagens ^| find "pasta(s)"') do set imapsub=%%B
set /a imap=%imapsub%-2
IF %imaa% GEQ 1 echo Tem %imaa% arquivos na pasta Imagens
IF %imap% GEQ 1 echo Tem %imap% pastas na pasta Imagens  
IF %imaa% EQU 0 IF %imap% EQU 0 echo NÆo tem arquivos na pasta Imagens & rd %dirFolders%\Imagens

::pause
echo.

for /f %%A in ('dir %dirFolders%\Livros ^| find "arquivo(s)"') do set liva=%%A
for /f %%B in ('dir %dirFolders%\Livros ^| find "pasta(s)"') do set livpsub=%%B
set /a livp=%livpsub%-2
IF %liva% GEQ 1 echo Tem %liva% arquivos na pasta Livros
IF %livp% GEQ 1 echo Tem %livp% pastas na pasta Livros 
IF %liva% EQU 0 IF %livp% EQU 0 echo NÆo tem arquivos na pasta Livros & rd %dirFolders%\Livros

::pause
echo.

for /f %%A in ('dir %dirFolders%\V¡deos ^| find "arquivo(s)"') do set vida=%%A
for /f %%B in ('dir %dirFolders%\V¡deos ^| find "pasta(s)"') do set vidpsub=%%B
set /a vidp=%vidpsub%-2
IF %vida% GEQ 1 echo Tem %vida% arquivos na pasta V¡deos
IF %vidp% GEQ 1 echo Tem %vidp% pastas na pasta V¡deos 
IF %vida% EQU 0 IF %vidp% EQU 0 echo NÆo tem arquivos na pasta V¡deos & rd %dirFolders%\V¡deos

echo.
pause