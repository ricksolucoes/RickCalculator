# SPEC-042 — INTERFACES DELPHI

## 1. Identificação

```text
ID: SPEC-042
Título: INTERFACES DELPHI
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Fixar padrão obrigatório de criação e implementação de interfaces.

## 3. Problema que resolve

Interfaces podem ser implementadas de forma incompatível com as regras do projeto.

## 4. Justificativa de necessidade

O System Designer e Developers devem compartilhar o mesmo contrato.

## 5. Escopo

### IN SCOPE

- GUID
- TInterfacedObject
- seções
- fluent
- Build
- New/Create/Destroy

### OUT OF SCOPE

- decidir onde uma interface é necessária; isso pertence à arquitetura

## 6. Entradas

- SPEC-041

## 7. Saídas

- interface pattern normativo

## 8. Responsável

```text
Owner: System Designer / Code Reviewer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-041_NAMING_DELPHI`

## 10. Regras

1. Interface usa I + PascalCase e GUID real único.
2. Classe concreta usa TInterfacedObject.
3. Ordem obrigatória da classe: private, protected, public; private permanece mesmo vazio.
4. Métodos de interface ficam em protected; usar comentário {Metodos da Interfaces} quando houver.
5. constructor Create fica em protected.
6. destructor Destroy; override fica em public.
7. Criação pública ocorre por class function New retornando a interface; implementação Result := Self.Create.
8. Métodos de ação/configuração de interface retornam a própria interface; implementação termina Result := Self.
9. Resultado primitivo final pode usar Build; não inventar retorno não permitido para contornar arquitetura.

## 11. Critérios de aceitação

- `AC-042-01` — Padrão estrutural completo.
- `AC-042-02` — Nenhum New retorna classe concreta.
- `AC-042-03` — GUID é real.

## 12. Blockers

- INTERFACE PATTERN BLOCKER

## 14. Evidências documentais

```text
Documento criado
Estrutura mínima conferida
Dependências declaradas
Escopo e fora de escopo declarados
Regras e critérios de aceitação presentes
Auditoria documental: PASS
```

## 15. Checklist

```text
[x] Objetivo definido
[x] Problema definido
[x] Necessidade comprovada
[x] Escopo fechado
[x] Fora de escopo fechado
[x] Entradas definidas
[x] Saídas definidas
[x] Responsável definido
[x] Dependências definidas
[x] Regras definidas
[x] Critérios de aceitação definidos
[x] Blockers avaliados
[x] Nenhuma decisão depende de suposição não registrada
[x] Auditoria documental concluída
```

## 16. Gate

```text
Status: COMPLETE
Acceptance: PASS
Open Blockers: 0
Decision: ADVANCE
Next: `SPEC-043_QUALIDADE_CODIGO`
```
