# SPEC-020 — FORMATAÇÃO

## 1. Identificação

```text
ID: SPEC-020
Título: FORMATAÇÃO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir representação de números sem alterar matemática interna.

## 3. Problema que resolve

Formatação visual pode contaminar o Double interno ou gerar inconsistência.

## 4. Justificativa de necessidade

Apresentação precisa ser responsabilidade própria.

## 5. Escopo

### IN SCOPE

- vírgula visual
- zeros
- -0
- notação científica
- precisão de apresentação

### OUT OF SCOPE

- regra matemática
- layout

## 6. Entradas

- SPEC-019

## 7. Saídas

- contrato de formatter

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-019_ERROS`

## 10. Regras

1. Cálculo usa Double internamente.
2. Display usa vírgula decimal.
3. Zeros insignificantes do resultado são removidos.
4. Resultado -0 é apresentado como 0.
5. Notação científica é usada quando necessária.
6. Arredondamento de apresentação respeita até 15 dígitos significativos e comportamento natural do Double.

## 11. Critérios de aceitação

- `AC-020-01` — Formatter não altera regra matemática.
- `AC-020-02` — Representação de zero é estável.
- `AC-020-03` — Notação científica é suportada.

## 12. Blockers

- FORMAT BLOCKER

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
Next: `SPEC-030_UI_REFERENCE`
```
