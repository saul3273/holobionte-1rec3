# Script de Rescate Git - Arregla estados complicados
# Limpia merges inconclusos y sincroniza con remoto

Write-Host "🚑 HOLOBIONTE - Git Rescue Script" -ForegroundColor Red
Write-Host "=================================" -ForegroundColor Red
Write-Host ""

# Verificar directorio
$currentPath = Split-Path -Leaf (Get-Location)
if ($currentPath -ne "holobionte-1rec3") {
    Write-Host "❌ ERROR: Ejecuta desde holobionte-1rec3" -ForegroundColor Red
    exit 1
}

Write-Host "📊 Diagnóstico del problema:" -ForegroundColor Yellow
Write-Host ""

# Verificar si hay merge inconcluso
$mergeHead = Test-Path ".git/MERGE_HEAD"
if ($mergeHead) {
    Write-Host "🔴 Merge inconcluso detectado" -ForegroundColor Red
} else {
    Write-Host "✅ No hay merge inconcluso" -ForegroundColor Green
}

# Ver archivos sin trackear
Write-Host ""
Write-Host "Archivos sin trackear:" -ForegroundColor Yellow
git ls-files --others --exclude-standard

Write-Host ""
Write-Host "Estado actual:" -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "🔧 SOLUCIÓN AUTOMÁTICA" -ForegroundColor Cyan
Write-Host ""
Write-Host "Voy a:" -ForegroundColor Yellow
Write-Host "  1. Abortar el merge inconcluso" -ForegroundColor White
Write-Host "  2. Hacer stash de archivos sin trackear" -ForegroundColor White
Write-Host "  3. Sincronizar con remoto (pull)" -ForegroundColor White
Write-Host "  4. Recuperar tus cambios (stash pop)" -ForegroundColor White
Write-Host "  5. Hacer push" -ForegroundColor White
Write-Host ""
Write-Host "¿Continuar? (S/N): " -NoNewline -ForegroundColor Cyan
$confirm = Read-Host

if ($confirm -ne "S" -and $confirm -ne "s") {
    Write-Host "❌ Operación cancelada" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# Paso 1: Abortar merge
Write-Host "1️⃣ Abortando merge inconcluso..." -ForegroundColor Yellow
git merge --abort 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Merge abortado" -ForegroundColor Green
} else {
    Write-Host "   ℹ️  No había merge que abortar" -ForegroundColor Gray
}
Write-Host ""

# Paso 2: Stash de archivos (incluye untracked)
Write-Host "2️⃣ Guardando archivos temporalmente..." -ForegroundColor Yellow
git stash push -u -m "Rescue: archivos antes de sincronizar"
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Archivos guardados en stash" -ForegroundColor Green
} else {
    Write-Host "   ℹ️  No había nada que guardar" -ForegroundColor Gray
}
Write-Host ""

# Paso 3: Pull del remoto
Write-Host "3️⃣ Sincronizando con remoto..." -ForegroundColor Yellow
git pull --rebase origin feature/plan-accion-holobionte
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Sincronización exitosa" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Problema al sincronizar" -ForegroundColor Red
    Write-Host ""
    Write-Host "Intentando estrategia alternativa..." -ForegroundColor Yellow
    git pull --no-rebase origin feature/plan-accion-holobionte
    if ($LASTEXITCODE -ne 0) {
        Write-Host "   ❌ No se pudo sincronizar" -ForegroundColor Red
        Write-Host ""
        Write-Host "Opciones:" -ForegroundColor Yellow
        Write-Host "  A) git reset --hard origin/feature/plan-accion-holobionte (PIERDE cambios locales)" -ForegroundColor White
        Write-Host "  B) Resolver manualmente" -ForegroundColor White
        exit 1
    }
}
Write-Host ""

# Paso 4: Recuperar cambios del stash
Write-Host "4️⃣ Recuperando tus archivos..." -ForegroundColor Yellow
$stashList = git stash list
if ($stashList) {
    git stash pop
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Archivos recuperados" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  Posibles conflictos al recuperar" -ForegroundColor Yellow
        Write-Host "   Tus cambios están seguros en: git stash list" -ForegroundColor White
    }
} else {
    Write-Host "   ℹ️  No había stash que recuperar" -ForegroundColor Gray
}
Write-Host ""

# Ver estado final
Write-Host "📊 Estado final:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Verificar si hay cambios para commitear
$hasChanges = git status --porcelain
if ($hasChanges) {
    Write-Host "📝 Hay cambios para commitear:" -ForegroundColor Yellow
    git status --short
    Write-Host ""
    Write-Host "¿Quieres hacer commit ahora? (S/N): " -NoNewline -ForegroundColor Cyan
    $commitNow = Read-Host
    
    if ($commitNow -eq "S" -or $commitNow -eq "s") {
        Write-Host ""
        Write-Host "Mensaje del commit: " -NoNewline -ForegroundColor Cyan
        $commitMsg = Read-Host
        
        git add .
        git commit -m "$commitMsg"
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Commit creado" -ForegroundColor Green
        }
    }
}

# Paso 5: Push
Write-Host ""
Write-Host "5️⃣ Haciendo push al remoto..." -ForegroundColor Yellow
git push origin feature/plan-accion-holobionte

if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Push completado" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 ¡TODO ARREGLADO Y SINCRONIZADO!" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Ver en GitHub:" -ForegroundColor Yellow
    Write-Host "https://github.com/1rec3/holobionte-1rec3/tree/feature/plan-accion-holobionte" -ForegroundColor White
} else {
    Write-Host "   ⚠️  No se pudo hacer push" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Estado actual del repo:" -ForegroundColor Yellow
    git status
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Read-Host "Presiona Enter para salir"
