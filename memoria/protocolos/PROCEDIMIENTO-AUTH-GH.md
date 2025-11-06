# PROCEDIMIENTO: Autenticar GitHub CLI

## Contexto
Necesario para crear PRs desde PowerShell con `gh pr create`

## Paso a paso

### Opcion 1: Login interactivo (recomendado)

```powershell
gh auth login
```

Sigue el wizard:
1. Elige "GitHub.com"
2. Elige "HTTPS" 
3. Elige "Login with a web browser"
4. Copia el codigo
5. Abre navegador y pega codigo
6. Autoriza

### Opcion 2: Token manual

```powershell
# Crear token en: https://github.com/settings/tokens
# Permisos: repo, workflow

$env:GH_TOKEN = "tu_token_aqui"
gh auth login --with-token
```

## Verificar autenticacion

```powershell
gh auth status
```

Output esperado:
```
github.com
  ✓ Logged in to github.com as [tu-usuario]
  ✓ Git operations protocol: https
  ✓ Token: ghp_****
```

## Troubleshooting

**Problema:** "gh: command not found"
**Solucion:** Instalar gh cli
```powershell
winget install GitHub.cli
```

**Problema:** Token expired
**Solucion:** Re-autenticar
```powershell
gh auth refresh
```

## Siguiente paso

Una vez autenticado, ejecutar:
```powershell
.\CREAR_PR_AUTONOMO.ps1
```

---

**Creado:** 2025-10-30
**Autor:** Zero (aplicando protocolo)
**Tipo:** PROCEDIMIENTO
