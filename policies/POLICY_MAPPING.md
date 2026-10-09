# POLICY MAPPING — RickCalculator

## Objetivo

Mapear quais Agents consomem quais Policies runtime.

As Policies não decidem produto. Elas fornecem invariantes técnicos compartilhados.

## Policies oficiais

### `DELPHI_CODING_STANDARD.md`

Consumidores:

- SYSTEM_DESIGNER
- PRODUCTION_DEVELOPER
- REFACTOR_SPECIALIST
- CODE_REVIEWER
- BUILD_RELEASE_VALIDATOR

Responsabilidade:

- naming;
- qualidade;
- zero warnings;
- UTF-8 BOM;
- Method Toxicity;
- regras gerais Delphi.

### `DELPHI_INTERFACE_PATTERN.md`

Consumidores:

- SYSTEM_DESIGNER
- PRODUCTION_DEVELOPER
- CODE_REVIEWER

Responsabilidade:

- interface naming;
- GUID;
- TInterfacedObject;
- private/protected/public;
- Create/Destroy/New;
- fluent interface pattern;
- regra de não criar interface artificial.

### `DELPHI_PROJECT_STRUCTURE.md`

Consumidores:

- SYSTEM_DESIGNER
- PRODUCTION_DEVELOPER
- TEST_DEVELOPER
- BUILD_RELEASE_VALIDATOR

Responsabilidade:

- layout físico do projeto;
- src/tests/Temp/bin/logs;
- separação entre fonte e artefatos.

## Regras

1. Agent consulta somente Policies necessárias à própria responsabilidade.
2. Policy não substitui Task Spec.
3. Policy não pode ampliar escopo.
4. Em conflito entre Task Spec aprovada e Policy, o Agent gera blocker; não reconcilia por conta própria.
5. Build Specs não são consultadas em runtime.

## Estado

```text
POLICY MAPPING: IMPLEMENTED
```
