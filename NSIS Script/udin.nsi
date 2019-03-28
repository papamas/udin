;NSIS Modern User Interface
;Basic Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  SetCompressor /solid lzma
  XPStyle on
  ;Name and file
  
  !define PRODUCT_NAME "SiUdin"
  !define PRODUCT_VERSION "1.0"
  !define PRODUCT_PUBLISHER "Nur Muhamad Holik"
  !define PRODUCT_WEB_SITE "https://github.com/papamas"
  !define WORK_DIR "d:\production\"
  Caption "SiUDIN ${PRODUCT_VERSION} For Windows"
  
  Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  OutFile "${WORK_DIR}\dist\SiUDIN-${PRODUCT_VERSION}-setup.exe"

  ;Default installation folder
  InstallDir "c:\udin"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\siudin" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin
  BGGradient f87820 FFFFFF FFFFFF
  InstallColors FF8080 000030

;--------------------------------
;Interface Settings
  !define MUI_LANGDLL_REGISTRY_ROOT "HKLM"
  !define MUI_LANGDLL_REGISTRY_KEY "Software\siudin"
  !define MUI_LANGDLL_REGISTRY_VALUENAME "lang"

  !define MUI_ABORTWARNING
  !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
  !define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

;--------------------------------
;Pages
  
  !include LogicLib.nsh

  !insertmacro MUI_PAGE_LICENSE "${WORK_DIR}\gpl-2.0.txt"
  ;!insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------

!macro VerifyUserIsAdmin
UserInfo::GetAccountType
pop $0
${If} $0 != "admin" ;Require admin rights on NT4+
        messageBox mb_iconstop "Administrator rights required!"
        setErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
        quit
${EndIf}
!macroend
 
function .onInit
	setShellVarContext all
	!insertmacro VerifyUserIsAdmin
functionEnd
 
;Installer Sections
Section "Installer SiUDIN" 

  SetOverwrite ifnewer
  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File "${WORK_DIR}\udin\dbsiudin_backup.bat"
  File "${WORK_DIR}\udin\dbsiudin_installservice.bat"
  File "${WORK_DIR}\udin\dbsiudin_restore.bat"
  File "${WORK_DIR}\udin\dbsiudin_start.bat"
  File "${WORK_DIR}\udin\dbsiudin_stop.bat"
  File "${WORK_DIR}\udin\dbsiudin_uninstallservice.bat"
  File "${WORK_DIR}\udin\README.txt"
  File "${WORK_DIR}\udin\SiUDIN_Simulasi_Ternate.sql"
  File "${WORK_DIR}\udin\SiUDIN_Starter.sql"
  File "${WORK_DIR}\udin\websiudin_installservice.bat"
  File "${WORK_DIR}\udin\websiudin_start.bat"
  File "${WORK_DIR}\udin\websiudin_stop.bat"
  File "${WORK_DIR}\udin\websiudin_uninstallservice.bat"
  
  SetOutPath "$INSTDIR\apache"
  File /r "${WORK_DIR}\udin\apache\*"
  ;SetOutPath "$INSTDIR\apache"
  
  SetOutPath "$INSTDIR\mysql"
  File /r "${WORK_DIR}\udin\mysql\*"
  ;SetOutPath "$INSTDIR\mysql"
  
  SetOutPath "$INSTDIR\php"
  File /r "${WORK_DIR}\udin\php\*"
  ;SetOutPath "$INSTDIR\php"
  
  SetOutPath "$INSTDIR\tmp"
  File /r "${WORK_DIR}\udin\tmp\*"
 
  ;Store installation folder
  WriteRegStr HKCU "Software\siudin" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  ;install service web SiUDIN
  ;cek terlebih dahulu apakah service ada?
  SimpleSC::ExistsService "WebSiUdin"
  Pop $0
    ${If} $0 == 0
	    ; apakah service sedang runing
		SimpleSC::ServiceIsRunning "WebSiUdin"
		Pop $0
		Pop $1 
		    ${If} $1 == 0 
				; karena service telah ada dan belum running coba jalankan service
				DetailPrint "Try to start service WebSiUdin"	
				ExecWait "$INSTDIR\websiudin_start.bat"	
			${Else}
			    DetailPrint "Service WebSiUdin has been Running...."
			${EndIf}
  ${Else}
    ; karena service blm ada maka coba install service
    DetailPrint "Try to Install service WebSiUdin"
    ExecWait "$INSTDIR\websiudin_installservice.bat"
  ${EndIf}
  
  ;install service Database SiUdin
  ;cek terlebih dahulu apakah service ada?
  SimpleSC::ExistsService "Database SiUdin"
  Pop $0
    ${If} $0 == 0
	    ; apakah service sedang runing
		SimpleSC::ServiceIsRunning "Database SiUdin"
		Pop $0
		Pop $1 
		    ${If} $1 == 0 
				; karena service telah ada dan belum running coba jalankan service
				DetailPrint "Try to start service Database SiUdin"	
				ExecWait "$INSTDIR\dbsiudin_start.bat"	
			${Else}
			    DetailPrint "Service Database SiUdin has been Running...."
			${EndIf}
  ${Else}
    ; karena service blm ada maka coba install service
    DetailPrint "Try to Install service Database SiUdin"
    ExecWait '$INSTDIR\mysql\bin\mysqld --install "Database SiUdin" --defaults-file="$INSTDIR\mysql\my.ini"'
	DetailPrint "Try to Start Database SiUdin"
	ExecWait 'net start "Database SiUdin"'
  ${EndIf}
  
  ExecShell "open" "http://127.0.0.1/udin/4admin/"

SectionEnd




Section "Uninstall"

  ;Uninstall service websiudin terlebih dahulu
  ;cek apakah service ada
  SimpleSC::ExistsService "WebSiUdin"
  Pop $0
    ${If} $0 == 0
	    ; cek apakah service sedang runing
		SimpleSC::ServiceIsRunning "WebSiUdin"
		Pop $0
		Pop $1 
		    ${If} $1 == 0 
				; service tidak runing maka coba uninstall service
				DetailPrint "Try to uninstall service WebSiUdin"	
                ExecWait "$INSTDIR\websiudin_uninstallservice.bat"					
			${Else}
			    ; service tidak running maka stop terlebih dahulu
			    ;DetailPrint "Try to Stop service WebSiUdin"	
			    ;ExecWait "$INSTDIR\websiudin_stop.bat"	
				
				DetailPrint "Try to uninstall service WebSiUdin"	
                ExecWait "$INSTDIR\websiudin_uninstallservice.bat"	
			${EndIf}
  ${Else}
    DetailPrint "Service WebSiUdin has been uninstall from service"
  ${EndIf}
  
  ;Uninstall service Database SiUDIN terlebih dahulu
  ;cek apakah service ada
  SimpleSC::ExistsService "Database SiUdin"
  Pop $0
    ${If} $0 == 0
	    ; cek apakah service sedang runing
		SimpleSC::ServiceIsRunning "Database SiUdin"
		Pop $0
		Pop $1 
		    ${If} $1 == 0 
				; service tidak runing maka coba uninstall service
				DetailPrint "Try to uninstall service Database SiUdin"	
                ExecWait '$INSTDIR\mysql\bin\mysqld.exe --remove "Database SiUdin" '					
			${Else}
			    ; service running maka stop terlebih dahulu
			    ;DetailPrint "Try to Stop service Database SiUdin"	
			    ;ExecWait "$INSTDIR\dbsiudin_stop.bat"	
				DetailPrint "Try to Stop Service Database SiUdin"
				ExecWait 'net stop "Database SiUdin" '
				
				DetailPrint "Try to uninstall service Database SiUdin"	
                ExecWait '$INSTDIR\mysql\bin\mysqld.exe --remove "Database SiUdin" '	
			${EndIf}
  ${Else}
    DetailPrint "Service Database SiUdin has been uninstall from service"
  ${EndIf}

  ;ADD YOUR OWN FILES HERE...
  RMDir /r "$INSTDIR\apache"
  RMDir /r "$INSTDIR\mysql"
  RMDir /r "$INSTDIR\php"
  RMDir /r "$INSTDIR\tmp"
  
  
  Delete "$INSTDIR\dbsiudin_backup.bat"
  Delete "$INSTDIR\dbsiudin_installservice.bat"
  Delete "$INSTDIR\dbsiudin_restore.bat"
  Delete "$INSTDIR\dbsiudin_start.bat"
  Delete "$INSTDIR\dbsiudin_stop.bat"
  Delete "$INSTDIR\dbsiudin_uninstallservice.bat"
  Delete "$INSTDIR\README.txt"
  Delete "$INSTDIR\SiUDIN_Simulasi_Ternate.sql"
  Delete "$INSTDIR\SiUDIN_Starter.sql"
  Delete "$INSTDIR\websiudin_installservice.bat"
  Delete "$INSTDIR\websiudin_start.bat"
  Delete "$INSTDIR\websiudin_stop.bat"
  Delete "$INSTDIR\websiudin_uninstallservice.bat"
  
 
  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\siudin"

SectionEnd