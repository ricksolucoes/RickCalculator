@echo off

rem ============================================================
rem RickCalculator - Configuracao portavel do workspace e Delphi
rem ============================================================

rem A raiz do RickCalculator e calculada a partir desta pasta config.
rem Nao depende de letra de unidade ou caminho fixo.
for %%I in ("%~dp0..") do set "RickCalculator_ROOT=%%~fI"

set "RickCalculator_WORKSPACE=%RickCalculator_ROOT%\workspace"
set "RickCalculator_ARTIFACTS=%RickCalculator_ROOT%\artifacts"
set "RickCalculator_LOGS=%RickCalculator_ROOT%\logs"
set "RickCalculator_VALIDATION=%RickCalculator_ROOT%\validation"
set "RickCalculator_AGENTS=%RickCalculator_ROOT%\agents"

rem ============================================================
rem Delphi alvo deste pacote
rem ============================================================

set "RickCalculator_DELPHI_VERSION=20.0"
set "RickCalculator_DELPHI_PRODUCT=Delphi 10.3 Rio"

rem Permite configurar outra instalacao sem editar os scripts:
rem   set RickCalculator_DELPHI_HOME=C:\...\Embarcadero\Studio\20.0
rem
rem Se nao houver override, tenta reutilizar BDS quando ele ja
rem apontar para Studio 20.0. Caso contrario, usa o local padrao.
if defined RickCalculator_DELPHI_HOME goto DELPHI_HOME_READY

if defined BDS goto CHECK_EXISTING_BDS

goto USE_DEFAULT_DELPHI

:CHECK_EXISTING_BDS
echo %BDS% | findstr /I /C:"\Studio\20.0" >nul
if errorlevel 1 goto USE_DEFAULT_DELPHI
set "RickCalculator_DELPHI_HOME=%BDS%"
goto DELPHI_HOME_READY

:USE_DEFAULT_DELPHI
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\20.0"

:DELPHI_HOME_READY
set "RickCalculator_BDS=%RickCalculator_DELPHI_HOME%"
set "RickCalculator_DELPHI_BIN=%RickCalculator_BDS%\bin"
set "RickCalculator_RSVARS=%RickCalculator_DELPHI_BIN%\rsvars.bat"
