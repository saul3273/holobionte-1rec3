# SYNC.md - Protocolo de Sincronización Notion/Keep → GitHub

## 📅 Formato y Frecuencia de Sincronización

### Frecuencia Recomendada
- **Semanal**: Para proyectos activos (ideal los viernes)
- **Quincenal**: Para proyectos en mantenimiento
- **Ad-hoc**: Tras decisiones importantes o hitos críticos

### Formato de Entrada
- **Origen**: Notion/Google Keep
- **Destino**: `/cuadernos/*.md` en GitHub
- **Formato destino**: Markdown (siguiendo PLANTILLA.md)
- **Nomenclatura**: `YYYYMMDD-tema-descriptivo.md`

---

## ✅ Checklist de Validación

### Validación Manual
- [ ] Verificar que la fecha coincide con la del apunte original
- [ ] Confirmar que el campo "referencia fuente" incluye enlace/ID de Notion/Keep
- [ ] Revisar que las acciones/decisiones estén claramente documentadas
- [ ] Comprobar que los inputs relevantes están enlazados o referenciados
- [ ] Validar formato Markdown (encabezados, listas, enlaces)

### Validación Automatizada
- [ ] Lint Markdown (markdownlint o similar)
- [ ] Verificar estructura de plantilla (script custom)
- [ ] Comprobar enlaces rotos (action de GitHub)
- [ ] Validar fechas en formato ISO (YYYY-MM-DD)

---

## 📝 Ejemplo de Migración

### ANTES (Notion/Keep)
```
Reunión equipo - 25 oct
- Decidimos usar arquitectura modular
- Juan se encarga del backend
- Ana del frontend
- Siguiente sync: 1 nov
Referencia: proyecto-alpha
```

### DESPUÉS (GitHub: cuadernos/20251025-reunion-equipo-arquitectura.md)
```markdown
# Reunión de Equipo - Decisión Arquitectura

**Fecha**: 2025-10-25

## Síntesis
Reunión de alineación sobre arquitectura del proyecto. Se decidió implementar una arquitectura modular para facilitar escalabilidad y mantenimiento.

## Inputs Relevantes
- Propuesta inicial de arquitectura (#3)
- Análisis de escalabilidad (Notion: DB-Tech-2025)
- Feedback de stakeholders

## Referencia Fuente
- **Origen**: Notion - Página "Proyecto Alpha"
- **Enlace**: [Notion Link](https://notion.so/proyecto-alpha-123)
- **Fecha original**: 2025-10-25

## Acciones y Decisiones Tomadas

### Decisiones
- ✅ Adoptar arquitectura modular
- ✅ Separación frontend/backend clara

### Acciones
- [ ] @Juan: Setup inicial backend (deadline: 2025-11-01)
- [ ] @Ana: Setup inicial frontend (deadline: 2025-11-01)
- [ ] @Equipo: Próxima sync: 2025-11-01

### Seguimiento
- Issue relacionado: #5
- Milestone: v0.1-alpha
```

---

## 👥 Roles y Responsabilidades

### Responsable de Sync
- **Actual**: @saul3273
- **Backup**: (por definir)

### Flujo de Trabajo
1. **Identificar** apuntes en Notion/Keep pendientes de migrar
2. **Transformar** usando PLANTILLA.md como base
3. **Crear** archivo en `/cuadernos/` con nomenclatura correcta
4. **Commit** con mensaje descriptivo: `sync: [tema] desde [fuente]`
5. **Verificar** con checklist de validación

---

## 📊 Histórico de Sincronizaciones

| Fecha | Responsable | Documentos | Fuente | Notas |
|-------|-------------|------------|--------|-------|
| 2025-10-27 | @saul3273 | 1 | Issue #1 | Sync inicial, creación de protocolo |

---

## 🔧 Mejoras Futuras

- [ ] Script automatizado para convertir Notion export → formato plantilla
- [ ] GitHub Action para validación automática post-commit
- [ ] Integración API Notion para sync bidireccional
- [ ] Dashboard de métricas de sincronización

---

**Última actualización**: 2025-10-27  
**Versión**: 1.0  
**Mantenedor**: @saul3273
