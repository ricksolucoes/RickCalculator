# SPEC-108 — REFACTOR SPECIALIST AGENT

## 1. Identificação

```text
ID: SPEC-108
Título: REFACTOR SPECIALIST AGENT
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Refatora após GREEN sem mudar comportamento.

## 3. Problema que resolve

Sem contrato específico, o Agent pode ultrapassar sua responsabilidade de qualidade e estrutura interna.

## 4. Justificativa de necessidade

A equipe precisa de especialistas pequenos e previsíveis, não de um super-agent.

## 5. Escopo

### IN SCOPE

- responsabilidade exclusiva
- entradas
- saídas
- blockers
- handoff

### OUT OF SCOPE

- nova funcionalidade ou mudança de requisito

## 6. Entradas

- SPEC-107_PRODUCTION_DEVELOPER_AGENT
- SPEC-003_HANDOFF_E_BLOCKERS
- SPEC-004_NO_ASSUMPTION_E_ESCALACAO

## 7. Saídas

- contrato do Agent REFACTOR SPECIALIST AGENT

## 8. Responsável

```text
Owner: REFACTOR SPECIALIST AGENT
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-107_PRODUCTION_DEVELOPER_AGENT`

## 10. Regras

1. Avaliar duplicação, SRP, acoplamento e toxicity.
2. Refatorar só quando houver melhoria concreta.
3. Reexecutar suíte completa.
4. Registrar quando nenhuma alteração é necessária.
5. Toda dúvida fora de autoridade gera blocker/handoff.
6. O Agent não consulta Build Specs durante runtime; seu comportamento final deve incorporar as regras necessárias.

## 11. Critérios de aceitação

- `AC-108-01` — Responsabilidade é estreita.
- `AC-108-02` — Entradas e saídas são identificáveis.
- `AC-108-03` — Problemas externos são roteados.
- `AC-108-04` — Nenhuma decisão por suposição.

## 12. Blockers

- AGENT CONTRACT BLOCKER

## 13. Observação de runtime

Esta Build Spec será usada na fase seguinte para criar o arquivo físico do Agent correspondente.

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
Next: `SPEC-109_CODE_REVIEWER_AGENT`
```
