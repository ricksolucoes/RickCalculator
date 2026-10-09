# TDD PLAN

Task: TASK-20261009-161654
Owner: TDD_PLANNER
Sources: REQUIREMENTS, ACCEPTANCE_CRITERIA, SYSTEM_DESIGN, UI_SPEC aprovados; policies runtime Delphi; config e scripts runtime. Nenhuma Build Spec consultada.

## Execution contract

Projeto console: validation/RickCalculatorTests/RickCalculatorTests.dproj, testes em src/Calculator.Tests.pas, runner em src/Calculator.TestRunner.pas. Usar runner RTL pequeno, sem dependência externa: casos registrados por nome, assertivas reais, exceção de assertiva contabilizada como Failed, demais exceções como Errors, resumo Discovered/Executed/Passed/Failed/Errors e ExitCode 0 somente com Executed=Discovered>0, Failed=Errors=0. Permitir seleção cumulativa por ciclo; a seleção identifica explicitamente os nomes incluídos. Não registrar testes futuros antes do ciclo autorizado.

Cada teste de Engine usa instância nova com TCalculatorMath.New; fixture libera Engine. Controller usa New e interface. Math usa New. Overflow do contrato matemático usa MaxDouble+MaxDouble e exige EOverflow. Para testar erro da Engine sem centenas de comandos, injetar implementação TEST-ONLY de ICalculatorMath cujo Add lança EOverflow; Build respeita assinatura. Não alterar produção nem fabricar resultados na dependência real. A fixture de erro executa Digit(1), Add, Digit(1), Equals, exige HasError antes de cada recuperação. Testes de recuperação com uma nova operação comprovam cancelamento de flags anteriores.

Se units inexistentes impedirem compilação, isso é impedimento estrutural e NÃO RED. TEST_DEVELOPER entrega evidência do compilador ao coordenador para PRODUCTION_DEVELOPER criar somente declarações/estrutura mínima dos contratos aprovados, com comportamento neutro explicitamente identificado como incompleto. Nenhuma implementação funcional futura é autorizada nessa preparação. Retornar a TEST_DEVELOPER, compilar e executar o teste antes do GREEN funcional. Não aceitar mero erro de ligação/configuração como prova funcional.

Comando de build: scripts/build-project.cmd validation/RickCalculatorTests/RickCalculatorTests.dproj Debug Win32; execução: validation/RickCalculatorTests/bin/RickCalculatorTests.exe, com seleção cumulativa implementada pelo runner. Capturar stdout/stderr e código de saída em logs próprios e copiar evidências pertinentes à pasta evidence da tarefa. Artefatos de compilação seguem DCC_ExeOutput=bin e DCC_DcuOutput=Temp. Recurso .res real; fontes Delphi UTF-8 BOM; zero warnings. Testes não dependem de janela VCL.

## Shared cycle fields

Os campos abaixo se aplicam individualmente a TODOS os ciclos, em conjunto com seus campos específicos:

- Initial State: comportamento ainda não evidenciado; instância nova Entry/0, salvo precondição explícita do teste. Não declarar RED antecipadamente.
- RED or ALREADY GREEN Evidence Plan: executar suíte anterior verde, adicionar somente os testes do ciclo, compilar com Errors=Warnings=0 e executar. RED somente com falha de assertiva que mostre expected/actual; registrar nomes, contagens e código real. Se todos já passam, ALREADY GREEN com execução e sem regressão artificial.
- Expected Failed: RED >=1, correspondente somente ao comportamento novo, com testes anteriores passando; GREEN/ALREADY GREEN=0.
- Expected Errors: 0 tanto no RED funcional quanto no GREEN. EOverflow esperado e capturado pelo teste de fronteira não é erro do runner.
- Expected ExitCode: RED=1 (runner); GREEN/ALREADY GREEN=0. Falha de build não satisfaz RED.
- Suite Before: todos os casos dos ciclos anteriores; C01 inicia com runner vazio e build técnico verificado, sem chamar isso de suíte funcional aprovada.
- Suite After: todos os casos C01 até o ciclo atual, executados após GREEN e novamente após qualquer refactor que altere código.
- REFACTOR Review: REFACTOR_SPECIALIST avalia duplicação, coesão, ownership de interfaces, limites de métricas e policies; registra alteração ou justificativa objetiva para nenhuma alteração. Testes congelados, sem antecipar ciclo futuro.
- Layer: domínio puro, salvo identificação específica de contrato Controller ou View no ciclo.
- Authorized Production Files: caminhos abaixo relativos a workspace/RickCalculator; infraestrutura .dpr/.dproj/.rc/.res apenas quando necessária à compilação real, conforme SYSTEM_DESIGN, sem antecipar UI.

## Cycles

### C01 — Soma finita no contrato matemático

Requirement: FR-02. Acceptance Criteria: AC-03, primeira soma.
Layer: Math. Test Unit: Calculator.Tests.pas. Test Name: Math_AddTwoAndThree.
Precondition: Math.New novo. Input: Add(2,3).Build. Expected Result: Double 5, igualdade exata para estes inteiros.
GREEN Minimum: implementar somente contrato Math e soma finita exigida por este teste.
Authorized Production Files: src/Interfaces/Calculator.Math.Intf.pas; src/Domain/Calculator.Math.pas.

### C02 — Entrada decimal e limite

Requirement: FR-01. Acceptance Criteria: AC-01, AC-02.
Test Unit: Calculator.Tests.pas. Test Names: Entry_InitialCommaAndDuplicate; Entry_FifteenSignificantDigits.
Precondition: Engine nova. Input/Expected Result: DecimalSeparator -> `0,`, repetir -> `0,`; fixture independente digita `123456789012345` -> mesmo texto, digita 6 -> texto inalterado.
GREEN Minimum: Engine inicial, dígitos, separador e limite; helpers de parse somente se usados neste ciclo.
Authorized Production Files: src/Domain/Calculator.Engine.pas; src/Domain/Calculator.Formatter.pas.

### C03 — Soma e encadeamento

Requirement: FR-02. Acceptance Criteria: AC-03, AC-04.
Test Unit: Calculator.Tests.pas. Test Names: Engine_SimpleAddition; Engine_SequentialAddition; Engine_ConsecutiveOperator.
Precondition: Engine nova por caso. Input/Expected Result: `2 + 3 =` -> `5`; `2 + 3 + 4 =` -> `9`; `2 + + 3 =` -> `5`.
GREEN Minimum: acumulador, pendência, segundo operando explícito e execução sequencial; formatar resultados inteiros utilizados.
Authorized Production Files: src/Domain/Calculator.Engine.pas; src/Domain/Calculator.Formatter.pas.

### C04 — Igual repetido e reinício após resultado

Requirement: FR-03, FR-04. Acceptance Criteria: AC-05..AC-08.
Test Unit: Calculator.Tests.pas. Test Names: Equals_RepeatsLastOperand; Equals_UsesFirstOperandWhenMissing; Equals_WithoutOperation; Result_DigitStartsNew; Result_AddContinues.
Precondition: Engine nova por caso. Input/Expected Result: `2 + 3 = = =` -> `5`,`8`,`11`; `5 + = =` -> `10`,`15`; `5 =` -> `5`; `2 + 3 = 7` -> `7`; `2 + 3 = + 4 =` -> `9`.
GREEN Minimum: repetição e transições após resultado; nenhuma limpeza/edição futura antecipada.
Authorized Production Files: src/Domain/Calculator.Engine.pas.

### C05 — C e CE nos estados normais

Requirement: FR-05, FR-06. Acceptance Criteria: AC-09 (entrada/pendência/resultado), AC-10, AC-11.
Test Unit: Calculator.Tests.pas. Test Names: Clear_EntryPendingResult; ClearEntry_ExplicitSecondOperand; ClearEntry_MissingSecondOperand; ClearEntry_CancelsResultRepeat.
Precondition: fixtures novas; testar C independentemente após `123`, `8 + 2` e `2 + 3 =`.
Input/Expected Result: C -> `0`, depois `=` -> `0`, depois `7 =` -> `7`; `8 + 2 CE =` -> `8`; `8 + CE =` -> `8`; `2 + 3 = CE` -> `0`, `=` -> `0`, `7` -> `7`.
GREEN Minimum: reset completo e limpeza da entrada com zero explícito; parcela erro de AC-09 pertence a C10.
Authorized Production Files: src/Domain/Calculator.Engine.pas.

### C06 — Backspace

Requirement: FR-07. Acceptance Criteria: AC-12, AC-13.
Test Unit: Calculator.Tests.pas. Test Names: Backspace_RemovesVisibleCharacters; Backspace_IgnoresResultThenEditsNewEntry.
Precondition: Engine nova por caso. Input/Expected Result: `1,2`, três Backspaces -> `1,`,`1`,`0`; `2 + 3 =`, Backspace -> `5`, digitar `7`, Backspace -> `0`.
GREEN Minimum: remoção textual da entrada editável e proteção do resultado.
Authorized Production Files: src/Domain/Calculator.Engine.pas.

### C07 — Sinal de entrada e resultado

Requirement: FR-08. Acceptance Criteria: AC-14, AC-15.
Test Unit: Calculator.Tests.pas. Test Names: Sign_AllowsNegativeZero; Sign_NegativeSecondOperand; Sign_TwiceRestoresEntry; Sign_ResultPreservesRepeat.
Precondition: Engine nova por caso. Input/Expected Result: ± -> `-0`; `5 + ± 2 =` -> `3`; entrada `12` e duas alternâncias -> `-12`,`12`; `2 + 3 = ± =` -> `5`,`-5`,`-2`.
GREEN Minimum: sinal textual, segundo operando negativo e sinal do resultado preservando repetição.
Authorized Production Files: src/Domain/Calculator.Engine.pas; src/Domain/Calculator.Formatter.pas.

### C08 — Formatação de Double

Requirement: FR-10. Acceptance Criteria: AC-18, AC-19.
Test Unit: Calculator.Tests.pas. Test Names: Format_DecimalsRemoveInsignificantZeros; Format_NormalizesSignedZero; Format_ScientificAndPrecision.
Precondition: Engine nova para caso decimal; Formatter diretamente para valores inacessíveis por entrada curta.
Input/Expected Result: `1,20 + 2,30 =` -> `3,5`; formatter de Double 0 e de Double com bit de sinal negativo e magnitude zero -> `0`; formatter de Double 1E100 -> notação científica que represente esse valor, sem ponto decimal e com <=15 dígitos significativos; Double 1.2345678901234567 -> representação ffGeneral precisão 15 com vírgula e sem zeros finais insignificantes conforme design aprovado.
O teste de precisão verifica a string `1,23456789012346` e a contagem de 15 significativos; o de 1E100 não impõe padding do expoente da RTL. Não comparar Double fracionário por igualdade matemática decimal.
GREEN Minimum: formatter local com TFormatSettings, ffGeneral/15 e zero normalizado; nenhuma mudança global de locale.
Authorized Production Files: src/Domain/Calculator.Formatter.pas; src/Domain/Calculator.Engine.pas.

### C09 — Fronteira matemática e entrada em erro

Requirement: FR-09. Acceptance Criteria: AC-16.
Layer: Math e Engine. Test Unit: Calculator.Tests.pas. Test Names: Math_OverflowRaisesEOverflow; Engine_OverflowShowsExactError.
Precondition: Math real para primeiro caso; Engine com Math overflow de teste para segundo.
Input/Expected Result: MaxDouble + MaxDouble -> EOverflow, sem resultado não finito exposto; fixture de erro -> DisplayText exatamente `Resultado fora da faixa numérica.` e HasError=True.
GREEN Minimum: detectar overflow/exceção esperada e não finitos sem mudar máscaras globais; Engine captura apenas EOverflow e estabelece estado Error.
Authorized Production Files: src/Domain/Calculator.Math.pas; src/Domain/Calculator.Engine.pas.

### C10 — Comandos e recuperação no erro

Requirement: FR-05, FR-09. Acceptance Criteria: AC-09 (erro), AC-17.
Test Unit: Calculator.Tests.pas. Test Names: Error_IgnoresUnavailableCommands; Error_ClearResets; Error_DigitRecovers; Error_CommaRecovers.
Precondition: fixture de erro nova para cada comando ou recuperação; Math de teste lança somente na primeira Add, permitindo observar novas operações reais subsequentes.
Input/Expected Result: CE, Backspace, ±, + e = mantêm mensagem e HasError=True; C -> `0`, HasError=False e `=` mantém `0`; Digit(7) -> `7`, HasError=False e `=` mantém `7`; DecimalSeparator -> `0,`, HasError=False. Após recuperação `C 2 + 3 = =` -> `5`,`8`, confirmando funcionamento sem estado antigo.
GREEN Minimum: comandos ignorados e recuperação limpa explicitamente autorizada.
Authorized Production Files: src/Domain/Calculator.Engine.pas.

### C11 — Controller e integração da View

Requirement: FR-01..FR-10, NFR-01. Acceptance Criteria: AC-01..AC-19 por delegação e regressão acumulada; UI-01..UI-08 de UI_SPEC.
Layer: Controller/View. Test Unit: Calculator.Tests.pas. Test Names: Controller_FluentCommandsAndDisplay; Controller_EditingAndResultCommands.
Precondition: Controller.New; interfaces mantidas durante toda chamada encadeada.
Input/Expected Result: Controller.Digit(2).Add.Digit(3).Equals.Build -> `5`, HasError=False; fixture independente DecimalSeparator.Build -> `0,`; Clear.Digit(8).Add.ClearEntry.Equals.Build -> `8`; Clear.Digit(1).Digit(2).Backspace.ToggleSign.Build -> `-1`.
GREEN Minimum: Controller delega e gerencia Engine, compor aplicação e implementar somente a View aprovada. Eventos visuais não contêm regras de domínio. Testes console verificam contrato; a aplicação completa deve também compilar e ser exercitada realmente por QA_FUNCTIONAL/UI_QA, incluindo todos os 17 botões, layout, foco, escala e apresentação de erro. Não atribuir aprovação visual por estes dois testes de Controller.
Authorized Production Files: src/Interfaces/Calculator.Controller.Intf.pas; src/Controller/Calculator.Controller.pas; src/View/Calculator.MainForm.pas; RickCalculator.dpr; RickCalculator.dproj; RickCalculator.rc; RickCalculator.res.

## Regression, traceability and evidence

Total planejado: 32 casos nomeados; cada método com múltiplas assertivas mantém seu nome registrado, informando subcenário na falha. Não usar quantidade declarada como evidência: runner registra descobertos/executados reais e lista nomes. C01=1; C02=2; C03=3; C04=5; C05=4; C06=2; C07=4; C08=3; C09=2; C10=4; C11=2.

AC-01/02 -> C02; AC-03 -> C01/C03; AC-04 -> C03; AC-05/06/07/08 -> C04; AC-09 -> C05/C10; AC-10/11 -> C05; AC-12/13 -> C06; AC-14/15 -> C07; AC-16 -> C09; AC-17 -> C10; AC-18/19 -> C08. C11 valida ligação do contrato utilizado pela View. NFR-01 e UI exigem inspeção/execução pelas etapas donas; NFR-02 é auditável pela cadeia runtime. Nenhum AC funcional fica sem teste.

Evidência por ciclo: baseline, log de build completo, RED ou ALREADY GREEN, handoffs, GREEN, decisão REFACTOR e regressão final; sempre comandos, nomes, expected/actual nas falhas, contagens reais, ExitCode e paths. Builds aprovados Errors=Warnings=0. Não sobrescrever logs RED com GREEN. Mudança em teste congelado requer resolução formal; falha estrutural é blocker técnico, divergência de expected result retorna a REQUIREMENTS_ANALYST. Ao final executar testes Debug e Release Win32 e builds da aplicação Debug/Release pelas etapas responsáveis. Teste de domínio não substitui QA funcional, UI ou release.

## Blockers

Nenhum blocker identificado nesta etapa de planejamento. Ausência de units iniciais é prevista e deve ser tratada pela sequência estrutural acima, com prova real antes de qualquer classificação RED.

## Status

APPROVED — TDD_PLANNER. Próximo responsável: TEST_DEVELOPER, somente C01 inicialmente; cada novo ciclo depende da conclusão GREEN/ALREADY GREEN e REFACTOR do anterior.

