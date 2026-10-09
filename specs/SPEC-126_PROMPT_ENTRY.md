# SPEC-126 — PROMPT ENTRY

## 1. Identificação

```text
ID: SPEC-126
Título: PROMPT ENTRY
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir o caminho desde a mensagem do usuário até Product Intake.

## 3. Problema que resolve

Sem contrato de entrada, o usuário pode precisar informar detalhes internos.

## 4. Justificativa de necessidade

O objetivo é demonstrar um único comando.

## 5. Escopo

### IN SCOPE

- prompt
- bootstrap
- Flow Coordinator
- Product Manager
- novo/retomada

### OUT OF SCOPE

- interpretação funcional detalhada; pertence ao PM

## 6. Entradas

- SPEC-120
- SPEC-125

## 7. Saídas

- entry flow

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-125_STATUS_REGISTRY`

## 10. Regras

1. Usuário fornece apenas intenção funcional curta.
2. Sistema identifica nova tarefa ou retomada pelo estado.
3. Flow Coordinator aciona Product Manager.
4. Nenhuma pergunta técnica de infraestrutura é feita se a configuração comprovada estiver válida.
5. Primeira decisão de produto pertence ao PM.

## 11. Critérios de aceitação

- `AC-126-01` — 'Crie a calculadora' inicia fluxo.
- `AC-126-02` — Nenhuma sequência manual de Agents exigida.

## 12. Blockers

- PROMPT ENTRY BLOCKER

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
Next: `SPEC-127_TEAM_READINESS`
```
