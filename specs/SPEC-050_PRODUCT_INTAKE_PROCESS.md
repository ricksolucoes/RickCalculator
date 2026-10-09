# SPEC-050 — PRODUCT INTAKE PROCESS

## 1. Identificação

```text
ID: SPEC-050
Título: PRODUCT INTAKE PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como o Product Manager recebe o prompt e cria o Product Brief.

## 3. Problema que resolve

Prompt curto precisa virar escopo rastreável sem inventar requisitos.

## 4. Justificativa de necessidade

É a porta de entrada runtime.

## 5. Escopo

### IN SCOPE

- intenção do cliente
- seleção de escopo
- restrições
- ambiguidade

### OUT OF SCOPE

- FR detalhados
- arquitetura

## 6. Entradas

- SPEC-011
- SPEC-005

## 7. Saídas

- PRODUCT_BRIEF runtime

## 8. Responsável

```text
Owner: Product Manager
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-046_ARQUITETURA_BASE`

## 10. Regras

1. Registrar texto original do cliente.
2. Mapear apenas para catálogo conhecido.
3. Não adicionar função por conveniência.
4. Se ambiguidade alterar produto e não houver fonte, HUMAN DECISION REQUIRED.
5. Handoff para Requirements Analyst somente com brief aprovado.

## 11. Critérios de aceitação

- `AC-050-01` — Brief preserva intenção.
- `AC-050-02` — Escopo completo ou reduzido é explícito.
- `AC-050-03` — Nenhum requisito técnico é inventado.

## 12. Blockers

- PRODUCT INTAKE BLOCKER

## 13. Observação de runtime

Cria `PRODUCT_BRIEF` como Task Spec.

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
Next: `SPEC-051_REQUIREMENTS_PROCESS`
```
