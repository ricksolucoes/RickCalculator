# SPEC-000 — GOVERNANÇA

## 1. Identificação

```text
ID: SPEC-000
Título: Governança da Construção do RickCalculator
Status: COMPLETE
Tipo: Build Spec Principal
```

## 2. Objetivo

Controlar a construção do sistema de Agents sem permitir desvio de escopo, suposição ou implementação fora do catálogo aprovado.

## 3. Build Specs x Task Specs

```text
Build Specs = blueprints de construção
Task Specs  = artefatos operacionais runtime
```

Agents não consultam Build Specs durante a execução normal da tarefa final.

## 4. Catálogo fechado

Specs autorizadas:

```text
000–005  Governança da construção
010–020  Produto
030–034  Interface
040–046  Engenharia Delphi
050–060  Processos da equipe
100–113  Contratos dos Agents
120–127  Composição e prontidão da equipe
```

Os IDs exatos permanecem os já aprovados no catálogo do projeto.

## 5. Autoria em lote

`CHANGE-0001` altera a regra anterior de materialização sequencial.

Passa a ser permitido:

```text
criar em lote todas as Build Specs do catálogo fechado
auditar documentalmente em ordem lógica
concluir automaticamente Specs sem blocker
```

Permanece proibido:

```text
criar Spec fora do catálogo
implementar artefato futuro por antecipação
resolver conflito por suposição
ignorar blocker
```

## 6. Significado de COMPLETE

`COMPLETE` em Build Spec significa que a especificação está fechada e auditada.

Não significa implementação física concluída.

## 7. Fonte de verdade

A precedência detalhada é definida por `SPEC-001_FONTE_DE_VERDADE`.

## 8. No-Assumption

Sem evidência ou autoridade:

```text
BLOCKER
```

Sem solução interna comprovável:

```text
HUMAN DECISION REQUIRED
```

## 9. Future Specs

Necessidade nova fora do catálogo:

```text
FUTURE
→ Change Request
→ análise de necessidade
→ aprovação
→ atualização de catálogo
```

Sem isso, não pode ser implementada.

## 10. Flow Coordinator

Pode:

- ler estados;
- chamar o próximo especialista;
- encaminhar blocker;
- registrar handoff.

Não pode decidir:

- requisito;
- UI;
- arquitetura;
- teste;
- implementação;
- QA;
- release;
- produto.

## 11. Change Request

Toda alteração estrutural posterior exige Change Request.

`CHANGE-0001` está aprovado e autoriza autoria documental em lote.

## 12. Critérios de aceitação

- `AC-000-01` — catálogo permanece fechado.
- `AC-000-02` — autoria em lote não equivale a implementação em lote.
- `AC-000-03` — Build Specs e Task Specs permanecem separadas.
- `AC-000-04` — nenhuma decisão sem evidência é aceita como fato.
- `AC-000-05` — necessidade fora do catálogo exige Change Request.
- `AC-000-06` — Flow Coordinator não possui autoridade técnica ou de produto.
- `AC-000-07` — `COMPLETE` documental não falsifica implementação física.

## 13. Evidências

```text
SPEC_CREATION_RULES.md atualizado
CHANGE-0001 aprovado
catálogo fechado preservado
autorização explícita do usuário registrada
```

## 14. Gate

```text
Status: COMPLETE
Acceptance: PASS
Open Blockers: 0
Decision: ADVANCE
Next: SPEC-001_FONTE_DE_VERDADE
```
