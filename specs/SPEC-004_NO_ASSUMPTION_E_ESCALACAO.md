# SPEC-004 — NO ASSUMPTION E ESCALAÇÃO

## 1. Identificação

```text
ID: SPEC-004
Título: NO ASSUMPTION E ESCALAÇÃO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Impedir decisões por suposição e definir quando envolver o humano.

## 3. Problema que resolve

Agentes autônomos podem preencher lacunas com inferências não autorizadas.

## 4. Justificativa de necessidade

O projeto exige comprovação de fatos e intervenção humana somente em decisões reais.

## 5. Escopo

### IN SCOPE

- fato x hipótese
- limites de autoridade
- human escalation
- perguntas objetivas

### OUT OF SCOPE

- resolver conteúdo específico de produto ainda não especificado

## 6. Entradas

- SPEC-001
- SPEC-003

## 7. Saídas

- regra no-assumption
- protocolo HUMAN DECISION REQUIRED

## 8. Responsável

```text
Owner: Governança da Construção
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-003_HANDOFF_E_BLOCKERS`

## 10. Regras

1. Fato exige fonte autorizada.
2. Se especialista puder resolver com fonte aprovada, não escalar.
3. Se decisão alterar produto e não houver fonte, escalar.
4. Pergunta ao humano deve listar fatos conhecidos, opções e impactos sem mascarar hipótese como fato.

## 11. Critérios de aceitação

- `AC-004-01` — Nenhuma lacuna é completada silenciosamente.
- `AC-004-02` — Escalação humana ocorre apenas quando necessária.

## 12. Blockers

- HUMAN DECISION REQUIRED

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
Next: `SPEC-005_TASK_SPEC_PROTOCOL`
```
