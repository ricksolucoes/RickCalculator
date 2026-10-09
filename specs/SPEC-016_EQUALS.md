# SPEC-016 — EQUALS

## 1. Identificação

```text
ID: SPEC-016
Título: EQUALS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir comportamento do botão '='.

## 3. Problema que resolve

'=' possui casos especiais que não podem ficar a cargo do Developer.

## 4. Justificativa de necessidade

O comportamento foi previamente definido e precisa virar contrato.

## 5. Escopo

### IN SCOPE

- primeiro igual
- igual repetido
- igual sem segundo operando
- igual sem operação

### OUT OF SCOPE

- formatação
- layout

## 6. Entradas

- SPEC-015

## 7. Saídas

- regras de equals

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-015_SEQUENCIAMENTO`

## 10. Regras

1. Repeated '=' repete a última operação com o último segundo operando.
2. Após resultado, operador usa o resultado atual.
3. '5 + =' usa 5 como segundo operando.
4. '5 =' mantém 5.
5. Após '=' um dígito inicia nova entrada.

## 11. Critérios de aceitação

- `AC-016-01` — Repeated equals é determinístico.
- `AC-016-02` — Igual sem operação não altera valor.
- `AC-016-03` — Segundo operando implícito segue regra aprovada.

## 12. Blockers

- EQUALS BLOCKER

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
Next: `SPEC-017_EDICAO`
```
