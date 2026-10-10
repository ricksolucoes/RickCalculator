# 🧮 RickCalculator

**English** | [Português (Brasil)](readme_PTBr.md)

![Delphi](https://img.shields.io/badge/Delphi-10.x%2B-red?style=flat-square)
![Validated](https://img.shields.io/badge/validated-Delphi%2010.3%20%7C%2010.4%20%7C%2012-red?style=flat-square)
![Claude Code](https://img.shields.io/badge/Claude%20Code-supported-blueviolet?style=flat-square)
![OpenAI Codex](https://img.shields.io/badge/OpenAI%20Codex-supported-111111?style=flat-square)
![TDD](https://img.shields.io/badge/TDD-required-success?style=flat-square)
![Architecture](https://img.shields.io/badge/architecture-multi--agent-blue?style=flat-square)

## 📑 Table of Contents

- [🧭 Overview](#-overview)
- [🧠 What This Project Demonstrates](#-what-this-project-demonstrates)
- [🤖 Supported Platforms](#-supported-platforms)
- [🧩 Multi-Agent Architecture](#-multi-agent-architecture)
- [👥 Official Agents](#-official-agents)
- [🗂️ Project Structure](#️-project-structure)
- [⚙️ Environment Requirements](#️-environment-requirements)
- [🛠️ Delphi](#️-delphi)
- [💻 Visual Studio Code](#-visual-studio-code)
- [🟣 Installing Claude Code](#-installing-claude-code-in-visual-studio-code)
- [⚫ Installing OpenAI Codex](#-installing-openai-codex-in-visual-studio-code)
- [▶️ Quick Start](#️-quick-start)
- [💾 Runtime and State Persistence](#-runtime-and-state-persistence)
- [✅ Team Readiness](#-team-readiness)
- [🔄 New Tasks and Resuming Work](#-new-tasks-and-resuming-work)
- [🧱 Build Specs vs. Task Specs](#-build-specs-vs-task-specs)
- [🧪 TDD](#-tdd)
- [📌 Evidence](#-evidence)
- [🚧 Blockers](#-blockers)
- [📜 Scripts](#-scripts)
- [🔐 PowerShell Execution Policy](#-powershell-execution-policy)
- [📐 Agent Principles](#-agent-principles)
- [🖥️ Reference UI](#️-reference-ui)
- [🧭 Build Spec Number Ranges](#-build-spec-number-ranges)
- [🔀 Why Two Integrations?](#-why-two-integrations)
- [📚 Glossary](#-glossary)
- [📄 License](#-license)



## 🧭 Overview

**RickCalculator** is a practical demonstration of **Software Engineering, Prompt Engineering, and Autonomous Agent Engineering applied to Delphi development**.

The project coordinates a team of specialized agents across **Product Management, Requirements Analysis, Product Design, System Design, TDD, Development, Refactoring, Code Review, QA, Release Validation, and Product Acceptance** to turn a short request into a functional Delphi application that is tested, compiled, reviewed, and validated.

This is not simply an AI code-generation project.

RickCalculator combines these engineering disciplines in an agent-driven development workflow built around:

- specialized responsibilities;
- explicit contracts between agents;
- clear authority boundaries;
- TDD;
- traceability;
- handoffs;
- blockers;
- verifiable evidence;
- persistent runtime state;
- independent review;
- functional and UI QA;
- automated builds;
- release validation;
- final product acceptance.

The same architecture can run through:

- **Claude Code**, by Anthropic;
- **OpenAI Codex**, within the OpenAI / ChatGPT ecosystem.

A short request such as:

```text
Create a calculator that can add numbers.
```

or:

```text
Create a calculator.
```

is enough to start the workflow.

Any equivalent instruction that clearly expresses the intent to build a calculator can also be used.

The user does not need to select, invoke, or coordinate individual agents manually.



## 🧠 What This Project Demonstrates

RickCalculator brings together three complementary engineering disciplines.

### Software Engineering

The project applies engineering practices across the full development lifecycle:

- requirements analysis;
- separation of responsibilities;
- architecture;
- explicit contracts;
- TDD;
- refactoring;
- code review;
- QA;
- build automation;
- release validation;
- traceability from requirements to implementation and evidence.

### Prompt Engineering

Prompts in this project are not treated as isolated text instructions.

They are part of an operational architecture with:

- context definition;
- role-based authority;
- expected inputs and outputs;
- approval criteria;
- explicit prohibitions;
- handoff mechanisms;
- blocker rules;
- state persistence;
- separation between build-time instructions and runtime instructions.

### Autonomous Agent Engineering

The project defines a multi-agent team in which each agent has a specific responsibility, authority, and scope.

The user does not need to manually invoke specialists.

The runtime controls progression across agents and persists enough state to resume work after interruptions or across new sessions.

### Expected Outcome

The project can be summarized as:

```text
A SINGLE PROMPT
        ↓
MULTI-AGENT ORCHESTRATION
        ↓
PRODUCT + SOFTWARE ENGINEERING
        ↓
TDD + IMPLEMENTATION + REVIEW + QA
        ↓
BUILD + RELEASE VALIDATION
        ↓
VALIDATED DELPHI APPLICATION
```

RickCalculator is not intended to be a generic framework for arbitrary Delphi applications.

It was built as a concrete, auditable implementation of a specialized engineering team capable of producing the **RickCalculator** application.



## 🤖 Supported Platforms

### Claude Code

Claude Code uses:

```text
CLAUDE.md
```

as the platform-specific entry point for this project.

The file instructs Claude Code to:

- recognize the runtime;
- inspect persisted state;
- identify the agent responsible for the current stage;
- load the corresponding contract from `agents/`;
- respect Policies and Config;
- preserve blockers and handoffs;
- avoid bypassing the multi-agent workflow with a direct implementation.

Official documentation:

- Overview — Português (Brasil): https://code.claude.com/docs/pt/overview
- Overview — English: https://code.claude.com/docs/en/overview
- Official VS Code extension: https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code

### OpenAI Codex / ChatGPT

OpenAI Codex uses:

```text
AGENTS.md
```

as the operational repository entry point.

The file defines:

- the workflow entry point;
- official agents;
- execution order;
- Task Specs;
- Status Registry;
- Policies;
- Config;
- scripts;
- blocker handling;
- readiness criteria.

Codex detects `AGENTS.md` files in the repository and uses them as project instructions.

Official documentation:

- Codex: https://developers.openai.com/codex/
- Official VS Code extension: https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt

> In this document, **OpenAI Codex / ChatGPT** refers to OpenAI's coding agent running within the OpenAI / ChatGPT ecosystem.

### Platform Entry Files

| Platform | Entry file | Responsibility |
|---|---|---|
| Claude Code | `CLAUDE.md` | Claude Code-specific bootstrap and orchestration entry point |
| OpenAI Codex | `AGENTS.md` | Runtime entry point used by Codex |
| Both | `agents/*.md` | Specialized agent contracts |
| Both | `policies/*.md` | Shared technical rules |
| Both | `config/*` | Portable environment configuration |
| Both | `runtime/status/*` | Runtime status and readiness |
| Both | `runtime/tasks/<TASK-ID>/` | Task Specs, logs, and evidence |

The platform changes.

The engineering architecture does not.



## 🧩 Multi-Agent Architecture

Every new functional request enters through:

```text
FLOW_COORDINATOR
```

The official workflow is:

```text
User
  ↓
FLOW_COORDINATOR
  ↓
PRODUCT_MANAGER
  ↓
REQUIREMENTS_ANALYST
  ↓
PRODUCT_DESIGNER
  ↓
SYSTEM_DESIGNER
  ↓
TDD_PLANNER
  ↓
TEST_DEVELOPER
  ↓
PRODUCTION_DEVELOPER
  ↓
REFACTOR_SPECIALIST
  ↓
CODE_REVIEWER
  ↓
QA_FUNCTIONAL
  ↓
UI_QA
  ↓
BUILD_RELEASE_VALIDATOR
  ↓
PRODUCT_ACCEPTANCE
  ↓
FLOW_COORDINATOR
  ↓
TASK COMPLETE
```

The following cycle may repeat according to the `TDD_PLAN`:

```text
TEST_DEVELOPER
  ↓
PRODUCTION_DEVELOPER
  ↓
REFACTOR_SPECIALIST
```

`FLOW_COORDINATOR` does not make product or technical decisions.

Its responsibility is to coordinate:

- state transitions;
- gates;
- blockers;
- handoffs;
- resumption;
- task completion.



## 👥 Official Agents

The runtime contains **14 specialized agents**.

| Agent | Primary responsibility |
|---|---|
| `FLOW_COORDINATOR` | Coordinates states, gates, blockers, and handoffs |
| `PRODUCT_MANAGER` | Interprets the request as a product need |
| `REQUIREMENTS_ANALYST` | Produces verifiable requirements and acceptance criteria |
| `PRODUCT_DESIGNER` | Defines product experience and UI specification |
| `SYSTEM_DESIGNER` | Defines architecture and technical design |
| `TDD_PLANNER` | Plans TDD cycles |
| `TEST_DEVELOPER` | Implements and runs tests |
| `PRODUCTION_DEVELOPER` | Implements production code |
| `REFACTOR_SPECIALIST` | Refactors without changing validated behavior |
| `CODE_REVIEWER` | Performs independent technical review |
| `QA_FUNCTIONAL` | Validates functional behavior |
| `UI_QA` | Validates UI behavior and presentation |
| `BUILD_RELEASE_VALIDATOR` | Validates builds and release readiness |
| `PRODUCT_ACCEPTANCE` | Performs final product acceptance |

Agent contracts are stored in:

```text
agents/
```

Each file defines the agent's role, authority, inputs, outputs, blockers, and prohibited actions.



## 🗂️ Project Structure

```text
RickCalculator/
│
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── readme_PTBr.md
├── LICENSE
│
├── agents/
│   ├── FLOW_COORDINATOR.md
│   ├── PRODUCT_MANAGER.md
│   ├── REQUIREMENTS_ANALYST.md
│   ├── PRODUCT_DESIGNER.md
│   ├── SYSTEM_DESIGNER.md
│   ├── TDD_PLANNER.md
│   ├── TEST_DEVELOPER.md
│   ├── PRODUCTION_DEVELOPER.md
│   ├── REFACTOR_SPECIALIST.md
│   ├── CODE_REVIEWER.md
│   ├── QA_FUNCTIONAL.md
│   ├── UI_QA.md
│   ├── BUILD_RELEASE_VALIDATOR.md
│   └── PRODUCT_ACCEPTANCE.md
│
├── policies/
│   ├── DELPHI_CODING_STANDARD.md
│   ├── DELPHI_INTERFACE_PATTERN.md
│   ├── DELPHI_PROJECT_STRUCTURE.md
│   └── POLICY_MAPPING.md
│
├── config/
│   ├── delphi.env.cmd
│   └── RUNTIME_CONFIG_CONTRACT.md
│
├── scripts/
│   ├── env.cmd
│   ├── delphi-shell.cmd
│   ├── build-project.cmd
│   ├── runtime-init.ps1
│   ├── runtime-status.ps1
│   ├── runtime-set-stage.ps1
│   ├── runtime-blocker.ps1
│   ├── assert-zero-warnings.ps1
│   └── SCRIPT_CLASSIFICATION.md
│
├── runtime/
│   ├── PROMPT_ENTRY.md
│   ├── config/
│   │   └── runtime.json
│   ├── status/
│   │   ├── status.json
│   │   ├── team-readiness.json
│   │   └── README.md
│   └── tasks/
│       └── <TASK-ID>/
│           ├── specs/
│           ├── evidence/
│           └── logs/
│
└── specs/
    └── ...
```



## ⚙️ Environment Requirements

### Operating System

The runtime and Delphi project are designed to run on Windows.

Recommended:

```text
Windows 10
or
Windows 11
```



## 🛠️ Delphi

RickCalculator is designed for **Delphi 10.x and later**, using commercial editions compatible with the project's automated workflow.

### Compatibility

The runtime has been validated with:

| Version | BDS / Studio | Status |
|---|---:|---|
| Delphi 10.3 Rio | `20.0` | ✅ Validated |
| Delphi 10.4 Sydney | `21.0` | ✅ Validated |
| Delphi 12 Athens | `23.0` | ✅ Validated |

Other **Delphi 10.x or later** versions of Professional, Enterprise, and Architect are compatible with the project architecture as long as they provide the toolchain expected by the runtime.

> Not every compatible Delphi release has been validated individually. For a new environment, run the environment bootstrap, build, tests, and runtime validation before treating that setup as verified.

### Supported Editions

| Edition | RickCalculator support |
|---|---|
| Delphi Professional | ✅ Supported |
| Delphi Enterprise | ✅ Supported |
| Delphi Architect | ✅ Supported |
| Delphi Community Edition | ❌ Not supported |

**Delphi Community Edition is outside the support matrix for this project.** The runtime relies on automated builds and command-line access to the Delphi toolchain, and RickCalculator was designed and validated around that workflow using supported commercial editions.

Embarcadero distinguishes Community Edition from its commercial editions and documents command-line compiler usage and build-server scenarios among the capabilities associated with Professional and higher editions.

### Default Configuration

The repository is configured by default for:

```text
Delphi 10.3 Rio
BDS 20.0
```

Central configuration is stored in:

```text
config/delphi.env.cmd
```

Default installation path:

```text
C:\Program Files (x86)\Embarcadero\Studio\20.0
```

### Using a Different Delphi Installation

There are two supported approaches.

#### Option 1 — Temporary Path Override

To use another Delphi installation without changing project scripts, define `RickCalculator_DELPHI_HOME` before starting the runtime.

Delphi 10.4 Sydney example:

```bat
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\21.0"
```

Delphi 12 Athens example:

```bat
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\23.0"
```

Then load the environment:

```bat
scripts\env.cmd
```

The script should locate, among other tools:

```text
rsvars.bat
dcc32.exe
msbuild.exe
```

#### Option 2 — Change the Project Default

To make another Delphi version the default for the workspace, edit:

```text
config/delphi.env.cmd
```

Update the values for the target installation.

Delphi 10.4 Sydney:

```bat
set "RickCalculator_DELPHI_VERSION=21.0"
set "RickCalculator_DELPHI_PRODUCT=Delphi 10.4 Sydney"
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\21.0"
```

Delphi 12 Athens:

```bat
set "RickCalculator_DELPHI_VERSION=23.0"
set "RickCalculator_DELPHI_PRODUCT=Delphi 12 Athens"
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\23.0"
```

If the environment-detection logic still relies on the BDS version, update the corresponding `Studio\<version>` path validation as well.

After switching Delphi versions, validate the environment with:

```bat
scripts\env.cmd
```

and confirm that the runtime can locate the expected toolchain before starting a real task.



## 💻 Visual Studio Code

Open the project using the **RickCalculator repository root**.

Do not open individual files in isolation.

From Visual Studio Code:

```text
File
→ Open Folder...
→ RickCalculator
```

Or from a terminal:

```bat
cd D:\Projects\RickCalculator
code .
```

The workspace root should contain, among other files:

```text
RickCalculator/
├── AGENTS.md
├── CLAUDE.md
├── agents/
├── policies/
├── config/
├── runtime/
└── scripts/
```

This is important because Claude Code and OpenAI Codex need access to the repository-level instruction files and runtime artifacts.



## 🟣 Installing Claude Code in Visual Studio Code

### 1. Open Extensions

In Visual Studio Code:

```text
Ctrl + Shift + X
```

### 2. Install the Official Extension

Search for:

```text
Claude Code
```

Install:

```text
Claude Code for VS Code
```

Verify the publisher:

```text
Anthropic
```

Official Visual Studio Marketplace extension ID:

```text
anthropic.claude-code
```

Marketplace:

https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code

Avoid third-party extensions with similar names if you want to reproduce the environment documented by this repository.

### 3. Open Claude Code

After installation:

```text
Ctrl + Shift + P
```

Search for:

```text
Claude Code
```

and select the command that opens Claude Code in a new tab.

### 4. Sign In

On first use, complete the authentication flow presented by Claude Code.

Claude Code can be used with a compatible Claude subscription or Anthropic Console account, depending on the authentication options currently provided by Anthropic.

### 5. Open the RickCalculator Root

```bat
cd D:\Projects\RickCalculator
code .
```

Confirm that the workspace contains:

```text
RickCalculator/
├── CLAUDE.md
├── agents/
├── policies/
├── config/
├── runtime/
└── scripts/
```

`CLAUDE.md` must remain in the repository root.

It provides the Claude Code-specific project entry instructions.

### 6. Start a Task

Open a new Claude Code session and send only the functional request.

Examples:

```text
Create a calculator that can add numbers.
```

or:

```text
Create a calculator.
```

Any equivalent request that clearly expresses the intent to build a calculator can also be used.

You do not need to invoke the agents manually:

```text
FLOW_COORDINATOR
PRODUCT_MANAGER
SYSTEM_DESIGNER
TDD_PLANNER
...
```

The runtime detects the request intent and coordinates the agent workflow automatically.

Expected flow:

```text
User prompt
        ↓
CLAUDE.md
        ↓
FLOW_COORDINATOR
        ↓
PRODUCT_MANAGER
        ↓
...
        ↓
PRODUCT_ACCEPTANCE
        ↓
TASK COMPLETE
```

### Official Claude Code Documentation

Português (Brasil):

https://code.claude.com/docs/pt/overview

English:

https://code.claude.com/docs/en/overview

Official Visual Studio Code extension:

https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code



## ⚫ Installing OpenAI Codex in Visual Studio Code

### 1. Open Extensions

In Visual Studio Code:

```text
Ctrl + Shift + X
```

### 2. Install the Official Extension

Search for:

```text
Codex
```

Install:

```text
Codex – OpenAI's coding agent
```

Verify the publisher:

```text
OpenAI
```

Marketplace:

https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt

Avoid third-party extensions with similar names.

### 3. Sign In

Open the Codex panel and sign in using the authentication flow provided by the official extension.

### 4. Open the RickCalculator Root

Confirm that the workspace contains:

```text
AGENTS.md
agents/
policies/
config/
runtime/
scripts/
```

`AGENTS.md` is already included in the project.

Do not generate or replace it with another instruction file.

### 5. Start a Task

Send a functional request such as:

```text
Create a calculator that can add numbers.
```

or:

```text
Create a calculator.
```

Any equivalent request that clearly expresses the intent to build a calculator can also be used.

Expected flow:

```text
User prompt
        ↓
AGENTS.md
        ↓
FLOW_COORDINATOR
        ↓
PRODUCT_MANAGER
        ↓
...
        ↓
PRODUCT_ACCEPTANCE
        ↓
TASK COMPLETE
```



## ▶️ Quick Start

### Claude Code

```text
1. Install Visual Studio Code.
2. Install Anthropic's official Claude Code extension.
3. Open the RickCalculator repository root.
4. Sign in.
5. Open a Claude Code session.
6. Send a short request, for example:

   Create a calculator.

   or

   Create a calculator that can add numbers.

   Any equivalent request that clearly refers to building a calculator can also be used.

7. Follow the runtime, logs, and generated evidence.
```

### OpenAI Codex

```text
1. Install Visual Studio Code.
2. Install "Codex – OpenAI's coding agent" by OpenAI.
3. Open the RickCalculator repository root.
4. Sign in.
5. Open a Codex session.
6. Send a short request, for example:

   Create a calculator.

   or

   Create a calculator that can add numbers.

   Any equivalent request that clearly refers to building a calculator can also be used.

7. Follow the runtime, logs, and generated evidence.
```



## 💾 Runtime and State Persistence

Operational state is persisted in:

```text
runtime/status/status.json
```

The file can track values such as:

```text
task_id
task_status
current_stage
current_agent
current_gate
open_blockers
approved_artifacts
last_handoff
```

The goal is to avoid relying solely on model conversation history.

When a session is closed or later resumed, the runtime can inspect the persisted state and determine where execution should continue.



## ✅ Team Readiness

System readiness is recorded in:

```text
runtime/status/team-readiness.json
```

The real functional prompt may only run when the runtime reports:

```text
TEAM READY: YES
```

Conceptually:

```text
TEAM READY: NO
→ real functional prompt is not yet authorized

TEAM READY: YES
→ runtime is authorized to accept the functional request
```

The persisted runtime status is the source of truth. The README does not override that state.



## 🔄 New Tasks and Resuming Work

### New Task

A new request follows this flow:

```text
user request
↓
runtime bootstrap
↓
runtime/status/status.json
↓
FLOW_COORDINATOR
↓
PRODUCT_MANAGER
```

Bootstrap mechanisms are stored under:

```text
scripts/
```

### Resume

When an active task exists, the runtime must inspect:

```text
runtime/status/status.json
```

and continue from the recorded stage.

Conceptually:

```text
existing status
↓
FLOW_COORDINATOR
↓
current_stage
↓
current_agent
```

An active task must not be silently restarted from the beginning.



## 🧱 Build Specs vs. Task Specs

The project explicitly separates two classes of specification.

```text
BUILD SPECS
→ build the Agent system

TASK SPECS
→ are produced by Agents during a real task
```

### Build Specs

Build Specs define how the team and runtime are constructed:

- known product scope;
- normative UI;
- Delphi engineering rules;
- processes;
- Agent contracts;
- communication;
- artifacts;
- runtime structure;
- readiness criteria.

Once the Agent system has been built, Build Specs are no longer runtime dependencies for the final task.

During runtime:

```text
DO NOT CONSULT BUILD SPECS
```

### Task Specs

Task Specs are created during real task execution.

Standard artifacts include:

```text
PRODUCT_BRIEF
REQUIREMENTS
ACCEPTANCE_CRITERIA
UI_SPEC
SYSTEM_DESIGN
TDD_PLAN
```

Each Task Spec belongs to the agent responsible for producing it.

They act as contracts between workflow stages.



## 🧪 TDD

The development flow applies:

```text
TDD_PLANNER
↓
TEST_DEVELOPER
↓
PRODUCTION_DEVELOPER
↓
REFACTOR_SPECIALIST
```

Each cycle can produce separate evidence for:

```text
RED
GREEN
REFACTOR
```

The intent is to prevent the model from merely claiming that TDD was performed.

The runtime is structured to capture real evidence from tests, execution, and builds.



## 📌 Evidence

Each task can maintain:

```text
runtime/tasks/<TASK-ID>/
├── specs/
├── evidence/
└── logs/
```

Evidence may include:

- build results;
- test execution;
- RED / GREEN / REFACTOR cycles;
- regression testing;
- Code Review reports;
- functional QA;
- UI QA;
- visual validation screenshots;
- release validation;
- blockers;
- handoffs.

A model-generated statement does not replace evidence required by the process.



## 🚧 Blockers

No agent may:

- move forward while a blocker is open;
- take over another agent's responsibility;
- invent a decision merely to keep the workflow moving;
- declare success without evidence;
- skip directly to release.

Conceptually:

```text
Agent
↓
detects an issue
↓
registers a blocker
↓
runtime/status/status.json
↓
workflow stops
↓
responsible owner resolves it
↓
evidence is recorded
↓
workflow returns to the correct stage
```



## 📜 Scripts

Project scripts are technical mechanisms.

They may:

- prepare the environment;
- locate Delphi;
- run builds;
- read or update runtime state;
- register blockers;
- validate warnings;
- initialize the runtime.

Scripts may not make decisions that belong to agents.

They must not:

- decide requirements;
- choose UI behavior;
- define architecture;
- change the expected result;
- select the next agent based on product logic;
- approve QA;
- approve a release.



## 🔐 PowerShell Execution Policy

Part of the runtime uses PowerShell scripts.

If Windows policy prevents `.ps1` files from running, that condition must be treated as a real environment restriction.

The agent must not:

- silently change machine security policy;
- hide the problem;
- claim that bootstrap completed when it did not;
- continue while a blocker remains open.

Any resolution must respect the permissions and security policies of the target machine.



## 📐 Agent Principles

Agents follow principles such as:

- do not assume;
- do not invent requirements;
- do not expand scope for convenience;
- respect ownership;
- route problems to the appropriate specialist;
- escalate to a human when a required decision cannot be established;
- preserve traceability;
- perform real TDD;
- perform real builds;
- run real tests;
- require zero errors;
- require zero warnings when defined by Policy;
- validate releases;
- keep mathematical logic out of the View;
- preserve compatibility with the configured Delphi version.



## 🖥️ Reference UI

```text
┌───────────────────────────────┐
│          CALCULATOR           │
├───────────────────────────────┤
│                               │
│                     125.00    │
│                               │
├───────┬───────┬───────┬───────┤
│   7   │   8   │   9   │   /   │
├───────┼───────┼───────┼───────┤
│   4   │   5   │   6   │   ×   │
├───────┼───────┼───────┼───────┤
│   1   │   2   │   3   │   -   │
├───────┼───────┼───────┼───────┤
│   0   │   .   │   =   │   +   │
└───────┴───────┴───────┴───────┘
```

The reference is applied by the Product and UI agents according to the approved Specs.



## 🧭 Build Spec Number Ranges

The numeric ranges are intentional and act as namespaces by category.

| Range | Category | Purpose |
|---|---|---|
| `000–005` | Governance | Creation, approval, blockers, handoffs, no-assumption rules, and Task Specs |
| `010–020` | Product | Product definition, user language, and functional rules |
| `030–034` | UI | Visual reference, structure, controls, and View behavior |
| `040–046` | Delphi Engineering | Structure, naming, interfaces, quality, toxicity, build, and architecture |
| `050–060` | Team Process | PM, Requirements, Design, TDD, QA, Release, and Acceptance |
| `100–113` | Agent Contracts | Defines each agent before its physical implementation |
| `120–127` | System Composition | Defines `AGENTS.md`, Policies, Config, Scripts, runtime, status, prompt entry, and readiness |

### Intentional Numbering Gaps

The gaps are deliberate.

```text
SPEC-060
↓
SPEC-100
```

does not mean that:

```text
SPEC-061 ... SPEC-099
```

are missing.

The range change indicates a category change.

The range:

```text
100–113
```

is reserved for Agent contracts.

These Specs are not the physical Agent files themselves.

Example:

```text
SPEC-104_SYSTEM_DESIGNER_AGENT
        ↓
defines contract, authority,
inputs, outputs, blockers,
and prohibited actions
        ↓
agents/SYSTEM_DESIGNER.md
```

Summary:

```text
000–005   HOW THE PROJECT IS GOVERNED
010–020   WHAT THE PRODUCT IS
030–034   WHAT THE UI LOOKS LIKE
040–046   HOW DELPHI CODE MUST BE ENGINEERED
050–060   HOW THE TEAM OPERATES
100–113   WHO THE SPECIALISTS ARE
120–127   HOW THE TEAM IS ASSEMBLED AND EXECUTED
```



## 🔀 Why Two Integrations?

Claude Code and OpenAI Codex use different mechanisms to load repository-level instructions.

That is why the repository contains:

```text
CLAUDE.md
```

and:

```text
AGENTS.md
```

These files do not represent two separate architectures.

They are platform-specific entry adapters for the same engineering system.

The shared layer remains:

```text
agents/
policies/
config/
runtime/
scripts/
```

The goal is not to duplicate logic for each model.

The goal is to preserve the same engineering process regardless of which coding agent is used.



## 📚 Glossary

| Term | Definition |
|---|---|
| **Agent** | A specialized runtime unit with defined responsibilities, authority, inputs, outputs, and boundaries. |
| **Multi-Agent** | An architecture in which multiple agents collaborate on distinct stages of the same task. |
| **Flow Coordinator** | The agent responsible for coordinating states, gates, blockers, handoffs, and workflow progression. |
| **Handoff** | A formal transfer of responsibility or context between workflow stages. |
| **Blocker** | A condition that prevents workflow progression until it is resolved and recorded. |
| **Gate** | A mandatory criterion that must be satisfied before the workflow can move forward. |
| **Runtime** | The operational layer responsible for executing the task, maintaining state, and coordinating workflow. |
| **Status Registry** | Persistent execution state stored in `runtime/status/status.json`. |
| **Build Specs** | Specifications used to build, organize, and audit the Agent system. They are not runtime dependencies for the final task. |
| **Task Specs** | Specifications produced by Agents during a real task, such as `REQUIREMENTS`, `SYSTEM_DESIGN`, and `TDD_PLAN`. |
| **Prompt Engineering** | The discipline of designing context, constraints, responsibilities, inputs, outputs, and interaction rules for agents. |
| **Autonomous Agent Engineering** | The engineering discipline concerned with designing agents that can perform specialized work, collaborate, maintain state, and respect authority boundaries. |
| **TDD** | Test-Driven Development. A development process driven by RED, GREEN, and REFACTOR cycles. |
| **RED** | The TDD stage in which a valid test fails before the feature is implemented. |
| **GREEN** | The stage in which the required implementation makes the test pass. |
| **REFACTOR** | The stage in which code is improved without changing validated behavior. |
| **Code Review** | Independent technical review of an implementation before final validation. |
| **QA** | Quality Assurance. Validation of product quality and expected behavior. |
| **UI QA** | Validation focused specifically on UI behavior and presentation. |
| **Release Validation** | Verification of build, tests, warnings, artifacts, and release conditions. |
| **Product Acceptance** | Final verification of the product against approved requirements and acceptance criteria. |
| **Policy** | A shared technical rule applied across Agents, such as Delphi coding standards, architecture, and quality requirements. |
| **Evidence** | A verifiable artifact generated by the process, such as a test result, build result, log, or validation output. |
| **No-Assumption Rule** | A rule that prevents Agents from filling gaps through speculation when no evidence or authorized decision exists. |
| **Zero Warning** | A quality requirement that mandates warning-free builds when required by project Policies. |
| **Method Toxicity Metrics** | Criteria used to identify methods that are excessively complex, too large, or responsible for too many concerns. |
| **BDS** | Internal RAD Studio / Delphi version identifier, such as `20.0` for Delphi 10.3 Rio. |
| **dcc32** | Delphi Win32 compiler used in command-line automation. |
| **MSBuild** | The build engine used by RAD Studio to build Delphi projects and project groups. |
| **rsvars.bat** | Embarcadero script that initializes environment variables required by the Delphi toolchain. |



## 📄 License

This project is distributed under the **MIT License**.

The full license text is available in:

```text
LICENSE
```

at the repository root.
