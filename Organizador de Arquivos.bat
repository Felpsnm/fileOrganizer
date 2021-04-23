@echo off

set dir=C:\Users\%username%\Desktop
set dow=C:\Users\%username%\Downloads
set doc=C:\Users\%username%\Documents
set pic=C:\Users\%username%\Pictures
set mus=C:\Users\%username%\Music

cd %dir%  

echo ---------------------------------------------------------------------------
::(Área de Trabalho)Confere se as pastas existem e caso não existam cria elas

IF /i NOT EXIST "%dir%\Aplicativos" md "%dir%\Aplicativos" & echo A pasta Aplicativos será criada.  
echo.
  
IF /i NOT EXIST "%dir%\Arquivos" md "%dir%\Arquivos" & echo A pasta Arquivos será criada
echo.
echo ---------------------------------------------------------------------------
::(Arquivos)Confere se as pastas existem e caso não existam cria elas
set dira=%dir%\Arquivos

cd %dira%

IF /i NOT EXIST "%dira%\Android" md "%dira%\Android" & echo A pasta Android será criada
echo.

IF /i NOT EXIST "%dira%\Batch" md "%dira%\Batch" & echo A pasta Batch será criada
echo.

IF /i NOT EXIST "%dira%\Isos" md "%dira%\Isos" & echo A pasta Isos será criada
echo.

IF /i NOT EXIST "%dira%\Javascript" md "%dira%\Javascript" & echo A pasta Javascript será criada
echo.

IF /i NOT EXIST "%dira%\HTML" md "%dira%\HTML" & echo A pasta HTML será criada
echo.

IF /i NOT EXIST "%dira%\Office Access" md "%dira%\Office Access" & echo A pasta Office Access será criada
echo.

IF /i NOT EXIST "%dira%\Office Excel" md "%dira%\Office Excel" & echo A pasta Office Excel será criada
echo.

IF /i NOT EXIST "%dira%\Office PowerPoint" md "%dira%\Office PowerPoint" & echo A pasta Office PowerPoint será criada
echo.

IF /i NOT EXIST "%dira%\Office Word" md "%dira%\Office Word" & echo A pasta Office Word será criada
echo.

IF /i NOT EXIST "%dira%\Partidas de Xadrez" md "%dira%\Partidas de Xadrez" & echo A pasta Partidas de Xadrez será criada
echo.

IF /i NOT EXIST "%dira%\Pdf" md "%dira%\Pdf" & echo A pasta Pdf será criada
echo.

IF /i NOT EXIST "%dira%\Pynthon" md "%dira%\Pynthon" & echo A pasta Pynthon será criada
echo.
   
IF /i NOT EXIST "%dira%\Roblox" md "%dira%\Roblox" & echo A pasta Roblox será criada
echo.
 
IF /i NOT EXIST "%dira%\Rtf" md "%dira%\Rtf" & echo A pasta Rtf será criada
echo.

IF /i NOT EXIST "%dira%\Torrents" md "%dira%\Torrents" & echo A pasta Torrents será criada
echo.

IF /i NOT EXIST "%dira%\Texto" md "%dira%\Texto" & echo A pasta Texto será criada
echo.

IF /i NOT EXIST "%dira%\Microsoft Installer" md "%dira%\Microsoft Installer" & echo A pasta Microsoft Installer será criada
echo.

IF /i NOT EXIST "%dira%\Winrar" md "%dira%\Winrar" & echo A pasta Winrar será criada
echo.

IF /i NOT EXIST "%dira%\Xps" md "%dira%\Xps" & echo A pasta Xps será criada
echo.

echo ---------------------------------------------------------------------------    

::IF /i NOT EXIST "%dir%\Atalhos" md "%dir%\Atalhos" & echo A pasta Atalhos será criada

::echo.

IF /i NOT EXIST "%dir%\Imagens" md "%dir%\Imagens" & echo A pasta Imagens será criada
echo. 

IF /i NOT EXIST "%dir%\Livros" md "%dir%\Livros" & echo A pasta Livros será criada
echo. 

IF /i NOT EXIST "%dir%\µudios" md "%dir%\µudios" & echo A pasta µudios será criada
echo. 

IF /i NOT EXIST "%dir%\V¡deos" md "%dir%\V¡deos" & echo A pasta V¡deos será criada
echo.
 
echo ---------------------------------------------------------------------------

pause

cls 
:://////////////////////////////////////////////////////////////////////////////
cd %dir%

::Área de trabalho
echo.
echo µrea de Trabalho:
echo.

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dir%\*.exe %dir%\Aplicativos
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move %dir%\*.apk %dira%\Android

echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
move %dir%\*.bat,*.cmd,*.masb %dira%\Batch

echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move %dir%\*.iso,*.img,*.udf %dira%\Isos
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move %dir%\*.js %dira%\Javascript
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move %dir%\*.html %dira%\HTML
echo. 

echo Movendo arquivos para a Office Access...
echo.
move %dir%\*.accdb,*.accdt,*.accde,*.accdr,*.mdb,*.snp "%dira%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move %dir%\*.csv,*.xls,*.xlt,*.xlm,*.xlsx,*.xlsm,*.xltx,*.xltm "%dira%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move %dir%\*.ppt,*.pot,*.pps,*.pptx,*.pptm,*.potx,*.ppam,*.ppsx,*.ppsm,*.sldx,*.sldm "%dira%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move %dir%\*.doc,*.dot,*.wbk,*.docx,*.docm,*.dotx,*.dotm,*.docb "%dira%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move %dir%\*.pgn,*.pks,*.pgi "%dira%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move %dir%\*.pdf %dira%\Pdf
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move %dir%\*.py %dira%\Pynthon
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move %dir%\*.rbxl %dira%\Roblox
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move %dir%\*.rtf %dira%\Rtf
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move %dir%\*.torrent %dira%\Torrents
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move %dir%\*.txt %dira%\Texto
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move %dir%\*.msi "%dira%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move %dir%\*.zip,*.rar,*.7z %dira%\Winrar
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move %dir%\*.xps %dira%\Xps
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move %dir%\*.lnk %dir%\Atalhos
echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dir%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dir%\*.bmp,*.cpt,*.dds,*.dib,*.dng,*.emf,*.gif,*.heic,*.ico,*.icon,*.jfif,*.jpeg,*.jpg,*.pcx,*.pic,*.png,*.psd,*.psdx,*.raw,*.tga,*.thm,*.tif,*.tiff,*.wbmp,*.wdp,*.webp %dir%\Imagens
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dir%\*.epub,*.mobi %dir%\Livros
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dir%\*.264,*.3g2,*.3gp,*.arf,*.asf,*.asx,*.avi,*.bik,*.dash,*.dat,*.dvr,*.flv,*.h264,*.m2t,*.m2ts,*.m4v,*.mkv,*.mod,*.mov,*.mp4,*.mpeg,*.mpg,*.mts,*.ogv,*.prproj,*.rec,*.rmvb,*.swf,*.tod,*.tp,*.ts,*.vob,*.webm,*.wlmp,*.wmv %dir%\V¡deos
echo.
echo ___________________________________________________________________________

echo.
echo Fim da µrea de Trabalho:
echo.
pause
::------------------------------------------------------------------------------
cls
cd %dow%

::Downloads

echo.
echo Downloads:
echo.

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dow%\*.exe %dir%\Aplicativos
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move %dow%\*.apk %dira%\Android

echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
move %dow%\*.bat,*.cmd,*.masb %dira%\Batch
echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move %dow%\*.iso,*.img,*.udf %dira%\Isos
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move %dow%\*.js %dira%\Javascript
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move %dow%\*.html %dira%\HTML
echo. 

echo Movendo arquivos para a Office Access...
echo.
move %dow%\*.accdb,*.accdt,*.accde,*.accdr,*.mdb,*.snp "%dira%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move %dow%\*.csv,*.xls,*.xlt,*.xlm,*.xlsx,*.xlsm,*.xltx,*.xltm "%dira%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move %dow%\*.ppt,*.pot,*.pps,*.pptx,*.pptm,*.potx,*.ppam,*.ppsx,*.ppsm,*.sldx,*.sldm "%dira%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move %dow%\*.doc,*.dot,*.wbk,*.docx,*.docm,*.dotx,*.dotm,*.docb "%dira%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move %dow%\*.pgn,*.pks,*.pgi "%dira%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move %dow%\*.pdf %dira%\Pdf
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move %dow%\*.py %dira%\Pynthon
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move %dow%\*.rbxl %dira%\Roblox
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move %dow%\*.rtf %dira%\Rtf
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move %dow%\*.torrent %dira%\Torrents
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move %dow%\*.txt %dira%\Texto
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move %dow%\*.msi "%dira%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move %dow%\*.zip,*.rar,*.7z %dira%\Winrar
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move %dow%\*.xps %dira%\Xps
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move %dow%\*.lnk %dir%\Atalhos
echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dow%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dow%\*.bmp,*.cpt,*.dds,*.dib,*.dng,*.emf,*.gif,*.heic,*.ico,*.icon,*.jfif,*.jpeg,*.jpg,*.pcx,*.pic,*.png,*.psd,*.psdx,*.raw,*.tga,*.thm,*.tif,*.tiff,*.wbmp,*.wdp,*.webp %dir%\Imagens
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dow%\*.epub,*.mobi %dir%\Livros
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %dow%\*.264,*.3g2,*.3gp,*.arf,*.asf,*.asx,*.avi,*.bik,*.dash,*.dat,*.dvr,*.flv,*.h264,*.m2t,*.m2ts,*.m4v,*.mkv,*.mod,*.mov,*.mp4,*.mpeg,*.mpg,*.mts,*.ogv,*.prproj,*.rec,*.rmvb,*.swf,*.tod,*.tp,*.ts,*.vob,*.webm,*.wlmp,*.wmv %dir%\V¡deos
echo.
echo ___________________________________________________________________________

echo.
echo Fim do Downloads:
echo.
pause
::------------------------------------------------------------------------------
cls
cd %doc%

::Documentos
echo.
echo Documentos:
echo.

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %doc%\*.exe %dir%\Aplicativos
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move %doc%\*.apk %dira%\Android

echo. 

echo Movendo arquivos para a pasta Batch...
echo.     
move %doc%\*.bat,*.cmd,*.masb %dira%\Batch

echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move %doc%\*.iso,*.img,*.udf %dira%\Isos
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move %doc%\*.js %dira%\Javascript
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move %doc%\*.html %dira%\HTML
echo. 

echo Movendo arquivos para a Office Access...
echo.
move %doc%\*.accdb,*.accdt,*.accde,*.accdr,*.mdb,*.snp "%dira%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move %doc%\*.csv,*.xls,*.xlt,*.xlm,*.xlsx,*.xlsm,*.xltx,*.xltm "%dira%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move %doc%\*.ppt,*.pot,*.pps,*.pptx,*.pptm,*.potx,*.ppam,*.ppsx,*.ppsm,*.sldx,*.sldm "%dira%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move %doc%\*.doc,*.dot,*.wbk,*.docx,*.docm,*.dotx,*.dotm,*.docb "%dira%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move %doc%\*.pgn,*.pks,*.pgi "%dira%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move %doc%\*.pdf %dira%\Pdf
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move %doc%\*.py %dira%\Pynthon
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move %doc%\*.rbxl %dira%\Roblox
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move %doc%\*.rtf %dira%\Rtf
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move %doc%\*.torrent %dira%\Torrents
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move %doc%\*.txt %dira%\Texto
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move %doc%\*.msi "%dira%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move %doc%\*.zip,*.rar,*.7z %dira%\Winrar
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move %doc%\*.xps %dira%\Xps
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move %doc%\*.lnk %dir%\Atalhos
echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
move %doc%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move %doc%\*.bmp,*.cpt,*.dds,*.dib,*.dng,*.emf,*.gif,*.heic,*.ico,*.icon,*.jfif,*.jpeg,*.jpg,*.pcx,*.pic,*.png,*.psd,*.psdx,*.raw,*.tga,*.thm,*.tif,*.tiff,*.wbmp,*.wdp,*.webp %dir%\Imagens
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move %doc%\*.epub,*.mobi %dir%\Livros
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %doc%\*.264,*.3g2,*.3gp,*.arf,*.asf,*.asx,*.avi,*.bik,*.dash,*.dat,*.dvr,*.flv,*.h264,*.m2t,*.m2ts,*.m4v,*.mkv,*.mod,*.mov,*.mp4,*.mpeg,*.mpg,*.mts,*.ogv,*.prproj,*.rec,*.rmvb,*.swf,*.tod,*.tp,*.ts,*.vob,*.webm,*.wlmp,*.wmv %dir%\V¡deos
echo.
echo ___________________________________________________________________________

echo.
echo Fim dos Documentos.
echo.
pause
::------------------------------------------------------------------------------
cls

cd %pic%
::Imagens
echo.
echo Imagens:
echo.

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %pic%\*.exe %dir%\Aplicativos
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move %pic%\*.apk %dira%\Android

echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
move %pic%\*.bat,*.cmd,*.masb %dira%\Batch

echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move %pic%\*.iso,*.img,*.udf %dira%\Isos
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move %pic%\*.js %dira%\Javascript
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move %pic%\*.html %dira%\HTML
echo. 

echo Movendo arquivos para a Office Access...
echo.
move %pic%\*.accdb,*.accdt,*.accde,*.accdr,*.mdb,*.snp "%dira%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move %pic%\*.csv,*.xls,*.xlt,*.xlm,*.xlsx,*.xlsm,*.xltx,*.xltm "%dira%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move %pic%\*.ppt,*.pot,*.pps,*.pptx,*.pptm,*.potx,*.ppam,*.ppsx,*.ppsm,*.sldx,*.sldm "%dira%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move %pic%\*.doc,*.dot,*.wbk,*.docx,*.docm,*.dotx,*.dotm,*.docb "%dira%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move %pic%\*.pgn,*.pks,*.pgi "%dira%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move %pic%\*.pdf %dira%\Pdf
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move %pic%\*.py %dira%\Pynthon
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move %pic%\*.rbxl %dira%\Roblox
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move %pic%\*.rtf %dira%\Rtf
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move %pic%\*.torrent %dira%\Torrents
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move %pic%\*.txt %dira%\Texto
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move %pic%\*.msi "%dira%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move %pic%\*.zip,*.rar,*.7z %dira%\Winrar
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move %pic%\*.xps %dira%\Xps
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move %pic%\*.lnk %dir%\Atalhos
echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
move %pic%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move %pic%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move %pic%\*.epub,*.mobi %dir%\Livros
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %pic%\*.264,*.3g2,*.3gp,*.arf,*.asf,*.asx,*.avi,*.bik,*.dash,*.dat,*.dvr,*.flv,*.h264,*.m2t,*.m2ts,*.m4v,*.mkv,*.mod,*.mov,*.mp4,*.mpeg,*.mpg,*.mts,*.ogv,*.prproj,*.rec,*.rmvb,*.swf,*.tod,*.tp,*.ts,*.vob,*.webm,*.wlmp,*.wmv %dir%\V¡deos
echo.
echo ___________________________________________________________________________

echo.
echo Fim das Imagens:
echo.
pause
::------------------------------------------------------------------------------
cls

cd %mus%
::Músicas
echo.
echo M£sicas:
echo.

:: Movendo Aplicativos
echo ___________________________________________________________________________
echo.
echo -Movendo arquivos para a pasta Aplicativos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %mus%\*.exe %dir%\Aplicativos
echo.
echo ___________________________________________________________________________

:: Movendo Arquivos 
echo.
echo -Movendo arquivos para a pasta Arquivos:
echo.
echo ---------------------------------------------------------------------------
echo Movendo arquivos para a pasta Android...
echo.
move %mus%\*.apk %dira%\Android

echo. 

echo Movendo arquivos para a pasta Batch...
echo.   
move %mus%\*.bat,*.cmd,*.masb %dira%\Batch

echo. 

echo Movendo arquivos para a pasta Isos...
echo.
move %mus%\*.iso,*.img,*.udf %dira%\Isos
echo. 

echo Movendo arquivos para a pasta Javascript...
echo.
move %mus%\*.js %dira%\Javascript
echo. 

echo Movendo arquivos para a pasta HTML...
echo.
move %mus%\*.html %dira%\HTML
echo. 

echo Movendo arquivos para a Office Access...
echo.
move %mus%\*.accdb,*.accdt,*.accde,*.accdr,*.mdb,*.snp "%dira%\Office Access"
echo. 

echo Movendo arquivos para a pasta Office Excel...
echo.
move %mus%\*.csv,*.xls,*.xlt,*.xlm,*.xlsx,*.xlsm,*.xltx,*.xltm "%dira%\Office Excel"
echo. 

echo Movendo arquivos para a pasta Office PowerPoint...
echo.
move %mus%\*.ppt,*.pot,*.pps,*.pptx,*.pptm,*.potx,*.ppam,*.ppsx,*.ppsm,*.sldx,*.sldm "%dira%\Office PowerPoint"
echo. 

echo Movendo arquivos para a pasta Office Word...
echo.
move %mus%\*.doc,*.dot,*.wbk,*.docx,*.docm,*.dotx,*.dotm,*.docb "%dira%\Office Word"
echo. 

echo Movendo arquivos para a pasta Partidas de Xadrez...
echo.
move %mus%\*.pgn,*.pks,*.pgi "%dira%\Partidas de Xadrez"
echo. 

echo Movendo arquivos para a pasta Pdf...
echo.
move %mus%\*.pdf %dira%\Pdf
echo. 

echo Movendo arquivos para a pasta Pynthon...
echo.
move %mus%\*.py %dira%\Pynthon
echo. 

echo Movendo arquivos para a pasta Roblox...
echo.
move %mus%\*.rbxl %dira%\Roblox
echo. 

echo Movendo arquivos para a pasta Rtf...
echo.
move %mus%\*.rtf %dira%\Rtf
echo. 

echo Movendo arquivos para a pasta Torrents...
echo.
move %mus%\*.torrent %dira%\Torrents
echo. 

echo Movendo arquivos para a pasta Texto...
echo.
move %mus%\*.txt %dira%\Texto
echo. 

echo Movendo arquivos para a pasta Microsoft Installer...
echo.
move %mus%\*.msi "%dira%\Microsoft Installer"
echo. 

echo Movendo arquivos para a pasta Winrar...
echo.
move %mus%\*.zip,*.rar,*.7z %dira%\Winrar
echo. 

echo Movendo arquivos para a pasta Xps...
echo.
move %mus%\*.xps %dira%\Xps
echo -------------------------------------------------------------------------

:: Movendo Atalhos
::echo -Movendo arquivos para a pasta Atalhos...
::echo ---------------------------------------------------------------------------
::move %mus%\*.lnk %dir%\Atalhos
echo ___________________________________________________________________________

:: Movendo µudios
echo.
echo -Movendo arquivos para a pasta µudios...
echo.
echo ---------------------------------------------------------------------------
echo.
move %mus%\*.3ga,*.aac,*.aiff,*.amr,*.ape,*.arf,*.asf,*.asx,*.cda,*.dvf,*.flac,*.gp4,*.gp5,*.gpx,*.logic,*.m4a,*.m4b,*.m4p,*.midi,*.mp3,*.ogg,*.opus,*.pcm,*.rec,*.snd,*.sng,*.uax,*.wav,*.wma,*.wpl,*.zab %dir%\µudios
echo.
echo ___________________________________________________________________________

:: Movendo Imagens
echo.
echo -Movendo arquivos para a pasta Imagens...
echo.
echo ---------------------------------------------------------------------------
echo.
move %mus%\*.bmp,*.cpt,*.dds,*.dib,*.dng,*.emf,*.gif,*.heic,*.ico,*.icon,*.jfif,*.jpeg,*.jpg,*.pcx,*.pic,*.png,*.psd,*.psdx,*.raw,*.tga,*.thm,*.tif,*.tiff,*.wbmp,*.wdp,*.webp %dir%\Imagens
echo.
echo ___________________________________________________________________________

:: Movendo Livros
echo.
echo -Movendo arquivos para a pasta Livros...
echo.
echo ---------------------------------------------------------------------------
echo.
move %mus%\*.epub,*.mobi %dir%\Livros
echo.
echo ___________________________________________________________________________

:: Movendo Vídeos
echo.
echo -Movendo arquivos para a pasta V¡deos...
echo.
echo ---------------------------------------------------------------------------
echo.
move %mus%\*.264,*.3g2,*.3gp,*.arf,*.asf,*.asx,*.avi,*.bik,*.dash,*.dat,*.dvr,*.flv,*.h264,*.m2t,*.m2ts,*.m4v,*.mkv,*.mod,*.mov,*.mp4,*.mpeg,*.mpg,*.mts,*.ogv,*.prproj,*.rec,*.rmvb,*.swf,*.tod,*.tp,*.ts,*.vob,*.webm,*.wlmp,*.wmv %dir%\V¡deos
echo.
echo ___________________________________________________________________________

echo.
echo Fim das M£sicas:
echo.
pause
:://////////////////////////////////////////////////////////////////////////////
cls

for /f %%A in ('dir %dir%\Aplicativos ^| find "arquivo(s)"') do set apla=%%A
for /f %%B in ('dir %dir%\Aplicativos ^| find "pasta(s)"') do set aplpsub=%%B
set /a aplp=%aplpsub%-2
IF %apla% GEQ 1 echo Tem %apla% arquivos na pasta Aplicativos
IF %aplp% GEQ 1 echo Tem %aplp% pastas na pasta Aplicativos  
IF %apla% EQU 0 IF %aplp% EQU 0 echo NÆo tem arquivos na pasta Aplicativos & rd %dir%\Aplicativos 

::pause
echo.

for /f %%A in ('dir %dir%\Arquivos ^| find "arquivo(s)"') do set arqa=%%A
for /f %%B in ('dir %dir%\Arquivos ^| find "pasta(s)"') do set arqpsub=%%B
set /a arqp=%arqpsub%-2
IF %arqa% GEQ 1 echo Tem %arqa% arquivos na pasta Arquivos
IF %arqp% GEQ 1 echo Tem %arqp% pastas na pasta Arquivos  
IF %arqa% EQU 0 IF %arqp% EQU 0 echo NÆo tem arquivos na pasta Arquivos & rd %dir%\Arquivos 

::pause
echo.

::Início da pasta Arquivos---------------------------------------------------------

for /f %%A in ('dir %dira%\Android ^| find "arquivo(s)"') do set anda=%%A
for /f %%B in ('dir %dira%\Android ^| find "pasta(s)"') do set andpsub=%%B
set /a andp=%andpsub%-2
IF %anda% GEQ 1 echo Tem %anda% arquivos na pasta Android
IF %andp% GEQ 1 echo Tem %andp% pastas na pasta Android 
IF %anda% EQU 0 IF %andp% EQU 0 echo NÆo tem arquivos na pasta Batch & rd %dira%\Android 

::pause
echo.

for /f %%A in ('dir %dira%\Batch ^| find "arquivo(s)"') do set bata=%%A
for /f %%B in ('dir %dira%\Batch ^| find "pasta(s)"') do set batpsub=%%B
set /a batp=%batpsub%-2
IF %bata% GEQ 1 echo Tem %bata% arquivos na pasta Batch
IF %batp% GEQ 1 echo Tem %batp% pastas na pasta Batch 
IF %bata% EQU 0 IF %batp% EQU 0 echo NÆo tem arquivos na pasta Batch & rd %dira%\Batch 

::pause
echo.

for /f %%A in ('dir %dira%\Isos ^| find "arquivo(s)"') do set isoa=%%A
for /f %%B in ('dir %dira%\Isos ^| find "pasta(s)"') do set isopsub=%%B
set /a isop=%isopsub%-2
IF %isoa% GEQ 1 echo Tem %isoa% arquivos na pasta Isos
IF %isop% GEQ 1 echo Tem %isop% pastas na pasta Isos 
IF %isoa% EQU 0 IF %isop% EQU 0 echo NÆo tem arquivos na pasta Isos & rd %dira%\Isos 

::pause
echo.

for /f %%A in ('dir %dira%\Javascript ^| find "arquivo(s)"') do set jvsa=%%A
for /f %%B in ('dir %dira%\Javascript ^| find "pasta(s)"') do set jvspsub=%%B
set /a jvsp=%jvspsub%-2
IF %jvsa% GEQ 1 echo Tem %jvsa% arquivos na pasta Javascript
IF %jvsp% GEQ 1 echo Tem %jvsp% pastas na pasta Javascript 
IF %jvsa% EQU 0 IF %jvsp% EQU 0 echo NÆo tem arquivos na pasta Javascript & rd %dira%\Javascript 

::pause
echo.

for /f %%A in ('dir %dira%\HTML ^| find "arquivo(s)"') do set htmla=%%A
for /f %%B in ('dir %dira%\HTML ^| find "pasta(s)"') do set htmlpsub=%%B
set /a htmlp=%htmlpsub%-2
IF %htmla% GEQ 1 echo Tem %htmla% arquivos na pasta HTML
IF %htmlp% GEQ 1 echo Tem %htmlp% pastas na pasta HTML 
IF %htmla% EQU 0 IF %htmlp% EQU 0 echo NÆo tem arquivos na pasta HTML & rd %dira%\HTML

::pause
echo.

for /f %%A in ('dir "%dira%\Office Access" ^| find "arquivo(s)"') do set acca=%%A
for /f %%B in ('dir "%dira%\Office Access" ^| find "pasta(s)"') do set accpsub=%%B
set /a accp=%accpsub%-2
IF %acca% GEQ 1 echo Tem %acca% arquivos na pasta Office Access
IF %accp% GEQ 1 echo Tem %accp% pastas na pasta Office Access 
IF %acca% EQU 0 IF %accp% EQU 0 echo NÆo tem arquivos na pasta Office Access & rd "%dira%\Office Access"

::pause
echo.

for /f %%A in ('dir "%dira%\Office Excel" ^| find "arquivo(s)"') do set exca=%%A
for /f %%B in ('dir "%dira%\Office Excel" ^| find "pasta(s)"') do set excpsub=%%B
set /a excp=%excpsub%-2
IF %exca% GEQ 1 echo Tem %exca% arquivos na pasta Office Excel
IF %excp% GEQ 1 echo Tem %excp% pastas na pasta Office Excel 
IF %exca% EQU 0 IF %excp% EQU 0 echo NÆo tem arquivos na pasta Office Excel & rd "%dira%\Office Excel"

::pause
echo.

for /f %%A in ('dir "%dira%\Office PowerPoint" ^| find "arquivo(s)"') do set powa=%%A
for /f %%B in ('dir "%dira%\Office PowerPoint" ^| find "pasta(s)"') do set powpsub=%%B
set /a powp=%powpsub%-2
IF %powa% GEQ 1 echo Tem %powa% arquivos na pasta Office PowerPoint
IF %powp% GEQ 1 echo Tem %powp% pastas na pasta Office PowerPoint 
IF %powa% EQU 0 IF %powp% EQU 0 echo NÆo tem arquivos na pasta Office PowerPoint & rd "%dira%\Office PowerPoint"

::pause
echo.

for /f %%A in ('dir "%dira%\Office Word" ^| find "arquivo(s)"') do set wora=%%A
for /f %%B in ('dir "%dira%\Office Word" ^| find "pasta(s)"') do set worpsub=%%B
set /a worp=%worpsub%-2
IF %wora% GEQ 1 echo Tem %wora% arquivos na pasta Office Word
IF %worp% GEQ 1 echo Tem %worp% pastas na pasta Office Word 
IF %wora% EQU 0 IF %worp% EQU 0 echo NÆo tem arquivos na pasta Office Word & rd "%dira%\Office Word"

::pause
echo.

for /f %%A in ('dir "%dira%\Partidas de Xadrez" ^| find "arquivo(s)"') do set chea=%%A
for /f %%B in ('dir "%dira%\Partidas de Xadrez" ^| find "pasta(s)"') do set chepsub=%%B
set /a chep=%chepsub%-2
IF %chea% GEQ 1 echo Tem %chea% arquivos na pasta Partidas de Xadrez
IF %chep% GEQ 1 echo Tem %chep% pastas na pasta Partidas de Xadrez 
IF %chea% EQU 0 IF %chep% EQU 0 echo NÆo tem arquivos na pasta Partidas de Xadrez & rd "%dira%\Partidas de Xadrez"

::pause
echo.

for /f %%A in ('dir %dira%\Pdf ^| find "arquivo(s)"') do set pdfa=%%A
for /f %%B in ('dir %dira%\Pdf ^| find "pasta(s)"') do set pdfpsub=%%B
set /a pdfp=%pdfpsub%-2
IF %pdfa% GEQ 1 echo Tem %pdfa% arquivos na pasta Pdf
IF %pdfp% GEQ 1 echo Tem %pdfp% pastas na pasta Pdf 
IF %pdfa% EQU 0 IF %pdfp% EQU 0 echo NÆo tem arquivos na pasta Pdf & rd %dira%\Pdf

::pause
echo.

for /f %%A in ('dir %dira%\Pynthon ^| find "arquivo(s)"') do set pyna=%%A
for /f %%B in ('dir %dira%\Pynthon ^| find "pasta(s)"') do set pynpsub=%%B
set /a pynp=%pynpsub%-2
IF %pyna% GEQ 1 echo Tem %pyna% arquivos na pasta Pynthon
IF %pynp% GEQ 1 echo Tem %pynp% pastas na pasta Pynthon 
IF %pyna% EQU 0 IF %pynp% EQU 0 echo NÆo tem arquivos na pasta Pynthon & rd %dira%\Pynthon

::pause
echo.

for /f %%A in ('dir %dira%\Roblox ^| find "arquivo(s)"') do set roba=%%A
for /f %%B in ('dir %dira%\Roblox ^| find "pasta(s)"') do set robpsub=%%B
set /a robp=%robpsub%-2
IF %roba% GEQ 1 echo Tem %roba% arquivos na pasta Roblox
IF %robp% GEQ 1 echo Tem %robp% pastas na pasta Roblox
IF %roba% EQU 0 IF %robp% EQU 0 echo NÆo tem arquivos na pasta Roblox & rd %dira%\Roblox

::pause
echo.

for /f %%A in ('dir %dira%\Rtf ^| find "arquivo(s)"') do set rtfa=%%A
for /f %%B in ('dir %dira%\Rtf ^| find "pasta(s)"') do set rtfpsub=%%B
set /a rtfp=%rtfpsub%-2
IF %rtfa% GEQ 1 echo Tem %rtfa% arquivos na pasta Rtf
IF %rtfp% GEQ 1 echo Tem %rtfp% pastas na pasta Rtf
IF %rtfa% EQU 0 IF %rtfp% EQU 0 echo NÆo tem arquivos na pasta Rtf & rd %dira%\Rtf

::pause
echo.

for /f %%A in ('dir %dira%\Torrents ^| find "arquivo(s)"') do set tora=%%A
for /f %%B in ('dir %dira%\Torrents ^| find "pasta(s)"') do set torpsub=%%B
set /a torp=%torpsub%-2
IF %tora% GEQ 1 echo Tem %tora% arquivos na pasta Torrents
IF %torp% GEQ 1 echo Tem %torp% pastas na pasta Torrents
IF %tora% EQU 0 IF %torp% EQU 0 echo NÆo tem arquivos na pasta Torrents & rd %dira%\Torrents

::pause
echo.

for /f %%A in ('dir %dira%\Texto ^| find "arquivo(s)"') do set txta=%%A
for /f %%B in ('dir %dira%\Texto ^| find "pasta(s)"') do set txtpsub=%%B
set /a txtp=%txtpsub%-2
IF %txta% GEQ 1 echo Tem %txta% arquivos na pasta Texto
IF %txtp% GEQ 1 echo Tem %txtp% pastas na pasta Texto
IF %txta% EQU 0 IF %txtp% EQU 0 echo NÆo tem arquivos na pasta Texto & rd %dira%\Texto

::pause
echo.

for /f %%A in ('dir "%dira%\Microsoft Installer" ^| find "arquivo(s)"') do set msia=%%A
for /f %%B in ('dir "%dira%\Microsoft Installer" ^| find "pasta(s)"') do set msipsub=%%B
set /a msip=%msipsub%-2
IF %msia% GEQ 1 echo Tem %msia% arquivos na pasta Microsoft Installer
IF %msip% GEQ 1 echo Tem %msip% pastas na pasta Microsoft Installer
IF %msia% EQU 0 IF %msip% EQU 0 echo NÆo tem arquivos na pasta Microsoft Installer & rd "%dira%\Microsoft Installer"

::pause
echo.

for /f %%A in ('dir %dira%\Winrar ^| find "arquivo(s)"') do set wina=%%A
for /f %%B in ('dir %dira%\Winrar ^| find "pasta(s)"') do set winpsub=%%B
set /a winp=%winpsub%-2
IF %wina% GEQ 1 echo Tem %wina% arquivos na pasta Winrar
IF %winp% GEQ 1 echo Tem %winp% pastas na pasta Winrar
IF %wina% EQU 0 IF %winp% EQU 0 echo NÆo tem arquivos na pasta Winrar & rd %dira%\Winrar

::pause 
echo.

for /f %%A in ('dir %dira%\Xps ^| find "arquivo(s)"') do set xpsa=%%A
for /f %%B in ('dir %dira%\Xps ^| find "pasta(s)"') do set xpspsub=%%B
set /a xpsp=%xpspsub%-2
IF %xpsa% GEQ 1 echo Tem %xpsa% arquivos na pasta Xps
IF %xpsp% GEQ 1 echo Tem %xpsp% pastas na pasta Xps
IF %xpsa% EQU 0 IF %xpsp% EQU 0 echo NÆo tem arquivos na pasta Xps, ela será apagada & rd %dira%\Xps

::pause
echo.

::Fim da pasta Arquivos---------------------------------------------------------

::for /f %%A in ('dir %dir%\Atalhos ^| find "arquivo(s)"') do set ataa=%%A
::for /f %%B in ('dir %dir%\Atalhos ^| find "pasta(s)"') do set atapsub=%%B
::set /a atap=%atapsub%-2
::IF %ataa% GEQ 1 echo Tem %ataa% arquivos na pasta Atalhos
::IF %atap% GEQ 1 echo Tem %atap% pastas na pasta Atalhos  
::IF %ataa% EQU 0 IF %atap% EQU 0 echo NÆo tem arquivos na pasta Atalhos & rd %dir%\Atalhos 

::pause
echo.

for /f %%A in ('dir %dir%\µudios ^| find "arquivo(s)"') do set auda=%%A
for /f %%B in ('dir %dir%\µudios ^| find "pasta(s)"') do set audpsub=%%B
set /a audp=%audpsub%-2
IF %auda% GEQ 1 echo Tem %auda% arquivos na pasta µudios
IF %audp% GEQ 1 echo Tem %audp% pastas na pasta µudios  
IF %auda% EQU 0 IF %audp% EQU 0 echo NÆo tem arquivos na pasta µudios & rd %dir%\µudios 

::pause
echo.

for /f %%A in ('dir %dir%\Imagens ^| find "arquivo(s)"') do set imaa=%%A
for /f %%B in ('dir %dir%\Imagens ^| find "pasta(s)"') do set imapsub=%%B
set /a imap=%imapsub%-2
IF %imaa% GEQ 1 echo Tem %imaa% arquivos na pasta Imagens
IF %imap% GEQ 1 echo Tem %imap% pastas na pasta Imagens  
IF %imaa% EQU 0 IF %imap% EQU 0 echo NÆo tem arquivos na pasta Imagens & rd %dir%\Imagens

::pause
echo.

for /f %%A in ('dir %dir%\Livros ^| find "arquivo(s)"') do set liva=%%A
for /f %%B in ('dir %dir%\Livros ^| find "pasta(s)"') do set livpsub=%%B
set /a livp=%livpsub%-2
IF %liva% GEQ 1 echo Tem %liva% arquivos na pasta Livros
IF %livp% GEQ 1 echo Tem %livp% pastas na pasta Livros 
IF %liva% EQU 0 IF %livp% EQU 0 echo NÆo tem arquivos na pasta Livros & rd %dir%\Livros

::pause
echo.

for /f %%A in ('dir %dir%\V¡deos ^| find "arquivo(s)"') do set vida=%%A
for /f %%B in ('dir %dir%\V¡deos ^| find "pasta(s)"') do set vidpsub=%%B
set /a vidp=%vidpsub%-2
IF %vida% GEQ 1 echo Tem %vida% arquivos na pasta V¡deos
IF %vidp% GEQ 1 echo Tem %vidp% pastas na pasta V¡deos 
IF %vida% EQU 0 IF %vidp% EQU 0 echo NÆo tem arquivos na pasta V¡deos & rd %dir%\V¡deos

echo.
pause