# SPEC-003 — HANDOFF E BLOCKERS

## 1. Identificação

```text
ID: SPEC-003
Título: HANDOFF E BLOCKERS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Padronizar passagem de responsabilidade e devolução de problemas.

## 3. Problema que resolve

Sem protocolo, mini-agents podem duplicar trabalho ou assumir responsabilidade alheia.

## 4. Justificativa de necessidade

O modelo de empresa depende de comunicação curta, tipada e rastreável.

## 5. Escopo

### IN SCOPE

- handoff
- blocker
- resolution
- routing
- retorno ao originador

### OUT OF SCOPE

- decisões de produto
- conteúdo das Task Specs

## 6. Entradas

- SPEC-002

## 7. Saídas

- templates de HANDOFF, BLOCKER e RESOLUTION
- matriz owner por domínio

## 8. Responsável

```text
Owner: Governança da Construção
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-002_GATES_E_APROVACOES`

## 10. Regras

1. Handoff informa From, To, artefatos, evidência, blockers e próxima responsabilidade.
2. Blocker pertence ao especialista do domínio afetado.
3. Agent não corrige silenciosamente problema de outro domínio.
4. Após resolução, controle retorna ao ponto seguro.

## 11. Critérios de aceitação

- `AC-003-01` — Todo blocker tem owner.
- `AC-003-02` — Todo handoff identifica artefatos aprovados.
- `AC-003-03` — Nenhum blocker aberto é perdido.

## 12. Blockers

- ROUTING BLOCKER
- OWNERSHIP BLOCKER

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
Next: `SPEC-004_NO_ASSUMPTION_E_ESCALACAO`
```
