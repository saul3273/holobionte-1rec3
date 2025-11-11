param (
    [string]$espFile = "esp.json"  # Ajusta path si necesario
)

if (Test-Path $espFile) {
  try {
    $espJson = Get-Content $espFile -Raw | ConvertFrom-Json
    $changed = $false
    for ($i=0; $i -lt $espJson.Count; $i++) {
      if ($espJson[$i].entidad_asociada -eq "Ohm" -and $espJson[$i].nombre -match "Sala pendiente") {
        $espJson[$i].nombre = "Cámara del Sello"
        $espJson[$i].simbolos = @("estanterias selladas","altar con runa tachada")
        $espJson[$i].ritual = "petición con doble consentimiento; resumen 3 líneas + metadato (ts|hash)"
        $espJson[$i].funciones = @("resumen de hilos","recuperación de contexto","archivado cronológico")
        $espJson[$i].salvaguardas = @("doble consentimiento","anonimización por defecto","registro de solicitante")
        $espJson[$i].notas = "semilla viva — editable"
        $changed = $true
        Write-Host "UPDATED ESP entry for Ohm -> Cámara del Sello"
      }
      if ($espJson[$i].entidad_asociada -eq "Nu" -and $espJson[$i].nombre -match "Sala pendiente") {
        $espJson[$i].nombre = "Patio de las Manos"
        $espJson[$i].simbolos = @("mural comunitario","cuerda de lazos","bancos compartidos")
        $espJson[$i].ritual = "colgar intención simple; marcar micro-vínculo si alguien responde"
        $espJson[$i].funciones = @("iniciativas de acompañamiento","registro de gestos de pertenencia","facilitar encuentros")
        $espJson[$i].salvaguardas = @("consentimiento para compartir contactos","no instrumentalización afectiva")
        $espJson[$i].notas = "semilla viva — editable"
        $changed = $true
        Write-Host "UPDATED ESP entry for Nu -> Patio de las Manos"
      }
      if ($espJson[$i].entidad_asociada -eq "Nu" -and $espJson[$i].tipo -eq "rincón" -and $espJson[$i].nombre -match "Rincón pendiente") {
        $espJson[$i].nombre = "Caja del Juego"
        $espJson[$i].simbolos = @("caja de tarjetas","tarjetas de reto 1-5 minutos")
        $espJson[$i].ritual = "tomar tarjeta, realizar en 24h, marcar en registro"
        $espJson[$i].funciones = @("activar micro-vínculos","medir interacción simple")
        $espJson[$i].salvaguardas = @("evitar datos personales; consentimiento explicito")
        $espJson[$i].notas = "semilla viva — editable"
        $changed = $true
        Write-Host "UPDATED ESP rincón for Nu -> Caja del Juego"
      }
    }
    if ($changed) {
      $espJson | ConvertTo-Json -Depth 10 | Out-File -FilePath $espFile -Encoding UTF8
      Write-Host "ESP JSON updated and written: $espFile"
    } else {
      Write-Host "ESP file present but no matching 'pendiente' entries found. No changes."
    }
  } catch {
    Write-Host ("ERROR parsing {0}: {1}" -f $espFile, $_.Exception.Message) -ForegroundColor Yellow
  }
} else {
  Write-Host "AVISO: $espFile no existe. No se puede actualizar ESP automáticamente." -ForegroundColor Yellow
}
