# SPEC CREATION RULES

## 1. Objetivo

Este documento governa as **Build Specs** utilizadas para construir o sistema de Agents do RickCalculator.

Build Specs são blueprints de construção. Elas não são dependências runtime da tarefa final.

## 2. Build Spec x Task Spec

```text
BUILD SPEC
→ define como o sistema deve ser construído

TASK SPEC
→ artefato operacional criado por um Agent durante uma solicitação real
```

O protocolo runtime das Task Specs é definido por `SPEC-005_TASK_SPEC_PROTOCOL` e incorporado aos Agents.

## 3. Catálogo fechado

Somente as Build Specs registradas em `SPEC-000_GOVERNANCA.md` podem existir sem novo Change Request.

Nova Build Spec fora do catálogo exige:

```text
necessidade comprovada
+
Change Request
+
aprovação
+
atualização formal do catálogo
```

## 4. Autoria em lote

Conforme `CHANGE-0001`:

```text
AUTORIA DOCUMENTAL EM LOTE = PERMITIDA
IMPLEMENTAÇÃO ANTECIPADA = PROIBIDA
```

Todas as Build Specs do catálogo podem ser materializadas em uma operação.

A auditoria deve respeitar a ordem lógica do catálogo.

## 5. Significado de COMPLETE

Para uma Build Spec:

```text
Status: COMPLETE
```

significa:

- documento completo;
- escopo fechado;
- critérios de aceitação definidos;
- dependências verificadas;
- auditoria documental aprovada;
- nenhum blocker documental aberto.

Não significa que o Agent, Policy, Script, código ou produto correspondente já foi implementado.

## 6. Estados

```text
PENDING
IN_PROGRESS
BLOCKED
REVIEW
APPROVED
IMPLEMENTING
VERIFYING
COMPLETE
FUTURE
```

Na autoria em lote, Specs documentais podem ir a `COMPLETE` após auditoria automática autorizada quando não houver blocker.

## 7. Estrutura mínima

Toda Build Spec deve conter:

```text
ID
Título
Status
Objetivo
Problema que resolve
Justificativa de necessidade
Escopo
Fora do escopo
Entradas
Saídas
Responsável
Dependências
Regras
Critérios de aceitação
Evidências
Blockers
Checklist
Gate / Handoff
```

## 8. Granularidade

Mini Specs só são justificadas quando possuem responsabilidade, entrada, saída e aceitação independentes e reduzem contexto.

Não dividir apenas para aumentar documentação.

## 9. Fonte de verdade

Durante a construção:

```text
1. decisão explícita mais recente do usuário
2. Build Spec aplicável APPROVED/COMPLETE
3. artefato aprovado
4. evidência executável
5. documento inicial ainda não substituído
6. arquivo existente apenas como evidência física
```

## 10. No-Assumption

Se faltar fato que altere produto, regra, processo ou contrato:

```text
NÃO DECIDIR
→ BLOCKER
→ especialista responsável
→ humano se necessário
```

## 11. Future Build Specs

Necessidade fora do catálogo ou do escopo atual:

```text
NÃO IMPLEMENTAR
NÃO CRIAR COMO BUILD SPEC ATIVA
REGISTRAR COMO FUTURE
```

Future Spec só entra no catálogo por Change Request aprovado.

## 12. Implementação

A implementação física do sistema começa somente depois de concluído o catálogo documental.

Nenhuma Build Spec autoriza implicitamente:

- reescrever Agent;
- alterar Policy;
- alterar Config;
- alterar Script;
- escrever produto;
- antecipar código.

A implementação deve seguir as Specs completas.

## 13. Regra final

```text
BUILD SPECS COMPLETAS
↓
IMPLEMENTAÇÃO DA EQUIPE
↓
AUDITORIA DA EQUIPE
↓
PROMPT DO USUÁRIO
↓
TASK SPECS / EXECUÇÃO
↓
RICKCALCULATOR
```
