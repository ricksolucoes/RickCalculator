# SPEC-055 — TDD EXECUTION PROCESS

## 1. Identificação

```text
ID: SPEC-055
Título: TDD EXECUTION PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir a execução RED/ALREADY GREEN → GREEN → REFACTOR.

## 3. Problema que resolve

Um Developer único poderia manipular testes para passar.

## 4. Justificativa de necessidade

Separação de Test Developer, Production Developer e Refactor Specialist reforça TDD real.

## 5. Escopo

### IN SCOPE

- test first
- RED
- ALREADY GREEN
- GREEN
- refactor
- regressão
- integridade do teste

### OUT OF SCOPE

- planejar requisito
- aprovar produto

## 6. Entradas

- TDD_PLAN
- SPEC-045

## 7. Saídas

- evidência de ciclos TDD

## 8. Responsável

```text
Owner: TDD Team
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-054_TDD_PLANNING_PROCESS`

## 10. Regras

1. Test Developer escreve/congela teste antes de produção do ciclo.
2. RED válido é falha funcional esperada, não erro acidental de sintaxe.
3. ALREADY GREEN exige prova de implementação preexistente e nenhuma mudança funcional nova.
4. Production Developer não altera expectativa do teste para passar.
5. Refactor ocorre após GREEN e reexecuta suíte.
6. Hash/diff do teste deve preservar integridade entre fases quando aplicável.

## 11. Critérios de aceitação

- `AC-055-01` — TDD real e comprovável.
- `AC-055-02` — Teste não é removido/enfraquecido.
- `AC-055-03` — Regressão completa após ciclo.

## 12. Blockers

- TEST BLOCKER
- IMPLEMENTATION BLOCKER
- REFACTOR BLOCKER

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
Next: `SPEC-056_CODE_REVIEW_PROCESS`
```
