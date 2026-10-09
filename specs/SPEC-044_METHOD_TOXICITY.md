# SPEC-044 — METHOD TOXICITY

## 1. Identificação

```text
ID: SPEC-044
Título: METHOD TOXICITY
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Fixar limites objetivos de toxicidade de métodos.

## 3. Problema que resolve

Complexidade excessiva pode crescer durante TDD.

## 4. Justificativa de necessidade

O projeto já possui thresholds normativos.

## 5. Escopo

### IN SCOPE

- Function Length
- Parameter Count
- If Depth
- Cyclomatic Complexity

### OUT OF SCOPE

- estilo subjetivo

## 6. Entradas

- SPEC-043

## 7. Saídas

- thresholds

## 8. Responsável

```text
Owner: Refactor Specialist / Code Reviewer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-043_QUALIDADE_DE_CODIGO`

## 10. Regras

1. Function Length <= 20.
2. Parameter Count <= 6.
3. If Depth <= 5.
4. Cyclomatic Complexity <= 6.
5. Exceção não pode ser inventada pelo Developer; violação exige refactor ou blocker arquitetural.

## 11. Critérios de aceitação

- `AC-044-01` — Todos os thresholds definidos.
- `AC-044-02` — Review pode reprovar objetivamente.

## 12. Blockers

- TOXICITY BLOCKER

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
Next: `SPEC-045_BUILD_QUALITY`
```
