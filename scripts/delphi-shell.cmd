@echo off

rem ============================================================
rem RickCalculator - Delphi Shell
rem ============================================================

call "%~dp0..\config\delphi.env.cmd"

if not exist "%RickCalculator_RSVARS%" goto RSVARS_NOT_FOUND

echo.
echo ============================================================
echo RickCalculator - Preparando Delphi
echo ============================================================
echo.

echo BDS global.......: %BDS%
echo RickCalculator BDS.......: %RickCalculator_BDS%
echo Delphi Version...: %RickCalculator_DELPHI_VERSION%
echo rsvars............: %RickCalculator_RSVARS%
echo.

rem ============================================================
rem Preservar BDS global antes que rsvars seja executado
rem ============================================================

set "RickCalculator_ORIGINAL_BDS=%BDS%"

rem O rsvars do Studio 20.0 deve configurar o processo atual.
call "%RickCalculator_RSVARS%"

if errorlevel 1 goto RSVARS_ERROR

cd /d "%RickCalculator_ROOT%"

echo.
echo ============================================================
echo Ambiente Delphi carregado
echo ============================================================
echo.

echo BDS..............: %BDS%
echo BDSCOMMONDIR.....: %BDSCOMMONDIR%
echo FrameworkDir.....: %FrameworkDir%
echo FrameworkVersion.: %FrameworkVersion%
echo.

where dcc32.exe

if errorlevel 1 goto DCC_NOT_FOUND

where msbuild.exe

if errorlevel 1 goto MSBUILD_NOT_FOUND

echo.
echo ============================================================
echo AMBIENTE PRONTO
echo ============================================================
echo.

goto END


:RSVARS_NOT_FOUND

echo.
echo [ERRO] rsvars.bat nao encontrado.
echo.
echo Caminho esperado:
echo "%RickCalculator_RSVARS%"
echo.
exit /b 1


:RSVARS_ERROR

echo.
echo [ERRO] Falha ao executar rsvars.bat.
echo.
exit /b 1


:DCC_NOT_FOUND

echo.
echo [ERRO] dcc32.exe nao encontrado no PATH.
echo.
exit /b 1


:MSBUILD_NOT_FOUND

echo.
echo [ERRO] MSBuild.exe nao encontrado no PATH.
echo.
exit /b 1


:END