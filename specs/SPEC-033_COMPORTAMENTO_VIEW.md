# SPEC-033 — COMPORTAMENTO DA VIEW

## 1. Identificação

```text
ID: SPEC-033
Título: COMPORTAMENTO DA VIEW
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir limites da View.

## 3. Problema que resolve

Eventos VCL podem virar lugar de regra de negócio.

## 4. Justificativa de necessidade

O projeto exige separação clara.

## 5. Escopo

### IN SCOPE

- captura de clique
- envio de comando
- apresentação do display
- mensagem/estado visual de erro

### OUT OF SCOPE

- cálculo
- máquina de estados
- formatação interna

## 6. Entradas

- SPEC-032

## 7. Saídas

- contrato da View

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-032_CONTROLES_UI`

## 10. Regras

1. View não soma, subtrai, multiplica ou divide.
2. View não decide repeated equals, CE, erro ou sequência.
3. View chama ICalculatorController.
4. View apresenta a string devolvida pelo Controller.
5. Integração com controles deve ser fina.

## 11. Critérios de aceitação

- `AC-033-01` — Nenhuma regra matemática na Form.
- `AC-033-02` — Controller é ponto de interação funcional.

## 12. Blockers

- VIEW RESPONSIBILITY BLOCKER

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
Next: `SPEC-034_UI_ESCOPO_REDUZIDO`
```
