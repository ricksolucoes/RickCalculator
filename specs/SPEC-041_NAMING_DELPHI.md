# SPEC-041 — NAMING DELPHI

## 1. Identificação

```text
ID: SPEC-041
Título: NAMING DELPHI
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Fixar convenções de nomenclatura Delphi.

## 3. Problema que resolve

Naming inconsistente viola regras normativas do projeto.

## 4. Justificativa de necessidade

Code Review precisa de regras objetivas.

## 5. Escopo

### IN SCOPE

- locals
- fields
- parameters
- constants
- interfaces
- classes
- enums

### OUT OF SCOPE

- nomes específicos de domínio ainda não definidos

## 6. Entradas

- SPEC-040
- regras Delphi aprovadas

## 7. Saídas

- naming contract

## 8. Responsável

```text
Owner: Code Reviewer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-040_ESTRUTURA_DO_PROJETO`

## 10. Regras

1. Local: L + PascalCase.
2. Campo privado: F + PascalCase.
3. Parâmetro: A + PascalCase.
4. Constante: CAIXA ALTA, inicia '_' e termina '_'; palavras separadas por '_'.
5. Interface: I + PascalCase.
6. Classe concreta: T + PascalCase.
7. Enums usam {$SCOPEDENUMS ON} e membros sem prefixos artificiais.

## 11. Critérios de aceitação

- `AC-041-01` — Todas as categorias possuem regra.
- `AC-041-02` — Constantes seguem padrão exclusivo Delphi do usuário.

## 12. Blockers

- NAMING BLOCKER

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
Next: `SPEC-042_INTERFACES_DELPHI`
```
