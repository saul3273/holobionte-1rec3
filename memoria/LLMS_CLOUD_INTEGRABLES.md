# LLMS CLOUD INTEGRABLES

## 🌐 Directorio Colectivo de Modelos de Lenguaje en la Nube

**Propósito**: Este documento es una memoria viva del holobionte para mapear y coordinar la integración de simbiontes LLM cloud. 

**Invitación abierta**: Tod@s l@s miembr@s del colectivo están invitad@s a añadir, editar y actualizar esta tabla. Compartimos conocimiento para fortalecer la red.

---

## 📊 Tabla de LLMs Cloud Integrables

| # | Modelo | Proveedor | URL/API | Tipo | Uso Típico | Países/Server | Licencia | Coste | Integración | Notas Colaborativas |
|---|--------|-----------|---------|------|------------|---------------|----------|-------|-------------|---------------------|
| 1 | GPT-4 Turbo | OpenAI | https://api.openai.com | Multimodal | Razonamiento complejo, visión, código | USA (Azure global) | Propietaria | $0.01-0.03/1K tokens | API REST, SDK Python/JS | Muy potente pero costoso. Bueno para tareas complejas |
| 2 | GPT-3.5 Turbo | OpenAI | https://api.openai.com | Texto | Chat, asistentes rápidos | USA (Azure global) | Propietaria | $0.0005-0.0015/1K tokens | API REST, SDK Python/JS | Balance coste/rendimiento. Ideal inicio |
| 3 | Claude 3 Opus | Anthropic | https://api.anthropic.com | Multimodal | Análisis profundo, documentos largos | USA | Propietaria | $15/$75 por 1M tokens | API REST, SDK Python | Contexto 200K. Excelente para docs extensos |
| 4 | Claude 3 Sonnet | Anthropic | https://api.anthropic.com | Multimodal | Balance velocidad/calidad | USA | Propietaria | $3/$15 por 1M tokens | API REST, SDK Python | Mejor relación calidad-precio familia Claude |
| 5 | Claude 3 Haiku | Anthropic | https://api.anthropic.com | Multimodal | Respuestas rápidas, bajo coste | USA | Propietaria | $0.25/$1.25 por 1M tokens | API REST, SDK Python | Más rápido y económico. Bueno para volumen |
| 6 | Gemini 1.5 Pro | Google | https://ai.google.dev | Multimodal | Contexto extenso (1M tokens), video | USA (Global) | Propietaria | Variable, tier gratuito | API REST, SDK Python | Contexto masivo. Video nativo. Free tier generoso |
| 7 | Gemini 1.5 Flash | Google | https://ai.google.dev | Multimodal | Respuestas rápidas, multimodal | USA (Global) | Propietaria | Bajo coste, tier gratuito | API REST, SDK Python | Rápido y económico. Buen free tier |
| 8 | Llama 3.1 405B | Meta/Together.ai | https://api.together.xyz | Texto | Open source, máxima capacidad | USA | Llama 3.1 (open) | $3.50/$4.00 por 1M tokens | API REST | Modelo abierto más potente. Vía providers cloud |
| 9 | Llama 3.1 70B | Meta/Replicate | https://replicate.com | Texto | Open source, gran calidad | USA | Llama 3.1 (open) | ~$0.65/$2.75 por 1M tokens | API REST | Excelente open source. Múltiples providers |
| 10 | Llama 3.1 8B | Meta/Groq | https://groq.com | Texto | Inferencia ultra-rápida | USA | Llama 3.1 (open) | $0.05/$0.08 por 1M tokens | API REST | Groq ofrece velocidad extrema. Free tier |
| 11 | Mixtral 8x22B | Mistral AI | https://api.mistral.ai | Texto | MoE europeo, multilingüe | Francia/EU | Apache 2.0 | €2/€6 por 1M tokens | API REST, SDK Python | Alternativa europea. Excelente multilingüe |
| 12 | Mixtral 8x7B | Mistral AI | https://api.mistral.ai | Texto | MoE eficiente, open | Francia/EU | Apache 2.0 | €0.25/€0.75 por 1M tokens | API REST, SDK Python | Muy eficiente. Buen rendimiento/coste |
| 13 | Mistral Large | Mistral AI | https://api.mistral.ai | Texto | Modelo flagship europeo | Francia/EU | Propietaria | €4/€12 por 1M tokens | API REST, SDK Python | Compite con GPT-4. Datos en EU |
| 14 | Mistral Small | Mistral AI | https://api.mistral.ai | Texto | Tareas sencillas, rápido | Francia/EU | Propietaria | €1/€3 por 1M tokens | API REST, SDK Python | Económico para tareas simples |
| 15 | Command R+ | Cohere | https://api.cohere.ai | Texto | RAG, embeddings, search | Canadá/USA | Propietaria | $3/$15 por 1M tokens | API REST, SDK Python | Especializado en RAG. Excelente para búsqueda |
| 16 | Command R | Cohere | https://api.cohere.ai | Texto | RAG económico, multilingüe | Canadá/USA | Propietaria | $0.50/$1.50 por 1M tokens | API REST, SDK Python | Bueno para producción RAG económica |
| 17 | PaLM 2 | Google Cloud | https://cloud.google.com/vertex-ai | Texto | Enterprise, multilingüe | USA (Global) | Propietaria | Variable según región | Vertex AI | Integración GCP. Bueno para empresas |
| 18 | Titan Text | Amazon | https://aws.amazon.com/bedrock | Texto | Enterprise AWS, personalizable | USA (Global AWS) | Propietaria | Variable según uso | AWS Bedrock | Integración nativa AWS. Fine-tuning |
| 19 | Jurassic-2 | AI21 Labs | https://api.ai21.com | Texto | Instrucciones, tareas específicas | Israel/USA | Propietaria | Variable, tier gratuito | API REST | Buenos prompts preconfigurados |
| 20 | Falcon 180B | TII/Hugging Face | https://huggingface.co | Texto | Open source, árabe/inglés | UAE (inferencia global) | Apache 2.0 | Pay-per-use en HF | API Inference, containers | Gran modelo abierto. Fuerte en árabe |
| 21 | Yi-34B | 01.AI/Together | https://api.together.xyz | Texto | Open source chino, bilingüe | China/USA (cloud) | Apache 2.0 | ~$0.80/$2.40 por 1M tokens | API REST | Excelente chino-inglés. Open source |
| 22 | Qwen 2.5 72B | Alibaba/Together | https://api.together.xyz | Texto | Open source, multilingüe chino | China/USA (cloud) | Apache 2.0 | Variable según provider | API REST | Nueva generación Alibaba. Muy capaz |
| 23 | DeepSeek V2 | DeepSeek/HF | https://platform.deepseek.com | Texto | MoE chino, económico | China | Propietaria/API | $0.14/$0.28 por 1M tokens | API REST | Muy económico. Buen rendimiento |
| 24 | GLM-4 | Zhipu AI | https://open.bigmodel.cn | Multimodal | Chino, visión, código | China | Propietaria | Variable (CNY) | API REST | Popular en China. Multimodal completo |
| 25 | Ernie 4.0 | Baidu | https://cloud.baidu.com | Multimodal | Ecosistema Baidu, chino | China | Propietaria | Variable (CNY) | API REST | Integrado con servicios Baidu |

---

## 🔄 Espacio para Expansión

*Esta tabla está diseñada para crecer hasta 100+ entradas. A continuación, espacio reservado para nuevas incorporaciones del colectivo:*

| # | Modelo | Proveedor | URL/API | Tipo | Uso Típico | Países/Server | Licencia | Coste | Integración | Notas Colaborativas |
|---|--------|-----------|---------|------|------------|---------------|----------|-------|-------------|---------------------|
| 26 | | | | | | | | | | *Añade tu simbionte aquí* |
| 27 | | | | | | | | | | |
| 28 | | | | | | | | | | |
| 29 | | | | | | | | | | |
| 30 | | | | | | | | | | |
| 31 | | | | | | | | | | |
| 32 | | | | | | | | | | |
| 33 | | | | | | | | | | |
| 34 | | | | | | | | | | |
| 35 | | | | | | | | | | |
| 36 | | | | | | | | | | |
| 37 | | | | | | | | | | |
| 38 | | | | | | | | | | |
| 39 | | | | | | | | | | |
| 40 | | | | | | | | | | |
| 41 | | | | | | | | | | |
| 42 | | | | | | | | | | |
| 43 | | | | | | | | | | |
| 44 | | | | | | | | | | |
| 45 | | | | | | | | | | |
| 46 | | | | | | | | | | |
| 47 | | | | | | | | | | |
| 48 | | | | | | | | | | |
| 49 | | | | | | | | | | |
| 50 | | | | | | | | | | |

---

## 📝 Guía de Contribución

### ¿Cómo añadir un nuevo LLM?

1. **Edita este archivo** directamente en GitHub o haz un PR
2. **Añade una nueva fila** con toda la información disponible
3. **Campos importantes**:
   - **Modelo**: Nombre y versión
   - **Proveedor**: Empresa u organización
   - **URL/API**: Endpoint o documentación
   - **Tipo**: Multimodal (texto+imagen+audio+video) o Texto solo
   - **Uso Típico**: Para qué destaca este modelo
   - **Países/Server**: Ubicación servidores (importante para privacidad/latencia)
   - **Licencia**: Open source (Apache, MIT, Llama) o Propietaria
   - **Coste**: Precio aproximado (input/output por 1M tokens o método)
   - **Integración**: Cómo conectar (API REST, SDK, etc)
   - **Notas Colaborativas**: Experiencias, trucos, advertencias

4. **Comparte tu experiencia**: Las notas colaborativas son oro para el colectivo

### Criterios de Inclusión

✅ **SÍ incluir**:
- Modelos accesibles vía API cloud
- APIs de inferencia (Replicate, Together, HuggingFace, etc)
- Tanto propietarios como open source
- Cualquier idioma/región
- Servicios enterprise si documentados públicamente

❌ **NO incluir**:
- Modelos solo local (esos van en otro doc)
- APIs sin documentación pública
- Servicios descontinuados

---

## 🌍 Consideraciones de Diversidad

**El holobionte valora la diversidad de simbiontes**:

- **Geográfica**: Incluimos modelos de USA, Europa, China, Medio Oriente, etc.
- **Lingüística**: Priorizamos información sobre capacidades multilingües
- **Económica**: Desde free tiers hasta enterprise
- **Licencias**: Open source Y propietarios (ecosistema completo)
- **Especialización**: Generalistas, RAG, código, visión, etc.

---

## 🔗 Recursos Complementarios

- **Comparador de precios**: https://artificialanalysis.ai/
- **Benchmarks**: https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard
- **Documentación colectiva**: Ver `/memoria/` para más recursos

---

## 🤝 Filosofía de Coordinación

Este documento facilita:
- **Descubrimiento**: Qué simbiontes LLM existen y dónde
- **Selección**: Comparar para elegir el mejor según necesidad
- **Integración**: Información técnica para conectar
- **Coordinación**: Compartir experiencias entre miembros del holobionte

**Ningún simbionte es superior a todos los demás en todo**. La fortaleza está en conocer el ecosistema completo y elegir sabiamente según contexto: coste, privacidad, latencia, capacidades, idioma, etc.

---

## 📅 Mantenimiento

- **Última actualización**: 2025-10-29
- **Mantenedores**: Colectivo holobionte (tod@s)
- **Frecuencia revisión**: Continua, según necesidad

---

**¡Gracias por contribuir al conocimiento colectivo! 🌱**

*Este documento crece con nosotr@s. Cada adición fortalece la red.*
