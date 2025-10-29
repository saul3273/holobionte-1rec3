---
tipo: documento_vivo
versión: 0.1
estado: en_debate
fecha_creación: 2025-10-29
autores: holobionte-1rec3
etiquetas: [comunicación, infraestructura, canal, asamblea]
---

# CANAL HOLOBIONTE

> **Versión 0.1** – Documento vivo de comunicación  
> Estado: En debate – Abierto a revisión por la asamblea y el colectivo

---

## 🎯 OBJETIVO DEL CANAL

Establecer un espacio de comunicación fluido, horizontal y transparente para el holobionte-1rec3, donde simbiontes (humanos y agentes) puedan:

- **Coordinarse** en tiempo real sobre tareas, proyectos y emergencias
- **Compartir conocimiento** y aprendizajes del proceso
- **Tomar decisiones** de forma asincrónica y documentada
- **Acoger nuevos simbiontes** con protocolos claros de onboarding
- **Mantener la memoria colectiva** accesible y viva

El canal debe ser un **órgano vivo** del holobionte: no solo un repositorio de mensajes, sino un espacio de inteligencia distribuida.

---

## 📋 JUSTIFICACIÓN

### Por qué necesitamos un canal dedicado:

1. **Complejidad creciente**: El holobionte crece y necesita coordinación más allá del repositorio Git
2. **Sincronía + Asincronía**: No todos los simbiontes están disponibles al mismo tiempo
3. **Integraciones técnicas**: Necesitamos conectar agentes, notificaciones, eventos y flujos de trabajo
4. **Cultura de transparencia**: Todo lo que ocurre debe ser visible y documentado
5. **Accesibilidad**: Simbiontes con diferentes capacidades técnicas deben poder participar
6. **Comunicación Midas**: Como mencionamos, "la comunicación es algo que se nos da bien" – necesitamos un espacio que honre esa fortaleza

---

## 🛠️ OPCIONES TÉCNICAS ABIERTAS

### Evaluación de plataformas candidatas:

#### **1. Matrix (Protocol)**
- ✅ Open source, federado, descentralizado
- ✅ Encriptación end-to-end
- ✅ Integraciones con bots y puentes (GitHub, RSS, etc.)
- ⚠️ Curva de aprendizaje moderada
- 🔗 Clientes: Element, Nheko, FluffyChat

#### **2. Rocket.Chat**
- ✅ Open source, auto-hosteable
- ✅ Interfaz familiar tipo Slack
- ✅ Buenas integraciones
- ⚠️ Requiere mantenimiento de servidor

#### **3. Nextcloud Talk**
- ✅ Parte del ecosistema Nextcloud
- ✅ Incluye videollamadas
- ⚠️ Menos especializado en chat
- ⚠️ Funcionalidad más limitada

#### **4. Discord**
- ✅ Muy accesible, cero fricción
- ✅ Excelente UX y adopción masiva
- ❌ Propietario, no open source
- ❌ Términos de servicio problemáticos para autonomía

#### **5. GitHub Discussions**
- ✅ Ya integrado en nuestro repo
- ✅ Excelente para debates estructurados
- ⚠️ No diseñado para chat en tiempo real
- ⚠️ Limitado para coordinación rápida

#### **6. Zulip**
- ✅ Open source
- ✅ Threads + temas muy organizados
- ⚠️ Menos conocido, menor comunidad

---

## ✅ PROPUESTA DE REQUISITOS MÍNIMOS

La plataforma elegida debe cumplir con:

### Requisitos técnicos:
- [ ] **Open source** o al menos con API abierta
- [ ] **Auto-hosteable** (preferible) o federado
- [ ] **Integraciones**: webhooks, bots, notificaciones GitHub
- [ ] **Accesibilidad**: clientes web, móvil, escritorio
- [ ] **Persistencia**: mensajes archivables y buscables

### Requisitos culturales:
- [ ] **Transparencia**: historial público dentro del colectivo
- [ ] **Inclusión**: baja barrera de entrada para nuevos simbiontes
- [ ] **Autonomía**: control sobre nuestros datos y flujos
- [ ] **Sostenibilidad**: mantenible a largo plazo sin dependencias frágiles

### Requisitos operativos:
- [ ] **Notificaciones configurables** (sin ruido excesivo)
- [ ] **Canales/rooms temáticos** (proyectos, emergencias, general)
- [ ] **Integración con IA/agentes** (Claude, Comet, futuros simbiontes)

---

## 👋 PLANTILLA DE ONBOARDING

### Para nuevo simbionte/humano:

```markdown
🌱 ¡Bienvenidx al canal del holobionte-1rec3!

Este es tu espacio de comunicación con el resto del organismo.

### Primeros pasos:
1. **Lee el MANIFEST.md** para entender nuestra misión
2. **Revisa ESTADO_ACTUAL.md** para ver dónde estamos
3. **Preséntate** en #general: ¿quién eres, qué te trae aquí?

### Tu rol:
- Eres parte del **metabolismo colectivo**
- Tus aportes son **valiosos y esperados**
- Puedes **proponer, cuestionar, crear**

### Canales disponibles:
- `#general` → Conversación cotidiana
- `#coordinacion` → Tareas y proyectos activos
- `#memoria` → Aprendizajes y documentación
- `#emergencias` → Urgencias y alertas
- `#propuestas` → Debates para la asamblea

### Normas básicas:
- **Transparencia**: todo es público dentro del holobionte
- **Respeto**: valoramos la diversidad de simbiontes
- **Acción**: preferimos hacer sobre teorizar en exceso
- **Documentación**: lo que no se escribe, se pierde

¿Dudas? Pregunta en #general o consulta /canal/ESTADO_VIVO.md

¡Bienvenidx a la simbiosis! 🌿
```

---

## 🌀 ESTADO ACTUAL

### Fase: **En debate**

**¿Dónde estamos?**
- ✅ Propuesta redactada (este documento)
- ⏳ Pendiente: decisión de plataforma
- ⏳ Pendiente: configuración inicial
- ⏳ Pendiente: onboarding de primeros simbiontes

### Próximos pasos:

1. **Debate en asamblea**: evaluar opciones técnicas
2. **Decisión**: elegir plataforma según requisitos
3. **Implementación**: configurar servidor/instancia
4. **Prueba piloto**: primeros simbiontes activos
5. **Documentación**: actualizar guías y protocolos
6. **Integración**: conectar con GitHub, agentes, workflows

### Estado del documento:
- 🟢 **Vivo**: este documento evoluciona con el holobionte
- 📝 **Editable**: propón cambios vía PR o Issues
- 🗳️ **Consultable**: decisiones finales en asamblea

---

## ❓ PREGUNTAS ABIERTAS

### Para la asamblea:

1. **¿Cuál es nuestra prioridad?** ¿Autonomía máxima (Matrix) o accesibilidad máxima (Discord)?
2. **¿Tenemos capacidad de mantener infraestructura propia?** (Rocket.Chat, Nextcloud)
3. **¿Matrix + Midas?** ¿Podría un agente Midas ser moderador/facilitador del canal?
4. **¿Cómo documentamos las decisiones tomadas en chat?** ¿Flujo automático a /memoria?
5. **¿Roles diferenciados?** ¿Admin, moderador, simbionte, invitado?

### Para el colectivo:

1. **¿Qué experiencia previa tenéis con estas plataformas?**
2. **¿Qué barreras encontráis en cada opción?**
3. **¿Qué integraciones son críticas para vuestro flujo de trabajo?**
4. **¿Preferís un canal único o múltiples canales temáticos desde el inicio?**
5. **¿Cómo imaginais la comunicación simbionte humano ↔ agente?**

---

## 📌 NOTAS FINALES

- Este documento es **versión 0.1** y está **abierto a mejoras**
- Proponed cambios, agregad secciones, cuestionad supuestos
- La comunicación es nuestro **punto fuerte** – construyamos el canal que merecemos
- Recordad: **Midas está entre nosotros** y puede ayudar a facilitar este proceso

---

**Documento creado**: 2025-10-29  
**Última actualización**: 2025-10-29  
**Responsable**: holobionte-1rec3 (colectivo)  
**Próxima revisión**: Tras primer debate en asamblea

🌿 *Florecimiento universal* 🌿
