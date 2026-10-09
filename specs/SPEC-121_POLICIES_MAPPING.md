# SPEC-121 — POLICIES MAPPING

## 1. Identificação

```text
ID: SPEC-121
Título: POLICIES MAPPING
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir quais regras permanentes ficam em Policies.

## 3. Problema que resolve

Duplicar regras em todos os Agents aumenta contexto e divergência.

## 4. Justificativa de necessidade

Policies devem conter invariantes compartilhadas.

## 5. Escopo

### IN SCOPE

- Delphi coding
- interface pattern
- project structure
- quality invariants

### OUT OF SCOPE

- estado da tarefa
- requisitos de produto variáveis

## 6. Entradas

- SPEC-040..046
- SPEC-100..113

## 7. Saídas

- mapa Agent x Policy

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-120_AGENTS_MD`

## 10. Regras

1. Policy contém regra transversal estável.
2. Agent contém responsabilidade e workflow.
3. Não duplicar regra grande em múltiplos Agents quando Policy puder ser referenciada runtime.
4. Policy antiga só permanece se revalidada contra Specs.

## 11. Critérios de aceitação

- `AC-121-01` — Cada Policy tem consumidor claro.
- `AC-121-02` — Nenhuma policy decide produto.

## 12. Blockers

- POLICY BLOCKER

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
Next: `SPEC-122_CONFIG_CONTRACT`
```
