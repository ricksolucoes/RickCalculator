# Decisão técnica — BLOCKER-C01-BUILD-001

Task: TASK-20261009-161654 / C01
Owner: SYSTEM_DESIGNER
Status: APPROVED TECHNICAL DECISION; BLOCKER OPEN PENDING EXECUTION

## Evidência real

Lidos TEST_DEVELOPER_C01_BLOCKER.md, TDD_PLAN aprovado, projeto de testes e log C01-test-build-blocked.log. A falha MSB6002/MSB6003 ocorre antes da execução do compilador; não é RED funcional. Inspeção read-only dos targets da instalação configurada constatou:

- CodeGear.Delphi.Targets importa CodeGear.Common.Targets antes de montar os parâmetros de compilação.
- CodeGear.Common.Targets, linha 47, importa EnvOptions.proj somente se ImportEnvOptions for diferente de false.
- DelphiLibraryPath é anexado ao UnitSearchPath e a outros paths no Delphi.Targets, mesmo com DCC_UnitSearchPath explícito.
- EnvOptions.proj do usuário possui valores DelphiLibraryPath com mais de 12 mil caracteres; a repetição desse valor nos switches explica o limite de 32 mil caracteres do processo.
- O diretório RTL Win32/release da instalação configurada contém System.dcu.

## Decisão aprovada para execução

TEST_DEVELOPER deve alterar exclusivamente o PropertyGroup do seu validation/RickCalculatorTests/RickCalculatorTests.dproj, ANTES do Import de CodeGear.Delphi.Targets, acrescentando:

```xml
<ImportEnvOptions>false</ImportEnvOptions>
<DelphiLibraryPath>$(BDS)\lib\$(Platform)\release</DelphiLibraryPath>
```

Preservar DCC_UnitSearchPath relativo já definido, DCC_IncludePath, DCC_ResourcePath, DCC_ObjPath, namespaces necessários, Debug/Release e saídas bin/Temp. Isso desliga somente a importação das preferências globais do IDE nesse projeto, evitando componentes externos sem dependência funcional no produto. BDS permanece fornecido pelo script/config aprovado; usar RTL release também no build Debug é suportado por esse projeto sem dependência de DCUs de debug. Não alterar compilador, instalação, EnvOptions do usuário, scripts runtime, registro do Windows, políticas ou expected results. Não desativar warnings.

PRODUCTION_DEVELOPER fica autorizado a aplicar as mesmas duas propriedades no futuro RickCalculator.dproj no ciclo de criação da aplicação, evitando repetição do problema. Não criar esse projeto antecipadamente.

## Verificação e fechamento

TEST_DEVELOPER executa novamente o script aprovado e preserva log completo e ExitCode. Confirmar que dcc32 realmente foi iniciado e que os paths externos extensos não aparecem mais. Se a falha de comprimento desaparecer e surgir missing-unit real, a causa deste blocker estará tecnicamente removida; registrar RESOLUTION com essa evidência e abrir o blocker estrutural distinto previsto no TDD_PLAN para PRODUCTION_DEVELOPER. Não declarar baseline aprovada enquanto existirem erros ou warnings. Se o erro de comprimento persistir, manter este blocker OPEN e retornar a SYSTEM_DESIGNER com o novo log. Não classificar qualquer falha de build como RED funcional. Não alterar o teste congelado.

A decisão documental não é evidência de compilação bem-sucedida; este relatório mantém explicitamente o blocker OPEN até a execução pelo owner. Nenhuma implementação, projeto ou registry foi alterado nesta atuação.

HANDOFF

From: SYSTEM_DESIGNER
To: TEST_DEVELOPER via FLOW_COORDINATOR
Current Task: TASK-20261009-161654 / C01
Status: TECHNICAL DECISION APPROVED; EXECUTION REQUIRED
Approved Artifacts: runtime/tasks/TASK-20261009-161654/logs/SYSTEM_DESIGNER_C01_BUILD_DECISION.md
Open Blockers: BLOCKER-C01-BUILD-001, aberto somente até confirmação executável da remoção da causa.
Evidence: targets Delphi reais, condição ImportEnvOptions, metadados de tamanho DelphiLibraryPath e presença System.dcu; logs originais preservados.
Next Responsibility: TEST_DEVELOPER aplica configuração no próprio dproj, executa rebuild e registra resolução comprovada ou devolve novo diagnóstico ao owner. FLOW_COORDINATOR não avança para GREEN antes do fluxo de estrutura e RED exigido pelo TDD_PLAN.
