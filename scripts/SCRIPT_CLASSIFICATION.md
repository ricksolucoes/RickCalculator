# SCRIPT CLASSIFICATION — RickCalculator

## ACTIVE RUNTIME / BUILD

```text
env.cmd
delphi-shell.cmd
build-project.cmd
assert-zero-warnings.ps1
runtime-init.ps1
runtime-status.ps1
runtime-set-stage.ps1
runtime-blocker.ps1
```

## LEGACY / DIAGNOSTIC SCRIPTS

Os scripts do workflow anterior foram removidos deste pacote limpo.

Se no futuro houver necessidade real de diagnóstico do ambiente Delphi, o problema deve gerar blocker técnico e o diagnóstico apropriado poderá ser criado ou restaurado de forma controlada.

## Proibições

Nenhum script pode:

- interpretar requisito;
- escolher arquitetura;
- decidir expected result;
- escolher próximo Agent por lógica de produto;
- declarar QA PASS;
- declarar Release PASS sem evidência real.

## Estado

```text
SCRIPTS CONTRACT: IMPLEMENTED
LEGACY SCRIPTS IN NORMAL PACKAGE: 0
```
