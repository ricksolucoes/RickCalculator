# SYSTEM DESIGN

Task: TASK-20261009-161654
Owner: SYSTEM_DESIGNER
Sources: PRODUCT_BRIEF, REQUIREMENTS, ACCEPTANCE_CRITERIA e UI_SPEC aprovados; três policies Delphi runtime; config/delphi.env.cmd; runtime/config/runtime.json.

## Architecture

Aplicação desktop Delphi VCL, Delphi 10.3 Rio, Win32, Debug e Release conforme configuração runtime. Cadeia obrigatória: View → ICalculatorController → TCalculatorController → TCalculatorEngine → ICalculatorMath → TCalculatorMath. Não criar ICalculatorEngine. Engine é classe concreta interna à composição, sem dependência VCL. Nenhuma persistência, rede, histórico ou operação binária adicional.

## Responsibilities and Units

Raiz de projeto: workspace/RickCalculator, derivada de RickCalculator_WORKSPACE configurado, sem caminhos absolutos no projeto.

| Responsabilidade | Arquivo relativo à raiz do projeto | Tipo |
| --- | --- | --- |
| Inicialização VCL e composição | RickCalculator.dpr | Programa |
| Configuração e recursos | RickCalculator.dproj, RickCalculator.res | Projeto e recurso real compilado |
| Contrato de interação da aplicação | src/Interfaces/Calculator.Controller.Intf.pas | ICalculatorController |
| Contrato matemático puro | src/Interfaces/Calculator.Math.Intf.pas | ICalculatorMath |
| Coordenação e vida útil da Engine | src/Controller/Calculator.Controller.pas | TCalculatorController |
| Máquina de estados e entrada textual | src/Domain/Calculator.Engine.pas | TCalculatorEngine |
| Soma finita Double | src/Domain/Calculator.Math.pas | TCalculatorMath |
| Conversão e apresentação numérica | src/Domain/Calculator.Formatter.pas | TCalculatorFormatter, auxiliar concreto sem interface |
| Tela e eventos visuais | src/View/Calculator.MainForm.pas | TCalculatorMainForm |

Form criado programaticamente com CreateNew; DFM não é necessário. Somente criar pastas com essas responsabilidades. Temp recebe DCU, bin recebe EXE diretamente pelo compilador, logs recebe evidências reais. DCC_ExeOutput=bin e DCC_DcuOutput=Temp; nenhum movimento posterior de EXE. DPR/DPROJ devem registrar units e search paths relativos. Recurso .res deve ser válido, gerado por ferramenta Delphi a partir de recurso autorizado, nunca arquivo vazio ou binário fictício.

## Interfaces

ICalculatorController, GUID {4EE31D42-0799-4A1F-BB47-A28158C5BF85}:

```pascal
function Digit(const ADigit: Integer): ICalculatorController;
function DecimalSeparator: ICalculatorController;
function Add: ICalculatorController;
function Equals: ICalculatorController;
function Clear: ICalculatorController;
function ClearEntry: ICalculatorController;
function Backspace: ICalculatorController;
function ToggleSign: ICalculatorController;
function Build: string;
function HasError: Boolean;
```

Digit recebe 0..9 de controles autorizados. Build devolve exclusivamente texto final de apresentação atual, incluindo entrada transitória e mensagem de erro. HasError é consulta primitiva do estado para habilitação visual; não executa negócio. Não retornar record, objeto ou interface em Build. Métodos de ação sempre retornam Self via interface.

ICalculatorMath, GUID {EA00F587-F46C-44CD-A4BA-09655A34F340}:

```pascal
function Add(const ALeft: Double; const ARight: Double): ICalculatorMath;
function Build: Double;
```

Add calcula somente a soma dos operandos, sem estado da calculadora; o único armazenamento é o resultado dessa chamada para Build. Soma não finita ou overflow aritmético lança EOverflow. Engine captura apenas essa condição matemática esperada, estabelece erro e fornece a mensagem literal aprovada. Não converter falhas de programação em erro numérico. Não alterar globalmente máscaras de exceções do processo: considerar tanto exceção real quanto retorno infinito/NaN; ambos impedem exposição de resultado não finito.

Implementações seguem integralmente DELPHI_INTERFACE_PATTERN: TInterfacedObject, private/protected/public, métodos do contrato e Create em protected sob comentário obrigatório, Destroy override público, New retornando interface com Result := Self.Create. Controller.New sem argumentos cria Engine; Engine.Create recebe ICalculatorMath, permitindo teste determinístico da fronteira matemática sem expor dependência à View. Math.New sem argumentos. Engine pertence exclusivamente ao Controller e é liberada no Destroy; interface Math é gerenciada por referência. Não criar ciclos de referência.

## State and Behavior

Engine mantém enum escopado TCalculatorState=(Entry, Pending, Result, Error), texto da entrada, acumulador Double, flag de soma pendente, flag de segundo operando explícito, último segundo operando Double e flag de repetição. Inicial: Entry, texto 0, flags falsas. Flags distinguem entrada zero explícita da ausência de entrada; são essenciais a FR-03 e FR-06. Engine expõe métodos concretos equivalentes aos comandos, DisplayText:string e HasError:Boolean, apenas para uso do Controller/testes. Engine não possui interface nem referências à View.

- Entrada: texto preserva vírgula final e -0; parse usa formato explícito com vírgula, independente da configuração regional do Windows. Contagem de significativos ignora sinal e separador e zeros anteriores ao primeiro dígito não zero; dígitos após esse primeiro dígito contam, inclusive zeros. Impedir entrada acima de 15 significativos antes de alterar texto. Não limitar pelo número total de caracteres visíveis nem arredondar durante edição.
- Add: primeira soma captura valor atual; Add consecutivo sem segundo operando mantém pendência e display. Se segundo operando explícito existe, soma acumulador com entrada antes de manter a próxima pendência. Resultado passa a primeiro operando quando Add vem após Equals. Nova pendência desativa repetição anterior.
- Equals: pendência usa segundo operando explícito, ou acumulador se ausente; salva segundo operando para repetição, mostra resultado e remove pendência. Em Result com repetição, soma resultado atual ao segundo operando salvo. Sem pendência/repetição mantém valor, atendendo 5 =. Dígito/vírgula após resultado começa nova operação e cancela repetição.
- Clear reinicializa todo estado. ClearEntry durante pendência estabelece texto 0 como segundo operando explícito e preserva acumulador; após resultado cancela repetição e inicia Entry com 0. Backspace atua somente sobre entrada editável, normalizando vazio ou sinal isolado para 0; mantém separador final quando ele ainda está no texto.
- ToggleSign durante Pending inicia segundo operando editável -0, sem consumir acumulador. Em Entry alterna sinal textual. Em Result alterna valor atual e reapresenta, preservando segundo operando de repetição. Zero em resultado é sempre apresentado como 0.
- Error: somente Clear, Digit e DecimalSeparator recuperam, começando operação limpa. Demais comandos não alteram estado. HasError habilita a View a refletir a disponibilidade especificada. Mensagem: Resultado fora da faixa numérica.

Essas transições implementam FR-01..FR-10 e AC-01..AC-19; expected results pertencem aos critérios aprovados, não a este design.

## Formatter

Auxiliar separado justificado por parse explícito da entrada e apresentação de resultados, sem decidir transições. Usar TFormatSettings local com DecimalSeparator=',' e sem separadores de milhar; nunca modificar FormatSettings global. Conversão Double e FloatToStrF com ffGeneral, precisão 15, atende até 15 significativos, remoção de zeros insignificantes e notação científica natural da RTL; normalizar valor numericamente zero para texto 0. Texto de entrada nunca passa pela formatação de resultado. Engine usa formatter; View somente desenha texto fornecido.

## Dependencies and Composition

DPR cria aplicação, Controller.New e Form, atribuindo o Controller antes de exibir a tela. A referência de Controller fica em campo interface privado da View; View importa contrato, nunca Engine/Math. A composição concreta permanece no DPR e Controller. Controller apenas delega comandos e consultas à Engine. Engine importa contrato Math e Formatter; Math e Formatter importam somente RTL. Interfaces importam somente RTL quando necessário. Nenhum teste de domínio exige janela VCL ou automação visual.

View usa controles VCL com desenho apropriado para cores, foco, pressionamento e estado desabilitado; pode especializar controle visual concreto na própria unit sem criar interface artificial. Implementa exatamente UI_SPEC: 17 botões, espaços sem controles, foco em ordem de linhas, display somente leitura, layout escalável. Após cada comando, lê Build e HasError e atualiza apresentação; não conta dígitos, faz parse, cálculos ou recuperação de erro. Ajuste de fonte por medição do texto e redistribuição visual são responsabilidades de apresentação. Sem atalhos globais novos.

## Authorized Files by Responsibility

PRODUCTION_DEVELOPER: somente projeto/recursos e units de produção acima, saídas reais em Temp/bin/logs; recurso fonte .rc na raiz se necessário para gerar .res. TEST_DEVELOPER: projeto console de testes em validation/RickCalculatorTests com .dpr/.dproj/.res próprios, units em src, Temp/bin/logs próprios e referências relativas às units de produção; não implementar produção. TDD_PLANNER define casos, sequência e evidências reais, inclusive fronteira Double diretamente no contrato Math e transições de erro da Engine mediante dependência injetada. REFACTOR_SPECIALIST mantém contratos e comportamento. Não alterar scripts/config/policies sem resolução runtime correspondente. Logs de handoff e Task Specs ficam na pasta runtime desta tarefa.

## Implementation Constraints

Todas as policies permanecem obrigatórias: UTF-8 BOM nos fontes Delphi textuais; GUIDs reais acima; métodos pequenos respeitando Function Length <=20, Parameter Count <=6, If Depth <=5 e Cyclomatic Complexity <=6. Decompor transições e apresentação em helpers coesos para cumprir limites. Classes auxiliares concretas não recebem interface artificial. Compilações Debug/Release e testes exigem Errors=0 e Warnings=0, sem desativar ou mascarar warnings. Usar scripts técnicos e paths de config existentes. Não assumir PASS por inspeção: evidências executáveis pertencem às etapas correspondentes.

## Blockers

Nenhum. Não foi consultada Build Spec nem escrito código de produção nesta etapa.

## Status

APPROVED — SYSTEM_DESIGNER. Arquitetura-base preservada, contratos primitivos, responsabilidades e composição implementáveis. Destino TDD_PLANNER.
