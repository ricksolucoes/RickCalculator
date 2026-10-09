# POLÍTICA — CRIAÇÃO E IMPLEMENTAÇÃO DE INTERFACES DELPHI

## 1. ESCOPO E OBJETIVO

Esta política define o padrão obrigatório de interfaces Delphi no RickCalculator.

Quando uma responsabilidade possuir contrato próprio, a regra deve ser aplicada de forma consistente em todo o projeto. Não crie interface artificial para Form, DTO/record simples ou classe puramente interna sem abstração real.

---

## 2. NOMENCLATURA DA INTERFACE

Toda interface deve começar obrigatoriamente com `I`, seguido do nome em `PascalCase`.

Correto:

```text
IPadrao
ICliente
IPedido
IClienteService
IClienteRepository
IConnection
```

Incorreto:

```text
iPadrao
cliente
TClienteInterface
IntCliente
```

---

## 3. NOMENCLATURA DA IMPLEMENTAÇÃO

A classe concreta deve começar com `T`, seguido do nome em `PascalCase`.

```text
IPadrao -> TPadrao
IClienteController -> TClienteController
```

---

## 4. DECLARAÇÃO DA INTERFACE

Toda interface deve possuir GUID válido, real e único.

```pascal
type
  IPadrao = interface
    ['{GUID_VALIDO_E_UNICO}']
  end;
```

É proibido reutilizar GUID ou usar placeholder em implementação final.

---

## 5. PROCEDURE EM INTERFACE — PROIBIDO

Métodos pertencentes ao contrato da interface não devem ser declarados como `procedure`.

Métodos de configuração, ação, preparação, composição, alteração de estado ou execução intermediária devem ser `function` e retornar a própria interface.

```pascal
type
  IPadrao = interface
    ['{GUID_VALIDO_E_UNICO}']
    function Configurar(const AValor: Integer): IPadrao;
    function Executar: IPadrao;
  end;
```

---

## 6. FLUENT INTERFACE OBRIGATÓRIA PARA AÇÕES DO CONTRATO

Métodos intermediários do contrato retornam exatamente a interface implementada.

```pascal
function Valor(const AValor: Integer): IPadrao;
function Nome(const ANome: string): IPadrao;
function Executar: IPadrao;
```

A implementação deve finalizar com:

```pascal
Result := Self;
```

Não retornar classe concreta.

---

## 7. RESULTADO FINAL POR BUILD

Quando o fluxo precisar expor o resultado final da operação, esse resultado deve ser obtido por `Build`.

O retorno deve ser um tipo primitivo apropriado ao contrato.

Exemplos:

```pascal
function Build: string;
function Build: Integer;
function Build: Int64;
function Build: Boolean;
function Build: Double;
function Build: Currency;
```

É proibido fazer método intermediário devolver diretamente o resultado final de negócio quando o contrato exige fluxo com `Build`.

Evitar:

```pascal
function Calcular: Currency;
```

Utilizar:

```pascal
function Calcular: ICalculadora;
function Build: Currency;
```

Se a arquitetura aparentemente exigir que `Build` devolva record, objeto, classe, interface ou outro tipo não primitivo, o agente NÃO deve inventar exceção: deve interromper e devolver blocker para revisão arquitetural.

---

## 8. IMPLEMENTAÇÃO COM TINTERFACEDOBJECT

Padrão obrigatório:

```pascal
type
  TPadrao = class(TInterfacedObject, IPadrao)
  private

  protected
    {Metodos da Interfaces}
    constructor Create;
  public
    destructor Destroy; override;
    class function New: IPadrao;
  end;
```

A ordem obrigatória das seções é:

```text
private
protected
public
```

Mesmo quando `private` estiver vazia, ela deve ser mantida.

---

## 9. CAMPOS PRIVADOS

Campos internos ficam em `private` e começam obrigatoriamente com `F` + `PascalCase`.

```pascal
private
  FValor: Integer;
  FNome: string;
  FResultado: Currency;
```

---

## 10. MÉTODOS DA INTERFACE EM PROTECTED

Todos os métodos concretos que implementam o contrato devem ficar em `protected`.

Utilize o comentário:

```pascal
{Metodos da Interfaces}
```

Exemplo:

```pascal
protected
  {Metodos da Interfaces}
  function Valor(const AValor: Integer): IPadrao;
  function Executar: IPadrao;
  function Build: Integer;

  constructor Create;
```

Não redeclare esses métodos em `public`.

---

## 11. CONSTRUCTOR CREATE

`constructor Create` deve ficar obrigatoriamente em `protected`.

```pascal
constructor TPadrao.Create;
begin
  inherited Create;
end;
```

---

## 12. DESTRUCTOR DESTROY

`destructor Destroy` deve ficar em `public` e ser `override`.

```pascal
destructor TPadrao.Destroy;
begin
  inherited;
end;
```

---

## 13. CRIAÇÃO PÚBLICA POR NEW

A criação externa ocorre exclusivamente por:

```pascal
class function New: IPadrao;
```

Implementação:

```pascal
class function TPadrao.New: IPadrao;
begin
  Result := Self.Create;
end;
```

`New` sempre retorna a interface, nunca a classe concreta.

---

## 14. CONSUMIDOR DEPENDE DA ABSTRAÇÃO

Correto:

```pascal
var
  LPadrao: IPadrao;
begin
  LPadrao := TPadrao.New;
end;
```

Incorreto:

```pascal
var
  LPadrao: TPadrao;
begin
  LPadrao := TPadrao.Create;
end;
```

---

## 15. PARÂMETROS, VARIÁVEIS, CAMPOS, CONSTANTES E ENUMS

Todo código de interface e implementação também deve obedecer a `DELPHI_CODING_STANDARD.md`:

```text
Parâmetro       -> A + PascalCase
Variável local  -> L + PascalCase
Campo privado   -> F + PascalCase
Constante       -> _CAIXA_ALTA_
Enum            -> {$SCOPEDENUMS ON}
Membro do enum  -> TTipoEnum.Valor
```

---

## 16. EXEMPLO CONSOLIDADO

```pascal
type
  IPadrao = interface
    ['{GUID_VALIDO_E_UNICO}']
    function Valor(const AValor: Integer): IPadrao;
    function Executar: IPadrao;
    function Build: Integer;
  end;

  TPadrao = class(TInterfacedObject, IPadrao)
  private
    FValor: Integer;
    FResultado: Integer;
  protected
    {Metodos da Interfaces}
    function Valor(const AValor: Integer): IPadrao;
    function Executar: IPadrao;
    function Build: Integer;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: IPadrao;
  end;
```

---

## 17. PROIBIÇÕES

É proibido:

- nome de interface iniciado por `i` minúsculo;
- interface sem GUID real e único;
- `procedure` em contrato;
- método de ação/configuração que não retorne a própria interface;
- método intermediário devolver resultado final que deveria ser obtido por `Build`;
- `Build` não primitivo sem revisão arquitetural;
- `New` retornar classe concreta;
- `Create` público como forma concorrente de instanciação;
- método do contrato redeclarado em `public`;
- implementação que não use `TInterfacedObject` quando seguir este padrão;
- consumidor depender da classe concreta quando existe contrato;
- misturar `IPadrao` e `iPadrao` entre units;
- criar interface apenas para aumentar abstração.
