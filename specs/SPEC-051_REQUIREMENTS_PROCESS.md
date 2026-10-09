# SPEC-051 — REQUIREMENTS PROCESS

## 1. Identificação

```text
ID: SPEC-051
Título: REQUIREMENTS PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como o Requirements Analyst cria FR, NFR e AC.

## 3. Problema que resolve

Comportamento não pode nascer no TDD Planner ou Developer.

## 4. Justificativa de necessidade

Requisitos verificáveis são base de todo o restante.

## 5. Escopo

### IN SCOPE

- FR
- NFR
- AC
- rastreabilidade
- lacunas

### OUT OF SCOPE

- UI detalhada
- arquitetura
- testes concretos

## 6. Entradas

- PRODUCT_BRIEF
- SPEC-012..020

## 7. Saídas

- REQUIREMENTS
- ACCEPTANCE_CRITERIA

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-050_PRODUCT_INTAKE_PROCESS`

## 10. Regras

1. Cada comportamento deve possuir origem no Product Brief/catálogo.
2. AC deve ser observável e verificável.
3. Precondição não vira requisito novo.
4. Lacuna funcional retorna ao PM; não é preenchida pelo Analyst.
5. Rastrear FR → AC.

## 11. Critérios de aceitação

- `AC-051-01` — FR/AC completos para o escopo.
- `AC-051-02` — Nenhum comportamento sem origem.
- `AC-051-03` — Lacunas são blockers.

## 12. Blockers

- REQUIREMENT BLOCKER

## 13. Observação de runtime

Cria `REQUIREMENTS` e `ACCEPTANCE_CRITERIA`.

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
Next: `SPEC-052_PRODUCT_DESIGN_PROCESS`
```
