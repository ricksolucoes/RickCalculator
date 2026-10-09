# SPEC-123 — SCRIPTS CONTRACT

## 1. Identificação

```text
ID: SPEC-123
Título: SCRIPTS CONTRACT
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir limites dos scripts auxiliares.

## 3. Problema que resolve

Scripts antigos podem incorporar decisões do workflow anterior.

## 4. Justificativa de necessidade

Scripts devem executar mecanismos, não tomar decisões de produto.

## 5. Escopo

### IN SCOPE

- build
- test execution
- warning checks
- environment helpers
- evidence capture

### OUT OF SCOPE

- orquestração inteligente
- requisitos
- arquitetura

## 6. Entradas

- scripts existentes
- SPEC-122

## 7. Saídas

- mapa manter/ajustar/remover

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-122_CONFIG_CONTRACT`

## 10. Regras

1. Script deve ser determinístico e parametrizável quando necessário.
2. Decisão de próximo Agent pertence ao Flow Coordinator.
3. Script não altera expected result nem requisito.
4. Script retorna status/evidência consumível.

## 11. Critérios de aceitação

- `AC-123-01` — Cada script possui função técnica estreita.
- `AC-123-02` — Sem decisão de produto em script.

## 12. Blockers

- SCRIPT BLOCKER

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
Next: `SPEC-124_RUNTIME_ARTIFACT_STRUCTURE`
```
