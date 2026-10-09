# SPEC-015 — SEQUENCIAMENTO

## 1. Identificação

```text
ID: SPEC-015
Título: SEQUENCIAMENTO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir ordem operacional da calculadora.

## 3. Problema que resolve

Sem regra explícita, precedência e operadores consecutivos ficam ambíguos.

## 4. Justificativa de necessidade

O produto aprovado usa cálculo sequencial.

## 5. Escopo

### IN SCOPE

- cálculo sequencial
- operador pendente
- troca de operador
- segundo operando

### OUT OF SCOPE

- repeated equals detalhado
- UI

## 6. Entradas

- SPEC-014

## 7. Saídas

- máquina de sequenciamento

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-014_OPERACOES`

## 10. Regras

1. Operações são avaliadas sequencialmente, sem precedência algébrica.
2. Exemplo aprovado: 2 + 3 × 4 = 20.
3. Operadores consecutivos substituem o operador pendente pelo último.
4. Segundo operando explícito pode ser zero; CE antes do '=' pode produzir zero explícito conforme estado da entrada.

## 11. Critérios de aceitação

- `AC-015-01` — Sem precedência matemática.
- `AC-015-02` — Operador consecutivo substitui anterior.
- `AC-015-03` — Sequência produz resultado determinístico.

## 12. Blockers

- SEQUENCE BLOCKER

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
Next: `SPEC-016_EQUALS`
```
