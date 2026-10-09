# SPEC-002 — GATES E APROVAÇÕES

## 1. Identificação

```text
ID: SPEC-002
Título: GATES E APROVAÇÕES
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir gates objetivos para passagem entre responsabilidades.

## 3. Problema que resolve

Sem gates, etapas podem avançar sem comprovação.

## 4. Justificativa de necessidade

Uma equipe especializada precisa de aceitação objetiva entre entregas.

## 5. Escopo

### IN SCOPE

- PASS/FAIL/BLOCKED
- critérios de avanço
- aprovação automática documental autorizada
- gate runtime

### OUT OF SCOPE

- conteúdo técnico das etapas
- implementação de Agents

## 6. Entradas

- SPEC-000
- SPEC-001

## 7. Saídas

- contrato único de gate

## 8. Responsável

```text
Owner: Governança da Construção
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-001_FONTE_DE_VERDADE`

## 10. Regras

1. Gate contém status, evidência, blockers, decisão e destino.
2. ADVANCE exige critérios satisfeitos e zero blocker.
3. FAIL/RETURN devolve ao owner correto.
4. HUMAN_DECISION_REQUIRED só quando a equipe não pode resolver objetivamente.

## 11. Critérios de aceitação

- `AC-002-01` — Nenhum avanço sem evidência.
- `AC-002-02` — Gate possui decisão inequívoca.
- `AC-002-03` — Blocker impede ADVANCE.

## 12. Blockers

- GATE BLOCKER

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
Next: `SPEC-003_HANDOFF_E_BLOCKERS`
```
