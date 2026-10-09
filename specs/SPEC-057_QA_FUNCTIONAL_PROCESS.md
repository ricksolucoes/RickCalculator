# SPEC-057 — QA FUNCTIONAL PROCESS

## 1. Identificação

```text
ID: SPEC-057
Título: QA FUNCTIONAL PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir validação independente contra AC.

## 3. Problema que resolve

Testes unitários não substituem aceitação funcional.

## 4. Justificativa de necessidade

QA deve comprovar que o produto implementa o pedido.

## 5. Escopo

### IN SCOPE

- AC
- regressão
- cenários funcionais
- defect routing

### OUT OF SCOPE

- corrigir código
- alterar requisito

## 6. Entradas

- REQUIREMENTS
- ACCEPTANCE_CRITERIA
- build testável

## 7. Saídas

- QA REPORT

## 8. Responsável

```text
Owner: QA Functional
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-056_CODE_REVIEW_PROCESS`

## 10. Regras

1. QA valida AC, não intenção inferida.
2. Defeito gera evidência reproduzível.
3. QA não altera expected result para casar com implementação.
4. Defeito de requisito volta ao Analyst/PM; defeito de código ao Developer.

## 11. Critérios de aceitação

- `AC-057-01` — Todos AC do escopo têm resultado.
- `AC-057-02` — Falha não é mascarada.
- `AC-057-03` — Regressão aprovada.

## 12. Blockers

- QA BLOCKER

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
Next: `SPEC-058_UI_QA_PROCESS`
```
