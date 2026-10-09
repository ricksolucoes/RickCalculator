# SPEC-125 — STATUS REGISTRY

## 1. Identificação

```text
ID: SPEC-125
Título: STATUS REGISTRY
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir persistência mínima de estado runtime.

## 3. Problema que resolve

Sem estado compartilhado, o coordenador pode repetir ou pular etapas.

## 4. Justificativa de necessidade

A equipe precisa retomar fluxo e blockers de forma determinística.

## 5. Escopo

### IN SCOPE

- current stage
- gate
- blockers
- handoff
- artifact refs
- task scope

### OUT OF SCOPE

- conteúdo completo dos artefatos

## 6. Entradas

- SPEC-124
- SPEC-003

## 7. Saídas

- contrato do registry

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-124_RUNTIME_ARTIFACT_STRUCTURE`

## 10. Regras

1. Registry registra estado, não decisão técnica.
2. Somente owner/gate autorizado altera status correspondente.
3. Blocker aberto impede avanço do ramo.
4. Reexecução lê estado e valida evidência antes de reutilizar.

## 11. Critérios de aceitação

- `AC-125-01` — Retomada é possível.
- `AC-125-02` — Estado não substitui artefato.

## 12. Blockers

- STATUS BLOCKER

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
Next: `SPEC-126_PROMPT_ENTRY`
```
