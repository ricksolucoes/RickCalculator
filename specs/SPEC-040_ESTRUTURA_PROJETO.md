# SPEC-040 — ESTRUTURA DO PROJETO

## 1. Identificação

```text
ID: SPEC-040
Título: ESTRUTURA DO PROJETO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir organização física do RickCalculator.

## 3. Problema que resolve

Arquivos dispersos dificultam ownership, build e review.

## 4. Justificativa de necessidade

Developers precisam de layout previsível.

## 5. Escopo

### IN SCOPE

- raiz
- src
- tests
- Temp
- bin
- logs

### OUT OF SCOPE

- workspace externo do sistema
- deployment cloud

## 6. Entradas

- SPEC-034

## 7. Saídas

- layout físico normativo

## 8. Responsável

```text
Owner: System Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-034_UI_ESCOPO_REDUZIDO`

## 10. Regras

1. .dpr/.dproj/.res ficam na raiz do projeto.
2. Units ficam em subpastas de src por responsabilidade.
3. Testes ficam em tests.
4. DCUs temporários ficam em Temp.
5. Executáveis ficam em bin.
6. Logs ficam em logs.

## 11. Critérios de aceitação

- `AC-040-01` — Código-fonte e artefatos separados.
- `AC-040-02` — Estrutura reflete responsabilidade.

## 12. Blockers

- PROJECT STRUCTURE BLOCKER

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
Next: `SPEC-041_NAMING_DELPHI`
```
