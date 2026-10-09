@echo off
setlocal

rem ============================================================
rem RickCalculator - Generic Delphi Project Builder
rem
rem Uso:
rem build-project.cmd Projeto.dproj [Config] [Platform]
rem
rem Exemplo:
rem build-project.cmd Calculator.dproj Debug Win32
rem ============================================================

call "%~dp0..\config\delphi.env.cmd"

if "%~1"=="" goto USAGE

set "PROJECT_FILE=%~f1"
set "BUILD_CONFIG=%~2"
set "BUILD_PLATFORM=%~3"

if "%BUILD_CONFIG%"=="" set "BUILD_CONFIG=Debug"
if "%BUILD_PLATFORM%"=="" set "BUILD_PLATFORM=Win32"

if not exist "%PROJECT_FILE%" goto PROJECT_NOT_FOUND

if not exist "%RickCalculator_RSVARS%" goto RSVARS_NOT_FOUND

call "%RickCalculator_RSVARS%"

if errorlevel 1 goto RSVARS_ERROR

where msbuild.exe >nul 2>&1

if errorlevel 1 goto MSBUILD_NOT_FOUND

echo.
echo ============================================================
echo RickCalculator - Build Delphi
echo ============================================================
echo.
echo Projeto.......: %PROJECT_FILE%
echo Configuracao..: %BUILD_CONFIG%
echo Plataforma....: %BUILD_PLATFORM%
echo Delphi........: %BDS%
echo.

set "BUILD_LOG=%TEMP%\RickCalculator-build-%RANDOM%-%RANDOM%.log"
msbuild "%PROJECT_FILE%" ^
    /t:Build ^
    /p:Config=%BUILD_CONFIG% ^
    /p:Platform=%BUILD_PLATFORM% ^
    /nologo > "%BUILD_LOG%" 2>&1
set "BUILD_EXIT=%ERRORLEVEL%"
type "%BUILD_LOG%"
if not "%BUILD_EXIT%"=="0" goto BUILD_ERROR
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0assert-zero-warnings.ps1" -LogPath "%BUILD_LOG%"
if errorlevel 1 goto BUILD_WARNING
if exist "%BUILD_LOG%" del /q "%BUILD_LOG%"

echo.
echo ============================================================
echo BUILD CONCLUIDO COM SUCESSO
echo ============================================================
echo.

exit /b 0


:USAGE

echo.
echo Uso:
echo.
echo   build-project.cmd Projeto.dproj [Config] [Platform]
echo.
echo Exemplo:
echo.
echo   build-project.cmd Calculator.dproj Debug Win32
echo.
exit /b 1


:PROJECT_NOT_FOUND

echo.
echo [ERRO] Projeto nao encontrado:
echo "%PROJECT_FILE%"
echo.
exit /b 1


:RSVARS_NOT_FOUND

echo.
echo [ERRO] rsvars.bat nao encontrado:
echo "%RickCalculator_RSVARS%"
echo.
exit /b 1


:RSVARS_ERROR

echo.
echo [ERRO] Falha ao carregar ambiente Delphi.
echo.
exit /b 1


:MSBUILD_NOT_FOUND

echo.
echo [ERRO] MSBuild.exe nao encontrado.
echo.
exit /b 1


:BUILD_ERROR

echo.
echo ============================================================
echo BUILD FALHOU
echo ============================================================
echo.
exit /b 1
:BUILD_WARNING

echo.
echo ============================================================
echo BUILD REPROVADO: WARNINGS ENCONTRADOS
echo ============================================================
echo.
if exist "%BUILD_LOG%" del /q "%BUILD_LOG%"
exit /b 1
