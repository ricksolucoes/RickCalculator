# SPEC-031 — ESTRUTURA DA TELA

## 1. Identificação

```text
ID: SPEC-031
Título: ESTRUTURA DA TELA
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Traduzir a referência visual em estrutura VCL.

## 3. Problema que resolve

Uma imagem ASCII não define sozinha responsabilidades dos controles.

## 4. Justificativa de necessidade

System/Product Designer precisam de estrutura implementável.

## 5. Escopo

### IN SCOPE

- Form principal
- display
- container de teclado
- células de botões

### OUT OF SCOPE

- nomes concretos finais de classes
- cores/fontes sem fonte aprovada

## 6. Entradas

- SPEC-030

## 7. Saídas

- estrutura VCL conceitual

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-030_UI_REFERENCE`

## 10. Regras

1. Uma Form principal contém display e teclado.
2. Display é visualização controlada, não entrada livre do usuário.
3. Teclado representa comandos da calculadora.
4. Layout deve manter leitura simples e previsível.

## 11. Critérios de aceitação

- `AC-031-01` — Estrutura implementável sem lógica de domínio.
- `AC-031-02` — Display e keypad separados.

## 12. Blockers

- UI STRUCTURE BLOCKER

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
Next: `SPEC-032_CONTROLES_UI`
```
