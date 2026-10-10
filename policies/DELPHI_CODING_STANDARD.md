# POLÍTICA — PADRÃO DE CÓDIGO DELPHI

## 1. ESCOPO

Esta política é obrigatória para todo código Delphi criado, alterado, testado ou validado pelo RickCalculator.

Nenhum agente pode flexibilizar silenciosamente estas regras.

---

## 2. ZERO WARNINGS — REGRA ABSOLUTA DO WORKSPACE

Todo build Delphi aceito pelo RickCalculator deve terminar com:

```text
Errors = 0
Warnings = 0
```

Um build com `ExitCode = 0` e qualquer warning NÃO é considerado aprovado.

Regras obrigatórias:

- warning não é informativo: é falha de qualidade;
- nenhum agente pode retornar `PASS` mantendo warning conhecido;
- warnings novos ou preexistentes no escopo compilado devem ser tratados antes do `PASS`;
- é proibido desabilitar warning apenas para obter `PASS`, salvo exigência técnica objetiva, documentada e previamente aprovada;
- é proibido mascarar warning em log, filtrar sua saída ou ignorá-lo;
- cada build validado deve registrar a contagem real de warnings;
- se a ferramenta não fornecer contagem estruturada, o log deve ser inspecionado por indicadores reais de warning do compilador/MSBuild;
- quando houver warning, o resultado da etapa é `FAIL`, `TECHNICAL BLOCKER` ou equivalente do agente, nunca `PASS`.

Esta regra vale para:

```text
Debug
Release
projetos de validação
projetos de testes
aplicações
bibliotecas
packages
```

---

## 3. VARIÁVEIS LOCAIS

Toda variável local deve começar obrigatoriamente com `L`, seguido do nome em `PascalCase`.

Correto:

```pascal
var
  LCliente: TCliente;
  LTotalPedido: Currency;
  LQuantidadeItens: Integer;
  LDataEmissao: TDateTime;
```

Incorreto:

```pascal
var
  Cliente: TCliente;
  vCliente: TCliente;
  lCliente: TCliente;
  strNome: string;
  intCodigo: Integer;
  _Cliente: TCliente;
```

O prefixo `L` identifica explicitamente variável pertencente ao escopo local de método/função/bloco.

---

## 4. CAMPOS PRIVADOS

Todo campo privado deve começar obrigatoriamente com `F`, seguido do nome em `PascalCase`.

```pascal
private
  FCliente: TCliente;
  FNome: string;
  FValorTotal: Currency;
```

---

## 5. PARÂMETROS

Todo parâmetro deve começar obrigatoriamente com `A`, seguido do nome em `PascalCase`.

```pascal
procedure AtualizarCliente(const ACliente: TCliente; const AUsuario: string);
```

---

## 6. CONSTANTES DELPHI

Toda constante deve:

- estar em `CAIXA ALTA`;
- começar com `_`;
- terminar com `_`;
- separar palavras compostas com `_`.

```pascal
const
  _NOME_ = 'Sistema';
  _VALOR_MAXIMO_ = 100;
  _TEMPO_ESPERA_ = 5000;
```

Essa regra é exclusiva para constantes Delphi.

---

## 7. ENUMERAÇÕES

Toda enumeração deve ser utilizada exclusivamente com:

```pascal
{$SCOPEDENUMS ON}
```

Declaração:

```pascal
type
  TStatusPedido = (Pendente, Aprovado, Cancelado);
```

Uso obrigatório com qualificação:

```pascal
LStatus := TStatusPedido.Pendente;

if LStatus = TStatusPedido.Aprovado then
  ...
```

É proibido criar prefixos artificiais nos membros da enumeração, como:

```text
spPendente
coAdd
cmClear
```

Use o tipo como namespace:

```text
TStatusPedido.Pendente
TRickCalculatorOperation.Add
TRickCalculatorCommand.Clear
```

---

## 8. TOXICITY METRICS DO DELPHI

Limites máximos normativos:

```text
Function Length        <= 20
Parameter Count        <= 6
If Depth               <= 5
Cyclomatic Complexity  <= 6
```

Esses valores são limites máximos, não metas.

Nenhuma implementação pode receber `PASS` excedendo esses thresholds. A ação padrão é refatorar preservando o comportamento.

---

## 9. CODIFICAÇÃO DOS FONTES

Todo arquivo Delphi textual criado ou alterado deve usar UTF-8 com BOM.

Aplica-se a:

```text
*.pas
*.dpr
*.dfm textual
```

Assinatura física esperada:

```text
EF BB BF
```

Arquivos `.dproj` devem permanecer XML válido e respeitar sua declaração XML.

---

## 10. PRINCÍPIOS DE QUALIDADE

Aplicar quando pertinentes:

- Clean Code;
- SOLID;
- responsabilidade única;
- baixo acoplamento;
- alta coesão;
- código morto proibido;
- tratamento explícito de erros;
- nomes que expressem intenção;
- abstrações somente quando houver benefício concreto;
- evitar overengineering.

---

## 11. VIEW

A View é responsável por apresentação e interação.

É proibido implementar regra de negócio diretamente em eventos de Form, Frame ou componentes visuais.

A View deve delegar operações à abstração adequada definida pela arquitetura.

---

## 12. REGRA RESUMIDA

```text
Build aprovado   -> Errors = 0 e Warnings = 0
Variável local   -> L + PascalCase
Campo privado    -> F + PascalCase
Parâmetro        -> A + PascalCase
Constante        -> _CAIXA_ALTA_
Enum             -> {$SCOPEDENUMS ON}
Membro de enum   -> TTipoEnum.Valor
```
