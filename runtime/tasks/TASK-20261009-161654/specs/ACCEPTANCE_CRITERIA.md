# ACCEPTANCE CRITERIA

Task: TASK-20261009-161654
Owner: REQUIREMENTS_ANALYST

## Criteria

- AC-01 (FR-01): partindo de entrada limpa, vírgula apresenta `0,`; uma segunda vírgula na mesma entrada não acrescenta separador.
- AC-02 (FR-01): a entrada `123456789012345` é aceita; o próximo dígito significativo é ignorado.
- AC-03 (FR-02): `2 + 3 =` apresenta `5`; `2 + 3 + 4 =` apresenta `9`.
- AC-04 (FR-02): `2 + + 3 =` apresenta `5`; repetir o operador não cria operando ou operação adicional.
- AC-05 (FR-03): `2 + 3 = = =` apresenta sucessivamente `5`, `8`, `11`.
- AC-06 (FR-03): `5 + =` apresenta `10`; outro `=` apresenta `15`.
- AC-07 (FR-03): `5 =` mantém `5`.
- AC-08 (FR-04): após `2 + 3 =`, digitar `7` apresenta nova entrada `7`; em execução independente, após `2 + 3 =`, `+ 4 =` apresenta `9`.
- AC-09 (FR-05): C durante entrada, soma pendente, resultado ou erro retorna a 0 sem preservar operação ou repetição anterior.
- AC-10 (FR-06): `8 + 2 CE =` apresenta `8`; `8 + CE =` também apresenta `8`.
- AC-11 (FR-06): após `2 + 3 =`, CE apresenta `0`; `=` não repete a soma anterior e um dígito começa nova entrada.
- AC-12 (FR-07): a partir de `1,2`, Backspace apresenta sucessivamente `1,`, `1`, `0`.
- AC-13 (FR-07): após `2 + 3 =`, Backspace mantém `5`; após digitar uma nova entrada, Backspace volta a editar essa entrada.
- AC-14 (FR-08): ± em entrada limpa permite `-0`; `5 + ± 2 =` apresenta `3`; alternar sinal de uma entrada duas vezes restaura seu valor.
- AC-15 (FR-08): `2 + 3 = ± =` apresenta sucessivamente `5`, `-5`, `-2`, comprovando preservação do último segundo operando.
- AC-16 (FR-09): quando uma soma ultrapassa a faixa finita de Double, aparece exatamente `Resultado fora da faixa numérica.` e o estado passa a erro.
- AC-17 (FR-09): no erro de AC-16, CE, Backspace, ±, + e `=` preservam a mensagem; em execuções independentes, C retorna a 0, um dígito inicia essa nova entrada e vírgula inicia `0,`.
- AC-18 (FR-10): `1,20 + 2,30 =` apresenta `3,5`; resultado numericamente igual a zero é apresentado como `0`, inclusive quando possuir sinal negativo interno.
- AC-19 (FR-10): resultados respeitam até 15 dígitos significativos e o comportamento natural de Double; quando necessária, a apresentação usa notação científica com vírgula decimal.

## Traceability

Cada AC identifica seu FR explicitamente. FR-01 a FR-10 estão cobertos. NFR-01 é verificável pela ausência de operações excluídas no produto; NFR-02 pela cadeia de artefatos runtime e suas fontes.

## Open Blockers

Nenhum. Divisão por zero não integra os critérios porque divisão está explicitamente excluída do PRODUCT_BRIEF.

## Status

APPROVED — REQUIREMENTS_ANALYST.
