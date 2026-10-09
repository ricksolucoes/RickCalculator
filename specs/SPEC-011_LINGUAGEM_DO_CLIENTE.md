# SPEC-011 — LINGUAGEM DO CLIENTE

## 1. Identificação

```text
ID: SPEC-011
Título: LINGUAGEM DO CLIENTE
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir como o Product Manager interpreta comandos curtos.

## 3. Problema que resolve

Uma frase curta pode ser ampliada indevidamente.

## 4. Justificativa de necessidade

O primeiro Agent precisa converter intenção em escopo sem inventar.

## 5. Escopo

### IN SCOPE

- comando completo
- comando com subconjunto explícito
- restrições expressas
- ambiguidade real

### OUT OF SCOPE

- requisitos detalhados ainda não levantados

## 6. Entradas

- SPEC-010

## 7. Saídas

- regras de interpretação do prompt

## 8. Responsável

```text
Owner: Product Manager
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-010_VISAO_RICKCALCULATOR`

## 10. Regras

1. 'Crie a calculadora' seleciona o escopo funcional base completo.
2. 'Crie a calculadora de somar' seleciona apenas soma entre as operações matemáticas.
3. Restrição explícita do cliente prevalece sobre default.
4. Ambiguidade que altera produto deve ser escalada, não presumida.

## 11. Critérios de aceitação

- `AC-011-01` — Comando completo é determinístico.
- `AC-011-02` — Subconjunto explícito reduz escopo.
- `AC-011-03` — Nenhuma função não pedida é adicionada.

## 12. Blockers

- PRODUCT INTERPRETATION BLOCKER

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
Next: `SPEC-012_ESCOPO_FUNCIONAL`
```
