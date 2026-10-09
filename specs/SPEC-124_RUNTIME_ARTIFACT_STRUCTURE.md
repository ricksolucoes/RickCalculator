# SPEC-124 — RUNTIME ARTIFACT STRUCTURE

## 1. Identificação

```text
ID: SPEC-124
Título: RUNTIME ARTIFACT STRUCTURE
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir onde a tarefa real cria seus artefatos.

## 3. Problema que resolve

Agents precisam compartilhar Task Specs, código, logs e build sem paths inventados.

## 4. Justificativa de necessidade

Uma estrutura runtime comum reduz handoffs caros.

## 5. Escopo

### IN SCOPE

- task specs
- src
- tests
- logs
- bin
- Temp
- evidence
- status

### OUT OF SCOPE

- estrutura das Build Specs

## 6. Entradas

- SPEC-123
- SPEC-005

## 7. Saídas

- estrutura runtime normativa

## 8. Responsável

```text
Owner: Framework Builder
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-123_SCRIPTS_CONTRACT`

## 10. Regras

1. A execução possui raiz própria do RickCalculator.
2. Task Specs ficam em área de specs da tarefa.
3. Código e testes seguem SPEC-040.
4. Logs/evidências são separados de fontes.
5. Estrutura deve poder ser criada do zero pelos componentes autorizados.

## 11. Critérios de aceitação

- `AC-124-01` — Workspace pode começar vazio.
- `AC-124-02` — Nenhum Agent presume artefato inexistente.

## 12. Blockers

- STRUCTURE BLOCKER

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
Next: `SPEC-125_STATUS_REGISTRY`
```
