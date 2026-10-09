# SPEC-019 — ERROS

## 1. Identificação

```text
ID: SPEC-019
Título: ERROS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir erros de domínio e recuperação.

## 3. Problema que resolve

Erro não pode depender de exceção não controlada ou estado residual.

## 4. Justificativa de necessidade

Mensagens e recuperação já foram aprovadas.

## 5. Escopo

### IN SCOPE

- divisão por zero
- faixa numérica
- estado Error
- recuperação

### OUT OF SCOPE

- build errors
- UI física

## 6. Entradas

- SPEC-018

## 7. Saídas

- contrato de Error State

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-018_RESULTADO`

## 10. Regras

1. Divisão por zero exibe exatamente: 'Não é possível dividir por zero.'.
2. Faixa numérica exibe exatamente: 'Resultado fora da faixa numérica.'.
3. Em Error State: C limpa; dígito inicia nova entrada; vírgula inicia '0,'.
4. Em Error State: CE, Backspace, ±, operadores e '=' são ignorados.

## 11. Critérios de aceitação

- `AC-019-01` — Mensagens exatas.
- `AC-019-02` — Recuperação determinística.
- `AC-019-03` — Nenhuma exceção acidental é UX.

## 12. Blockers

- ERROR STATE BLOCKER

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
Next: `SPEC-020_FORMATACAO`
```
