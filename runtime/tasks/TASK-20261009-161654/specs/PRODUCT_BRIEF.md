# PRODUCT BRIEF

Original Request: Crie a calculadora de somar.

Product: RickCalculator.

Requested Scope: Calculadora de escopo reduzido para entrada de números, execução de soma e apresentação do resultado, com os recursos de apoio do catálogo funcional aplicáveis a essa operação.

Explicit Exclusions: Subtração, multiplicação e divisão. Funções fora do catálogo operacional não estão autorizadas.

Functional Operations: Soma como única operação matemática. Capacidades de apoio do catálogo: entrada numérica, =, C, CE, Backspace, ±, estado de resultado, estado de erro e formatação aprovada. O detalhamento funcional dessas capacidades cabe a REQUIREMENTS e ACCEPTANCE_CRITERIA, sem ampliar as operações matemáticas.

Known Constraints: Preservar o pedido original e o escopo reduzido. Usar somente fontes runtime autorizadas e não consultar Build Specs. Não antecipar UI, arquitetura, implementação ou testes.

Open Product Questions: Nenhuma. A seleção da operação está expressamente resolvida no contrato PRODUCT_MANAGER.

Decision Evidence: runtime/status/status.json preserva o pedido original da tarefa TASK-20261009-161654. agents/PRODUCT_MANAGER.md determina expressamente que esse pedido seleciona Soma e não autoriza adicionar Subtração, Multiplicação ou Divisão; o mesmo contrato fornece o catálogo operacional de apoio.

Status: APPROVED
