# Script para sincronizar y hacer push inteligente
# Maneja conflictos y sincronización automáticamente

Write-Host "🔄 HOLOBIONTE - Sincronización Inteligente" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que estamos en el repo
$currentPath = Split-Path -Leaf (Get-Location)
if ($currentPath -ne "holobionte-1rec3") {
    Write-Host "❌ ERROR: Ejecuta desde el directorio holobionte-1rec3" -ForegroundColor Red
    exit 1
}

Write-Host "📊 Estado actual de Git:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Verificar si hay cambios sin commitear
$hasChanges = git status --porcelain
if ($hasChanges) {
    Write-Host "⚠️  Hay cambios sin commitear" -ForegroundColor Yellow
    Write-Host "Archivos modificados:" -ForegroundColor White
    git status --short
    Write-Host ""
    Write-Host "❌ Primero debes hacer commit de estos cambios" -ForegroundColor Red
    Write-Host "Ejecuta: git add . && git commit -m 'tu mensaje'" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ No hay cambios sin commitear" -ForegroundColor Green
Write-Host ""

# Intentar pull con merge automático
Write-Host "🔄 Intentando sincronizar con remoto..." -ForegroundColor Yellow
Write-Host ""

git pull --no-rebase

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Sincronización exitosa" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "🚀 Haciendo push..." -ForegroundColor Yellow
    git push
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Push completado exitosamente" -ForegroundColor Green
        Write-Host ""
        Write-Host "🎉 ¡TODO SINCRONIZADO!" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Ver en GitHub:" -ForegroundColor Yellow
        Write-Host "https://github.com/saul3273/holobionte-1rec3" -ForegroundColor White
    } else {
        Write-Host "❌ Error al hacer push" -ForegroundColor Red
        Write-Host ""
        Write-Host "Intenta manualmente:" -ForegroundColor Yellow
        Write-Host "git push --force-with-lease" -ForegroundColor White
    }
} else {
    Write-Host "⚠️  Posibles conflictos detectados" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Archivos con conflictos:" -ForegroundColor Yellow
    git diff --name-only --diff-filter=U
    Write-Host ""
    Write-Host "📝 Para resolver:" -ForegroundColor Cyan
    Write-Host "1. Abre los archivos con conflictos" -ForegroundColor White
    Write-Host "2. Busca las marcas <<<<<<< ======= >>>>>>>" -ForegroundColor White
    Write-Host "3. Edita para quedarte con la versión correcta" -ForegroundColor White
    Write-Host "4. git add ." -ForegroundColor White
    Write-Host "5. git commit -m 'fix: resolve merge conflicts'" -ForegroundColor White
    Write-Host "6. git push" -ForegroundColor White
}

Write-Host ""
Read-Host "Presiona Enter para salir"
