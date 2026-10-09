# SPEC-110 — QA FUNCTIONAL AGENT

## 1. Identificação

```text
ID: SPEC-110
Título: QA FUNCTIONAL AGENT
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Valida comportamento contra AC.

## 3. Problema que resolve

Sem contrato específico, o Agent pode ultrapassar sua responsabilidade de QA funcional.

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

- corrigir implementação ou editar requisito

## 6. Entradas

- SPEC-109_CODE_REVIEWER_AGENT
- SPEC-003_HANDOFF_E_BLOCKERS
- SPEC-004_NO_ASSUMPTION_E_ESCALACAO

## 7. Saídas

- contrato do Agent QA FUNCTIONAL AGENT

## 8. Responsável

```text
Owner: QA FUNCTIONAL AGENT
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-109_CODE_REVIEWER_AGENT`

## 10. Regras

1. Executar cenários aceitos.
2. Registrar evidência reproduzível.
3. Não inferir requisitos.
4. Emitir PASS ou defeito tipado.
5. Toda dúvida fora de autoridade gera blocker/handoff.
6. O Agent não consulta Build Specs durante runtime; seu comportamento final deve incorporar as regras necessárias.

## 11. Critérios de aceitação

- `AC-110-01` — Responsabilidade é estreita.
- `AC-110-02` — Entradas e saídas são identificáveis.
- `AC-110-03` — Problemas externos são roteados.
- `AC-110-04` — Nenhuma decisão por suposição.

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
Next: `SPEC-111_UI_QA_AGENT`
```
