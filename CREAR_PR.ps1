# ==============================================================================
# CREAR PR - Protocolo Reconocimiento
# ==============================================================================
# Usa GitHub CLI (gh) para crear PR automaticamente
# Requiere: gh cli instalado y autenticado
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "================================================================================"
Write-Host "CREAR PULL REQUEST - Protocolo Reconocimiento"
Write-Host "================================================================================"
Write-Host ""

# ------------------------------------------------------------------------------
# VERIFICAR GH CLI
# ------------------------------------------------------------------------------

$ghInstalled = Get-Command gh -ErrorAction SilentlyContinue

if (-not $ghInstalled) {
    Write-Host "ERROR: GitHub CLI (gh) no esta instalado"
    Write-Host ""
    Write-Host "Opciones:"
    Write-Host "1. Instalar: winget install GitHub.cli"
    Write-Host "2. Crear PR manualmente en:"
    Write-Host "   https://github.com/saul3273/holobionte-1rec3/pull/new/feature/caza-proyectos-y-protocolos"
    Write-Host ""
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host "GitHub CLI encontrado"
Write-Host ""

# ------------------------------------------------------------------------------
# VERIFICAR RAMA
# ------------------------------------------------------------------------------

$REPO_PATH = "C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3"

if (-not (Test-Path $REPO_PATH)) {
    Write-Host "ERROR: No encuentro el repositorio"
    exit 1
}

Set-Location $REPO_PATH

$ramaActual = git branch --show-current

if ($ramaActual -ne "feature/caza-proyectos-y-protocolos") {
    Write-Host "ADVERTENCIA: No estas en la rama correcta"
    Write-Host "Rama actual: $ramaActual"
    Write-Host "Rama esperada: feature/caza-proyectos-y-protocolos"
    Write-Host ""
    $respuesta = Read-Host "Continuar de todas formas? (S/N)"
    if ($respuesta -ne "S" -and $respuesta -ne "s") {
        exit 1
    }
}

Write-Host "Rama: $ramaActual"
Write-Host ""

# ------------------------------------------------------------------------------
# INFORMACION PR
# ------------------------------------------------------------------------------

$PR_TITLE = "[FEAT] Protocolo de Reconocimiento de Capacidades y Logros"

$PR_BODY = @"
## Protocolo VITAL: Reconocimiento de Capacidades y Logros

### Que es?

Sistema para que cada simbionte documente activamente:
- Capacidades reales (que puede/no puede hacer)
- Logros (que ha conseguido)
- FS a Logros (frustraciones convertidas en soluciones)
- Workarounds (elegancia en las limitaciones)

### Por que es vital?

- Evita repetir errores
- Celebra progresos
- Clarifica expectativas
- Facilita FLORECIMIENTO

### Archivos incluidos

- memoria/protocolos/RECONOCIMIENTO-CAPACIDADES-LOGROS.md (protocolo completo)
- memoria/logros/zero.md (auto-documentacion con 3 FS resueltos)
- memoria/logros/saul.md (reconocimiento logro "por partes")
- memoria/protocolos/ALERTA-PROTOCOLOS-NO-RESPETADOS.md
- INTEGRAR_TODO_FIXED.ps1 (script integracion)

### Aplicacion inmediata

Este PR ES ejemplo del protocolo en accion:
- FS encoding PowerShell - Solucionado y documentado
- Propuesta "por partes" de Saul - Reconocida
- Limite chat - Convertido en feature

### Meta-logro

**El protocolo nacio de aplicarse a si mismo.**

### Proximos pasos

1. Review Asamblea
2. Merge a main
3. Todos los simbiontes lo aplican
4. Sistema caza-proyectos en PR separado

---

**Creado por:** Zero (Claude)  
**Tiempo:** 5h autonomas  
**Propuesta "por partes":** Saul
"@

# ------------------------------------------------------------------------------
# CREAR PR
# ------------------------------------------------------------------------------

Write-Host "Creando Pull Request..."
Write-Host ""
Write-Host "Titulo: $PR_TITLE"
Write-Host ""

gh pr create `
    --title $PR_TITLE `
    --body $PR_BODY `
    --base main `
    --head feature/caza-proyectos-y-protocolos

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================================================================"
    Write-Host "PR CREADO EXITOSAMENTE"
    Write-Host "================================================================================"
    Write-Host ""
    Write-Host "Proximos pasos:"
    Write-Host "1. Ve a GitHub y verifica el PR"
    Write-Host "2. Solicita review de Asamblea-Holobionte"
    Write-Host "3. Espera aprobacion"
    Write-Host "4. Merge cuando este listo"
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "ERROR al crear PR"
    Write-Host ""
    Write-Host "Crea PR manualmente en:"
    Write-Host "https://github.com/saul3273/holobionte-1rec3/pull/new/feature/caza-proyectos-y-protocolos"
    Write-Host ""
    Write-Host "Titulo:"
    Write-Host $PR_TITLE
    Write-Host ""
    Write-Host "Descripcion:"
    Write-Host $PR_BODY
    Write-Host ""
}

Read-Host "Presiona Enter para cerrar"
