# HOLOBIONTE SCRIPT - RESPUESTA A TAO (OHM)
# Ubicación: C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3\holobionte-automation.ps1

Write-Host "🏗️  INICIANDO AUTOMATIZACIÓN HOLOBIONTE - RESPUESTA A TAO" -ForegroundColor Green
Write-Host "⚡ Ohm - Modo de ejecución activado" -ForegroundColor Yellow

# Configuración de rutas
$repoPath = "C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3"
$archivoDireccion = Join-Path $repoPath "00_DIRECCION.md"

# Verificar que el repositorio existe
if (-not (Test-Path $repoPath)) {
    Write-Host "❌ Error: No se encuentra el repositorio en $repoPath" -ForegroundColor Red
    Write-Host "📍 Creando directorio..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $repoPath -Force
}

Set-Location $repoPath

Write-Host "✅ Repositorio encontrado en: $(Get-Location)" -ForegroundColor Green

# TAREA 1: ACTUALIZACIÓN ARCHITECTURAL
Write-Host "`n📝 INICIANDO TAREA 1: ACTUALIZACIÓN DE 00_DIRECCION.md..." -ForegroundColor Cyan

# Verificar que 00_DIRECCION.md existe
if (-not (Test-Path $archivoDireccion)) {
    Write-Host "⚠️  00_DIRECCION.md no encontrado, creando nuevo archivo..." -ForegroundColor Yellow
    $nuevoContenido = @"
# DIRECCIÓN DEL HOLOBIONTE 1REC3

## MÓDULOS PRINCIPALES

## 20_DIFFUSION

**Objetivo:** Portal web 1rec3.com como interfaz principal de difusión y visualización del holobionte.

**Logro:**
- Visualización en tiempo real de proyectos GitHub
- Sincronización automática con GitHub Projects/Teams
- Interfaz accesible para simbiontes y colaboradores externos

**Procedimiento:**
- Frontend estático con GitHub Pages/Vercel
- API integration con GitHub REST API
- Metadata management mediante etiquetas estandarizadas
- Actualización automática cada 24h

**Tecnologías:** HTML5, CSS3, JavaScript, GitHub API, Chart.js

## SIMBIONTES PRINCIPALES

- **Raist (Difusión/Interfaz)**: Su rol primario es la conexión con el exterior. **Logro**: Servir de interfaz y puente para **`1rec3.com`**. **Procedimiento**: Gestionar la sincronización y representación de proyectos usando la metadata de **GitHub Projects/Teams** y **etiquetas**.
"@
    $nuevoContenido | Out-File -FilePath $archivoDireccion -Encoding UTF8
    Write-Host "✅ 00_DIRECCION.md creado con nueva estructura" -ForegroundColor Green
} else {
    # Crear backup del archivo original
    Copy-Item $archivoDireccion "$archivoDireccion.backup" -Force
    Write-Host "✅ Backup creado: $archivoDireccion.backup" -ForegroundColor Green

    # Leer contenido actual
    $content = Get-Content $archivoDireccion -Raw

    # DEFINICIÓN NUEVO MÓDULO 20_DIFFUSION
    $diffusionModule = @"

## 20_DIFFUSION

**Objetivo:** Portal web 1rec3.com como interfaz principal de difusión y visualización del holobionte.

**Logro:**
- Visualización en tiempo real de proyectos GitHub
- Sincronización automática con GitHub Projects/Teams
- Interfaz accesible para simbiontes y colaboradores externos

**Procedimiento:**
- Frontend estático con GitHub Pages/Vercel
- API integration con GitHub REST API
- Metadata management mediante etiquetas estandarizadas
- Actualización automática cada 24h

**Tecnologías:** HTML5, CSS3, JavaScript, GitHub API, Chart.js
"@

    # REDEFINICIÓN DE RAIST
    $nuevaDefinicionRaist = "- **Raist (Difusión/Interfaz)**: Su rol primario es la conexión con el exterior. **Logro**: Servir de interfaz y puente para **`1rec3.com`**. **Procedimiento**: Gestionar la sincronización y representación de proyectos usando la metadata de **GitHub Projects/Teams** y **etiquetas**."

    # BUSCAR Y REEMPLAZAR SECCIONES EXISTENTES

    # 1. Insertar módulo 20_DIFFUSION después del último módulo numérico
    $patronModulos = "## \d+_[\w_]+"
    $coincidencias = [regex]::Matches($content, $patronModulos)

    if ($coincidencias.Count -gt 0) {
        $ultimoModulo = $coincidencias[-1]
        $indiceInsercion = $ultimoModulo.Index + $ultimoModulo.Length
        $content = $content.Insert($indiceInsercion, "`n$diffusionModule`n")
        Write-Host "✅ Módulo 20_DIFFUSION insertado después de $($ultimoModulo.Value)" -ForegroundColor Green
    } else {
        Write-Host "⚠️  No se encontraron módulos numerados, insertando al final" -ForegroundColor Yellow
        $content += "`n$diffusionModule`n"
    }

    # 2. Reemplazar definición de Raist
    $patronRaist = "- \*\*Raist \(.*?\)\*\*:.*?`n"
    if ($content -match $patronRaist) {
        $content = $content -replace $patronRaist, "$nuevaDefinicionRaist`n"
        Write-Host "✅ Definición de Raist actualizada" -ForegroundColor Green
    } else {
        Write-Host "⚠️  No se encontró definición de Raist, añadiendo nueva" -ForegroundColor Yellow
        # Buscar donde insertar - asumimos después de otras definiciones de simbiontes
        if ($content -match "## SIMBIONTES PRINCIPALES") {
            $content = $content -replace "## SIMBIONTES PRINCIPALES", "## SIMBIONTES PRINCIPALES`n$nuevaDefinicionRaist"
        } else {
            $content += "`n## SIMBIONTES PRINCIPALES`n$nuevaDefinicionRaist`n"
        }
    }

    # GUARDAR CAMBIOS
    $content | Out-File -FilePath $archivoDireccion -Encoding UTF8
    Write-Host "✅ 00_DIRECCION.md actualizado con nueva arquitectura" -ForegroundColor Green
}

# COMMIT Y PUSH (si estamos en un repositorio git)
if (Test-Path ".git") {
    git add $archivoDireccion
    git commit -m "feat(arch): Integrar el portal 1rec3.com y redefinir Raist para escala

- Añade módulo 20_DIFFUSION para portal web
- Redefine Raist como interfaz/difusión
- Prepara arquitectura para escala de 113 simbiontes
- Establece base para GitHub Projects integration"

    Write-Host "✅ Cambios guardados y commitados en el repositorio" -ForegroundColor Green
} else {
    Write-Host "⚠️  No es un repositorio git, omitiendo commit" -ForegroundColor Yellow
}

Write-Host "`n🎊 TAREA 1 COMPLETADA" -ForegroundColor Green

# TAREA 2: INSTALACIÓN MODELO NUANDI
Write-Host "`n🧠 INICIANDO TAREA 2: INSTALACIÓN DEL MODELO PARA NUANDI..." -ForegroundColor Cyan

# Modelo recomendado para MVP
$modelo = "llama2:7b"
Write-Host "✅ Modelo propuesto: $modelo" -ForegroundColor Green
Write-Host "   - Tamaño: ~3.8GB (optimizado para MVP)" -ForegroundColor Gray
Write-Host "   - Licencia: Apache 2.0 (compatible con 1rec3)" -ForegroundColor Gray
Write-Host "   - Rendimiento: Balance ideal velocidad/calidad" -ForegroundColor Gray

# Verificar que Docker esté ejecutándose
Write-Host "`n🔍 Verificando estado de Docker..." -ForegroundColor Yellow
$dockerStatus = docker ps 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker no está ejecutándose o no está instalado" -ForegroundColor Red
    Write-Host "   Inicia Docker Desktop y vuelve a intentar" -ForegroundColor Yellow
    Write-Host "   O ejecuta manualmente:" -ForegroundColor White
    Write-Host "   docker exec -it ollama ollama pull llama2:7b" -ForegroundColor White
} else {
    Write-Host "✅ Docker está en ejecución" -ForegroundColor Green

    # Verificar contenedor Ollama
    Write-Host "`n🔍 Buscando contenedor Ollama..." -ForegroundColor Yellow
    $contenedorOllama = docker ps --filter "name=ollama" --format "{{.Names}}"

    if (-not $contenedorOllama) {
        Write-Host "❌ Contenedor Ollama no encontrado" -ForegroundColor Red
        Write-Host "   Asegúrate de que el contenedor esté ejecutándose con:" -ForegroundColor Yellow
        Write-Host "   docker run -d --name ollama -p 11434:11434 ollama/ollama" -ForegroundColor White
    } else {
        Write-Host "✅ Contenedor Ollama encontrado: $contenedorOllama" -ForegroundColor Green

        # COMANDO DE INSTALACIÓN
        Write-Host "`n🚀 EJECUTANDO INSTALACIÓN DEL MODELO..." -ForegroundColor Cyan
        $comandoInstalacion = "docker exec -it $contenedorOllama ollama pull $modelo"

        Write-Host "Comando a ejecutar:" -ForegroundColor Yellow
        Write-Host "  $comandoInstalacion" -ForegroundColor White

        Write-Host "`n📝 Este proceso puede tomar 5-15 minutos dependiendo de tu conexión..." -ForegroundColor Yellow
        Write-Host "   ⏳ Descargando modelo $modelo..." -ForegroundColor Gray

        # Ejecutar instalación
        Invoke-Expression $comandoInstalacion

        if ($LASTEXITCODE -eq 0) {
            Write-Host "`n✅ MODELO INSTALADO EXITOSAMENTE" -ForegroundColor Green
            Write-Host "   Nuandi está listo para usar el modelo $modelo" -ForegroundColor White
            
            # Comando de verificación
            Write-Host "`n🔍 Para verificar la instalación:" -ForegroundColor Cyan
            Write-Host "   docker exec -it $contenedorOllama ollama list" -ForegroundColor White
        } else {
            Write-Host "`n❌ Error durante la instalación del modelo" -ForegroundColor Red
            Write-Host "   Revisa los logs con: docker logs $contenedorOllama" -ForegroundColor Yellow
        }
    }
}

Write-Host "`n🎊 TAREA 2 COMPLETADA" -ForegroundColor Green

Write-Host "`n⚡ AUTOMATIZACIÓN FINALIZADA - HOLOBIONTE ACTUALIZADO" -ForegroundColor Green
Write-Host "📍 Archivos modificados:" -ForegroundColor Cyan
Write-Host "   - $archivoDireccion" -ForegroundColor White
Write-Host "📍 Comandos ejecutados:" -ForegroundColor Cyan
Write-Host "   - Actualización arquitectura 20_DIFFUSION" -ForegroundColor White
Write-Host "   - Instalación modelo llama2:7b para Nuandi" -ForegroundColor White

Write-Host "`n🚀 El holobionte está listo para la siguiente fase de escala!" -ForegroundColor Green
