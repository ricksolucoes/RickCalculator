# SPEC-017 — EDIÇÃO

## 1. Identificação

```text
ID: SPEC-017
Título: EDIÇÃO
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir C, CE, Backspace e ±.

## 3. Problema que resolve

Comandos de edição alteram estado e podem interferir em operações pendentes.

## 4. Justificativa de necessidade

Eles precisam ser independentes de detalhes da View.

## 5. Escopo

### IN SCOPE

- C
- CE
- Backspace
- ±

### OUT OF SCOPE

- cálculo matemático
- layout

## 6. Entradas

- SPEC-016

## 7. Saídas

- regras de edição

## 8. Responsável

```text
Owner: Requirements Analyst
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-016_EQUALS`

## 10. Regras

1. C limpa todo o estado para inicial.
2. CE limpa apenas a entrada atual conforme contexto.
3. Backspace remove o último caractere visível; 1,2→1,→1→0.
4. Após resultado, Backspace é ignorado até nova entrada.
5. ± após resultado alterna sinal e preserva repetição.
6. Com operador pendente e sem segundo dígito, ± inicia entrada negativa; exemplo: 5 + ± 2 = 3.

## 11. Critérios de aceitação

- `AC-017-01` — C e CE são distintos.
- `AC-017-02` — Backspace segue caractere visível.
- `AC-017-03` — Sinal respeita contexto.

## 12. Blockers

- EDIT COMMAND BLOCKER

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
Next: `SPEC-018_RESULTADO`
```
