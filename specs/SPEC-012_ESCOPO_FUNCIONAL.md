# SPEC-012 — ESCOPO FUNCIONAL

## 1. Identificação

```text
ID: SPEC-012
Título: ESCOPO FUNCIONAL
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir o catálogo funcional autorizado do RickCalculator.

## 3. Problema que resolve

Sem catálogo, Agents podem adicionar ou remover comportamento arbitrariamente.

## 4. Justificativa de necessidade

O Product Manager precisa selecionar um subconjunto a partir de funções conhecidas.

## 5. Escopo

### IN SCOPE

- operações
- entrada
- edição
- resultado
- erros
- formatação

### OUT OF SCOPE

- detalhes técnicos
- UI física

## 6. Entradas

- SPEC-011

## 7. Saídas

- catálogo funcional base

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-011_LINGUAGEM_DO_CLIENTE`

## 10. Regras

1. O catálogo base contém soma, subtração, multiplicação e divisão.
2. Comandos de entrada/edição/resultados só entram quando aplicáveis ao produto solicitado.
3. Escopo reduzido não autoriza operações matemáticas omitidas.
4. Qualquer nova função fora do catálogo exige decisão do cliente.

## 11. Critérios de aceitação

- `AC-012-01` — Catálogo fechado.
- `AC-012-02` — Subconjunto pode ser selecionado sem ampliar catálogo.

## 12. Blockers

- FUNCTION SCOPE BLOCKER

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
Next: `SPEC-013_ENTRADA_NUMERICA`
```
