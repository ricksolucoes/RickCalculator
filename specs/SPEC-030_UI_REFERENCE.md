# SPEC-030 — UI REFERENCE

## 1. Identificação

```text
ID: SPEC-030
Título: UI REFERENCE
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Fixar o desenho visual original como referência normativa.

## 3. Problema que resolve

O Product Designer não pode reinventar a tela.

## 4. Justificativa de necessidade

A referência já foi fornecida pelo projeto.

## 5. Escopo

### IN SCOPE

- display
- teclado 4x4
- ordem base dos botões
- título visual

### OUT OF SCOPE

- estilo não especificado como cor/fonte exata se não houver fonte aprovada

## 6. Entradas

- documento inicial
- SPEC-020

## 7. Saídas

- referência UI normativa

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-020_FORMATACAO`

## 10. Regras

1. Preservar a composição base: display superior e grade 4x4.
2. Ordem base: 7 8 9 /; 4 5 6 ×; 1 2 3 -; 0 , = +.
3. Não mover lógica matemática para a UI.
4. Detalhes estéticos não documentados são responsabilidade do Product Designer dentro dos limites de produto, sem criar comportamento.

## 11. Critérios de aceitação

- `AC-030-01` — Estrutura visual base preservada.
- `AC-030-02` — Botões-base identificados.
- `AC-030-03` — UI não define matemática.

## 12. Blockers

- UI REFERENCE BLOCKER

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
Next: `SPEC-031_ESTRUTURA_TELA`
```
