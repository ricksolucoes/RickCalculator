# UI SPEC

Task: TASK-20261009-161654
Owner: PRODUCT_DESIGNER
Sources: PRODUCT_BRIEF, REQUIREMENTS e ACCEPTANCE_CRITERIA aprovados; referência normativa em agents/PRODUCT_DESIGNER.md.

## Scope

Calculadora de somar com entrada numérica, vírgula, =, +, C, CE, Backspace e ±. A composição preserva título, display superior e teclado estruturado da referência runtime.

## Structure

Uma única tela com título CALCULADORA, display logo abaixo e teclado abaixo do display. Área útil de referência: 360 × 440 unidades lógicas; margem externa 16, espaçamento entre controles 8. Permitir acomodação às métricas de fonte e escala do ambiente sem sobreposição ou corte. Display ocupa toda a largura disponível, com altura mínima 76; teclado tem quatro colunas iguais e cinco linhas de altura mínima 48. Fonte sans-serif legível, título 16, display numérico 28 e botões 18 unidades lógicas. Fundo claro, texto escuro e contornos discretos; + e = recebem destaque azul com texto de alto contraste. C e CE conservam aparência de controles de apoio.

Composição das linhas do teclado, da esquerda para a direita:

| Linha | Coluna 1 | Coluna 2 | Coluna 3 | Coluna 4 |
| --- | --- | --- | --- | --- |
| Apoio | C | CE | Backspace | ± |
| 1 | 7 | 8 | 9 | + |
| 2 | 4 | 5 | 6 | = |
| 3 | 1 | 2 | 3 | espaço vazio |
| 4 | 0 | , | espaço vazio | espaço vazio |

Espaços vazios são fundo da tela, sem borda, foco ou ação. Não devem sugerir botões desativados. A remoção dos operadores excluídos justifica a adaptação da última coluna da referência.

## Controls

- Display: apresentação somente leitura, texto numérico alinhado à direita, sem edição direta; inicia em 0. Deve comportar sinal, separador e até 15 dígitos significativos ou notação científica sem corte. Ajustar apresentação para caber mantendo legibilidade.
- Dez botões de dígitos: rótulos 0 a 9, um comando de entrada por ativação.
- Vírgula: rótulo `,`, comando de separador decimal.
- Soma: rótulo `+`, única operação matemática disponível.
- Igual: rótulo `=`, execução conforme FR-03.
- C e CE: rótulos literais; nomes acessíveis Limpar tudo e Limpar entrada.
- Backspace: rótulo Backspace, nome acessível Apagar último caractere; fonte pode ser reduzida para 12 para caber na coluna, sem truncamento.
- Sinal: rótulo `±`, nome acessível Alternar sinal.

## Visual States

- Inicial e entrada: display apresenta exatamente o texto recebido do estado da aplicação, inclusive estados transitórios `0,`, `1,` e `-0` autorizados.
- Soma pendente: display conserva a apresentação fornecida pelo estado; não acrescentar histórico, expressão ou cálculo auxiliar.
- Resultado: mesmo display e alinhamento da entrada, recebendo a formatação definida por FR-10.
- Erro: substituir o número pela mensagem exata `Resultado fora da faixa numérica.`. Usar fonte 14, quebra de linha e altura suficiente para mostrar integralmente; cor escura de erro, sem depender somente da cor. C e dígitos/vírgula continuam disponíveis. CE, Backspace, ±, + e = aparecem desabilitados enquanto o estado for erro, refletindo os comandos ignorados de FR-09.
- Foco: contorno visível no controle ativo; pressionado: mudança visível de fundo. Controles desabilitados têm aparência atenuada com texto legível.

## View Interaction Rules

Ativação por clique ou mecanismo padrão de ativação de botão do ambiente envia o comando correspondente. Ordem de foco segue linhas da tabela da esquerda para a direita, omitindo display e espaços vazios. Não introduzir atalhos globais adicionais. A View apresenta o estado e encaminha comandos; não calcula, limita dígitos, altera sinal, interpreta operandos, formata resultados ou decide recuperação de erro. Essas regras permanecem no comportamento aprovado e sua implementação cabe às próximas etapas. Alterações de estado atualizam o display e a disponibilidade dos controles de forma consistente.

## Reduced Scope Rules

Não mostrar botões, menus ou rótulos acionáveis para subtração, multiplicação ou divisão. O símbolo ± serve somente ao sinal da entrada/resultado aprovado; não representa operação binária de subtração. Não acrescentar memória, histórico, porcentagem ou outras funções.

## UI QA Criteria

- UI-01: título, display superior e teclado em quatro colunas correspondem à estrutura especificada e à referência runtime.
- UI-02: inventário contém exatamente os 17 botões autorizados; nenhuma affordance representa operação excluída.
- UI-03: todos os rótulos e o display ficam legíveis, sem sobreposição ou corte, inclusive valores de 15 dígitos, sinal, vírgula e notação científica (AC-02, AC-14, AC-19).
- UI-04: estados transitórios e resultado são apresentados sem transformação indevida pela View (AC-01, AC-12, AC-14, AC-18).
- UI-05: mensagem de erro é integral e literal; disponibilidade dos controles reflete FR-09 e recuperação de AC-17.
- UI-06: foco e pressionamento são perceptíveis; a ordem de foco segue a tabela e espaços vazios não recebem foco.
- UI-07: C, CE e Backspace são distinguíveis; + e = têm destaque claro sem sugerir funções adicionais.
- UI-08: inspecionar também em escala de exibição maior que a padrão, garantindo ausência de corte e sobreposição.

## Open Blockers

Nenhum.

## Status

APPROVED — PRODUCT_DESIGNER. UI cobre somente o escopo aprovado e está suficiente para SYSTEM_DESIGNER, implementação e UI_QA.
