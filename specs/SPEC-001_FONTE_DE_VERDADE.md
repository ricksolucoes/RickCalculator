# SPEC-001 — FONTE DE VERDADE

## 1. Identificação

```text
ID: SPEC-001
Título: FONTE DE VERDADE
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir a hierarquia oficial das fontes usadas durante a construção do sistema de Agents.

## 3. Problema que resolve

Evita que arquivos antigos, memória informal ou fontes conflitantes sejam tratados como regra atual.

## 4. Justificativa de necessidade

Todas as Specs posteriores dependem de uma autoridade inequívoca para fatos e decisões.

## 5. Escopo

### IN SCOPE

- hierarquia de fontes
- conflitos de autoridade
- arquivos legados
- evidência executável
- rastreabilidade

### OUT OF SCOPE

- requisitos funcionais
- Task Specs runtime
- implementação de Agents

## 6. Entradas

- SPEC-000_GOVERNANCA
- SPEC_CREATION_RULES
- decisões explícitas do usuário
- documento inicial
- ZIP atual como evidência física

## 7. Saídas

- hierarquia normativa
- regra de conflito
- regra para legado
- regra de rastreabilidade

## 8. Responsável

```text
Owner: Governança da Construção
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-000_GOVERNANCA`

## 10. Regras

1. Prioridade: decisão explícita mais recente do usuário > Build Spec aplicável > artefato aprovado > evidência executável > documento inicial ainda não substituído > arquivo existente como evidência física.
2. Arquivo existente não é fonte normativa automática.
3. Evidência executável comprova fatos, mas não cria requisito ou arquitetura.
4. Conflito não resolvido por precedência gera blocker.
5. Memória informal pode localizar contexto, mas não substituir fonte aprovada.

## 11. Critérios de aceitação

- `AC-001-01` — A hierarquia é inequívoca.
- `AC-001-02` — Arquivo legado não é automaticamente normativo.
- `AC-001-03` — Conflitos não são reconciliados por suposição.
- `AC-001-04` — Decisões relevantes são rastreáveis.

## 12. Blockers

- SOURCE CONFLICT BLOCKER
- AUTHORITY BLOCKER
- LEGACY SOURCE BLOCKER

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
Next: `SPEC-002_GATES_E_APROVACOES`
```
