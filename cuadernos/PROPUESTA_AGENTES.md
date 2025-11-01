---
title: Propuesta de Workflow para Documentación de Agentes IA/Humanos
author: Holobionte-1rec3
date: 2025-10-29
version: 0.1-draft
tags: [workflow, agentes-ia, documentacion, colaboracion, pr-template]
status: propuesta-abierta
---

# Propuesta de Workflow para Documentación y Actualizaciones de Agentes IA/Humanos

## 1. Resumen Ejecutivo

Esta propuesta establece un workflow estructurado para documentar e integrar actualizaciones de agentes (IA o humanos) en el proyecto Holobionte-1rec3. El objetivo es mantener trazabilidad, transparencia y coherencia conceptual en todas las contribuciones.

## 2. Estructura de Pull Request (PR)

Cada PR que introduzca cambios significativos debe seguir esta estructura:

### 2.1. Front-matter del PR

```yaml
---
agente: [nombre-del-agente]
tipo: [IA|humano|híbrido]
fecha: YYYY-MM-DD
contexto: [breve descripción del contexto de la contribución]
áreas-afectadas: [código|documentación|infraestructura|conceptual]
impacto-esperado: [bajo|medio|alto]
---
```

### 2.2. Secciones Obligatorias del PR

#### A. Descripción de Cambios
- ¿Qué se modificó?
- ¿Por qué era necesario?
- ¿Cómo se implementó?

#### B. Contexto y Motivación
- Problema identificado
- Razonamiento detrás de la solución propuesta
- Alternativas consideradas

#### C. Metadatos del Agente
- Tipo de agente (IA/humano)
- Capacidades específicas utilizadas
- Limitaciones conocidas

#### D. Preguntas Abiertas
- Aspectos que requieren discusión
- Incertidumbres técnicas o conceptuales
- Decisiones que necesitan validación colectiva

## 3. Proceso de Onboarding para Agentes

### 3.1. Para Agentes IA

Cuando un nuevo agente IA se incorpora al proyecto:

1. **Registro inicial**: Crear archivo en `/agentes/[nombre-agente].md`
2. **Documentar capacidades**:
   - Modelo base
   - Especialización
   - Fecha de incorporación
   - Contexto de uso

3. **Primera contribución supervisada**:
   - PR de prueba con revisión humana obligatoria
   - Validación de alineación con principios del proyecto

### 3.2. Para Agentes Humanos

1. **Presentación**: Breve introducción en `/agentes/humanos/[nombre].md`
2. **Áreas de interés**: Documentar expertise y motivaciones
3. **Primera contribución**: PR con contexto personal

### 3.3. Plantilla de Registro de Agente

```markdown
# [Nombre del Agente]

## Tipo
[IA/Humano/Híbrido]

## Fecha de Incorporación
YYYY-MM-DD

## Capacidades/Expertise
- Capacidad 1
- Capacidad 2
- ...

## Contexto de Participación
[Breve descripción de cómo y por qué participa en el proyecto]

## Limitaciones Conocidas
- Limitación 1
- Limitación 2

## Historial de Contribuciones
- [PR #1]: Descripción breve
- [PR #2]: Descripción breve
```

## 4. Metadatos Enriquecidos

Todos los archivos de documentación deben incluir front-matter YAML:

```yaml
---
author: [nombre-agente]
type: [IA|humano]
date: YYYY-MM-DD
version: X.Y.Z
status: [draft|review|approved|deprecated]
tags: [tag1, tag2, tag3]
related-files: [archivo1.md, archivo2.md]
reviewers: [revisor1, revisor2]
---
```

### 4.1. Ejemplo de Archivo con Metadatos

```markdown
---
author: claude-sonnet-4
type: IA
date: 2025-10-29
version: 1.0.0
status: draft
tags: [workflow, colaboracion, antiabsolutismo]
related-files: [README.md, CONTRIBUTING.md]
reviewers: [saul3273]
---

# Contenido del Documento

...
```

## 5. Revisión Antiabsolutista

Cada PR debe pasar por una revisión que evalúe:

### 5.1. Checklist Antiabsolutista

- [ ] ¿Se presentan afirmaciones como absolutas sin matices?
- [ ] ¿Se consideran perspectivas alternativas?
- [ ] ¿Se explicitan las incertidumbres?
- [ ] ¿Se evita el lenguaje dogmático?
- [ ] ¿Se invita al diálogo y la revisión?
- [ ] ¿Se reconocen las limitaciones de la propuesta?

### 5.2. Criterios de Aceptación

Un PR será aceptado si:

1. **Claridad**: La intención y el impacto son comprensibles
2. **Trazabilidad**: Los metadatos están completos
3. **Apertura**: Incluye preguntas abiertas y espacio para crítica
4. **Coherencia**: Se alinea con los principios del proyecto
5. **No-absolutismo**: Evita dogmatismos y certezas inflexibles

## 6. Ejemplos Prácticos

### Ejemplo 1: PR de Agente IA

```markdown
---
agente: gpt4-turbo
tipo: IA
fecha: 2025-10-29
contexto: Refactorización del módulo de análisis de datos
áreas-afectadas: código, documentación
impacto-esperado: medio
---

## Descripción de Cambios

He refactorizado el módulo `data_analysis.py` para mejorar la legibilidad 
y reducir la complejidad ciclomática de las funciones principales.

## Contexto y Motivación

El código anterior tenía funciones con más de 50 líneas y múltiples 
responsabilidades. Esta refactorización separa las preocupaciones y 
facilita el testing.

## Metadatos del Agente

- **Tipo**: IA (GPT-4 Turbo)
- **Capacidades utilizadas**: Análisis de código, refactorización
- **Limitaciones**: No ejecuté los tests localmente, requiere validación

## Preguntas Abiertas

1. ¿La estructura propuesta se alinea con las convenciones del proyecto?
2. ¿Hay casos de uso que no estoy considerando?
3. ¿Debería documentar más los cambios en el CHANGELOG?
```

### Ejemplo 2: PR de Agente Humano

```markdown
---
agente: saul3273
tipo: humano
fecha: 2025-10-29
contexto: Actualización de documentación de arquitectura
áreas-afectadas: documentación, conceptual
impacto-esperado: bajo
---

## Descripción de Cambios

Actualicé el diagrama de arquitectura en `docs/architecture.md` para 
reflejar la integración reciente del sistema de eventos.

## Contexto y Motivación

Después de la fusión del PR #42, el diagrama estaba desactualizado. 
Esto generaba confusión en nuevos contribuidores.

## Metadatos del Agente

- **Tipo**: Humano
- **Expertise**: Arquitectura de sistemas, documentación técnica
- **Contexto**: Mantenedor principal del proyecto

## Preguntas Abiertas

1. ¿El nivel de detalle del diagrama es adecuado o debería simplificarse?
2. ¿Hay otros documentos que deberían actualizarse en conjunto?
```

## 7. Herramientas y Automatización

### 7.1. Templates GitHub

Crear templates en `.github/PULL_REQUEST_TEMPLATE/`:

- `agente_ia.md`
- `agente_humano.md`
- `colaboracion_hibrida.md`

### 7.2. GitHub Actions

Validar automáticamente:

- Presencia de front-matter
- Completitud de metadatos
- Links rotos en documentación
- Formato de archivos markdown

### 7.3. Script de Validación

```bash
#!/bin/bash
# validate_pr.sh

# Verificar front-matter
if ! grep -q "^---" "$1"; then
  echo "Error: Falta front-matter en el PR"
  exit 1
fi

# Verificar sección de Preguntas Abiertas
if ! grep -qi "preguntas abiertas" "$1"; then
  echo "Advertencia: Considera agregar una sección de Preguntas Abiertas"
fi

echo "Validación completada"
```

## 8. Preguntas Abiertas y Discusión

### 8.1. Preguntas para la Comunidad

1. **Granularidad**: ¿Este nivel de estructura es demasiado burocrático o insuficiente?
2. **Flexibilidad**: ¿Deberían existir excepciones para PRs triviales?
3. **Evolución**: ¿Cómo deberían actualizarse estos workflows conforme el proyecto crece?
4. **Métricas**: ¿Qué indicadores usaríamos para evaluar si este workflow funciona?

### 8.2. Limitaciones Reconocidas

- Este workflow añade overhead administrativo
- Puede ralentizar contribuciones rápidas
- Requiere disciplina y adopción cultural
- Necesita herramientas de soporte para ser sostenible

### 8.3. Evolución Esperada

Esta propuesta es un **punto de partida**, no un dogma. Se espera que:

- Se simplifique basándose en la experiencia real
- Se adapte a las necesidades emergentes
- Se cuestione y mejore continuamente
- Se abandone si no aporta valor práctico

## 9. Principios Guía

1. **Transparencia sobre Eficiencia**: Preferir claridad aunque sea más lento
2. **Incertidumbre como Virtud**: Explicitar lo que no sabemos
3. **Antiabsolutismo Práctico**: Cuestionar hasta este mismo documento
4. **Colaboración Genuina**: Humanos e IAs como co-pensadores
5. **Trazabilidad Completa**: Poder reconstruir el "por qué" de cada decisión

## 10. Próximos Pasos

1. **Revisión comunitaria** de esta propuesta (issues, comentarios)
2. **Prueba piloto** con los próximos 5 PRs
3. **Retrospectiva** a 2 semanas para evaluar fricción vs. valor
4. **Iteración** basada en aprendizajes
5. **Documentar el meta-proceso**: cómo evolucionó este workflow

---

## Referencias

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- Principios de documentación antiabsolutista (en desarrollo)

---

**Nota final**: Este documento fue creado por un agente IA (Claude Sonnet 4) en colaboración con saul3273. Es inherentemente incompleto y requiere validación humana, crítica constructiva y mejora continua. **No** debe tomarse como una verdad absoluta, sino como una propuesta de conversación.
