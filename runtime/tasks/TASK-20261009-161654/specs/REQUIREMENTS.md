# REQUIREMENTS

Task: TASK-20261009-161654
Owner: REQUIREMENTS_ANALYST
Source: PRODUCT_BRIEF.md (APPROVED); agents/REQUIREMENTS_ANALYST.md, regras funcionais incorporadas.

## Functional Requirements

- FR-01 — Permitir entrada numérica com vírgula decimal visual. Vírgula inicial produz `0,`; aceitar somente um separador decimal. Limitar a entrada a 15 dígitos significativos, ignorando os excedentes.
- FR-02 — Oferecer soma como única operação matemática. Usar Double nos cálculos e executar somas sequencialmente; operador consecutivo substitui o anterior.
- FR-03 — `=` executa soma pendente; repetição de `=` repete a última soma com o último segundo operando. Em `5 + =`, usar 5 como segundo operando; `5 =` mantém 5.
- FR-04 — Dígito após resultado inicia nova entrada; `+` após resultado usa o resultado como primeiro operando.
- FR-05 — C limpa toda a operação e retorna a entrada a 0.
- FR-06 — CE limpa a entrada atual; durante segundo operando estabelece zero explícito, preservando a soma pendente (`8 + CE =` resulta 8). Após resultado, CE apresenta 0, cancela repetição e inicia nova entrada.
- FR-07 — Backspace remove o último caractere visível da entrada, retornando a 0 quando esgotada; após resultado é ignorado até nova entrada.
- FR-08 — ± permite iniciar entrada negativa, inclusive estado transitório `-0`, e alternar sinal durante entrada. Após resultado alterna sinal e preserva repetição de `=`.
- FR-09 — Resultado fora da faixa numérica apresenta `Resultado fora da faixa numérica.` e entra em estado de erro. Nesse estado, C limpa tudo; dígito inicia nova entrada; vírgula inicia `0,`. CE, Backspace, ±, + e `=` são ignorados.
- FR-10 — Apresentar resultados com vírgula decimal, remover zeros insignificantes, apresentar resultado negativo zero como `0`, usar notação científica quando necessária e respeitar até 15 dígitos significativos e o comportamento natural do Double.

## Non-Functional Requirements

- NFR-01 — Não disponibilizar subtração, multiplicação ou divisão; recursos fora do catálogo aprovado não integram a tarefa. Origem: exclusões explícitas do PRODUCT_BRIEF.
- NFR-02 — Preservar rastreabilidade do comportamento até o brief e catálogo runtime autorizado; não consultar Build Specs. Origem: restrições do PRODUCT_BRIEF.

Não há metas de desempenho, plataforma ou decisões de arquitetura adicionais estabelecidas por estas fontes.

## Traceability

FR-01: entrada numérica do brief → AC-01, AC-02.
FR-02: soma do brief → AC-03, AC-04.
FR-03: equals do catálogo → AC-05, AC-06, AC-07.
FR-04: estado de resultado do catálogo → AC-08.
FR-05: C do catálogo → AC-09.
FR-06: CE do catálogo → AC-10, AC-11.
FR-07: Backspace do catálogo → AC-12, AC-13.
FR-08: ± do catálogo → AC-14, AC-15.
FR-09: estado de erro do catálogo → AC-16, AC-17.
FR-10: formatação do catálogo → AC-18, AC-19.

## Open Blockers

Nenhum.

## Status

APPROVED — REQUIREMENTS_ANALYST. Escopo integralmente coberto sem incluir operações excluídas.
