# RUNTIME CONFIG CONTRACT

## Fontes

```text
config/delphi.env.cmd
runtime/config/runtime.json
```

## Regras

- paths específicos do ambiente Delphi devem vir de `config/delphi.env.cmd`;
- configuração de fluxo runtime deve vir de `runtime/config/runtime.json`;
- Agents não devem inventar paths;
- divergência entre config e máquina real gera `CONFIG BLOCKER`;
- build de desenvolvimento: Win32 Debug;
- release final: Win32 Release;
- Build Specs não são dependência runtime;
- Agents legados não pertencem ao fluxo normal.

## Estado

```text
CONFIG CONTRACT: IMPLEMENTED
```
