# SPEC-013 — ENTRADA NUMÉRICA

## 1. Identificação

```text
ID: SPEC-013
Título: ENTRADA NUMÉRICA
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir comportamento de digitação numérica.

## 3. Problema que resolve

Entrada inconsistente gera divergência entre Engine, Controller e UI.

## 4. Justificativa de necessidade

Há regras específicas já aprovadas para decimal, sinal e limite.

## 5. Escopo

### IN SCOPE

- dígitos
- vírgula
- sinal
- limite de significativos
- zero inicial

### OUT OF SCOPE

- operações matemáticas
- layout

## 6. Entradas

- SPEC-012

## 7. Saídas

- regras de entrada

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-012_ESCOPO_FUNCIONAL`

## 10. Regras

1. Separador visual é vírgula.
2. Vírgula como primeiro comando forma '0,'.
3. Somente um separador decimal é aceito.
4. Máximo de 15 dígitos significativos de entrada; excedentes são ignorados.
5. Sinal pode iniciar entrada negativa quando permitido; estado visual pode usar '-0' durante entrada.

## 11. Critérios de aceitação

- `AC-013-01` — Entrada decimal é determinística.
- `AC-013-02` — Limite de 15 significativos é preservado.
- `AC-013-03` — Separador duplicado é ignorado.

## 12. Blockers

- INPUT RULE BLOCKER

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
Next: `SPEC-014_OPERACOES`
```
