# Nu Framework: Autonomous Multi-Agent Orchestrator

Nu = Cerebro autónomo del Holobionte basado en browser-use + AsyncIO + Ollama

## 🧠 Visión: Arquitectura Nativa Python

**Browser-use** = Automatización web moderna y potente
**AsyncIO** = Orquestación paralela nativa de Python
**Ollama** = Razonamiento local sin censura

**No es solo automatización**: Es AGENCIA real
- Puede planificar tareas de múltiples pasos
- Puede reflexionar sobre resultados  
- Puede adaptarse a errores
- Puede tomar decisiones autónomas

---

## 🎮 Arquitectura Multi-Navegador

```
         NU (Cerebro)
           ├─ AsyncIO Orchestrator
           ├─ Ollama Reasoning
           └─ Task Queue Manager
                    │
        ┌─────────┬─────────┬─────────┐
        │         │         │
        ▼         ▼         ▼
   ┌──────┐  ┌──────┐  ┌──────┐
   │Browser│  │Browser│  │Browser│
   │ Worker│  │ Worker│  │ Worker│
   │#1 (FLR)│  │#2 (UPK)│  │#3 (GH) │
   └──────┘  └──────┘  └──────┘
      │         │         │
  Freelancer  Upwork   GitHub
   bidding   bidding automation
```

Cada Browser-Use worker puede:
- Actuar en paralelo
- Tomar decisiones locales
- Reportar a Nu
- Recibir new tasks

---

## 🔄 Ciclo de Nu

**1. PERCEPCIÓN**
```
Browsers reportan: "He visto esto en Freelancer"
Ollama procesa: "Esto significa que..."
```

**2. RAZONAMIENTO**
```
Ollama piensa:
"Necesito:
- Bid en este proyecto
- Esperar respuesta en GitHub  
- Actualizar memoria en Qdrant"
```

**3. PLANEACIÓN**
```
AsyncIO genera plan:
Task 1: Browser #1 -> Login Freelancer + Search
Task 2: Browser #2 -> Check Upwork messages
Task 3: Browser #3 -> Update GitHub
Task 4: Esperar 30 min -> Task 5
```

**4. EJECUCIÓN PARALELA**
```
Browser #1, #2, #3 actúan simultáneamente
Nu monitorea progreso
Si error: Replanning
```

**5. REFLEXIÓN**
```
Ollama refleja: "Los bids bajaron porque..."
Guarda insights en Qdrant
Ajusta estrategia para próxima sesión
```

---

## 💫 Comparación: Nu vs Alternativas

| Aspecto | **Nu (browser-use)** | n8n | Comet |
|---------|---------|-----|-------|
| **Multi-navegador** | ✅ Native | ❌ Via plugins | ✅ Limited |
| **Razonamiento** | ✅ Full (Ollama) | ❌ Basic | ✅ Good |
| **Autonomía** | ✅ Completa | ❌ Limitada | ✅ Good |
| **Local LLM** | ✅ Nativo | ❌ Via API | ❌ NO |
| **Reflexión** | ✅ Loop real | ❌ NO | ✅ Limited |
| **Costo** | $0 | $0 | $20-240 |
| **Control** | ✅ 100% | ✅ 100% | ❌ 0% |
| **AsyncIO Native** | ✅ Sí | ❌ NO | ❌ NO |

---

## 🛬 Casos de Uso: Multi-Browser Nu

### Caso 1: Búsqueda de Trabajo Paralela

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

### Caso 2: Monitoreo 24/7

```
Browser #1: Checks Freelancer messages (15 min intervals)
Browser #2: Checks Upwork responses (10 min intervals)  
Browser #3: Scrolls Twitter for leads (20 min intervals)
Browser #4: Monitors competitor bids (30 min intervals)

Nu solo interviene si necesario
```

### Caso 3: Content Creation + Bidding

```
Browser #1: Extrae requirements de proyecto
Browser #2: Busca referencias en GitHub/Web
Browser #3: Submits bid while #2 is still researching

= Parallelism total
```

---

## 📄 Implementación Nu Core

```python
import asyncio
from browser_use import BrowserWorker
from ollama import AsyncClient
from qdrant_client import QdrantClient

class Nu:
    def __init__(self):
        self.ollama = AsyncClient()  # Local LLM reasoning
        self.memory = QdrantClient()  # Episodic memory
        self.browsers = []  # Multi-browser pool
        self.task_queue = asyncio.Queue()  # Task coordination
    
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
        response = await self.ollama.chat(
            model='deepseek-r1:70b',
            messages=[{
                'role': 'user',
                'content': f"Analiza estos resultados: {perception}"
            }]
        )
        return response['message']['content']
    
    async def plan(self, analysis):
        """AsyncIO genera plan multistep usando Ollama"""
        response = await self.ollama.chat(
            model='deepseek-r1:70b',
            messages=[{
                'role': 'user',
                'content': f"Genera plan de acción para: {analysis}"
            }]
        )
        # Parse plan into tasks
        plan = self._parse_plan(response['message']['content'])
        return plan
    
    async def execute_parallel(self, tasks):
        """Ejecuta múltiples tasks en paralelo con AsyncIO"""
        results = await asyncio.gather(
            *[self._assign_task(t) for t in tasks],
            return_exceptions=True
        )
        return results
    
    async def _assign_task(self, task):
        """Asigna task a browser worker disponible"""
        worker = self._get_available_worker()
        return await worker.execute(task)
    
    def _get_available_worker(self):
        """Encuentra worker disponible o crea uno nuevo"""
        for worker in self.browsers:
            if not worker.is_busy():
                return worker
        # Si todos ocupados, usa round-robin
        return self.browsers[len(self.browsers) % len(self.browsers)]
    
    async def orchestrate(self):
        """Main loop: Perceive -> Reason -> Plan -> Execute"""
        while True:
            try:
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
                    if not isinstance(r, Exception):
                        await self.memory.store(r)
                
                # Loop cada 5 minutos
                await asyncio.sleep(300)
                
            except Exception as e:
                print(f"Error en ciclo Nu: {e}")
                await asyncio.sleep(60)  # Espera 1 min antes de reintentar

# LANZA NU
if __name__ == '__main__':
    nu = Nu()
    
    # Crea 3 browsers
    async def main():
        await nu.create_browser_worker('freelancer')
        await nu.create_browser_worker('upwork')
        await nu.create_browser_worker('github')
        
        # Inicia loop infinito
        await nu.orchestrate()
    
    asyncio.run(main())
```

---

## 🚪 Stack Completo Nu

```yaml
Nu:
  core: "AsyncIO + Python 3.11+"
  reasoning: "Ollama (DeepSeek-R1 70B)"
  perception: "browser-use x N workers"
  memory:
    episodic: "Qdrant (vectors)"
    semantic: "Git (structured data)"
    cache: "Redis"
  coordination: "AsyncIO native"
  persistence: "Git + Qdrant"
```

---

## 🚀 Ventajas del Approach browser-use + AsyncIO

✅ **Paralelismo**: N tareas simultáneamente con AsyncIO nativo
✅ **Resiliencia**: Un browser cae, otros siguen  
✅ **Especialización**: Cada browser optimizado para su dominio
✅ **Escalabilidad**: Añade workers dinámicamente
✅ **Observabilidad**: Monitor cada worker independiente
✅ **Costos**: $0 - todo local y open source
✅ **Control Total**: No dependencia de APIs externas
✅ **Simplicidad**: AsyncIO es estándar de Python, no frameworks externos

---

## 📦 Próximo: Implementación Fase 1

1. ✅ Setup Ollama + DeepSeek-R1 70B
2. ⏳ Crear Nu.py core con AsyncIO
3. ⏳ Implementar 3 BrowserWorkers (Freelancer, Upwork, GitHub)
4. ⏳ Test parallelization con asyncio.gather
5. ⏳ Add Qdrant memory layer
6. ⏳ Deploy con Docker Compose

---

## 🔍 Por qué browser-use en vez de AutoGPT?

**AutoGPT (2023-2024)**:
- ❌ Requiere OpenAI API ($$$)
- ❌ Perdió autonomía en versiones recientes
- ❌ Enfoque en cloud, no local-first
- ❌ Complejidad innecesaria para nuestro caso de uso

**browser-use + AsyncIO (2025)**:
- ✅ Licencia MIT, $0 de costo
- ✅ Control total del código
- ✅ AsyncIO es nativo de Python 3.11+
- ✅ Integración directa con Ollama
- ✅ Más simple, más rápido, más mantenible
- ✅ Local-first por diseño
