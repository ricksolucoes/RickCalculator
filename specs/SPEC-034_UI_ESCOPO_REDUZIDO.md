# SPEC-034 — UI EM ESCOPO REDUZIDO

## 1. Identificação

```text
ID: SPEC-034
Título: UI EM ESCOPO REDUZIDO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como a UI reage quando o cliente pede somente parte das operações.

## 3. Problema que resolve

Escopo funcional reduzido não pode resultar em funções visuais enganosas.

## 4. Justificativa de necessidade

O comando 'calculadora de somar' precisa permanecer coerente visualmente.

## 5. Escopo

### IN SCOPE

- presença/ausência de operadores
- preservação do layout-base
- responsabilidade do Designer

### OUT OF SCOPE

- nova identidade visual
- novas funcionalidades

## 6. Entradas

- SPEC-033
- PRODUCT_BRIEF runtime

## 7. Saídas

- regra de adaptação visual

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-033_COMPORTAMENTO_DA_VIEW`

## 10. Regras

1. Somente operações autorizadas podem estar funcionais.
2. Product Designer pode adaptar a composição para remover ou desabilitar affordances de operações não autorizadas, preservando simplicidade e referência-base.
3. Nenhum botão pode aparentar função inexistente.
4. Se uma decisão visual alterar produto e não puder ser resolvida pelos limites aprovados, escalar ao Product Manager/humano.

## 11. Critérios de aceitação

- `AC-034-01` — UI não promete função fora do escopo.
- `AC-034-02` — Adaptação é responsabilidade do Designer, não do Developer.

## 12. Blockers

- REDUCED UI BLOCKER

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
Next: `SPEC-040_ESTRUTURA_PROJETO`
```
