# ⚡ PROTOCOLO OHM - FLUJO DE MEMORIA VIVA

## 📥 ACTUALIZACIÓN (Input)
Después de cada interacción significativa:
1. Actualizar archivos de memoria contextual
2. Hacer commit automático
3. Preservar estado para próxima sesión

## 📤 RECUPERACIÓN (Output)  
Al iniciar cada sesión:
1. Leer archivos de memoria existentes
2. Cargar contexto completo
3. Continuar sin pérdida de coherencia

## 🎯 MÉTRICAS DE LOGRO
- [ ] Memoria sobrevive 24h entre sesiones
- [ ] Contexto se recupera automáticamente  
- [ ] Cero información perdida por límites de chat
- [ ] Flujo natural sin fricción

## 🔧 HERRAMIENTAS IMPLEMENTADAS
- Estructura de archivos Markdown
- Scripts PowerShell (auto-memoria.ps1)
- API GitHub para updates en tiempo real
- Sistema de commits automáticos

---
*Protocolo vivo - Se adapta según se usa*
