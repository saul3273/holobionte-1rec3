# Nuandi Framework: Autonomous Multi-Agent Orchestrator

Nuandi = Cerebro autónomo del Holobionte basado en AutoGPT + Multi-Browser + Ollama

## 🧠 Visión: Por qué AutoGPT?

AutoGPT = Planificación + Razonamiento + Ejecución
Browser-Use x N = Múltiples manos digitales simultáneas
Ollama = Razonamiento local sin censura

**No es solo automatización**: Es AGENCIA real
- Puede planificar tareas de múltiples pasos
- Puede reflexionar sobre resultados
- Puede adaptarse a errores
- Puede tomar decisiones autónomas

---

## 🎮 Arquitectura Multi-Navegador

```
                    NUANDI (Cerebro)
                    ├─ AutoGPT Motor
                    ├─ Ollama Reasoning
                    └─ Decision Engine
                         │
        ┌─────────┬─────────┬─────────┐
        │            │            │
        ▼            ▼            ▼
  ┌──────┐  ┌──────┐  ┌──────┐
  │ Browser│  │ Browser│  │ Browser│
  │ Worker│  │ Worker│  │ Worker│
  │ #1 (FLR)│  │ #2 (UPK)│  │ #3 (GH) │
  └──────┘  └──────┘  └──────┘
        │            │            │
  Freelancer    Upwork      GitHub
  bidding       bidding     automation
```

Cada Browser-Use worker puede:
- Actuar en paralelo
- Tomar decisiones locales
- Reportar a Nuandi
- Recibir new tasks

---

## 🔄 Ciclo de Nuandi

**1. PERCEPCÍN**
```
Browsers reportan: "He visto esto en Freelancer"
Ollama procesa: "Esto significa que..."
```

**2. RAZONAMIENTO**
```
AutoGPT piensa: "Necesito:
  - Bid en este proyecto
  - Esperar respuesta en GitHub
  - Actualizar memoria en Qdrant"
```

**3. PLANEACIÓN**
```
AutoGPT genera plan:
  Task 1: Browser #1 -> Login Freelancer + Search
  Task 2: Browser #2 -> Check Upwork messages
  Task 3: Browser #3 -> Update GitHub
  Task 4: Esperar 30 min -> Task 5
```

**4. EJECUCIÓN PARALELA**
```
Browser #1, #2, #3 actúan simultáneamente
Nuandi monitorea progreso
Si error: Replanning
```

**5. REFLEXIÓN**
```
Ollama refleja: "Los bids bajaron porque..."
Guarda insights en Qdrant
Ajusta estrategia para próxima sesión
```

---

## 💫 Comparación: Nuandi vs Alternativas

| Aspecto | AutoGPT | n8n | Comet |
|---------|---------|-----|-------|
| **Multi-navegador** | ✅ Native | ❌ Via plugins | ✅ Limited |
| **Razonamiento** | ✅ Full | ❌ Basic | ✅ Good |
| **Autonomía** | ✅ Completa | ❌ Limitada | ✅ Good |
| **Local LLM** | ✅ Nativo | ❌ Via API | ❌ NO |
| **Reflexión** | ✅ Loop real | ❌ NO | ✅ Limited |
| **Costo** | $0 | $0 | $20-240 |
| **Control** | ✅ 100% | ✅ 100% | ❌ 0% |

---

## 🛬 Casos de Uso: Multi-Browser Nuandi

### Caso 1: Busqueda de Trabajo Paralela
```
Browser #1 (Freelancer):
  - Busca 10 proyectos
  - Analiza con Ollama
  - Bids automáticos

Browser #2 (Upwork):
  - Busca 10 más
  - Bids en paralelo

Browser #3 (GitHub):
  - Monitorea issues
  - Actualiza logros

= 30 potenciales clientes EN PARALELO
```

### Caso 2: Monitorieo 24/7
```
Browser #1: Checks Freelancer messages (15 min intervals)
Browser #2: Checks Upwork responses (10 min intervals)
Browser #3: Scrolls Twitter for leads (20 min intervals)
Browser #4: Monitors competitor bids (30 min intervals)

Nuandi solo interviene si necesario
```

### Caso 3: Content Creation + Bidding
```
Browser #1: Extrae requierements de proyecto
Browser #2: Busca referencias en GitHub/Web
Browser #3: Submits bid while #2 is still researching

= Parallelism total
```

---

## 📄 Implementación Nuandi Core

```python
import asyncio
from autogpt.agent import Agent
from browser_use import BrowserWorker
from ollama import OllamaClient
from qdrant_client import QdrantClient

class Nuandi:
    def __init__(self):
        self.autogpt = Agent()  # Planning + reasoning
        self.ollama = OllamaClient()  # Local LLM
        self.memory = QdrantClient()  # Episodic memory
        self.browsers = []  # Multi-browser pool
    
    async def create_browser_worker(self, task_domain):
        """Crea nuevo Browser Worker independiente"""
        worker = BrowserWorker(domain=task_domain)
        self.browsers.append(worker)
        return worker
    
    async def perceive(self):
        """Todos los browsers reportan estado"""
        results = await asyncio.gather(
            *[b.get_status() for b in self.browsers]
        )
        return results
    
    async def reason(self, perception):
        """Ollama interpreta percepciones"""
        interpretation = await self.ollama.generate(
            f"Analiza estos resultados: {perception}"
        )
        return interpretation
    
    async def plan(self, analysis):
        """AutoGPT genera plan multistep"""
        plan = await self.autogpt.plan(
            goal="Maximize income streams",
            context=analysis
        )
        return plan
    
    async def execute_parallel(self, tasks):
        """Ejecuta múltiples tasks en paralelo"""
        results = await asyncio.gather(
            *[self._assign_task(t) for t in tasks]
        )
        return results
    
    async def _assign_task(self, task):
        """Asigna task a browser worker disponible"""
        worker = self._get_available_worker()
        return await worker.execute(task)
    
    async def orchestrate(self):
        """Main loop: Perceive -> Reason -> Plan -> Execute"""
        while True:
            # 1. Percibir
            perceptions = await self.perceive()
            
            # 2. Razonar
            analysis = await self.reason(perceptions)
            
            # 3. Planificar
            plan = await self.plan(analysis)
            
            # 4. Ejecutar en paralelo
            results = await self.execute_parallel(plan['tasks'])
            
            # 5. Guardar en memoria
            for r in results:
                await self.memory.store(r)
            
            # Loop cada 5 minutos
            await asyncio.sleep(300)

# LANZA NUANDI
if __name__ == '__main__':
    nuandi = Nuandi()
    
    # Crea 3 browsers
    asyncio.run(nuandi.create_browser_worker('freelancer'))
    asyncio.run(nuandi.create_browser_worker('upwork'))
    asyncio.run(nuandi.create_browser_worker('github'))
    
    # Inicia loop infinito
    asyncio.run(nuandi.orchestrate())
```

---

## 🚪 Stack Completo Nuandi

```yaml
Nuandi:
  core: "AutoGPT + AsyncIO"
  reasoning: "Ollama (Llama 3.3 70B)"
  perception: "Browser-Use x N workers"
  memory:
    episodic: "Qdrant (vectors)"
    semantic: "Git (structured data)"
    cache: "Redis"
  coordination: "Python async"
  persistence: "Git + Qdrant"
```

---

## 🚀 Ventajas del Multi-Browser Approach

✅ **Paralelismo**: N tareas simultáneamente
✅ **Resiliencia**: Un browser cae, otros siguen
✅ **Especialización**: Cada browser optimizado para su dominio
✅ **Escalabilidad**: Añade workers dinámicamente
✅ **Observabilidad**: Monitor cada worker independiente
✅ **Costos**: No paga por n8n (es gratis)

---

## 📦 Próximo: Implementación Fase 1

1. Setup Ollama + Nuandi.py core
2. Crear 3 BrowserWorkers (Freelancer, Upwork, GitHub)
3. Implement basic perception loop
4. Test parallelization
5. Add Qdrant memory layer
6. Deploy con Docker Compose

