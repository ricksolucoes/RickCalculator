# SPEC-122 — CONFIG CONTRACT

## 1. Identificação

```text
ID: SPEC-122
Título: CONFIG CONTRACT
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir configuração runtime mínima.

## 3. Problema que resolve

Paths e ambiente não podem ser inventados pelos Agents.

## 4. Justificativa de necessidade

O ambiente Delphi já foi validado e deve ser consumido por Config.

## 5. Escopo

### IN SCOPE

- Delphi environment
- platform/config defaults
- paths configuráveis

### OUT OF SCOPE

- revalidação completa do ambiente em todo prompt
- requisito de produto

## 6. Entradas

- config existente
- SPEC-045

## 7. Saídas

- contrato de config

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-121_POLICIES_MAPPING`

## 10. Regras

1. Agents leem configuração; não hardcodam paths de máquina em contratos.
2. Ambiente validado é pré-condição operacional.
3. Se config divergir da máquina real, gerar CONFIG/BUILD blocker, não adivinhar.
4. Win32 Debug para desenvolvimento e Release para final conforme quality spec.

## 11. Critérios de aceitação

- `AC-122-01` — Config centraliza valores mutáveis.
- `AC-122-02` — Agent não inventa caminho.

## 12. Blockers

- CONFIG BLOCKER

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
Next: `SPEC-123_SCRIPTS_CONTRACT`
```
