# Script para commit y push de NLNet Application
# Ejecutar desde: C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3

Write-Host "🔥 HOLOBIONTE 1REC3 - NLNet Application Commit" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que estamos en el directorio correcto
$expectedPath = "holobionte-1rec3"
$currentPath = Split-Path -Leaf (Get-Location)

if ($currentPath -ne $expectedPath) {
    Write-Host "❌ ERROR: Debes ejecutar este script desde C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3" -ForegroundColor Red
    Write-Host "Ubicación actual: $(Get-Location)" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host "✅ Directorio correcto verificado" -ForegroundColor Green
Write-Host ""

# Verificar que los archivos existen
Write-Host "📁 Verificando archivos creados..." -ForegroundColor Yellow

$files = @(
    "nlnet\APPLICATION_DRAFT.md",
    "nlnet\EXECUTION_CHECKLIST.md"
)

$allFilesExist = $true
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file NO ENCONTRADO" -ForegroundColor Red
        $allFilesExist = $false
    }
}

if (-not $allFilesExist) {
    Write-Host ""
    Write-Host "❌ Algunos archivos no existen. Verifica que los descargaste correctamente." -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host ""
Write-Host "✅ Todos los archivos verificados" -ForegroundColor Green
Write-Host ""

# Mostrar estado de Git
Write-Host "📊 Estado actual de Git:" -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "¿Deseas continuar con el commit y push? (S/N)" -ForegroundColor Cyan
$confirm = Read-Host

if ($confirm -ne "S" -and $confirm -ne "s") {
    Write-Host "❌ Operación cancelada por el usuario" -ForegroundColor Yellow
    Read-Host "Presiona Enter para salir"
    exit 0
}

# Hacer commit
Write-Host ""
Write-Host "📝 Agregando archivos a Git..." -ForegroundColor Yellow

git add nlnet/
git add ESTADO_ACTUAL.md

Write-Host "✅ Archivos agregados" -ForegroundColor Green
Write-Host ""

Write-Host "💾 Creando commit..." -ForegroundColor Yellow

$commitMessage = @"
feat(nlnet): NLNet NGI0 Application structure and execution plan

## Added
- nlnet/APPLICATION_DRAFT.md: Comprehensive application structure (€50k)
  - Complete technical architecture
  - Detailed budget breakdown
  - Team structure and expertise
  - Timeline and milestones
  - Alignment with NGI0 values
  
- nlnet/EXECUTION_CHECKLIST.md: Day-by-day execution plan
  - 24-day timeline to deadline (1 Dec 2025)
  - Daily tasks and deliverables
  - Weekly milestones
  - Risk management and escalation paths

## Updated
- ESTADO_ACTUAL.md: Priority shift to funding execution
  - Updated timestamp (07 Nov 2025)
  - NLNet as critical priority
  - Resource allocation adjusted
  - Team coordination plan

## Context
Identified critical funding opportunity with 24-day deadline.
Application ~30% complete, structured for rapid execution.

Related to: #nlnet-application, #funding, #sustainability
Urgency: 🔴 CRITICAL - Deadline 1 December 2025
"@

git commit -m "$commitMessage"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Commit creado exitosamente" -ForegroundColor Green
} else {
    Write-Host "❌ Error al crear commit" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host ""
Write-Host "🚀 Haciendo push a GitHub..." -ForegroundColor Yellow

git push

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Push completado exitosamente" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 ¡TODO LISTO!" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📊 Resumen de cambios:" -ForegroundColor Yellow
    Write-Host "  - Directorio nlnet/ creado" -ForegroundColor White
    Write-Host "  - APPLICATION_DRAFT.md (~30% completo)" -ForegroundColor White
    Write-Host "  - EXECUTION_CHECKLIST.md (plan 24 días)" -ForegroundColor White
    Write-Host "  - ESTADO_ACTUAL.md actualizado" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 Próximos pasos:" -ForegroundColor Yellow
    Write-Host "  1. Revisar APPLICATION_DRAFT.md" -ForegroundColor White
    Write-Host "  2. Completar sección de Team CVs" -ForegroundColor White
    Write-Host "  3. Seguir EXECUTION_CHECKLIST.md día a día" -ForegroundColor White
    Write-Host ""
    Write-Host "🔗 Ver en GitHub:" -ForegroundColor Cyan
    Write-Host "  https://github.com/1rec3/holobionte-1rec3" -ForegroundColor White
    Write-Host ""
    Write-Host "⏰ Deadline: 1 Diciembre 2025 (24 días restantes)" -ForegroundColor Red
    Write-Host ""
} else {
    Write-Host "❌ Error al hacer push" -ForegroundColor Red
    Write-Host ""
    Write-Host "Posibles causas:" -ForegroundColor Yellow
    Write-Host "  - Necesitas autenticación (git config credential.helper)" -ForegroundColor White
    Write-Host "  - Conflictos con el remoto (git pull primero)" -ForegroundColor White
    Write-Host "  - Sin conexión a internet" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Write-Host "🌊 'La urgencia bien entendida no es ansiedad, es claridad.'" -ForegroundColor Cyan
Write-Host ""
Read-Host "Presiona Enter para salir"
