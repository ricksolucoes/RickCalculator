# SPEC-045 — BUILD QUALITY

## 1. Identificação

```text
ID: SPEC-045
Título: BUILD QUALITY
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir quality gate de build e arquivos Delphi.

## 3. Problema que resolve

ExitCode 0 isolado não comprova qualidade de build.

## 4. Justificativa de necessidade

O projeto exige zero warnings e encoding consistente.

## 5. Escopo

### IN SCOPE

- Errors
- Warnings
- UTF-8 BOM
- dproj XML
- Debug/Release

### OUT OF SCOPE

- paths de instalação; pertencem à config existente

## 6. Entradas

- SPEC-044

## 7. Saídas

- build quality contract

## 8. Responsável

```text
Owner: Build Release Validator / Code Reviewer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-044_METHOD_TOXICITY`

## 10. Regras

1. Errors = 0.
2. Warnings = 0; não suprimir warning para obter PASS.
3. Textuais Delphi criados/alterados usam UTF-8 BOM.
4. dproj permanece XML válido; não forçar BOM cegamente.
5. Debug Win32 para desenvolvimento/teste; Release Win32 para artefato final salvo decisão aprovada diferente.

## 11. Critérios de aceitação

- `AC-045-01` — Zero errors/warnings.
- `AC-045-02` — Encoding validável.
- `AC-045-03` — Build final Release Win32.

## 12. Blockers

- BUILD QUALITY BLOCKER

## 14. Evidências documentais

```text
Documento criado
Estrutura mínima conferida
Dependências declaradas
Escopo e fora de escopo declarados
Regras e critérios de aceitação presentes
Auditoria documental: PASS
```

## 15. Checklist

```text
[x] Objetivo definido
[x] Problema definido
[x] Necessidade comprovada
[x] Escopo fechado
[x] Fora de escopo fechado
[x] Entradas definidas
[x] Saídas definidas
[x] Responsável definido
[x] Dependências definidas
[x] Regras definidas
[x] Critérios de aceitação definidos
[x] Blockers avaliados
[x] Nenhuma decisão depende de suposição não registrada
[x] Auditoria documental concluída
```

## 16. Gate

```text
Status: COMPLETE
Acceptance: PASS
Open Blockers: 0
Decision: ADVANCE
Next: `SPEC-046_ARQUITETURA_BASE`
```
