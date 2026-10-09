# SPEC-052 — PRODUCT DESIGN PROCESS

## 1. Identificação

```text
ID: SPEC-052
Título: PRODUCT DESIGN PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como o Product Designer aplica a referência visual ao escopo aprovado.

## 3. Problema que resolve

Designer não deve reinventar comportamento nem ignorar escopo reduzido.

## 4. Justificativa de necessidade

A UI precisa ser deliberada antes do System Design.

## 5. Escopo

### IN SCOPE

- UI reference
- Product Brief
- requisitos
- controles
- adaptação visual

### OUT OF SCOPE

- arquitetura interna
- código

## 6. Entradas

- SPEC-030..034
- REQUIREMENTS

## 7. Saídas

- UI_SPEC

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-051_REQUIREMENTS_PROCESS`

## 10. Regras

1. Usar UI Reference como base.
2. Não criar função inexistente.
3. Resolver detalhe visual dentro da autoridade de design quando não altera produto.
4. Questão de produto retorna ao PM.
5. UI_SPEC descreve estrutura e comportamento visual suficiente para implementação e UI QA.

## 11. Critérios de aceitação

- `AC-052-01` — UI cobre o escopo.
- `AC-052-02` — Sem regra matemática na View.
- `AC-052-03` — Adaptação reduzida não promete função ausente.

## 12. Blockers

- UI BLOCKER

## 13. Observação de runtime

Cria `UI_SPEC`.

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
Next: `SPEC-053_SYSTEM_DESIGN_PROCESS`
```
