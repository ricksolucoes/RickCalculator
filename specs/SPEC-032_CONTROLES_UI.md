# SPEC-032 — CONTROLES UI

## 1. Identificação

```text
ID: SPEC-032
Título: CONTROLES UI
Status: COMPLETE
Tipo: Build Spec
```

## 2. Objetivo

Definir categorias de controles da View.

## 3. Problema que resolve

Sem inventário, a implementação pode adicionar controles desnecessários.

## 4. Justificativa de necessidade

A View deve refletir somente comandos autorizados.

## 5. Escopo

### IN SCOPE

- display
- dígitos
- separador
- igual
- operações autorizadas
- controles de edição quando previstos

### OUT OF SCOPE

- regra matemática
- eventos implementados

## 6. Entradas

- SPEC-031

## 7. Saídas

- inventário funcional de controles

## 8. Responsável

```text
Owner: Product Designer
Reviewer: Auditoria documental automática autorizada
Human escalation: somente quando houver blocker real não resolvível por fonte aprovada
```

## 9. Dependências

- `SPEC-031_ESTRUTURA_DA_TELA`

## 10. Regras

1. Cada controle dispara comando para Controller; não calcula.
2. Controles não autorizados pelo Product Brief não devem ganhar funcionalidade.
3. Display é somente apresentação.
4. C/CE/Backspace/± podem ser incorporados conforme escopo funcional aprovado mesmo que a referência inicial mostre somente o teclado base; Product Designer deve acomodá-los sem alterar regras.

## 11. Critérios de aceitação

- `AC-032-01` — Todo controle possui finalidade.
- `AC-032-02` — Nenhum controle contém domínio.
- `AC-032-03` — Escopo reduzido não habilita operação omitida.

## 12. Blockers

- UI CONTROL BLOCKER

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
Next: `SPEC-033_COMPORTAMENTO_VIEW`
```
