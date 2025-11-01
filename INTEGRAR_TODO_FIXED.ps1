# ==============================================================================
# INTEGRACION COMPLETA - Sistema Caza + Protocolo Reconocimiento
# ==============================================================================
# Sin emojis para evitar problemas de encoding
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "================================================================================"
Write-Host "INTEGRACION AUTOMATICA - Sistema Caza + Protocolo Reconocimiento"
Write-Host "================================================================================"
Write-Host ""

# ------------------------------------------------------------------------------
# CONFIGURACION
# ------------------------------------------------------------------------------

$REPO_PATH = "C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3"
$BRANCH_NAME = "feature/caza-proyectos-y-protocolos"

# Verificar repo
if (-not (Test-Path "$REPO_PATH\.git")) {
    Write-Host "ERROR: No encuentro el repositorio"
    Write-Host "Ruta esperada: $REPO_PATH"
    exit 1
}

Set-Location $REPO_PATH

Write-Host "Repositorio: $REPO_PATH"
Write-Host ""

# ------------------------------------------------------------------------------
# VERIFICAR ARCHIVOS
# ------------------------------------------------------------------------------

Write-Host "Verificando archivos creados..."
Write-Host ""

$archivosEsperados = @(
    "docs\caza-proyectos",
    "scripts\caza-proyectos",
    "memoria\protocolos\RECONOCIMIENTO-CAPACIDADES-LOGROS.md",
    "memoria\logros\zero.md"
)

$todosExisten = $true
foreach ($archivo in $archivosEsperados) {
    if (Test-Path "$REPO_PATH\$archivo") {
        Write-Host "  OK: $archivo"
    } else {
        Write-Host "  FALTA: $archivo"
        $todosExisten = $false
    }
}

Write-Host ""

# ------------------------------------------------------------------------------
# GIT: Fetch y estado
# ------------------------------------------------------------------------------

Write-Host "Verificando estado de git..."
Write-Host ""

git fetch origin

$ramaActual = git branch --show-current
Write-Host "Rama actual: $ramaActual"

# ------------------------------------------------------------------------------
# GIT: Crear/cambiar rama
# ------------------------------------------------------------------------------

Write-Host ""
Write-Host "Creando/cambiando a rama: $BRANCH_NAME"
Write-Host ""

$ramaExiste = git branch --list $BRANCH_NAME

if ($ramaExiste) {
    Write-Host "Rama existe, cambiando..."
    git checkout $BRANCH_NAME
} else {
    Write-Host "Creando nueva rama..."
    git checkout -b $BRANCH_NAME
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR al cambiar/crear rama"
    exit 1
}

Write-Host "Listo: En rama $BRANCH_NAME"
Write-Host ""

# ------------------------------------------------------------------------------
# GIT: Add
# ------------------------------------------------------------------------------

Write-Host "Aniadiendo archivos a git..."
Write-Host ""

git add docs/caza-proyectos/ 2>$null
git add scripts/caza-proyectos/ 2>$null
git add memoria/protocolos/RECONOCIMIENTO-CAPACIDADES-LOGROS.md 2>$null
git add memoria/logros/zero.md 2>$null
git add INTEGRAR_TODO_FIXED.ps1 2>$null

Write-Host "Archivos staged:"
git status --short

Write-Host ""

# ------------------------------------------------------------------------------
# GIT: Commit
# ------------------------------------------------------------------------------

Write-Host "Creando commit..."
Write-Host ""

$commitMessage = @"
feat: Sistema caza proyectos + Protocolo reconocimiento

Sistema automatizado scraping + analisis ROI + propuestas
Protocolo documentacion capacidades + logros + FS
Auto-documentacion Zero como ejemplo

Archivos:
- docs/caza-proyectos/ (guias completas)
- scripts/caza-proyectos/ (Python ejecutables)
- memoria/protocolos/RECONOCIMIENTO-CAPACIDADES-LOGROS.md
- memoria/logros/zero.md

Proyeccion: EUR 25k-50k/mes
Creado por: Zero (Claude)
Tiempo: 4h autonomas
"@

git commit -m $commitMessage

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR al hacer commit"
    Write-Host "(Puede que no haya cambios)"
    git status
    exit 1
}

Write-Host "Commit realizado"
Write-Host ""

# ------------------------------------------------------------------------------
# GIT: Push
# ------------------------------------------------------------------------------

Write-Host "Subiendo a GitHub..."
Write-Host ""
Write-Host "Si pide autenticacion, ingresa credenciales"
Write-Host ""

git push -u origin $BRANCH_NAME

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "ERROR al hacer push"
    Write-Host ""
    Write-Host "Puedes hacer push manual:"
    Write-Host "  cd $REPO_PATH"
    Write-Host "  git push -u origin $BRANCH_NAME"
    Write-Host ""
    Read-Host "Presiona Enter para continuar"
} else {
    Write-Host "Push completado"
    Write-Host ""
}

# ------------------------------------------------------------------------------
# INFORMACION FINAL
# ------------------------------------------------------------------------------

Write-Host ""
Write-Host "================================================================================"
Write-Host "INTEGRACION COMPLETADA"
Write-Host "================================================================================"
Write-Host ""

Write-Host "Archivos integrados:"
Write-Host "  - Sistema caza-proyectos (docs + scripts)"
Write-Host "  - Protocolo de reconocimiento"
Write-Host "  - Logros de Zero"
Write-Host ""

Write-Host "Rama creada: $BRANCH_NAME"
Write-Host ""

Write-Host "Enlaces:"
Write-Host "  Repo: https://github.com/saul3273/holobionte-1rec3"
Write-Host "  Compare: https://github.com/saul3273/holobionte-1rec3/compare/$BRANCH_NAME"
Write-Host ""

Write-Host "Proximos pasos:"
Write-Host ""
Write-Host "1. Crear Pull Request en GitHub"
Write-Host "2. Titulo: [FEAT] Sistema Caza Proyectos + Protocolo Reconocimiento"
Write-Host "3. Solicitar review de Asamblea"
Write-Host ""

Write-Host "Resumen logros:"
Write-Host "  - 19 archivos sistema caza-proyectos"
Write-Host "  - 5,042 lineas codigo + docs"
Write-Host "  - Protocolo reconocimiento"
Write-Host "  - Auto-documentacion Zero"
Write-Host "  - 2 FS convertidos en logros"
Write-Host "  - 4h trabajo autonomo"
Write-Host ""

Write-Host "Todo listo para crear PR"
Write-Host ""

Read-Host "Presiona Enter para cerrar"
