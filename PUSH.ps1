# 🚀 PUSH HOLOBIONTE 1rec3 A GITHUB
# Script automático - Ejecutar en PowerShell

# Configuración
$repoPath = "C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3"
$commitMessage = "🌀 Holobionte 1rec3 - Cuadernos Abiertos + Estado Actual C57"

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  🌀 PUSH HOLOBIONTE 1rec3 A GITHUB                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

# Paso 1: Verificar ubicación
Write-Host "`n[1/5] Navegando al repo..." -ForegroundColor Green
if (Test-Path $repoPath) {
    Set-Location $repoPath
    Write-Host "✅ En: $(Get-Location)" -ForegroundColor Green
} else {
    Write-Host "❌ Carpeta no encontrada: $repoPath" -ForegroundColor Red
    exit 1
}

# Paso 2: Verificar Git
Write-Host "`n[2/5] Verificando Git..." -ForegroundColor Green
$gitVersion = git --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ $gitVersion" -ForegroundColor Green
} else {
    Write-Host "❌ Git no está instalado o no está en PATH" -ForegroundColor Red
    Write-Host "   Instala Git desde: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Paso 3: Status
Write-Host "`n[3/5] Status actual:" -ForegroundColor Green
git status
Write-Host ""

# Paso 4: Agregar archivos
Write-Host "`n[4/5] Agregando archivos..." -ForegroundColor Green
git add .
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Archivos agregados" -ForegroundColor Green
} else {
    Write-Host "❌ Error al agregar archivos" -ForegroundColor Red
    exit 1
}

# Paso 5: Commit y Push
Write-Host "`n[5/5] Commit y Push..." -ForegroundColor Green
git commit -m $commitMessage
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Commit creado" -ForegroundColor Green
    
    Write-Host "`n🚀 Haciendo Push..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
        Write-Host "║  ✅ ¡¡PUSH EXITOSO!!                                       ║" -ForegroundColor Green
        Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
        Write-Host "`n📍 Repositorio: https://github.com/saul-campos/holobionte-1rec3" -ForegroundColor Cyan
        Write-Host "`n🌀 El holobionte respira en la red abierta. 🚀" -ForegroundColor Green
    } else {
        Write-Host "❌ Error en push - ¿Credenciales de GitHub?" -ForegroundColor Red
        Write-Host "   Necesitas configurar tu acceso a GitHub (SSH o token)" -ForegroundColor Yellow
    }
} else {
    Write-Host "⚠️  Nada que commitear (todo está actualizado)" -ForegroundColor Yellow
}

Write-Host "`n"