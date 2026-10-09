@echo off
setlocal

call "%~dp0..\config\delphi.env.cmd"

if not exist "%RickCalculator_RSVARS%" goto RSVARS_NOT_FOUND

call "%RickCalculator_RSVARS%"
if errorlevel 1 goto RSVARS_ERROR

echo.
echo ============================================
echo RickCalculator - Ambiente Delphi carregado
echo ============================================
echo.
echo Root........: %RickCalculator_ROOT%
echo BDS.........: %BDS%
echo Delphi Bin..: %RickCalculator_DELPHI_BIN%
echo Workspace...: %RickCalculator_WORKSPACE%
echo Artifacts...: %RickCalculator_ARTIFACTS%
echo.

where dcc32.exe
where msbuild.exe

endlocal
exit /b 0

:RSVARS_NOT_FOUND
echo [ERRO] rsvars.bat nao encontrado:
echo "%RickCalculator_RSVARS%"
endlocal
exit /b 1

:RSVARS_ERROR
echo [ERRO] Falha ao carregar o ambiente Delphi.
endlocal
exit /b 1
