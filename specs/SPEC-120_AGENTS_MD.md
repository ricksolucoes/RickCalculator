# SPEC-120 — AGENTS.MD CONTRACT

## 1. Identificação

```text
ID: SPEC-120
Título: AGENTS.MD CONTRACT
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir o bootstrap operacional da equipe.

## 3. Problema que resolve

Sem uma entrada comum, o prompt pode depender de chamada manual de Agents.

## 4. Justificativa de necessidade

O usuário precisa iniciar com um único comando.

## 5. Escopo

### IN SCOPE

- inicialização
- Flow Coordinator
- descoberta do pedido
- carregamento de fontes runtime

### OUT OF SCOPE

- decisões especializadas
- conteúdo dos Agents

## 6. Entradas

- SPEC-100..113

## 7. Saídas

- contrato para AGENTS.md

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-113_PRODUCT_ACCEPTANCE_AGENT`

## 10. Regras

1. AGENTS.md inicia o fluxo no Flow Coordinator.
2. Não replica contratos completos dos especialistas.
3. Não consulta Build Specs durante runtime.
4. Encaminha a solicitação do usuário ao Product Manager por meio do fluxo.

## 11. Critérios de aceitação

- `AC-120-01` — Prompt único inicia equipe.
- `AC-120-02` — Sem super-agent no AGENTS.md.

## 12. Blockers

- BOOTSTRAP BLOCKER

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
Next: `SPEC-121_POLICIES_MAPPING`
```
