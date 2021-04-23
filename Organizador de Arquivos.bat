@echo off

echo ______                                    _       _     _                            
echo ^|  _  \                                  ^| ^|     (_)   ^| ^|                         _ 
echo ^| ^| ^| ^|___  ___  ___  ___ _ ____   _____ ^| ^|_   ___  __^| ^| ___    _ __   ___  _ __(_)
echo ^| ^| ^| / _ \/ __^|/ _ \/ __^| '_ \ \ / / _ \^| \ \ / / ^|/ _` ^|/ _ \  ^| '_ \ / _ \^| '__^|  
echo ^| ^|/ /  __/\__ \  __/\__ \ ^| ^| \ V / (_) ^| ^|\ V /^| ^| (_^| ^| (_) ^| ^| ^|_) ^| (_) ^| ^|   _ 
echo ^|___/ \___^|^|___/\___^|^|___/_^| ^|_^|\_/ \___/^|_^| \_/ ^|_^|\__,_^|\___/  ^| .__/ \___/^|_^|  (_)
echo                                                                  ^| ^|                 
echo                                                                  ^|_^|                 
echo ______   _ _              _   _      _ _ _  ___  ___           _   _                 
echo ^|  ___^| ^| (_)            ^| \ ^| ^|    ^| ^| (_) ^|  \/  ^|          ^| ^| (_)                
echo ^| ^|_ ___^| ^|_ _ __   ___  ^|  \^| ^| ___^| ^| ^|_  ^| .  . ^| __ _ _ __^| ^|_ _ _ __  ___       
echo ^|  _/ _ \ ^| ^| '_ \ / _ \ ^| . ` ^|/ _ \ ^| ^| ^| ^| ^|\/^| ^|/ _` ^| '__^| __^| ^| '_ \/ __^|      
echo ^| ^|^|  __/ ^| ^| ^|_) ^|  __/ ^| ^|\  ^|  __/ ^| ^| ^| ^| ^|  ^| ^| (_^| ^| ^|  ^| ^|_^| ^| ^| ^| \__ \      
echo \_^| \___^|_^|_^| .__/ \___^| \_^| \_/\___^|_^|_^|_^| \_^|  ^|_/\__,_^|_^|   \__^|_^|_^| ^|_^|___/      
echo             ^| ^|                                                                      
echo             ^|_^|                                                                      

pause>nul

:://////////////////////////////////////////////////////////////////////////////

cls

set dirFolders=C:\Users\%username%\Desktop
set dirFoldersFiles=C:\Users\%username%\Desktop\Arquivos

set "desktopFolders="Aplicativos" "Arquivos" "µudios" "Imagens" "Livros" "V¡deos""
set "fileFolders="Android" "Batch" "Isos" "Javascript" "HTML" "Office Access" "Office Excel" "Office PowerPoint" "Office Word" "Partidas de Xadrez" "Pdf" "Pynthon" "Roblox" "Rtf" "Torrents" "Texto" "Microsoft Installer" "Winrar" "Xps""

set doc=C:\Users\%username%\Documents
set dow=C:\Users\%username%\Downloads
set pic=C:\Users\%username%\Pictures
set mus=C:\Users\%username%\Music
set vid=C:\Users\%username%\Videos

:://////////////////////////////////////////////////////////////////////////////

:Folder_Creation
setlocal enabledelayedexpansion
	echo ---------------------------------------------------------------------------
	::(Área de Trabalho)Confere se as pastas existem e caso não existam cria elas
	echo Área de Trabalho
	echo.
	for %%a in (%desktopFolders%) do (
		set dirOFCDesk=%%a
		set dirNoQuotesOFCDesk=!dirOFCDesk:"=!
		cd %dirFolders%
		IF /i NOT EXIST !dirOFCDesk! (
			md !dirOFCDesk!
			echo A pasta !dirNoQuotesOFCDesk! ser  criada.
		) ELSE (
			echo A pasta !dirNoQuotesOFCDesk! j  est  criada.
		)
	echo.
	)
	echo ____________________________________________________________________________
	echo Pasta Arquivos:
	echo.
	for %%a in (%fileFolders%) do (
		set dirOFCArquivos=%%a
		set dirNoQuotesOFCArquivos=!dirOFCArquivos:"=!
		cd %dirFoldersFiles%
		IF /i NOT EXIST !dirOFCArquivos! (
			md !dirOFCArquivos! 
			echo A pasta !dirNoQuotesOFCArquivos! ser  criada.
		) ELSE (
			echo A pasta !dirNoQuotesOFCArquivos! j  est  criada.
		)
	echo.
	)
	echo ---------------------------------------------------------------------------
	pause
	cls
endlocal
goto :Mover_Arquivos

:://////////////////////////////////////////////////////////////////////////////

:Mover_Arquivos
setlocal enabledelayedexpansion
	for %%a in (%dirFolders% %doc% %dow% %pic% %mus% %vid%) do (
		cd %%a
		if %%a equ %dirFolders% (
			set verif=dir
			echo.
			echo µrea de Trabalho:
			echo %%a
			echo.
		)
		if %%a equ %doc% (
			set verif=doc
			echo.
			echo Documentos:
			echo %%a
			echo.
		)
		if %%a equ %dow% (
			set verif=dow
			echo.
			echo Downloads:
			echo %%a
			echo.
		)
		if %%a equ %pic% (
			set verif=pic
			echo.
			echo Imagens:
			echo %%a
			echo.
		)
		if %%a equ %mus% (
			set verif=mus
			echo.
			echo µudios:
			echo %%a
			echo.
		)
		if %%a equ %vid% (
			set verif=vid
			echo.
			echo V¡deos:
			echo %%a
			echo.
		)
		:: Movendo Aplicativos
		echo ___________________________________________________________________________
		echo.
		echo -Movendo arquivos para a pasta Aplicativos...
		echo.
		echo ---------------------------------------------------------------------------
		echo.
		for %%b  in (*.exe) do (echo Arquivo movido: %%b && move "%%b" "%dirFolders%\Aplicativos")
		echo.
		echo ___________________________________________________________________________

		:: Movendo Arquivos 
		echo.
		echo -Movendo arquivos para a pasta Arquivos:
		echo.
		echo ---------------------------------------------------------------------------
		echo Movendo arquivos para a pasta Android...
		echo.
		for %%b  in (*.apk) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Android")
		echo. 

		echo Movendo arquivos para a pasta Batch...
		echo.   
		for %%b  in (*.bat *.cmd *.masb) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Batch")
		echo. 

		echo Movendo arquivos para a pasta Isos...
		echo.
		for %%b  in (*.iso *.img *.udf) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Isos")
		echo. 

		echo Movendo arquivos para a pasta Javascript...
		echo.
		for %%b  in (*.js) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Javascript")
		echo. 

		echo Movendo arquivos para a pasta HTML...
		echo.
		for %%b  in (*.html) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\HTML")
		echo. 

		echo Movendo arquivos para a Office Access...
		echo.
		for %%b  in (*.accdb *.accdt *.accde *.accdr *.mdb *.snp) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Office Access")
		echo. 

		echo Movendo arquivos para a pasta Office Excel...
		echo.
		for %%b  in (*.csv *.xls *.xlt *.xlm *.xlsx *.xlsm *.xltx *.xltm) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Office Excel")
		echo. 

		echo Movendo arquivos para a pasta Office PowerPoint...
		echo.
		for %%b  in (*.ppt *.pot *.pps *.pptx *.pptm *.potx *.ppam *.ppsx *.ppsm *.sldx *.sldm) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Office PowerPoint")
		echo. 

		echo Movendo arquivos para a pasta Office Word...
		echo.
		for %%b  in (*.doc *.dot *.docx *.docm *.dotx *.dotm *.docb *.wbk) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Office Word")
		echo. 

		echo Movendo arquivos para a pasta Partidas de Xadrez...
		echo.
		for %%b  in (*.pgn *.pks *.pgi) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Partidas de Xadrez")
		echo. 

		echo Movendo arquivos para a pasta Pdf...
		echo.
		for %%b  in (*.pdf) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Pdf")
		echo. 

		echo Movendo arquivos para a pasta Pynthon...
		echo.
		for %%b  in (*.py) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Pynthon")
		echo. 

		echo Movendo arquivos para a pasta Roblox...
		echo.
		for %%b  in (*.rbxl) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Roblox")
		echo. 

		echo Movendo arquivos para a pasta Rtf...
		echo.
		for %%b  in (*.rtf) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Rtf")
		echo. 

		echo Movendo arquivos para a pasta Torrents...
		echo.
		for %%b  in (*.torrent) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Torrents")
		echo. 

		echo Movendo arquivos para a pasta Texto...
		echo.
		for %%b  in (*.txt) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Texto")
		echo. 

		echo Movendo arquivos para a pasta Microsoft Installer...
		echo.
		for %%b  in (*.msi) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Microsoft Installer")
		echo. 

		echo Movendo arquivos para a pasta Winrar...
		echo.
		for %%b  in (*.7z *.rar *.zip) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Winrar")
		echo. 

		echo Movendo arquivos para a pasta Xps...
		echo.
		for %%b  in (*.xps) do (echo Arquivo movido: %%b && move "%%b" "%dirFoldersFiles%\Xps")
		echo -------------------------------------------------------------------------

		echo ___________________________________________________________________________

		:: Movendo µudios
		echo.
		echo -Movendo arquivos para a pasta µudios...
		echo.
		echo ---------------------------------------------------------------------------
		echo.
		for %%b  in (*.3ga *.aac *.aiff *.amr *.ape *.arf *.asf *.asx *.cda *.dvf *.flac *.gp4 *.gp5 *.gpx *.logic *.m4a *.m4b *.m4p *.midi *.mp3 *.ogg *.opus *.pcm *.rec *.snd *.sng *.uax *.wav *.wma *.wpl *.zab) do (echo Arquivo movido: %%b && move "%%b" "%dirFolders%\µudios")
		echo.
		echo ___________________________________________________________________________

		:: Movendo Imagens
		echo.
		echo -Movendo arquivos para a pasta Imagens...
		echo.
		echo ---------------------------------------------------------------------------
		echo.
		for %%b  in (*.bmp *.cpt *.dds *.dib *.dng *.emf *.gif *.heic *.ico *.icon *.jfif *.jpeg *.jpg *.pcx *.pic *.png *.psd *.psdx *.raw *.tga *.thm *.tif *.tiff *.wbmp *.zab) do (echo Arquivo movido: %%b && move "%%b" "%dirFolders%\Imagens")
		echo.
		echo ___________________________________________________________________________

		:: Movendo Livros
		echo.
		echo -Movendo arquivos para a pasta Livros...
		echo.
		echo ---------------------------------------------------------------------------
		echo.
		for %%b  in (*.epub *.mobi) do (echo Arquivo movido: %%b && move "%%b" "Livros")
		echo.
		echo ___________________________________________________________________________

		:: Movendo Vídeos
		echo.
		echo -Movendo arquivos para a pasta V¡deos...
		echo.
		echo ---------------------------------------------------------------------------
		echo.
		for %%b  in (*.264 *.3g2 *.3gp *.arf *.asf *.asx *.avi *.bik *.dash *.dat *.dvr *.flv *.h264 *.m2t *.m2ts *.m4v *.mkv *.mod *.mov *.mp4 *.mpeg *.mpg *.mts *.ogv *.prproj *.rec *.rmvb *.swf *.tod *.tp *.ts *.vob *.webm *.wlmp *.wmv) do (echo Arquivo movido: %%b && move "%%b" "%dirFolders%\V¡deos")
		echo.
		if !verif!==dir (
			set "verif="
			echo ___________________________________________________________________________
			echo.
			echo Fim da µrea de Trabalho:
			echo.
			pause
			cls
		)
		if !verif!==doc (
			set "verif="
			echo.
			echo Fim dos Documentos:
			echo.
			pause
			cls
		)
		if !verif!==dow (
			set "verif="
			echo ___________________________________________________________________________
			echo.
			echo Fim dos Downloads:
			echo.
			pause
			cls
		)
		if !verif!==pic (
			set "verif="
			echo ___________________________________________________________________________
			echo.
			echo Fim das Imagens:
			echo.
			pause	
			cls
		)
		if !verif!==mus (
			set "verif="
			echo ___________________________________________________________________________
			echo.
			echo Fim dos µudios:
			echo.
			pause
			cls
		)
		if !verif!==vid (
			set "verif="
			echo ___________________________________________________________________________
			echo.
			echo Fim dos V¡deos:
			echo.
			pause
			cls
			goto :Delete_Folders
		)
	)
endlocal
:://////////////////////////////////////////////////////////////////////////////

:Delete_Folders

cd %dirFolders%
cls
setlocal enabledelayedexpansion
	for %%a in (%fileFolders% %desktopFolders%) do (
		set dirODF=%%a
		set dirNoQuotesODF=!dirODF:"=!
		set "dirCommandPath="
		set /a "existFiles=0" 
		set /a "numFiles=0"
		set /a "numFolders=0"
		echo.
		dir "%dirFolders%" | find /i "DIR" | find /i !dirODF! >nul
		if !errorlevel! equ 0 (
			set dirCommandPath=%dirFolders%
			echo µrea de Trabalho:
			echo.
		)
		if !errorlevel! equ 1 (
			set dirCommandPath=%dirFoldersFiles%
			echo Pasta "Arquivos":
			echo.
		) 
		echo Pasta !dirODF:"=!:
		echo.
		if defined dirCommandPath (
			for /f %%b in ('dir "!dirCommandPath!\!dirNoQuotesODF!" ^| find "arquivo(s)"') do (
				set /a "numFiles=%%b"
			)
			for /f %%c in ('dir "!dirCommandPath!\!dirNoQuotesODF!" ^| find "pasta(s)"') do (
                echo.
                set /a "numFolders=%%c"
                set /a "numFolders=!numFolders!-2"
            )
            if !numFiles! geq 1 (
                set /a existFiles=1
            ) else (
                if !numFolders! geq 1 (
                    set /a existFiles=1
                )
            )
            if !existFiles! equ 1 (
                echo Tem !numFiles! arquivos e !numFolders! pastas na pasta !dirNoQuotesODF!
            ) else (
				if not !existFiles! equ 1 (
					echo NÆo tem arquivos ou pastas na pasta !dirNoQuotesODF!, ela ser  apagada
					echo Apagando na Pasta arquivos...
					rd "!dirCommandPath!\!dirNoQuotesODF!"
				)
			)
		) else (
			echo Erro ao definir dirCommandPath
			pause>nul
		)
		echo.
		pause>nul
		cls
	)
endlocal	