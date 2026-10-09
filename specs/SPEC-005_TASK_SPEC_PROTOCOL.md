# SPEC-005 — TASK SPEC PROTOCOL

## 1. Identificação

```text
ID: SPEC-005
Título: TASK SPEC PROTOCOL
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como Agents criam, aprovam, usam e encerram Task Specs durante uma solicitação real.

## 3. Problema que resolve

Build Specs não estarão disponíveis como dependência runtime; a equipe precisa de artefatos operacionais próprios.

## 4. Justificativa de necessidade

Permite colaboração estruturada sem transformar Build Specs em runtime.

## 5. Escopo

### IN SCOPE

- ownership de Task Spec
- tipos padrão
- versionamento
- aprovação
- handoff
- mudança controlada

### OUT OF SCOPE

- conteúdo concreto de uma futura tarefa
- criação de Build Specs

## 6. Entradas

- SPEC-003
- SPEC-004

## 7. Saídas

- protocolo runtime de Task Specs

## 8. Responsável

```text
Owner: Governança da Construção
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-004_NO_ASSUMPTION_E_ESCALACAO`

## 10. Regras

1. Task Spec pertence ao Agent responsável por seu domínio.
2. Outro Agent não altera Task Spec alheia; devolve blocker.
3. Task Specs padrão: PRODUCT_BRIEF, REQUIREMENTS, ACCEPTANCE_CRITERIA, UI_SPEC, SYSTEM_DESIGN, TDD_PLAN.
4. Task Spec adicional exige necessidade concreta e escopo próprio.
5. Task Spec aprovada pode mudar somente por resolução formal do owner ou decisão humana rastreada.

## 11. Critérios de aceitação

- `AC-005-01` — Agents podem trabalhar sem consultar Build Specs.
- `AC-005-02` — Task Specs têm ownership e aprovação claros.
- `AC-005-03` — Nenhum Agent usa Task Spec para ampliar escopo.

## 12. Blockers

- TASK SPEC OWNERSHIP BLOCKER
- TASK SPEC CONFLICT BLOCKER

## 13. Observação de runtime

Durante runtime, Task Specs são artefatos da tarefa e podem ser lidas pelos Agents autorizados.

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
Next: `SPEC-010_VISAO_RICKCALCULATOR`
```
