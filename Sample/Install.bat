@ECHO OFF
SETLOCAL
SET BIN1=C:\ShellExecute\ShellExecute.exe
SET BIN2=C:\ShellExecute\Administrator\ShellExecute.exe
SET REG_DIRECTORY_BACKGROUND_SHELL=HKCR\Directory\Background\shell
SET REG_DIRECTORY_SHELL=HKCR\Directory\shell
SET REG_DRIVE_SHELL=HKCR\Drive\shell
SET MENU_CAPTION1="コマンド プロンプト..."
SET MENU_CAPTION2="コマンド プロンプト (管理者)..."
SET ARGS_BACKGROUND_SHELL1="\"%BIN1%\" open cmd.exe \"\" \"%%V\" 5"
SET ARGS_BACKGROUND_SHELL2="\"%BIN2%\" open cmd.exe \"\" \"%%V\" 5"
SET ARGS_DIRECTORY_SHELL1="\"%BIN1%\" open cmd.exe \"\" \"%%1\" 5"
SET ARGS_DIRECTORY_SHELL2="\"%BIN2%\" open cmd.exe \"\" \"%%1\" 5"
SET ARGS_DRIVE_SHELL1="\"%BIN1%\" open cmd.exe \"\" %%1 5"
SET ARGS_DRIVE_SHELL2="\"%BIN2%\" open cmd.exe \"\" %%1 5"

ECHO コマンドプロンプト 右クリックメニューをインストールします。
PAUSE

IF NOT EXIST %BIN1% (
    ECHO %BIN1% がありません。
    EXIT /B
)

IF NOT EXIST %BIN2% (
    ECHO %BIN1% がありません。
    EXIT /B
)

ECHO ON
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\AdministratorCommand /ve /t REG_SZ /d %MENU_CAPTION2% /f
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\AdministratorCommand /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\AdministratorCommand\command /ve /t REG_SZ /d %ARGS_BACKGROUND_SHELL2% /f
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\CommandPrompt /ve /t REG_SZ /d %MENU_CAPTION1% /f
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\CommandPrompt /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DIRECTORY_BACKGROUND_SHELL%\CommandPrompt\command /ve /t REG_SZ /d %ARGS_BACKGROUND_SHELL1% /f
REG ADD %REG_DIRECTORY_SHELL%\AdministratorCommand /ve /t REG_SZ /d %MENU_CAPTION2% /f
REG ADD %REG_DIRECTORY_SHELL%\AdministratorCommand /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DIRECTORY_SHELL%\AdministratorCommand\command /ve /t REG_SZ /d %ARGS_DIRECTORY_SHELL2% /f
REG ADD %REG_DIRECTORY_SHELL%\CommandPrompt /ve /t REG_SZ /d %MENU_CAPTION1% /f
REG ADD %REG_DIRECTORY_SHELL%\CommandPrompt /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DIRECTORY_SHELL%\CommandPrompt\command /ve /t REG_SZ /d %ARGS_DIRECTORY_SHELL1% /f
REG ADD %REG_DRIVE_SHELL%\AdministratorCommand /ve /t REG_SZ /d %MENU_CAPTION2% /f
REG ADD %REG_DRIVE_SHELL%\AdministratorCommand /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DRIVE_SHELL%\AdministratorCommand\command /ve /t REG_SZ /d %ARGS_DRIVE_SHELL2% /f
REG ADD %REG_DRIVE_SHELL%\CommandPrompt /ve /t REG_SZ /d %MENU_CAPTION1% /f
REG ADD %REG_DRIVE_SHELL%\CommandPrompt /v Icon /t REG_SZ /d cmd.exe /f
REG ADD %REG_DRIVE_SHELL%\CommandPrompt\command /ve /t REG_SZ /d %ARGS_DRIVE_SHELL1% /f
@PAUSE
