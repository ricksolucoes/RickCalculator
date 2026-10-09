# SPEC-058 — UI QA PROCESS

## 1. Identificação

```text
ID: SPEC-058
Título: UI QA PROCESS
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir validação da View contra UI_SPEC.

## 3. Problema que resolve

QA funcional pode não detectar divergência visual/estrutural.

## 4. Justificativa de necessidade

A interface possui referência normativa própria.

## 5. Escopo

### IN SCOPE

- estrutura
- controles
- comportamento visual
- escopo reduzido
- ausência de regra de negócio na View

### OUT OF SCOPE

- criar redesign
- mudar requisito

## 6. Entradas

- UI_SPEC
- aplicação construída

## 7. Saídas

- UI QA REPORT

## 8. Responsável

```text
Owner: UI QA
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-057_QA_FUNCTIONAL_PROCESS`

## 10. Regras

1. Comparar contra UI_SPEC aprovada.
2. Validar affordances somente do escopo.
3. Falha visual retorna ao Product Designer/Developer conforme causa.
4. Não inventar nova preferência estética durante QA.

## 11. Critérios de aceitação

- `AC-058-01` — Tela corresponde ao design aprovado.
- `AC-058-02` — Nenhuma operação fora do escopo aparenta estar disponível.

## 12. Blockers

- UI QA BLOCKER

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
Next: `SPEC-059_RELEASE_PROCESS`
```
