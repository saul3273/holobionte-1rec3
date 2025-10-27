# PLAN-LLMS

## 1. Visión estratégica
- Priorizar LLMs locales (open source, ejecutables on-prem/edge) permite: control total de datos, latencia baja, costos predecibles, personalización profunda (fine-tuning, RAG, adapters), y resiliencia sin dependencia de terceros. 
- Evolución continua: podemos iterar versiones, aplicar parches, probar cuantizaciones y optimizaciones (GGUF, AWQ, TensorRT-LLM) y compartir mejoras con la comunidad.
- Ventajas frente a cloud: privacidad y cumplimiento, funcionamiento offline, tuning específico de dominio sin límites de política, ahorro a escala. 
- Sinergias con cloud: usar servicios cloud para burst/peak, modelos cerrados como baseline/benchmark, y pipelines híbridos (pre-filtrado local + llamada cloud para casos complejos), además de comparar calidad y coste.

## 2. Tabla de sugerencias (muestras iniciales)
Campos: nombre | tipo (local/cloud/híbrido) | comunidad | facilidad de evolución | soporte hardware

- Llama 3.x | híbrido | muy alta (Meta + OSS) | alta (adapters, SFT, LoRA) | CPU, GPU NVIDIA/AMD, Apple Silicon, TPU via frameworks
- Mistral/Mixtral | híbrido | alta | alta | GPU NVIDIA, Apple Silicon (via llama.cpp/ollama), CPU cuantizada
- DeepSeek-R1/7B/8B/Distill | híbrido | media-alta | media-alta (distillation, SFT) | GPU NVIDIA, CPU cuantizada
- Falcon | local | media | media | GPU NVIDIA, CPU cuantizada
- GLM (THUDM/ChatGLM) | híbrido | media | media | GPU NVIDIA, CPU
- Qwen/Qwen2/Qwen2.5 | híbrido | alta | alta | GPU NVIDIA, CPU, Apple Silicon
- StarCoder2 (code) | local | alta | media | GPU NVIDIA, CPU
- LLaVA (multimodal) | local | alta | media | GPU NVIDIA
- Phi-3 (small) | local | alta | alta | CPU, GPU, edge
- TinyLlama | local | alta | alta | CPU micro/embedded
- Command-R+/Jamba (AI21) | cloud | media | baja | cloud
- GPT-4o/mini | cloud | muy alta | baja | cloud
- Claude 3.x | cloud | alta | baja | cloud
- Gemini 1.5 | cloud | alta | baja | cloud

Nota: ampliar la tabla colaborativamente con PRs, incluyendo tamaños, licencias, compatibilidad (Ollama, vLLM, TGI, TensorRT-LLM), y métricas (MT-Bench, MMLU, Code, Safety).

## 3. Plan de acción colaborativo
Etapa 0. Organización
- Crear etiquetas de issues: llm-local, llm-cloud, infra, tuning, benchmark, integración.
- Definir matriz de soporte: {CPU, Apple Silicon, GPU 8–24GB, GPU >24GB} x {chat, code, multimodal}.

Etapa 1. Test rápido (smoke tests)
- Ollama y/o llama.cpp: levantar modelos base (Phi-3, TinyLlama, Llama3 8B Q4/Q5, Mistral 7B) y verificar prompts estándar.
- vLLM/TGI: servir Llama/Qwen para throughput; pruebas de latencia/throughput en lotes.
- Validar RAG mínimo: ingestion + retrieval + respuesta con conjunto de documentos del repo.

Etapa 2. Setup reproducible
- Docker Compose: servicios para ollama/vllm, vector DB (Qdrant/Weaviate), API gateway, UI de chat.
- Scripts make/nox: make up, make bench, make rag, make tune.
- Observabilidad: Prometheus + Grafana; trazas OpenTelemetry.

Etapa 3. Tuning
- LoRA/QLoRA con PEFT/TRL; datasets del dominio (markdowns del repo, issues, docs públicos).
- Evaluación automatizada post-tuning (MT-Bench-lite, custom evals por tareas del holobionte).
- Gestión de artefactos: versionado de checkpoints, adapters, cuantizaciones (GGUF Q4_K_M/Q5_K_M).

Etapa 4. Benchmarking
- KPIs: calidad (exact match, BLEU/ROUGE para tareas textuales), code pass@k, latencia p50/p95, costo por 1K tokens, memoria.
- Benchmark cruzado local vs cloud con prompts reales del proyecto; reporte semanal.

Etapa 5. Integración “simbionte”
- Enrutamiento inteligente: policy router (calidad/costo/latencia) y fallback.
- Orquestación: función-calling/tools, RAG con contexto del repositorio, y cache semántica.
- Seguridad: redacción segura, filtros de PII, control de permisos y auditoría.

Etapa 6. Ciclo continuo
- Retroalimentación de usuarios en issues/PRs; auto-evals nocturnas; canary releases.

## 4. Reflexión abierta: ¿cuántos LLMs integrar?
- Pros de integrar muchos: especialización por tarea (code, razonamiento, multimodal, compresión), resiliencia ante caídas, benchmarking vivo, negociación coste/calidad.
- Contras: complejidad operativa, deuda técnica, coste de mantenimiento y evals, seguridad múltiple.
- 113 LLMs cloud: viable solo si hay orquestación/abstracciones sólidas y selección dinámica; más realista: 5–10 “core” + 10–20 “especialistas” activos, y un catálogo pasivo con activación bajo demanda.
- Propuesta: 
  - Núcleo local: 4–6 (Llama3, Qwen2.5, Mistral, Phi-3/TinyLlama, LLaVA multimodal).
  - Núcleo cloud: 3–5 (GPT-4o/mini, Claude 3.x, Gemini, Command-R+, DeepSeek).
  - Especialistas rotativos según OKRs.
- Debate: usar este issue para priorización por impacto/recursos; definir SLAs por categoría.

## Referencias
- llama.cpp, Ollama, vLLM, TGI, TensorRT-LLM, Qdrant/Weaviate, TRL/PEFT, MT-Bench/MMLU.
- Modelos: Meta Llama, Mistral, Qwen, DeepSeek, Falcon, THUDM GLM, StarCoder2, LLaVA, Phi-3, TinyLlama.

## Invitación a contribuir
- Abre un issue con: modelo propuesto, motivo, hardware, pasos de instalación y métricas.
- Envía PRs ampliando la tabla, añadiendo scripts de setup, y casos de evaluación.
