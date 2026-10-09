# CHANGE-0001 — AUTORIA EM LOTE DAS BUILD SPECS

## 1. Identificação

```text
Change ID: CHANGE-0001
Status: APPROVED
Origem: decisão explícita do usuário
Data lógica: 2026-10-09
```

## 2. Motivo

A governança original exigia criação e aprovação manual de uma Build Spec por vez.

O usuário autorizou explicitamente a geração de todas as Build Specs do catálogo fechado em uma única operação, desde que o controle de escopo, a auditoria documental, a ordem lógica e os blockers continuem preservados.

## 3. Alteração aprovada

Passa a ser permitido:

- materializar em lote todas as Build Specs já existentes no catálogo fechado;
- auditar documentalmente cada Build Spec de forma sequencial;
- concluir automaticamente uma Build Spec documental quando todos os seus critérios forem comprovados;
- usar a autorização do usuário para o lote como aprovação documental das Specs sem blocker.

Continua proibido:

- criar Build Spec fora do catálogo sem novo Change Request;
- implementar Agents, Policies, Config, Scripts ou produto por antecipação;
- resolver ambiguidades por suposição;
- ignorar blockers;
- usar Build Specs como dependência runtime depois que a equipe estiver pronta.

## 4. Distinção entre autoria e implementação

```text
AUTORIA EM LOTE = AUTORIZADA
IMPLEMENTAÇÃO EM LOTE = NÃO AUTORIZADA POR ESTE CHANGE
```

As Build Specs são blueprints de construção.

`Status: COMPLETE` significa que a especificação está completa e auditada, não que o Agent, Policy, Script, código ou produto correspondente já foi implementado.

## 5. Impacto

Arquivos afetados:

- `README.md`
- `specs/SPEC_CREATION_RULES.md`
- `specs/SPEC-000_GOVERNANCA.md`
- `specs/SPEC-001_FONTE_DE_VERDADE.md`
- demais Build Specs do catálogo fechado

## 6. Catálogo

O catálogo não foi ampliado.

Nenhuma nova Build Spec foi adicionada além das já aprovadas em `SPEC-000`.

## 7. Aprovação

```text
USER APPROVAL: CONFIRMED
CATALOG CHANGE REQUIRED: NO
REAPPROVAL OF SPEC-000: INCLUDED IN THIS CHANGE
```
