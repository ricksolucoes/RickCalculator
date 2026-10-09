# POLÍTICA — ESTRUTURA DE PROJETO DELPHI

## 1. OBJETIVO

Esta política define a organização física obrigatória dos projetos Delphi criados ou alterados pelo RickCalculator.

Nenhum agente pode criar uma estrutura diferente por preferência própria.

Quando uma pasta ou camada for indicada como "quando aplicável", ela somente deve ser criada quando existir responsabilidade concreta que justifique sua existência. Pastas vazias e camadas artificiais são proibidas.

---

## 2. RAIZ DO PROJETO

A raiz de cada projeto Delphi deve conter os arquivos de projeto:

```text
<PROJECT_DIR>\
├── Projeto.dpr
├── Projeto.dproj
├── Projeto.res
├── src\
├── Temp\
├── bin\
└── logs\
```

Regras obrigatórias:

- `.dpr` fica na raiz do projeto;
- `.dproj` fica na raiz do projeto;
- `.res` do projeto fica na raiz do projeto;
- `.pas` e `.dfm` ficam dentro de `src`;
- `.dcu` e demais artefatos intermediários de compilação ficam em `Temp`;
- `.exe` fica em `bin`;
- logs de build, execução e validação ficam em `logs`;
- é proibido utilizar `bin` para armazenar `.dcu`;
- é proibido utilizar `src` para armazenar `.exe`;
- é proibido mover manualmente o EXE após o build para simular a estrutura correta; o projeto/compilador deve gerar diretamente no destino configurado.

---

## 3. ORGANIZAÇÃO DE `src`

Quando aplicável ao tipo de aplicação, organize as units por responsabilidade:

```text
src\
├── Model\
├── View\
├── Controller\
├── Service\
├── Interfaces\
├── Domain\
├── Infrastructure\
└── Common\
```

Essas pastas NÃO são obrigatórias quando não houver código com a respectiva responsabilidade.

### Model

Estado e estruturas de dados da aplicação quando o modelo MVC exigir essa responsabilidade.

### View

Forms, Frames, DataModules estritamente visuais e demais elementos de apresentação.

A View não contém regra de negócio.

### Controller

Coordena ações originadas pela View e delega regras e operações aos componentes apropriados.

O Controller não deve concentrar regra de negócio que pertença ao Domain ou Service.

### Service

Representa casos de uso, orquestração de operações ou serviços de aplicação quando essa responsabilidade existir.

Não crie Service apenas para aumentar o número de camadas.

### Interfaces

Contém contratos quando houver abstração real conforme `DELPHI_INTERFACE_PATTERN.md`.

### Domain

Regras de negócio puras, entidades e conceitos de domínio quando aplicáveis.

### Infrastructure

Integrações, persistência, acesso externo ou detalhes técnicos quando aplicáveis.

### Common

Código compartilhado genuinamente transversal. Não utilizar como pasta genérica para responsabilidades indefinidas.

---

## 4. MVC E SERVICE

O padrão arquitetural preferencial para aplicações com interface é MVC, complementado por Service quando aplicável.

A decisão não pode ser automática apenas porque a pasta existe.

Use:

```text
View -> Controller -> Service/Domain
```

quando as responsabilidades reais do projeto justificarem essa cadeia.

Para validações técnicas mínimas sem regra de negócio, não crie Model, Controller ou Service artificiais.

---

## 5. SAÍDAS DE BUILD

Projetos `.dproj` devem configurar diretamente:

```text
DCC_ExeOutput = bin
DCC_DcuOutput = Temp
```

Os caminhos devem ser relativos ao diretório do projeto.

Após o build, valide:

```text
[PASS] EXE em bin
[PASS] DCU em Temp, quando houver DCU produzido
[PASS] nenhum EXE em src
[PASS] nenhum DCU em bin
```

---

## 6. PORTABILIDADE

Nunca codifique a letra da unidade ou o caminho absoluto do workspace.

Todos os caminhos internos devem derivar de `PROJECT_ROOT` ou do diretório real do projeto.
