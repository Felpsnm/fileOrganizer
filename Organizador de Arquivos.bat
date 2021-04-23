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

cls
:://////////////////////////////////////////////////////////////////////////////
::<--Getting Serial-->
for /f %%a in ('wmic baseboard get /format:list ^| find /i "SerialNumber"') do (set BBS=%%a)
goto :Início

::<--Criando Ponto de Restauração-->
for /f %%a in ('wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE%", 100, 7 ^| find /i "ReturnValue"') do (set /a RestPointTest=%%a)
if RestPointTest equ 1 (
	echo Houve um erro ao criar um Ponto de Restauração, entre em contato com o desenvolvedor do programa.
	pause
	exit
) else (
	echo Ponto de Restauração criado com sucesso!
	pause>nul
)

::<--Verificando a Arquitetura do Sistema Operacional-->
:Início
for /f %%a in ('wmic os get /format:list ^| find /i "OSArchitecture"') do (set /a OSArc=%%a)
if %OSArc% equ 32 (
	if not exist "C:\Program Files (x86)\FileOrganizer\" (
		set "FilOrgDir=C:\Program Files (x86)\FileOrganizer\"	
		md "C:\Program Files (x86)\FileOrganizer\"
	)
)
if %OSArc% equ 64 (
	if not exist "C:\Program Files\FileOrganizer\" (
		set "FilOrgDir=C:\Program Files\FileOrganizer\"
		md "C:\Program Files\FileOrganizer\"
	)
)
cd C:\Program Files\FileOrganizer\
:://////////////////////////////////////////////////////////////////////////////
	for /f %%a in ('wmic baseboard get /format:list ^| find /i "SerialNumber"') do (set BBS2=%%a)
	if %BBS:~13% equ %BBS2:~13% ( 
		goto :Menu_Principal 
	) else ( 
		goto :Fake_Copy 
	)
	
	:Fake_Copy
		echo Esta cópia não é original, entre em contato com o desenvolvedor do Programa
		pause>nul
		exit

	:Menu_Principal
	echo.
	echo Escolha:
	echo 1)Organizador de Arquivos    2)Configurações    3)Sair
	echo.
	choice /c 123 /n /m "Digite> "
	
	if %errorlevel% equ 1 ( cls & goto :Organizador_de_Arquivos )
	if %errorlevel% equ 2 ( cls & goto :Configurações_Menu )
	if %errorlevel% equ 3 ( exit )
	
		:Configurações_Menu
		echo Escolha:
		echo 1)Agendamento de Organização  2)Cancelar Agendamento    3)Voltar
		echo.
		choice /c 123 /n /m "Digite> "
		
		if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento )
		if %errorlevel% equ 2 ( cls & goto :Cancelar_Agendamento )
		if %errorlevel% equ 3 ( cls & goto :Menu_Principal )
		
			:Configurações_Agendamento
			echo.
			echo Escolha de que forma o programa deve ser executado automáticamente:
			echo 1)Por minutos    2)Por hora                 3)Diáriamente        4)Semanalmente    
			echo 5)Mensal         6)Ao ligar o Computador    7)Ao ficar Ocioso    8)Apenas uma vez
			echo 9)Voltar
			echo.
			choice 	/c 123456789 /n /m "Digite> "
			
			if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento_Minuto )
			if %errorlevel% equ 2 ( cls & goto :Configurações_Agendamento_Hora )
			if %errorlevel% equ 3 ( cls & goto :Configurações_Agendamento_Dia )
			if %errorlevel% equ 4 ( cls & goto :Configurações_Agendamento_Semana )
			if %errorlevel% equ 5 ( cls & goto :Configurações_Agendamento_Mes )
			if %errorlevel% equ 6 ( cls & goto :Configurações_Agendamento_OnStart )
			if %errorlevel% equ 7 ( cls & goto :Configurações_Agendamento_OnIdle )
			if %errorlevel% equ 8 ( cls & goto :Configurações_Agendamento_UmaVez )
			if %errorlevel% equ 9 ( cls & goto :Configurações_Menu )
			
				:Configurações_Agendamento_Minuto
				echo.
				echo O que você deseja fazer?
				echo 1)Definir horário de início    2)Definir horário final/duração                             3)Definir repetição
				echo 4)Definir atraso               5)Especificar um período máximo de tempo para uma Tarefa    6)Finalizar
				echo 7)Cancelar
				echo.
				choice /c 1234567 /n /m "Digite> "
				
				
				set "schType=minute"
				echo Digite com que frequência o programa deve ser executado automáticamente (1-1439 minutos):
				echo.
				set /p "schMo="
				if %schMo% gtr 1439 (
					set /a "schMo="
					echo ERRO: Digite um valor entre 1 e 1439!
					pause>nul
					cls
					goto :Configurações_Agendamento_Minuto
				) else (
					if %schMo% lss 1 (	
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 1439!
						pause>nul
						cls
						goto :Configurações_Agendamento_Minuto
					) else (
						echo A tarefa será executada a cada %schMo% minutos.
						pause>nul
						goto :Agendamento_Minuto
					)
				)
				
					:Agendamento_Minuto
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %schType% /mo %schMo% /tn FileOrganizer /tr %FilOrgDir%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "schType="
						set "schMo="
						cls
						goto :Menu_Principal
					)
				
				:Configurações_Agendamento_Hora
				set "schType=hourly"
				echo Digite com que frequência o programa deve ser executado automáticamente(1-23 horas):
				echo.
				set /p "schMo="
				if %schMo% gtr 23 (
					set /a "schMo="
					echo ERRO: Digite um valor entre 1 e 23!
					pause>nul
					cls
					goto :Configurações_Agendamento_Hora
				) else (
					if %schMo% lss 1 (	
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 23!
						pause>nul
						cls
						goto :Configurações_Agendamento_Hora
					) else (
						echo A tarefa será executada a cada %schMo% horas.
						pause>nul
						goto :Agendamento_Hora
					)
				)
				
					:Agendamento_Hora
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %schType% /mo %schMo% /tn FileOrganizer /tr %FilOrgDir%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "schType="
						set "schMo="
						cls
						goto :Menu_Principal
					)
				
				:Configurações_Agendamento_Dia
				set "schType=daily"
				echo Digite com que frequência o programa deve ser executado automáticamente(1-365 dias):
				echo.
				set /p "schMo="
				if %schMo% gtr 365 (
					set /a "schMo="
					echo ERRO: Digite um valor entre 1 e 365!
					pause>nul
					cls
					goto :Configurações_Agendamento_Dia
				) else (
					if %schMo% lss 1 (	
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 365!
						pause>nul
						cls
						goto :Configurações_Agendamento_Dia
					) else (
						echo A tarefa será executada a cada %schMo% dias.
						pause>nul
						goto :Agendamento_Dia
					)
				)
				
					:Agendamento_Dia
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %schType% /mo %schMo% /tn FileOrganizer /tr %FilOrgDir%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "schType="
						set "schMo="
						cls
						goto :Menu_Principal
					)
				
				:Configurações_Agendamento_Semana
				set "schType=weekly"
				echo Digite com que frequência o programa deve ser executado automáticamente(1-52 semanas):
				echo.
				set /p "schMo="
				if %schMo% gtr 52 (
					set /a "schMo="
					echo ERRO: Digite um valor entre 1 e 52!
					pause>nul
					cls
					goto :Configurações_Agendamento_Semana
				) else (
					if %schMo% lss 1 (	
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 52!
						pause>nul
						cls
						goto :Configurações_Agendamento_Semana
					) else (
						echo A tarefa será executada a cada %schMo% semanas.
						pause>nul
						goto :Agendamento_Semana
					)
				)
				
					:Agendamento_Semana
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %schType% /mo %schMo% /tn FileOrganizer /tr %FilOrgDir%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "schType="
						set "schMo="
						cls
						goto :Menu_Principal
					)
				
				:Configurações_Agendamento_Mes
				set "schType=monthly"
				echo Digite com que frequência o programa deve ser executado automáticamente(1-12 meses):
				echo.
				set /p "schMo="
				if %schMo% gtr 12 (
					set /a "schMo="
					echo ERRO: Digite um valor entre 1 e 12!
					pause>nul
					cls
					goto :Configurações_Agendamento_Mes
				) else (
					if %schMo% lss 1 (	
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 12!
						pause>nul
						cls
						goto :Configurações_Agendamento_Mes
					) else (
						echo A tarefa será executada a cada %schMo% meses.
						pause>nul
						goto :Agendamento_Mes
					)
				)
				
					:Agendamento_Mes
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %schType% /mo %schMo% /tn FileOrganizer /tr %FilOrgDir%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "schType="
						set "schMo="
						cls
						goto :Menu_Principal
					)
				
				:Configurações_Agendamento_OnStart
				set "schType=Minute"
				echo Digite com que frequência o programa deve ser executado automáticamente:
				echo.
				set /p schMo=
				
				:Configurações_Agendamento_OnIdle
				set "schType=Minute"
				echo Digite com que frequência o programa deve ser executado automáticamente:
				echo.
				set /p schMo=
				
				:Configurações_Agendamento_UmaVez
				set "schType=Minute"
			
			:Cancelar_Agendamento
			schtasks /query /fo list /tn "FileOrganizer">nul
			if %errorlevel% equ 0 (
				schtasks /delete /tn "FileOrganizer" /f
				pause>nul
				cls
			)
			goto :Configurações_Menu
			:://////////////////////////////////////////////////////////////////////////////
	
	:Organizador_de_Arquivos
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