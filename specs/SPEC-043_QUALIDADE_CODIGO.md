# SPEC-043 — QUALIDADE DE CÓDIGO

## 1. Identificação

```text
ID: SPEC-043
Título: QUALIDADE DE CÓDIGO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir critérios qualitativos de implementação.

## 3. Problema que resolve

Funcionalidade correta pode ainda ter baixa manutenção ou acoplamento indevido.

## 4. Justificativa de necessidade

Code Review precisa de critérios além de compilação.

## 5. Escopo

### IN SCOPE

- Clean Code
- SOLID
- coesão
- acoplamento
- responsabilidade
- código morto

### OUT OF SCOPE

- métricas numéricas; tratadas em SPEC-044

## 6. Entradas

- SPEC-042

## 7. Saídas

- quality contract

## 8. Responsável

```text
Owner: Code Reviewer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-042_INTERFACES_DELPHI`

## 10. Regras

1. Aplicar SRP e separação de responsabilidades.
2. Evitar abstração sem finalidade.
3. Remover código morto.
4. Preferir baixo acoplamento e alta coesão.
5. Não mover regra para View para reduzir código em domínio.
6. Refatoração não altera comportamento externo.

## 11. Critérios de aceitação

- `AC-043-01` — Critérios são auditáveis por review.
- `AC-043-02` — Sem overengineering deliberado.

## 12. Blockers

- QUALITY BLOCKER

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
Next: `SPEC-044_METHOD_TOXICITY`
```
