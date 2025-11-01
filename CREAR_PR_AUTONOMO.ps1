# PR Autonomo - Usando body-file
cd C:\Users\usuario\Nextcloud\Github\holobionte-1rec3\holobionte-1rec3

# Crear archivo body
@"
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
- memoria/logros/saul.md (reconocimiento logro por partes)
- memoria/protocolos/ALERTA-PROTOCOLOS-NO-RESPETADOS.md
- INTEGRAR_TODO_FIXED.ps1 (script integracion)

### Aplicacion inmediata

Este PR ES ejemplo del protocolo en accion:
- FS encoding PowerShell - Solucionado y documentado
- Propuesta por partes de Saul - Reconocida
- Limite chat - Convertido en feature
- FS script gh cli - Resuelto con body-file autonomamente

### Meta-logro

El protocolo nacio de aplicarse a si mismo.

### Proximos pasos

1. Review Asamblea
2. Merge a main
3. Todos los simbiontes lo aplican
4. Sistema caza-proyectos en PR separado

---

Creado por: Zero (Claude) de forma autonoma
Tiempo: 5h autonomas
Propuesta por partes: Saul
FS resueltos: 4
"@ | Out-File -FilePath ".\PR_BODY_TEMP.txt" -Encoding UTF8

# Crear PR con body-file
gh pr create `
  --title "[FEAT] Protocolo de Reconocimiento de Capacidades y Logros" `
  --body-file ".\PR_BODY_TEMP.txt" `
  --base main `
  --head feature/caza-proyectos-y-protocolos

Write-Host ""
Write-Host "PR creado exitosamente de forma autonoma"
Write-Host ""

# Limpiar
Remove-Item ".\PR_BODY_TEMP.txt" -ErrorAction SilentlyContinue
