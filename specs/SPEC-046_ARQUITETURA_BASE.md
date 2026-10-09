# SPEC-046 — ARQUITETURA BASE

## 1. Identificação

```text
ID: SPEC-046
Título: ARQUITETURA BASE
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Fixar a arquitetura-base aprovada do RickCalculator.

## 3. Problema que resolve

System Designer não deve redesenhar uma arquitetura já decidida.

## 4. Justificativa de necessidade

O projeto já consolidou uma separação específica para View, Controller, Engine e Math.

## 5. Escopo

### IN SCOPE

- View
- ICalculatorController
- TCalculatorController
- TCalculatorEngine
- ICalculatorMath
- TCalculatorMath

### OUT OF SCOPE

- arquitetura genérica para outros projetos
- persistência
- API

## 6. Entradas

- SPEC-045
- decisões arquiteturais aprovadas

## 7. Saídas

- arquitetura-base normativa

## 8. Responsável

```text
Owner: System Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-045_BUILD_QUALITY`

## 10. Regras

1. Fluxo: View → ICalculatorController → TCalculatorController → TCalculatorEngine → ICalculatorMath → TCalculatorMath.
2. TCalculatorEngine é detalhe concreto interno; não criar ICalculatorEngine.
3. ICalculatorController expõe comandos fluentes e Build: string.
4. ICalculatorMath usa interface e Build: Double conforme padrão aprovado.
5. View depende do Controller, não de Math/Engine concreto.
6. System Designer pode detalhar composição sem contrariar essa base.

## 11. Critérios de aceitação

- `AC-046-01` — Arquitetura preserva limites.
- `AC-046-02` — Engine não ganha interface artificial.
- `AC-046-03` — View não conhece Math diretamente.

## 12. Blockers

- ARCHITECTURE BLOCKER

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
Next: `SPEC-050_PRODUCT_INTAKE_PROCESS`
```
