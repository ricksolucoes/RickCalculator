# SPEC-018 — RESULTADO

## 1. Identificação

```text
ID: SPEC-018
Título: RESULTADO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir estado pós-cálculo.

## 3. Problema que resolve

Sem estado explícito, digitação e operadores após '=' divergem.

## 4. Justificativa de necessidade

Resultado é estado próprio da máquina.

## 5. Escopo

### IN SCOPE

- entrada após resultado
- operador após resultado
- CE após resultado
- sinal após resultado

### OUT OF SCOPE

- erros
- notação visual detalhada

## 6. Entradas

- SPEC-017

## 7. Saídas

- estado Result

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-017_EDICAO`

## 10. Regras

1. Dígito após resultado inicia novo cálculo.
2. Operador após resultado usa o resultado como primeiro operando.
3. CE após resultado mostra 0, cancela repetição e inicia nova entrada.
4. ± após resultado altera o valor exibido e preserva a repetição da última operação.

## 11. Critérios de aceitação

- `AC-018-01` — Todas as transições pós-resultado são definidas.
- `AC-018-02` — Repetição é cancelada somente quando regra determinar.

## 12. Blockers

- RESULT STATE BLOCKER

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
Next: `SPEC-019_ERROS`
```
