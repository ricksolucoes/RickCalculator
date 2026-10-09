# STATUS REGISTRY CONTRACT

Arquivo:

```text
runtime/status/status.json
```

Campos obrigatórios:

```text
schema_version
task_id
original_request
task_status
current_stage
current_agent
current_gate
open_blockers
approved_artifacts
last_handoff
human_decision_required
build_specs_runtime_dependency
updated_at
```

Regras:

1. Flow Coordinator é o principal responsável por transições.
2. Agent especializado só registra resultado de sua responsabilidade.
3. `open_blockers` não pode ser ignorado.
4. Gate PASS com blocker aberto é inválido.
5. Registry referencia artefatos; não substitui Task Specs.
6. `build_specs_runtime_dependency` deve permanecer `false`.
