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

:Get_Serial
	for /f %%a in ('wmic baseboard get /format:list ^| find /i "SerialNumber"') do (set BBS=%%a)
	goto :Home	


::<--Criando Ponto de Restauração-->

:Restauration_Point
	for /f %%a in ('wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE%", 100, 7 ^| find /i "ReturnValue"') do (set /a RestorePointTest=%%a)
	if RestorePointTest equ 1 (
		echo Houve um erro ao criar um Ponto de Restauração, entre em contato com o desenvolvedor do programa.
		pause
		exit
	) else (
		echo Ponto de Restauração criado com sucesso!
		pause>nul
	)


::<--Verificando a Arquitetura do Sistema Operacional-->

:Arc_Verify
	for /f %%a in ('wmic os get /format:list ^| find /i "OSArchitecture"') do (set /a OSArc=%%a)
	if %OSArc% equ 32 (
		if exist "C:\Program Files (x86)\" ( 
			if not exist "C:\Program Files (x86)\FileOrganizer\" (
				set "FileOrg_Directory=C:\Program Files (x86)\FileOrganizer\"	
				md "C:\Program Files (x86)\FileOrganizer\"
			) else (
				set "FileOrg_Directory=C:\Program Files (x86)\FileOrganizer\"
			)
		) else (
			cls
			echo Erro: Não foi possível encontrar a pasta "C:\Program Files (x86)\", entre em contato com o desenvolvedor do programa.
			pause>nul
			exit
		)
	)
	if %OSArc% equ 64 (
		if exist "C:\Program Files\" ( 
			if not exist "C:\Program Files\FileOrganizer\"(
				md "C:\Program Files\FileOrganizer\"
				set "FileOrg_Directory=C:\Program Files\FileOrganizer\"
			) else (
				set "FileOrg_Directory=C:\Program Files\FileOrganizer\"
			)
		) else (
			cls
			echo Erro: Não foi possível encontrar a pasta "C:\Program Files\", entre em contato com o desenvolvedor do programa.
			pause>nul
			exit
		)
	)
	cd %FileOrg_Directory%


:://////////////////////////////////////////////////////////////////////////////
:Integrity_Verify
	for /f %%a in ('wmic baseboard get /format:list ^| find /i "SerialNumber"') do (set BBS2=%%a)
	if %BBS:~13% equ %BBS2:~13% ( 
		goto :Home 
	) else ( 
		goto :Fake_Copy 
	)

	:Fake_Copy
		echo Esta cópia não é original, entre em contato com o desenvolvedor do Programa
		pause>nul
		exit

:Home	

::<--Definindo Escolha de executar Organização de Arquivos ou de Pastas-->

cls
echo Escolha:
echo 1)Organizador de Arquivos    2)Organizador de Pastas    3)Sair
echo.
choice /c 123 /n /m "Digite> "

if %errorlevel% equ 1 ( cls & goto :Organizador_de_Arquivos )
if %errorlevel% equ 2 ( cls & goto :Organizador_de_Pastas )
if %errorlevel% equ 3 ( exit )

	:Organizador_de_Arquivos
	
	echo Escolha:
	echo 1)Executar    2)Configurar   3)Voltar
	echo.
	choice /c 123 /n /m "Digite> "
	
	if %errorlevel% equ 1 ( cls & goto :Exec_Organizador_de_Arquivos )
	if %errorlevel% equ 2 ( cls & goto :Configurar_Organizador_de_Arquivos )
	if %errorlevel% equ 3 ( cls & goto :Home )
	
		:Configurar_Organizador_de_Arquivos
		
		::<--Definindo Escolha de Iniciar Agendamento ou Cancelar Agendamento Existente-->
		
		echo Escolha:
		echo 1)Agendamento de Organização    2)Cancelar Agendamento    3)Voltar
		echo.
		choice /c 123 /n /m "Digite> "
		
		if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento )
		if %errorlevel% equ 2 ( cls & goto :Cancelar_Agendamento )
		if %errorlevel% equ 3 ( cls & goto :Organizador_de_Arquivos )
		
			:Configurações_Agendamento
			
			::<--Definindo Escolha de Tipo de Agendamento (/sc)-->
			
			echo.
			echo Escolha de que forma o programa deve ser executado automáticamente:
			echo 1)Por minutos    2)Por hora                 3)Diáriamente        4)Semanalmente    
			echo 5)Mensal         6)Ao ligar o Computador    7)Ao ficar Ocioso    8)Apenas uma vez
			echo 9)Voltar
			echo.
			choice 	/c 123456789 /n /m "Digite> "
			
			if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento_Minuto_Var )
			if %errorlevel% equ 2 ( cls & goto :Configurações_Agendamento_Hora_Var )
			if %errorlevel% equ 3 ( cls & goto :Configurações_Agendamento_Dia_Var )
			if %errorlevel% equ 4 ( cls & goto :Configurações_Agendamento_Semana_Var )
			if %errorlevel% equ 5 ( cls & goto :Configurações_Agendamento_Mes_Var )
			if %errorlevel% equ 6 ( cls & goto :Configurações_Agendamento_OnStart_Var )
			if %errorlevel% equ 7 ( cls & goto :Configurações_Agendamento_OnIdle_Var )
			if %errorlevel% equ 8 ( cls & goto :Configurações_Agendamento_UmaVez_Var )
			if %errorlevel% equ 9 ( cls & goto :Configurações )
			
				setlocal
					:Configurações_Agendamento_Minuto_Var
				
					::<--Definindo Váriaveis Gerais do Tipo de Agendamento-->
					
					set "scheduleType=minute"
					set "Min_Mo=1"					
					set "Min_St_Hour=%time:~0,2%"
					set "Min_St_Minute=%time:~3,2%"
					set "Min_St=%Min_St_Hour%:%Min_St_Minute%"
					set "Min_EtDu_Type=Indefinido"
					set "Min_EtDu_=Indefinido"
					set "Min_K=Desativado"
					set "Min_K2="	
					set "Min_SdDay=%date:~0,2%"
					set "Min_SdMonth=%date:~3,2%"
					set "Min_SdYear=%date:~6,4%"
					set "Min_Sd=%Min_SdDay%/%Min_SdMonth%/%Min_SdYear%"
					set "Min_Ed=Indefinido"
					
					
					:Configurações_Agendamento_Minuto
					
					::<--Definindo Variável do Tamanho do Espaço-->
					
					set "spaceMinutes="
					
					for /f %%a in ('call contar %Min_Mo%') do ( set /a Min_Mo_Len=%%a )
					for /f %%a in ('call contar %Min_St%') do ( set /a Min_StLen=%%a )
					for /f %%a in ('call contar %Min_K%') do ( set /a Min_KLen=%%a )
					for /f %%a in ('call contar %Min_Sd%') do ( set /a schSdMinLen=%%a )
					
					if %Min_Mo_Len% equ 1 ( 
						if %Min_KLen% equ 10 (
						:: <--13 Espaços-->
						set "spaceMin=             "
						) else (
							if %Min_Mo_Len% equ 1 ( 
								if %Min_KLen% equ 7 (
									:: <--10 Espaços-->
									set "spaceMin=          "
								)
							)
						)
					)
					if %Min_Mo_Len% equ 2 ( 
						if %Min_KLen% equ 10 (
							:: <--12 Espaços-->
							set "spaceMin=            "
						) else (
							if %Min_Mo_Len% equ 2 ( 
								if %Min_KLen% equ 7 (
									:: <--9 Espaços-->
									set "spaceMin=         "
								)
							)	
						)
					)
					if %Min_Mo_Len% equ 3 ( 
						if %Min_KLen% equ 10 (
							:: <--11 Espaços-->
							set "spaceMin=           "
						) else (
							if %Min_Mo_Len% equ 3 ( 
								if %Min_KLen% equ 7 (
									:: <--8 Espaços-->
									set "spaceMin=        "
								)
							)
						)
					)
					if %Min_Mo_Len% equ 4 ( 
						if %Min_KLen% equ 10 (
							:: <--10 Espaços-->
							set "spaceMin=          "
						) else (
							if %Min_Mo_Len% equ 4 ( 
								if %Min_KLen% equ 7 (
								:: <--7 Espaços-->
									set "spaceMin=       "
								)
							)
						)
					)
					
					::<--Definindo Escolha de Configuração-->
					
					echo.
					echo O que você deseja fazer?
					echo 1)Definir /mo (%Min_Mo%)%spaceMin%2)Definir /st (%Min_St%)         3)Definir /et ou /du (%Min_EtDu_Type%)(%Min_EtDu_%)
					echo 4)Definir /k  (%Min_K%)    5)Definir /sd (%Min_Sd%)    6)Definir /ed        (%Min_Ed%)
					echo 7)Cancelar                    8)Finalizar
					echo.
					choice /c 123456789 /n /m "Digite> "
					
					if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento_Minuto_mo)
					if %errorlevel% equ 2 ( cls & goto :Configurações_Agendamento_Minuto_st )
					if %errorlevel% equ 3 ( cls & goto :Configurações_Agendamento_Minuto_et_du )
					if %errorlevel% equ 4 ( cls & goto :Configurações_Agendamento_Minuto_k )
					if %errorlevel% equ 5 ( cls & goto :Configurações_Agendamento_Minuto_sd )
					if %errorlevel% equ 6 ( cls & goto :Configurações_Agendamento_Minuto_ed )
					if %errorlevel% equ 7 ( cls & goto :Configurações_Agendamento )
					if %errorlevel% equ 8 ( cls & goto :Agendamento_Minuto )
						
						:Configurações_Agendamento_Minuto_mo
						
						::<--Definindo Textos Informativos de Frequência-->
						
						echo Digite com que frequência o programa deve ser executado automáticamente (1-1439 minutos):
						echo.
						
						::<--Definindo Variável de Frequência-->
						
						set /p "Min_Mo=Digite> "
						set Min_Mo=%Min_Mo: =%
						set "Min_Mo_Asp="%Min_Mo%""
						
						::<--Verificação de erros de Frequência-->
						
						::<--Verificação de Espaços e quantidade de caracteres na definição da Variável-->
						for /f %%a in ('call contar %Min_Mo_Asp%') do ( set /a Min_Mo_Len_Asp=%%a )
						
						set /a Min_Mo_Len=%Min_Mo_Len_Asp%-2
							
						if %Min_Mo_Len% gtr 4 (
							set "Min_Mo="
							echo ERRO: Digite um valor entre 1 e 1439!
							pause
							cls
							goto :Configurações_Agendamento_Minuto_mo
						) else (
							if %Min_Mo_Len% equ 0 (
								set "Min_Mo="
								echo ERRO: Digite um valor entre 1 e 1439!
								pause
								cls
								goto :Configurações_Agendamento_Minuto_mo
							) else (
								if %Min_Mo% equ 0 (
									set "Min_Mo="
									echo ERRO: Digite um valor entre 1 e 1439!
									pause
									cls
									goto :Configurações_Agendamento_Minuto_mo
								)
								if %Min_Mo% equ 00 (
									set "Min_Mo="
									echo ERRO: Digite um valor entre 1 e 1439!
									pause
									cls
									goto :Configurações_Agendamento_Minuto_mo
								)
								if %Min_Mo% equ 000 (
									set "Min_Mo="
									echo ERRO: Digite um valor entre 1 e 1439!
									pause
									cls
									goto :Configurações_Agendamento_Minuto_mo
								)
								if %Min_Mo% equ 0000 (
									set "Min_Mo="
									echo ERRO: Digite um valor entre 1 e 1439!
									pause
									cls
									goto :Configurações_Agendamento_Minuto_mo
								)
							)
						)
						
						::<--Verificação de Negativos e Números maiores que o limite na definição da Variável-->
						
						if %Min_Mo% gtr 1439 (
							set "Min_Mo="
							echo ERRO: Digite um valor entre 1 e 1439!
							pause>nul
							cls
							goto :Configurações_Agendamento_Minuto_mo
						) else (
							if %Min_Mo% lss 1 (	
								set "Min_Mo="
								echo ERRO: Digite um valor entre 1 e 1439!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_mo
							) else (
								echo A tarefa será executada a cada %Min_Mo% minutos.
								set "Min_Mo2= /mo %Min_Mo% "
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto
							)
						)
						
						
						:Configurações_Agendamento_Minuto_st
						
						::<--Definindo Textos Informativos de Hora Inicial-->
						
						echo Digite a hora de início para a tarefa:
						echo.
						
							:Configurações_Agendamento_Minuto_st_H
							::<--Definindo Variável de Hora Inicial-->
							@echo off
							set /p "Min_St_Hour=Hora: "
							set Min_St_Hour=%Min_St_Hour: =%
							set "Min_St_Hour_Asp="%Min_St_Hour%""
							
							if %Min_St_Hour_Asp% equ "" (
								cls
								goto :Configurações_Agendamento_Minuto_st
							)
							::<--Verificação de erros de Hora Inicial-->
							
							::<--Verificação de Espaços e quantidade de caracteres na definição da Variável-->
							
							for /f %%a in ('call contar %Min_St_Hour_Asp%') do ( set /a Min_St_Hour_Len_Asp=%%a )
							
							set /a Min_St_Hour_Len=%Min_St_Hour_Len_Asp%-2

							if %Min_St_Hour_Len% gtr 2 (
								set "Min_St_Hour="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_st
							) else (
								if %Min_St_Hour_Len% equ 1 (
									set Min_St_Hour=0%Min_St_Hour%
								)
							)
							
							::<--Verificação de Negativos e Números maiores que o limite na definição da Variável-->
							
							::Situação 1
							if %Min_Sd% equ %Min_Ed% (
								::Situação 1.1
								if %Min_Sd% equ %date:~0,2%/%date:~3,2%/%date:~6,4% (
									::Situação 1.1.1
									if %Min_EtDu% equ Indefinido (
										::Situação 1.1.1.1
										if %Min_St_Hour% gtr 23 (
											set "Min_St_Hour="
											echo ERRO: Digite um valor entre %time:~0,2% e 23!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_st
										::Situação 1.1.1.2
										) else (
											if %Min_St_Hour% lss %time:~0,2% (
												set "Min_St_Hour="
												echo ERRO: Digite um valor entre %time:~0,2% e 23!
												pause>nul
												cls
												goto :Configurações_Agendamento_Minuto_st
											)
										)
									::Situação 1.1.2
									) else (
										::Situação 1.1.2.1
										if %Min_St_Hour% gtr %Min_EtDu_Hour% (
											set "Min_St_Hour="
											echo ERRO: Digite um valor entre %time:~0,2% e %Min_EtDu_Hour%!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_st
										::Situação 1.1.2.2
										) else (
											if %Min_St_Hour% lss %time:~0,2% (
												set "Min_St_Hour="
												echo ERRO: Digite um valor entre %time:~0,2% e %Min_EtDu_Hour%!
												pause>nul
												cls
												goto :Configurações_Agendamento_Minuto_st
											)
										)
									)
								::Situação 1.2
								) else (
									::Situação 1.2.1
									if %Min_EtDu% equ Indefinido (
										::Situação 1.2.1.1
										if %Min_St_Hour% gtr 23 (
											set "Min_St_Hour="
											echo ERRO: Digite um valor entre 0 e 23!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_st
										::Situação 1.2.1.2
										) else (
											if %Min_St_Hour% lss 0 (
												set "Min_St_Hour="
												echo ERRO: Digite um valor entre 0 e 23!
												pause>nul
												cls
												goto :Configurações_Agendamento_Minuto_st
											)
										)
									::Situação 1.2.2
									) else (
										::Situação 1.2.2.1
										if %Min_St_Hour% gtr %Min_EtDu_Hour% (
											set "Min_St_Hour="
											echo ERRO: Digite um valor entre 0 e 23!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_st
										::Situação 1.2.2.2
										) else (
											if %Min_St_Hour% lss 0 (
												set "Min_St_Hour="
												echo ERRO: Digite um valor entre 0 e 23!
												pause>nul
												cls
												goto :Configurações_Agendamento_Minuto_st
											)
										)
									)
									
								)
							::Situação 2
							) else (
								if %Min_St_Hour% gtr 23 (
									set "Min_St_Hour="
									echo ERRO: Digite um valor entre 0 e 23!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_st
								) else (
									if %Min_St_Hour% lss 0 (
										set "Min_St_Hour="
										echo ERRO: Digite um valor entre 0 e 23!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_st
									)
								)
							)
							
							:Configurações_Agendamento_Minuto_st_M
							
							::<--Repetindo Textos Informativos de Hora Inicial-->
							
							cls 
							echo Digite a hora de início para a tarefa:
							echo.
							echo Hora: %Min_St_Hour%
							echo.
							
							::<--Definindo Variável de Minuto Inicial-->
							
							set /p "Min_St_Minute=Minuto: "
							set "Min_St_MinuteAsp="%Min_St_Minute%""
							
							::<--Verificação de erros de Minuto Inicial-->
							
							::<--Verificação de Espaços e quantidade de caracteres na definição da Variável-->
							
							for /f %%a in ('call contar %Min_St_MinuteAsp%') do ( set /a Min_St_MinuteLen=%%a )
							
							if %Min_St_MinuteLen% gtr 4 (
								set "Min_St_Minute="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_st_M
							) else (
								if %Min_St_MinuteLen% equ 3 (
									if %Min_St_MinuteAsp% equ " " (
										set Min_St_Minute=%Min_St_Minute: =00%
									) else (
										set Min_St_Minute=0%Min_St_Minute%
									)
								) else (
									set Min_St_Minute=%Min_St_Minute: =0%
								)
							)
							
							::<--Verificação de Negativos e Números maiores que o limite na definição da Variável-->
							
							if %Min_St_Minute% gtr 59 (
								set /a "Min_St_Minute="
								echo ERRO: Digite um valor entre 0 e 59!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_st_M
							) else (
								if %Min_St_Minute% lss 0 (
									set /a "Min_St_Minute="
									echo ERRO: Digite um valor entre 0 e 59!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_st_M
								) else (
									echo A tarefa será executada às %Min_St_Hour%:%Min_St_Minute% horas.
									set "Min_St=%Min_St_Hour%:%Min_St_Minute%"
									set "Min_St2= /st %Min_St_Hour%:%Min_St_Minute% "
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto
								)
							)
							
						
						
						:Configurações_Agendamento_Minuto_et_du
						
						::<--Definindo Escolha de Hora Final-->
						
						echo.
						echo Escolha como será definido a finalização da tarefa:
						echo.
						echo 1)Duração    2)Hora Final
						echo.
						choice /c 12 /n /m "Digite> "
						
						if %errorlevel% equ 1 ( set Min_EtDu_Type=du )
						if %errorlevel% equ 2 ( set Min_EtDu_Type=et )

							:Configurações_Agendamento_Minuto_et_du_H	

							::<--Definindo Textos Informativos de Duração-->

							if %Min_EtDu_Type% equ du (
							cls
							echo Digite a hora final para a tarefa:
							echo.
							)

							::<--Definindo Textos Informativos de Hora Final-->	

							if %Min_EtDu_Type% equ et (
							cls
							echo Digite a duração da tarefa:
							echo.
							)

							::<--Definindo Variável de Hora Final-->

							set /p "Min_EtDu_Hour=Hora: "
							set Min_EtDu_Hour=%Min_EtDu_Hour: =%
							set "Min_EtDu_Hour_Asp="%Min_EtDu_Hour%""
							
							::<--Verificação de erros de Hora Final e Duração-->
							
							::<--Verificação de Espaços e quantidade de caracteres na definição da Variável-->
							
							for /f %%a in ('call contar %Min_EtDu_Hour_Asp%') do ( set /a Min_EtDu_Len_Asp=%%a )
							set /a Min_EtDu_Hour_Len=%Min_EtDu_Len_Asp%-2
							
							if %Min_EtDu_Hour_Len% gtr 4 (
								set "Min_EtDu_Hour="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_st_M
							) else (
								if %Min_EtDu_Hour_Len% lss 1 (
									set "Min_EtDu_Hour="
									echo ERRO: Digite um valor entre 0 e 23!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_st_M
								) else (
									if %Min_EtDu_Hour_Len% equ 0 (
										set Min_EtDu_Hour=00
									) else (
										if %Min_EtDu_Hour_Len% equ 1 (
											set Min_EtDu_Hour=0%Min_EtDu_Hour%
										)
									)
								)
							)
							
							::<--Verificação de Negativos e Números maiores que o limite na definição da Variável-->
							
							if %Min_EtDu_Hour% gtr 23 (
								set "Min_EtDu_Hour="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_et_du_H
							) else (
								if %Min_EtDu_Hour% lss 0 (
									set "Min_EtDu_Hour="
									echo ERRO: Digite um valor entre 0 e 23!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_et_du_H
								)
							)
							
							if %Min_Sd% equ %Min_Ed% (
								if %Min_EtDu_Type% equ et ( 
									if %Min_EtDu_Hour% lss %Min_St_Hour% (
										cls
										set "Min_EtDu_Hour="
										echo ERRO: A hora final não pode ser menor que a hora inicial, pois a data inicial  
										echo é igual a data final
										if %Min_St_Hour% equ 23 (
											echo O único valor válido é 23!
											pause
										) else (
											echo Digite um valor entre %Min_St_Hour% e 23 ou altere a data final!
											pause
										)
										pause
										goto :Configurações_Agendamento_Minuto_et_du_H
									)
								)
							)
							if %Min_Ed% equ Indefinido (
								if %Min_EtDu_Type% equ et ( 
									if %Min_EtDu_Hour% lss %Min_St_Hour% (
										cls
										set "Min_EtDu_Hour="
										echo ERRO: A hora final não pode ser menor que a hora inicial, pois a data inicial  
										echo é igual a data final.
										if %Min_St_Hour% equ 23 (
											echo O único valor válido é 23!
											pause
										) else (
											echo Digite um valor entre %Min_St_Hour% e 23 ou altere a data final!
											pause
										)
										goto :Configurações_Agendamento_Minuto_et_du_H
									)
								)
							)
							
							:Configurações_Agendamento_Minuto_et_du_M

							::<--Repetindo Textos Informativos de Duração-->

							if %Min_EtDu_Type% equ du (
							cls
							echo Digite a hora final para a tarefa:
							echo.
							)
							
							::<--Repetindo Textos Informativos de Hora Final-->
							
							if %Min_EtDu_Type% equ et (
							cls
							echo Digite a duração da tarefa:
							echo.
							)
							echo Hora: %Min_EtDu_Hour%
							
							::<--Definindo Variável de Minuto Final-->
							
							set /p "Min_EtDu_Minute=Minuto: "
							set Min_EtDu_Minute=%Min_EtDu_Minute: =%
							
							::<--Verificação de erros de Minuto Final-->
							
							if %Min_EtDu_Minute% gtr 59 (
								set /a "Min_EtDu_Minute="
								echo ERRO: Digite um valor entre 0 e 59!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_et_du_M
							) else (
								if %Min_EtDu_Minute% lss 0 (
									set /a "Min_EtDu_Minute="
									echo ERRO: Digite um valor entre 0 e 59!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_et_du_M
								) 
							)
							
							if %Min_Sd% equ %Min_Ed% (
								if %Min_EtDu_Type% equ et ( 
									if %Min_EtDu_Minute% leq %Min_St_Minute% (
										cls
										set "Min_EtDu_Minute="
										
										echo ERRO: O minuto final não pode ser menor ou igual ao minuto inicial, pois a data inicial  
										echo é igual a data final
										
										if %Min_St_Minute% equ 59 (
											echo O único valor válido é 59!
											pause
										) else (
											echo Digite um valor entre %Min_St_Minute% e 59 ou altere a data final!
											pause
										)

										cls
										goto :Configurações_Agendamento_Minuto_et_du_M
									)
								)
							) else ( 
								if %Min_Ed% equ Indefinido (
									if %Min_EtDu_Type% equ et ( 
										if %Min_EtDu_Hour% equ %Min_St_Hour% (
											if %Min_EtDu_Minute% leq %Min_St_Minute% (
												cls
												set "Min_EtDu_Minute="
												
												echo ERRO: O minuto final não pode ser menor ou igual ao minuto inicial, pois a data inicial  
												echo é igual a data final
												
												if %Min_St_Minute% equ 59 (
													echo O único valor válido é 59!
													pause
												) else (
													echo Digite um valor entre %Min_St_Minute% e 59 ou altere a data final!
													pause
												)

												cls
												goto :Configurações_Agendamento_Minuto_et_du_M
											)
										)
									)
								)
							)		
							else (
									if %Min_EtDu_Type% equ du (
										echo A tarefa durará %Min_EtDu_Hour%:%Min_EtDu_Minute% horas.
										set "schDuMin= /du %Min_EtDu_Hour%:%Min_EtDu_Minute% "
									)
									if %Min_EtDu_Type% equ et (
										echo A tarefa será terminada às %Min_EtDu_Hour%:%Min_EtDu_Minute% horas.
										set "schEtMin= /et %Min_EtDu_Hour%:%Min_EtDu_Minute% "
									)
									set Min_EtDu_=%Min_EtDu_Hour%:%Min_EtDu_Minute%
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto
								)
						
						:Configurações_Agendamento_Minuto_k
						if %Min_K% equ Desativado (
							set Min_K=Ativado
							set "Min_K2= /k "
							goto :Configurações_Agendamento_Minuto
						)
						if %Min_K% equ Ativado (
							set Min_K=Desativado
							set "Min_K2="
							goto :Configurações_Agendamento_Minuto
						)
						
						
						:Configurações_Agendamento_Minuto_sd
						
						echo Digite a data de início para a tarefa:
						echo.
						
							:Configurações_Agendamento_Minuto_sd_Y
							set /p "schSdMinYInput=Ano: "
							set schSdMinYInput=%schSdMinYInput: =%
							set /a "Min_SdYear=%schSdMinYInput%"
							set /a "schSdMinYLimite=%date:~6,4%+50"
							if %Min_SdYear% gtr %schSdMinYLimite% (
								set /a "Min_SdYear="
								echo ERRO: Digite um valor entre %date:~6,4% e %schSdMinYLimite%!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_sd
							) else (
								if %Min_SdYear% lss %date:~6,4% (
									set /a "Min_SdYear="
									echo ERRO: Digite um valor entre %date:~6,4% e %schSdMinYLimite%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_sd
								)
							)
							
							set /a "bisextoTest1Min=%Min_SdYear% %% 4"
							set /a "bisextoTest2Min=%Min_SdYear% %% 100"
							set /a "bisextoTest3Min=%Min_SdYear% %% 400"
							set /a "impParTestMin=%Min_SdYear% %% 2"
							
							
							:Configurações_Agendamento_Minuto_sd_M
							cls
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %Min_SdYear%
							set /p "schSdMinMInput=Mês: "
							set schSdMinMInput=%schSdMinMInput: =%
							set /a Min_SdMonth=%schSdMinMInput%
							if %Min_SdYear% equ %date:~6,4% (
								if %Min_SdMonth% gtr 12 (
									if %date:~3,2% equ 12 (
										set /a "Min_SdMonth="
										echo ERRO: O único valor válido de mês para o ano especificado é 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_sd_M
									) else (
										set /a "Min_SdMonth="
										echo ERRO: Digite um valor entre %date:~3,2% e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_sd_M
									)
								) else (
									if %Min_SdMonth% lss %date:~3,2% (
										if %date:~3,2% equ 12 (
											set /a "Min_SdMonth="
											echo ERRO: O único valor válido de mês para o ano especificado é 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_sd_M
										) else (
											set /a "Min_SdMonth="
											echo ERRO: Digite um valor entre %date:~3,2% e 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_sd_M
										)
									)
								)
							) else (
								if %Min_SdMonth% gtr 12 (
									set /a "Min_SdMonth="
									echo ERRO: Digite um valor entre 1 e 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_sd_M
								) else (
									if %Min_SdMonth% lss 1 (
										set /a "Min_SdMonth="
										echo ERRO: Digite um valor entre 1 e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_sd_M
									) 			
								)
							)
							
							if %Min_SdMonth% equ 2 (	
								if %bisextoTest1Min% equ 0 (								
									if %bisextoTest2Min% neq 0 (
										set lastDayMin=29 
									) else (
										if %bisextoTest2Min% equ 0 (
											set lastDayMin=28
										)
									)
								) else (
									if %bisextoTest1Min% neq 0 (										
										if %bisextoTest3Min% equ 0 (
											set lastDayMin=29 
										) else (
											if %bisextoTest3Min% neq 0 (
												set lastDayMin=28
											)
										)
									)
								)
							)
							
							if %Min_SdMonth% neq 2 (
								if %Min_SdMonth% leq 7 (				
									if %impParTestMin% equ 1 (
										set /a lastDayMin=31 
									)
									if %impParTestMin% equ 0 (
										set /a lastDayMin=30 
									)
								)
							)
							
							if %Min_SdMonth% geq 8 (
								if %impParTestMin% equ 1 (
									set /a lastDayMin=30 
								)
								if %impParTestMin% equ 0 (
									set /a lastDayMin=31 
								)
							)
							
							
							:Configurações_Agendamento_Minuto_sd_D
							cls 
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %Min_SdYear%
							echo Mês: %Min_SdMonth%
							set /p "Min_SdDay=Dia: "
							set Min_SdDay=%Min_SdDay: =%
							
							if %Min_SdYear% equ %date:~6,4% (
								if %Min_SdDay% gtr %lastDayMin% (
									set /a "Min_SdDay="
									echo ERRO: Digite um valor entre %date:~0,2% e %lastDayMin%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_sd_D
								) else (
									if %Min_SdDay% lss %date:~0,2% (
										set /a "Min_SdDay="
										echo ERRO: Digite um valor entre %date:~0,2% e %lastDayMin%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_sd_D	
									)
								)
							) else (
								if %Min_SdDay% gtr %lastDayMin% (
									set /a "Min_SdDay="
									echo ERRO: Digite um valor entre 1 e %lastDayMin%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_sd_D
								) else (
									if %Min_SdDay% lss 1 (
										set /a "Min_SdDay="
										echo ERRO: Digite um valor entre 1 e %lastDayMin%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_sd_D
									)
								)	
							)
							
							set /a "lastDayMin="
							set "Min_Sd=%Min_SdDay%/%Min_SdMonth%/%Min_SdYear%"
							set "schSdMin2= /sd %Min_SdDay%/%Min_SdMonth%/%Min_SdYear% "
							echo A tarefa será executada a partir do dia %Min_SdDay%/%Min_SdMonth%/%Min_SdYear%.
							pause>nul
							cls
							goto :Configurações_Agendamento_Minuto
								
						
						
						:Configurações_Agendamento_Minuto_ed
						echo Digite a data final para a tarefa:
						echo.
						
							:Configurações_Agendamento_Minuto_ed_Y
							set /p "schEdMinYInput=Ano: "
							set schEdMinYInput=%schEdMinYInput: =%
							set /a "schEdMinY=%schEdMinYInput%"
							set /a "schEdMinYLimite=%date:~6,4%+50"
							if %schEdMinY% gtr %schEdMinYLimite% (
								set /a "schEdMinY="
								echo ERRO: Digite um valor entre %date:~6,4% e %schEdMinYLimite%!
								pause>nul
								cls
								goto :Configurações_Agendamento_Minuto_ed
							) else (
								if %schEdMinY% lss %date:~6,4% (
									set /a "schEdMinY="
									echo ERRO: Digite um valor entre %date:~6,4% e %schEdMinYLimite%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_ed
								)
							)
							
							set /a "bisextoTest1EdMin=%schEdMinY% %% 4"
							set /a "bisextoTest2EdMin=%schEdMinY% %% 100"
							set /a "bisextoTest3EdMin=%schEdMinY% %% 400"
							set /a "impParTestEdMin=%schEdMinY% %% 2"
							
							
							:Configurações_Agendamento_Minuto_ed_M
							cls
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %schEdMinY%
							set /p "schEdMinMInput=Mês: "
							set schEdMinMInput=%schEdMinMInput: =%
							set /a schEdMinM=%schEdMinMInput%
							if %schEdMinY% equ %date:~6,4% (
								if %schEdMinM% gtr 12 (
									if %date:~3,2% equ 12 (
										set /a "schEdMinM="
										echo ERRO: O único valor válido de mês para o ano especificado é 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_ed_M
									) else (
										set /a "schEdMinM="
										echo ERRO: Digite um valor entre %date:~3,2% e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_ed_M
									)
								) else (
									if %schEdMinM% lss %date:~3,2% (
										if %date:~3,2% equ 12 (
											set /a "schEdMinM="
											echo ERRO: O único valor válido de mês para o ano especificado é 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_ed_M
										) else (
											set /a "schEdMinM="
											echo ERRO: Digite um valor entre %date:~3,2% e 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Minuto_ed_M
										)
									)
								)
							) else (
								if %schEdMinM% gtr 12 (
									set /a "schEdMinM="
									echo ERRO: Digite um valor entre 1 e 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_ed_M
								) else (
									if %schEdMinM% lss 1 (
										set /a "schEdMinM="
										echo ERRO: Digite um valor entre 1 e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_ed_M
									) 			
								)
							)
							
							if %schEdMinM% equ 2 (	
								if %bisextoTest1EdMin% equ 0 (								
									if %bisextoTest2EdMin% neq 0 (
										set lastDayEdMin=29 
									) else (
										if %bisextoTest2EdMin% equ 0 (
											set lastDayEdMin=28
										)
									)
								) else (
									if %bisextoTest1EdMin% neq 0 (										
										if %bisextoTest3EdMin% equ 0 (
											set lastDayEdMin=29 
										) else (
											if %bisextoTest3EdMin% neq 0 (
												set lastDayEdMin=28
											)
										)
									)
								)
							)
							
							if %schEdMinM% neq 2 (
								if %schEdMinM% leq 7 (				
									if %impParTestEdMin% equ 1 (
										set /a lastDayEdMin=31 
									)
									if %impParTestEdMin% equ 0 (
										set /a lastDayEdMin=30 
									)
								)
							)
							
							if %schEdMinM% geq 8 (
								if %impParTestEdMin% equ 1 (
									set /a lastDayEdMin=30 
								)
								if %impParTestEdMin% equ 0 (
									set /a lastDayEdMin=31 
								)
							)
							
							
							:Configurações_Agendamento_Minuto_ed_D
							cls 
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %schEdMinY%
							echo Mês: %schEdMinM%
							set /p "schEdMinD=Dia: "
							set schEdMinD=%schEdMinD: =%
							
							if %schEdMinY% equ %date:~6,4% (
								if %schEdMinD% gtr %lastDayEdMin% (
									set /a "schEdMinD="
									echo ERRO: Digite um valor entre %date:~0,2% e %lastDayEdMin%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_ed_D
								) else (
									if %schEdMinD% lss %date:~0,2% (
										set /a "schEdMinD="
										echo ERRO: Digite um valor entre %date:~0,2% e %lastDayEdMin%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_ed_D	
									)
								)
							) else (
								if %schEdMinD% gtr %lastDayEdMin% (
									set /a "schEdMinD="
									echo ERRO: Digite um valor entre 1 e %lastDayEdMin%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Minuto_ed_D
								) else (
									if %schEdMinD% lss 1 (
										set /a "schEdMinD="
										echo ERRO: Digite um valor entre 1 e %lastDayEdMin%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Minuto_ed_D
									)
								)	
							)
							
							set /a "lastDayEdMin="
							set "Min_Ed=%schEdMinD%/%schEdMinM%/%schEdMinY%"
							set "schEdMin2= /ed %schEdMinD%/%schEdMinM%/%schEdMinY% "
							echo A tarefa será executada até o dia %schEdMinD%/%schEdMinM%/%schEdMinY%.
							pause>nul
							cls
							goto :Configurações_Agendamento_Minuto
							
						
							
						:Agendamento_Minuto
						echo.
						schtasks /query /fo list /tn "FileOrganizer" 2>nul
						if %errorlevel% equ 0 (
							echo schtasks /delete /tn "FileOrganizer" /f
							echo Uma tarefa existente de mesmo nome foi deletada.
							pause
						) else (
							echo schtasks /create /sc %scheduleType%%Min_Mo2%%Min_St2%%schEtMin%%schDuMin%%Min_K2%%schSdMin2%%schEdMin2%/tn FileOrganizer /tr %FileOrg_Directory%\FileOrganizer.bat
							echo O Agendamento foi realizado com sucesso!
							pause
							set "scheduleType="
							set "schMo="
							cls
							goto :Home
						)
											
					
				endlocal
				::-------------------------------------------------------------------------------------------------------------------------------------------
				
				:Configurações_Agendamento_Hora_Var
					set "scheduleType=Hora"
					set "schMoHora=1"
					set "schStHoraH=%time:~0,2%"
					set "schStHoraM=%time:~3,2%"
					set "schStHora=%schStHoraH%:%schStHoraM%"
					set "schEtDuHoraType=Indefinido"
					set "schEtDuHora=Indefinido"
					set "schKHora=Desativado"
					set "schKHora2="
					set "schSdHoraD=%date:~0,2%"
					set "schSdHoraM=%date:~3,2%"
					set "schSdHoraY=%date:~6,4%"
					set "schSdHora=%schSdHoraD%/%schSdHoraM%/%schSdHoraY%"
					set "schEdHora=Indefinido"
				
				
				:Configurações_Agendamento_Hora
				set "spaceHora="
					
				for /f %%a in ('call contar %schMoHora%') do ( set /a schMoHoraLen=%%a )
				for /f %%a in ('call contar %schStHora%') do ( set /a schStHoraLen=%%a )
				for /f %%a in ('call contar %schKHora%') do ( set /a schKHoraLen=%%a )
				for /f %%a in ('call contar %schSdHora%') do ( set /a schSdHoraLen=%%a )
				
				if %schMoHoraLen% equ 1 ( 
					if %schKHoraLen% equ 10 (
					:: <--13 Espaços-->
					set "spaceHora=             "
					) else (
						if %schMoHoraLen% equ 1 (
							if %schKHoraLen% equ 7 (
								:: <--10 Espaços-->
								set "spaceHora=          "
							)
						)
					)
				)
				if %schMoHoraLen% equ 2 ( 
					if %schKHoraLen% equ 10 (
						:: <--12 Espaços-->
						set "spaceHora=            "
					) else (
						if %schMoHoraLen% equ 2 ( 
							if %schKHoraLen% equ 7 (
								:: <--9 Espaços-->
								set "spaceHora=         "
							)
						)	
					)
				)
				if %schMoHoraLen% equ 3 ( 
					if %schKHoraLen% equ 10 (
						:: <--11 Espaços-->
						set "spaceHora=           "
					) else (
						if %schMoHoraLen% equ 3 ( 
							if %schKHoraLen% equ 7 (
								:: <--8 Espaços-->
								set "spaceHora=        "
							)
						)
					)
				)
				if %schMoHoraLen% equ 4 ( 
					if %schKHoraLen% equ 10 (
						:: <--10 Espaços-->
						set "spaceHora=          "
					) else (
						if %schMoHoraLen% equ 4 ( 
							if %schKHoraLen% equ 7 (
							:: <--7 Espaços-->
								set "spaceHora=       "
							)
						)
					)
				)
				
				echo.
				echo O que você deseja fazer?
				echo 1)Definir /mo (%schMoHora%)%spaceHora%2)Definir /st (%schStHora%)         3)Definir /et ou /du (%schEtDuHoraType%)(%schEtDuHora%)
				echo 4)Definir /k  (%schKHora%)    5)Definir /sd (%schSdHora%)    6)Definir /ed        (%schEdHora%)
				echo 7)Cancelar                    8)Finalizar
				echo.
				choice /c 123456789 /n /m "Digite> "
				
				if %errorlevel% equ 1 ( cls & goto :Configurações_Agendamento_Hora_mo)
				if %errorlevel% equ 2 ( cls & goto :Configurações_Agendamento_Hora_st )
				if %errorlevel% equ 3 ( cls & goto :Configurações_Agendamento_Hora_et_du )
				if %errorlevel% equ 4 ( cls & goto :Configurações_Agendamento_Hora_k )
				if %errorlevel% equ 5 ( cls & goto :Configurações_Agendamento_Hora_sd )
				if %errorlevel% equ 6 ( cls & goto :Configurações_Agendamento_Hora_ed )
				if %errorlevel% equ 7 ( cls & goto :Configurações_Agendamento )
				if %errorlevel% equ 8 ( cls & goto :Agendamento_Hora )
				
					:Configurações_Agendamento_Hora_mo
					echo Digite com que frequência o programa deve ser executado automáticamente (1-1439 Horas):
						echo.
						set /p "schMoHora=Digite> "
						set schMoHora=%schMoHora: =%
						if %schMoHora% gtr 1439 (
							set "schMoHora="
							echo ERRO: Digite um valor entre 1 e 1439!
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora_mo
						) else (
							if %schMoHora% lss 1 (	
								set "schMoHora="
								echo ERRO: Digite um valor entre 1 e 1439!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_mo
							) else (
								echo A tarefa será executada a cada %schMoHora% Horas.
								set "schMoHora2= /mo %schMoHora% "
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora
							)
						)
					
					
					:Configurações_Agendamento_Hora_st
					echo Digite a hora de início para a tarefa:
					echo.
						
						:Configurações_Agendamento_Hora_st_H
						set /p "schStHoraH=Hora: "
						set schStHoraH=%schStHoraH: =%
						if %schStHoraH% gtr 23 (
							set "schStHoraH="
							echo ERRO: Digite um valor entre 0 e 23!
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora_st
						) else (
							if %schStHoraH% lss 0 (
								set "schStHoraH="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_st
							)
						)
						
						
						:Configurações_Agendamento_Hora_st_M
							cls 
							echo Digite a hora de início para a tarefa:
							echo.
							echo Hora: %schStHoraH%
							echo.
							set /p "schStHoraM=Minuto: "
							set schStHoraM=%schStHoraM: =%
							if %schStHoraM% gtr 59 (
								set /a "schStHoraM="
								echo ERRO: Digite um valor entre 0 e 59!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_st_M
							) else (
								if %schStHoraM% lss 0 (
									set /a "schStHoraM="
									echo ERRO: Digite um valor entre 0 e 59!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_st_M
								) else (
									echo A tarefa será executada às %schStHoraH%:%schStHoraM% horas.
									set "schStHora=%schStHoraH%:%schStHoraM%"
									set "schStHora2= /st %schStHoraH%:%schStHoraM% "
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora
								)
							)
						
					
						
					:Configurações_Agendamento_Hora_et_du
					echo.
					echo Escolha como será definido a finalização da tarefa:
					echo.
					echo 1)Duração    2)Hora Final
					echo.
					choice /c 12 /n /m "Digite> "
					
					if %errorlevel% equ 1 ( set schEtDuHoraType=du )
					if %errorlevel% equ 2 ( set schEtDuHoraType=et ) 
					
						:Configurações_Agendamento_Hora_et_du_H
						if %schEtDuHoraType% equ du (
						cls
						echo Digite a hora final para a tarefa:
						echo.
						)
						if %schEtDuHoraType% equ et (
						cls
						echo Digite a duração da tarefa:
						echo.
						)	
						set /p "schEtDuHoraH=Hora: "
						set schEtDuHoraH=%schEtDuHoraH: =%
						if %schEtDuHoraH% gtr 23 (
							set "schEtDuHoraH="
							echo ERRO: Digite um valor entre 0 e 23!
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora_et_du
						) else (
							if %schEtDuHoraH% lss 0 (
								set "schEtDuHoraH="
								echo ERRO: Digite um valor entre 0 e 23!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_et_du
							)
						)
						

						:Configurações_Agendamento_Hora_et_du_M
						if %schEtDuHoraType% equ du (
						cls
						echo Digite a hora final para a tarefa:
						echo.
						)
						if %schEtDuHoraType% equ et (
						cls
						echo Digite a duração da tarefa:
						echo.
						)
						echo Hora: %schEtDuHoraH%
						echo.						
						set /p "schEtDuHoraM=Minuto: "
						set schEtDuHoraM=%schEtDuHoraM: =%
						if %schEtDuHoraM% gtr 59 (
							set /a "schEtDuHoraM="
							echo ERRO: Digite um valor entre 0 e 59!
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora_et_du_M
						) else (
							if %schEtDuHoraM% lss 0 (
								set /a "schEtDuHoraM="
								echo ERRO: Digite um valor entre 0 e 59!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_et_du_M
							) else (
								if %schEtDuHoraType% equ du (
									echo A tarefa durará %schEtDuHoraH%:%schEtDuHoraM% horas.
									set "schDuHora= /du %schEtDuHoraH%:%schEtDuHoraM% "
								)
								if %schEtDuHoraType% equ et (
									echo A tarefa será terHoraada às %schEtDuHoraH%:%schEtDuHoraM% horas.
									set "schEtHora= /et %schEtDuHoraH%:%schEtDuHoraM% "
								)
								set schEtDuHora=%schEtDuHoraH%:%schEtDuHoraM%
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora
							)
						)
						
							
					
					:Configurações_Agendamento_Hora_k
					if %schKHora% equ Desativado (
						set schKHora=Ativado
						set "schKHora2= /k "
						goto :Configurações_Agendamento_Hora
					)
					if %schKHora% equ Ativado (
						set schKHora=Desativado
						set "schKHora2="
						goto :Configurações_Agendamento_Hora
					)
					
					
					:Configurações_Agendamento_Hora_sd
					echo Digite a data de início para a tarefa:
						echo.
						
							:Configurações_Agendamento_Hora_sd_Y
							set /p "schSdHoraYInput=Ano: "
							set schSdHoraYInput=%schSdHoraYInput: =%
							set /a "schSdHoraY=%schSdHoraYInput%"
							set /a "schSdHoraYLimite=%date:~6,4%+50"
							if %schSdHoraY% gtr %schSdHoraYLimite% (
								set /a "schSdHoraY="
								echo ERRO: Digite um valor entre %date:~6,4% e %schSdHoraYLimite%!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_sd
							) else (
								if %schSdHoraY% lss %date:~6,4% (
									set /a "schSdHoraY="
									echo ERRO: Digite um valor entre %date:~6,4% e %schSdHoraYLimite%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_sd
								)
							)
							
							set /a "bisextoTest1Hora=%schSdHoraY% %% 4"
							set /a "bisextoTest2Hora=%schSdHoraY% %% 100"
							set /a "bisextoTest3Hora=%schSdHoraY% %% 400"
							set /a "impParTestHora=%schSdHoraY% %% 2"
							
							:Configurações_Agendamento_Hora_sd_M
							cls
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %schSdHoraY%
							set /p "schSdHoraHoraInput=Mês: "
							set schSdHoraHoraInput=%schSdHoraHoraInput: =%
							set /a schSdHoraM=%schSdHoraHoraInput%
							if %schSdHoraY% equ %date:~6,4% (
								if %schSdHoraM% gtr 12 (
									if %date:~3,2% equ 12 (
										set /a "schSdHoraM="
										echo ERRO: O único valor válido de mês para o ano especificado é 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_sd_M
									) else (
										set /a "schSdHoraM="
										echo ERRO: Digite um valor entre %date:~3,2% e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_sd_M
									)
								) else (
									if %schSdHoraM% lss %date:~3,2% (
										if %date:~3,2% equ 12 (
											set /a "schSdHoraM="
											echo ERRO: O único valor válido de mês para o ano especificado é 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Hora_sd_M
										) else (
											set /a "schSdHoraM="
											echo ERRO: Digite um valor entre %date:~3,2% e 12!
											pause>nul
											cls
											goto :Configurações_Agendamento_Hora_sd_M
										)
									)
								)
							) else (
								if %schSdHoraM% gtr 12 (
									set /a "schSdHoraM="
									echo ERRO: Digite um valor entre 1 e 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_sd_M
								) else (
									if %schSdHoraM% lss 1 (
										set /a "schSdHoraM="
										echo ERRO: Digite um valor entre 1 e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_sd_M
									) 			
								)
							)
							
							if %schSdHoraM% equ 2 (	
								if %bisextoTest1Hora% equ 0 (								
									if %bisextoTest2Hora% neq 0 (
										set lastDayHora=29 
									) else (
										if %bisextoTest2Hora% equ 0 (
											set lastDayHora=28
										)
									)
								) else (
									if %bisextoTest1Hora% neq 0 (										
										if %bisextoTest3Hora% equ 0 (
											set lastDayHora=29 
										) else (
											if %bisextoTest3Hora% neq 0 (
												set lastDayHora=28
											)
										)
									)
								)
							)
							
							if %schSdHoraM% neq 2 (
								if %schSdHoraM% leq 7 (				
									if %impParTestHora% equ 1 (
										set /a lastDayHora=31 
									)
									if %impParTestHora% equ 0 (
										set /a lastDayHora=30 
									)
								)
							)
							
							if %schSdHoraM% geq 8 (
								if %impParTestHora% equ 1 (
									set /a lastDayHora=30 
								)
								if %impParTestHora% equ 0 (
									set /a lastDayHora=31 
								)
							)
							
							:Configurações_Agendamento_Hora_sd_D
							cls 
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %schSdHoraY%
							echo Mês: %schSdHoraM%
							set /p "schSdHoraD=Dia: "
							set schSdHoraD=%schSdHoraD: =%
							
							if %schSdHoraY% equ %date:~6,4% (
								if %schSdHoraD% gtr %lastDayHora% (
									set /a "schSdHoraD="
									echo ERRO: Digite um valor entre %date:~0,2% e %lastDayHora%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_sd_D
								) else (
									if %schSdHoraD% lss %date:~0,2% (
										set /a "schSdHoraD="
										echo ERRO: Digite um valor entre %date:~0,2% e %lastDayHora%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_sd_D	
									)
								)
							) else (
								if %schSdHoraD% gtr %lastDayHora% (
									set /a "schSdHoraD="
									echo ERRO: Digite um valor entre 1 e %lastDayHora%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_sd_D
								) else (
									if %schSdHoraD% lss 1 (
										set /a "schSdHoraD="
										echo ERRO: Digite um valor entre 1 e %lastDayHora%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_sd_D
									)
								)	
							)
							
							set /a "lastDayHora="
							set "schSdHora=%schSdHoraD%/%schSdHoraM%/%schSdHoraY%"
							set "schSdHora2= /sd %schSdHoraD%/%schSdHoraM%/%schSdHoraY% "
							echo A tarefa será executada a partir do dia %schSdHoraD%/%schSdHoraM%/%schSdHoraY%.
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora
					
					:Configurações_Agendamento_Hora_ed
					echo Digite a data final para a tarefa:
						echo.
						:Configurações_Agendamento_Hora_ed_Y
						set /p "schEdHoraYInput=Ano: "
						set schEdHoraYInput=%schEdHoraYInput: =%
						set /a "schEdHoraY=%schEdHoraYInput%"
						set /a "schEdHoraYLimite=%date:~6,4%+50"
						if %schEdHoraY% gtr %schEdHoraYLimite% (
							set /a "schEdHoraY="
							echo ERRO: Digite um valor entre %date:~6,4% e %schEdHoraYLimite%!
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora_ed
						) else (
							if %schEdHoraY% lss %date:~6,4% (
								set /a "schEdHoraY="
								echo ERRO: Digite um valor entre %date:~6,4% e %schEdHoraYLimite%!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_ed
							)
						)
						set /a "bisextoTest1EdHora=%schEdHoraY% %% 4"
						set /a "bisextoTest2EdHora=%schEdHoraY% %% 100"
						set /a "bisextoTest3EdHora=%schEdHoraY% %% 400"
						set /a "impParTestEdHora=%schEdHoraY% %% 2"
						
						:Configurações_Agendamento_Hora_ed_M
						cls
						echo Digite a data de início para a tarefa:
						echo.
						echo Ano: %schEdHoraY%
						set /p "schEdHoraHoraInput=Mês: "
						set schEdHoraHoraInput=%schEdHoraHoraInput: =%
						set /a schEdHoraM=%schEdHoraHoraInput%
						if %schEdHoraY% equ %date:~6,4% (
							if %schEdHoraM% gtr 12 (
								if %date:~3,2% equ 12 (
									set /a "schEdHoraM="
									echo ERRO: O único valor válido de mês para o ano especificado é 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_ed_M
								) else (
									set /a "schEdHoraM="
									echo ERRO: Digite um valor entre %date:~3,2% e 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_ed_M
								)
							) else (
								if %schEdHoraM% lss %date:~3,2% (
									if %date:~3,2% equ 12 (
										set /a "schEdHoraM="
										echo ERRO: O único valor válido de mês para o ano especificado é 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_ed_M
									) else (
										set /a "schEdHoraM="
										echo ERRO: Digite um valor entre %date:~3,2% e 12!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_ed_M
									)
								)
							)
						) else (
							if %schEdHoraM% gtr 12 (
								set /a "schEdHoraM="
								echo ERRO: Digite um valor entre 1 e 12!
								pause>nul
								cls
								goto :Configurações_Agendamento_Hora_ed_M
							) else (
								if %schEdHoraM% lss 1 (
									set /a "schEdHoraM="
									echo ERRO: Digite um valor entre 1 e 12!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_ed_M
								) 			
							)
						)
						
						if %schEdHoraM% equ 2 (	
							if %bisextoTest1EdHora% equ 0 (								
								if %bisextoTest2EdHora% neq 0 (
									set lastDayEdHora=29 
								) else (
									if %bisextoTest2EdHora% equ 0 (
										set lastDayEdHora=28
									)
								)
							) else (
								if %bisextoTest1EdHora% neq 0 (										
									if %bisextoTest3EdHora% equ 0 (
										set lastDayEdHora=29 
									) else (
										if %bisextoTest3EdHora% neq 0 (
											set lastDayEdHora=28
										)
									)
								)
							)
						)
						
						if %schEdHoraM% neq 2 (
							if %schEdHoraM% leq 7 (				
								if %impParTestEdHora% equ 1 (
									set /a lastDayEdHora=31 
								)
								if %impParTestEdHora% equ 0 (
									set /a lastDayEdHora=30 
								)
							)
						)
						
						if %schEdHoraM% geq 8 (
							if %impParTestEdHora% equ 1 (
								set /a lastDayEdHora=30 
							)
							if %impParTestEdHora% equ 0 (
								set /a lastDayEdHora=31 
							)
						)
						
						:Configurações_Agendamento_Hora_ed_D
							cls 
							echo Digite a data de início para a tarefa:
							echo.
							echo Ano: %schEdHoraY%
							echo Mês: %schEdHoraM%
							set /p "schEdHoraD=Dia: "
							set schEdHoraD=%schEdHoraD: =%
							
							if %schEdHoraY% equ %date:~6,4% (
								if %schEdHoraD% gtr %lastDayEdHora% (
									set /a "schEdHoraD="
									echo ERRO: Digite um valor entre %date:~0,2% e %lastDayEdHora%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_ed_D
								) else (
									if %schEdHoraD% lss %date:~0,2% (
										set /a "schEdHoraD="
										echo ERRO: Digite um valor entre %date:~0,2% e %lastDayEdHora%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_ed_D	
									)
								)
							) else (
								if %schEdHoraD% gtr %lastDayEdHora% (
									set /a "schEdHoraD="
									echo ERRO: Digite um valor entre 1 e %lastDayEdHora%!
									pause>nul
									cls
									goto :Configurações_Agendamento_Hora_ed_D
								) else (
									if %schEdHoraD% lss 1 (
										set /a "schEdHoraD="
										echo ERRO: Digite um valor entre 1 e %lastDayEdHora%!
										pause>nul
										cls
										goto :Configurações_Agendamento_Hora_ed_D
									)
								)	
							)
							
							set /a "lastDayEdHora="
							set "schEdHora=%schEdHoraD%/%schEdHoraM%/%schEdHoraY%"
							set "schEdHora2= /ed %schEdHoraD%/%schEdHoraM%/%schEdHoraY% "
							echo A tarefa será executada a partir do dia %schEdHoraD%/%schEdHoraM%/%schEdHoraY%.
							pause>nul
							cls
							goto :Configurações_Agendamento_Hora

					:Agendamento_Hora
						echo.
						schtasks /query /fo list /tn "FileOrganizer" 2>nul
						if %errorlevel% equ 0 (
							echo schtasks /delete /tn "FileOrganizer" /f
							echo Uma tarefa existente de mesmo nome foi deletada.
							pause
						) else (
							echo schtasks /create /sc %scheduleType%%schMoHora2%%schStHora2%%schEtHora%%schDuHora%%schKHora2%%schSdHora2%%schEdHora2%/tn FileOrganizer /tr %FileOrg_Directory%\FileOrganizer.bat
							echo O Agendamento foi realizado com sucesso!
							pause
							set "scheduleType="
							set "schMo="
							cls
							goto :Organizador_de_Arquivos
						)
				
				::-------------------------------------------------------------------------------------------------------------------------------------------
				
				:Configurações_Agendamento_Dia
				echo.
				echo O que você deseja fazer?
				echo 1)Definir /mo    2)Definir /st    3)Definir /ri
				echo 4)Definir /sd    5)Definir /ed    6)Cancelar
				echo 7)Finalizar
				echo.
				choice /c 1234567 /n /m "Digite> "
				
				if %errorlevel% equ 1 ( goto :Configurações_Agendamento_Dia_mo)
				if %errorlevel% equ 2 ( goto :Configurações_Agendamento_Dia_st )
				if %errorlevel% equ 3 ( goto :Configurações_Agendamento_Dia_ri )
				if %errorlevel% equ 4 ( goto :Configurações_Agendamento_Dia_sd )
				if %errorlevel% equ 5 ( goto :Configurações_Agendamento_Dia_ed )
				if %errorlevel% equ 6 ( goto :Configurações_Agendamento )
				if %errorlevel% equ 7 ( goto :Agendamento_Dia )
				
					:Configurações_Agendamento_Dia_mo
					set "scheduleType=daily"
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
							goto :Configurações_Agendamento_Dia_mo
						) else (
							echo A tarefa será executada a cada %schMo% dias.
							pause>nul
							goto :Configurações_Agendamento_Dia
						)
					)
					
					:Configurações_Agendamento_Dia_st
					
					:Configurações_Agendamento_Dia_ri
					
					:Configurações_Agendamento_Dia_sd
					
					:Configurações_Agendamento_Dia_ed
					
					:Agendamento_Dia
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %scheduleType% /mo %schMo% /tn FileOrganizer /tr %FileOrg_Directory%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "scheduleType="
						set "schMo="
						cls
						goto :Home
					)
				
				::-------------------------------------------------------------------------------------------------------------------------------------------
				
				:Configurações_Agendamento_Semana
				echo.
				echo O que você deseja fazer?
				echo 1)Definir /mo    2)Definir /st    3)Definir /ri
				echo 4)Definir /sd    5)Definir /ed    6)Definir /d
				echo 7)Cancelar       8)Finalizar
				echo.
				choice /c 12345678 /n /m "Digite> "
				
				if %errorlevel% equ 1 ( goto :Configurações_Agendamento_Semana_mo)
				if %errorlevel% equ 2 ( goto :Configurações_Agendamento_Semana_st )
				if %errorlevel% equ 3 ( goto :Configurações_Agendamento_Semana_ri )
				if %errorlevel% equ 4 ( goto :Configurações_Agendamento_Semana_sd )
				if %errorlevel% equ 5 ( goto :Configurações_Agendamento_Semana_ed )
				if %errorlevel% equ 6 ( goto :Configurações_Agendamento_Semana_d )
				if %errorlevel% equ 7 ( goto :Configurações_Agendamento )
				if %errorlevel% equ 8 ( goto :Agendamento_Semana )
					
					:Configurações_Agendamento_Semana_mo
					set "scheduleType=weekly"
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
							goto :Configurações_Agendamento_Semana_mo
						) else (
							echo A tarefa será executada a cada %schMo% semanas.
							pause>nul
							goto :Configurações_Agendamento_Semana
						)
					)
					
					:Configurações_Agendamento_Semana_st
					
					:Configurações_Agendamento_Semana_ri
					
					:Configurações_Agendamento_Semana_sd
					
					:Configurações_Agendamento_Semana_ed
					
					:Configurações_Agendamento_Semana_d
				
					:Agendamento_Semana
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %scheduleType% /mo %schMo% /tn FileOrganizer /tr %FileOrg_Directory%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "scheduleType="
						set "schMo="
						cls
						goto :Home
					)
				
				::-------------------------------------------------------------------------------------------------------------------------------------------
				
				:Configurações_Agendamento_Mes
				echo.
				echo O que você deseja fazer?
				echo 1)Definir /mo    2)Definir /st     3)Definir /ri
				echo 4)Definir /sd    5)Definir /ed     6)Definir /d
				echo 7)Definir /m     8)Cancelar        9)Finalizar
				echo.
				choice /c 123456789 /n /m "Digite> "
				
				if %errorlevel% equ 1 ( goto :Configurações_Agendamento_Mes_mo )
				if %errorlevel% equ 2 ( goto :Configurações_Agendamento_Mes_st )
				if %errorlevel% equ 3 ( goto :Configurações_Agendamento_Mes_ri )
				if %errorlevel% equ 4 ( goto :Configurações_Agendamento_Mes_sd )
				if %errorlevel% equ 5 ( goto :Configurações_Agendamento_Mes_ed )
				if %errorlevel% equ 6 ( goto :Configurações_Agendamento_Mes_d )
				if %errorlevel% equ 7 ( goto :Configurações_Agendamento_Mes_m )
				if %errorlevel% equ 8 ( goto :Configurações_Agendamento )
				if %errorlevel% equ 9 ( goto :Agendamento_Mes )
					
					:Configurações_Agendamento_Mes_mo
					set "scheduleType=monthly"
					echo Digite com que frequência o programa deve ser executado automáticamente(1-12 meses):
					echo.
					set /p "schMo="
					if %schMo% gtr 12 (
						set /a "schMo="
						echo ERRO: Digite um valor entre 1 e 12!
						pause>nul
						cls
						goto :Configurações_Agendamento_Mes_mo
					) else (
						if %schMo% lss 1 (	
							set /a "schMo="
							echo ERRO: Digite um valor entre 1 e 12!
							pause>nul
							cls
							goto :Configurações_Agendamento_Mes_mo
						) else (
							echo A tarefa será executada a cada %schMo% meses.
							pause>nul
							goto :Configurações_Agendamento_Mes
						)
					)
					
					:Configurações_Agendamento_Mes_st
					
					:Configurações_Agendamento_Mes_ri
					
					:Configurações_Agendamento_Mes_sd
					
					:Configurações_Agendamento_Mes_ed
					
					:Configurações_Agendamento_Mes_d
					
					:Configurações_Agendamento_Mes_m 
					
				
					:Agendamento_Mes
					schtasks /query /fo list /tn "FileOrganizer">nul
					if %errorlevel% equ 0 (
						schtasks /delete /tn "FileOrganizer" /f
						echo deletado
						pause
					) else (
						schtasks /create /sc %scheduleType% /mo %schMo% /tn FileOrganizer /tr %FileOrg_Directory%\FileOrganizer.bat
						echo O Agendamento foi realizado com sucesso!
						pause
						set "scheduleType="
						set "schMo="
						cls
						goto :Home
					)
				
				:Configurações_Agendamento_OnStart
				set "scheduleType=Minute"
				echo Digite com que frequência o programa deve ser executado automáticamente:
				echo.
				set /p schMo=
				
				:Configurações_Agendamento_OnIdle
				set "scheduleType=Minute"
				echo Digite com que frequência o programa deve ser executado automáticamente:
				echo.
				set /p schMo=
				
				:Configurações_Agendamento_UmaVez
				set "scheduleType=Minute"
			
			:Cancelar_Agendamento
			schtasks /query /fo list /tn "FileOrganizer">nul
			if %errorlevel% equ 0 (
				schtasks /delete /tn "FileOrganizer" /f
				pause>nul
				cls
			)
			goto :Configurações
			:://////////////////////////////////////////////////////////////////////////////
	
		:Exec_Organizador_de_Arquivos
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
		goto Organizador_de_Arquivos
		
	:Organizador_de_Pastas
		