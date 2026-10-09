UI QA REPORT

Reference: TASK-20261009-161654
UI Spec: runtime/tasks/TASK-20261009-161654/specs/UI_SPEC.md
Checks:
- UI-01 PASS: título, display superior, quatro colunas e cinco linhas; células vazias sem controles.
- UI-02 FAIL: 17 botões presentes sem operações excluídas, mas controles de apoio exibem nomes acessíveis no lugar dos rótulos literais aprovados.
- UI-03 FAIL: rótulos dos quatro controles de apoio truncados. Display numérico observado comporta 15 dígitos, sinal, vírgula e científico, mas o critério global exige todos os rótulos legíveis.
- UI-04 PASS: execução real apresenta 0,, 1,, -0, resultado 5 e científico sem transformação indevida pela View.
- UI-05 PASS: mensagem integral e literal; CE/Backspace/±/+/= desabilitados; recuperação por dígito observada.
- UI-06 PARTIAL: ciclo de foco VCL real validado em 17 posições via CM_DIALOGKEY/VK_TAB e contorno visível. Captura inicial/pressionada ocorreu durante animação de apresentação do Windows; não aprovar estado pressionado a partir dessas imagens.
- UI-07 FAIL: C, CE, Backspace e ± não têm rótulos aprovados legíveis; + e = aparecem cinza sem destaque azul.
- UI-08 PARTIAL: harness exercitou View real em 144 DPI, verificando limites e ausência de sobreposição. Captura desktop da janela maior foi parcialmente limitada pela área visível da sessão; não afirmar ausência de corte visual integral.
- Inspeção estrutural PASS: View encaminha comandos e apresenta estado; não executa matemática/domínio.
Findings:
O render final usa aparência nativa TButton e Caption com nomes acessíveis; não apresenta LabelText nem Accent definidos em Calculator.MainForm. Evidência determinante é 10-error.bmp, capturada do desktop por BitBlt, após animação inicial, com tela inteira visível. Trata-se de execução do código de produção, não mock.
Evidence:
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/VisualQA.dpr
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/build.log (zero erros/warnings)
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/execution.log
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/10-error.bmp
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/12-scale150.bmp
runtime/tasks/TASK-20261009-161654/evidence/ui-qa/14-scale150-error.bmp
Capturas inspecionadas com view_image: 01, 02, 04, 10, 12 e 14. As primeiras contêm animação/transparência da janela; não usadas como prova de legibilidade final. Captura 10 confirma defeito independentemente.
Limitations:
Escala maior foi exercitada em instância real da View por ScaleForPPI, PixelsPerInch=144 e relayout; configuração global/monitor não foi alterada. Captura desktop maior excede área visível, limitando conclusão UI-08. Handoff posterior deve repetir inspeção visual após correção, garantindo janela inteiramente visível e captura após estabilização.
Result: FAIL

BLOCKER

ID: BLOCKER-UIQA-001
Raised By: UI_QA
Type: IMPLEMENTATION
Current Task: TASK-20261009-161654
Issue: Botões de apoio exibem nomes acessíveis truncados em lugar de C, CE, Backspace e ±; + e = não têm destaque azul aprovado.
Evidence: 10-error.bmp e 12-scale150.bmp de captura desktop real, UI_SPEC Controls e UI-02/UI-03/UI-07.
Why Cannot Proceed: Interface diverge de rótulos e contraste de controles aprovados. Gate UI_QA não pode aprovar.
Required Owner: PRODUCTION_DEVELOPER
Required Resolution: Corrigir renderização dos botões mantendo nomes acessíveis e contrato funcional; retornar pela revisão/QA aplicável e repetir UI_QA, incluindo foco, pressionamento e escala com captura integral estabilizada.
Status: OPEN

HANDOFF

From: UI_QA
To: PRODUCTION_DEVELOPER
Current Task: TASK-20261009-161654
Status: BLOCKED
Approved Artifacts: Nenhuma aprovação UI adicional.
Open Blockers: BLOCKER-UIQA-001
Evidence: Este relatório e evidence/ui-qa.
Next Responsibility: Resolver defeito de renderização dentro de autoridade de implementação. Não alterar UI_SPEC ou expectativas para acomodar defeito.
