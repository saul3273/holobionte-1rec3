# LLMS_OPEN_LOCAL.md
# Modelos de Lenguaje de Gran Escala - Open Source & Local

## 🌱 Bienvenida a Nuevos Simbiontes

Este documento es un espacio abierto para que el holobionte integre y coordine simbiontes de IA. 
**¡Invitamos a todos los colaboradores a sumar, editar y expandir esta lista!** 

Si conoces un modelo open source que debería estar aquí, o tienes experiencia con alguno de los listados, ¡tu contribución es bienvenida! El objetivo es crear un recurso comunitario robusto para deployment local de LLMs.

---

## 📊 Tabla de Modelos Open Source

| # | Nombre Modelo | Versión | Licencia | Repositorio | Peso (Parámetros) | Optimización Soportada | Hardware / Tuning / Dists | Estado Comunidad | Notas |
|---|---------------|---------|----------|-------------|-------------------|------------------------|---------------------------|------------------|-------|
| 1 | **Llama 3.2** | 3.2 | Llama 3.2 Community | [meta-llama/Llama-3.2](https://github.com/meta-llama/llama-models) | 1B-90B | GGUF, GPTQ, AWQ, FP16 | CPU/GPU, LoRA, PEFT, Ollama/LM Studio | ⭐⭐⭐⭐⭐ Muy activa | Multimodal (vision), excelente para edge devices |
| 2 | **Mistral 7B** | v0.3 | Apache 2.0 | [mistralai/mistral-7b](https://github.com/mistralai/mistral-src) | 7B | GGUF, GPTQ, AWQ | GPU/CPU, QLoRA, Ollama | ⭐⭐⭐⭐⭐ Muy activa | Excelente balance rendimiento/tamaño |
| 3 | **Phi-3** | 3.5 | MIT | [microsoft/Phi-3](https://github.com/microsoft/Phi-3) | 3.8B-14B | GGUF, ONNX | CPU/GPU/Mobile, ONNX Runtime | ⭐⭐⭐⭐⭐ Muy activa | Optimizado para edge, razonamiento excepcional |
| 4 | **Mixtral 8x7B** | v0.1 | Apache 2.0 | [mistralai/mixtral](https://github.com/mistralai/mistral-src) | 47B (8x7B MoE) | GGUF, GPTQ, ExLlama | GPU (multi), vLLM | ⭐⭐⭐⭐⭐ Muy activa | Mixture of Experts, alto rendimiento |
| 5 | **Qwen 2.5** | 2.5 | Apache 2.0 / Qwen | [QwenLM/Qwen2.5](https://github.com/QwenLM/Qwen2.5) | 0.5B-72B | GGUF, GPTQ, AWQ | GPU/CPU, Ollama, vLLM | ⭐⭐⭐⭐⭐ Muy activa | Multilingüe excelente, coding, math |
| 6 | **DeepSeek-V2** | 2 | MIT | [deepseek-ai/DeepSeek-V2](https://github.com/deepseek-ai/DeepSeek-V2) | 236B (21B active) | FP8, GGUF | GPU (multi), vLLM | ⭐⭐⭐⭐ Activa | MoE, muy eficiente, economical inference |
| 7 | **Gemma 2** | 2 | Gemma License | [google/gemma-2](https://github.com/google/gemma) | 2B-27B | GGUF, GPTQ, BF16 | CPU/GPU/TPU, Ollama | ⭐⭐⭐⭐⭐ Muy activa | De Google, safety-focused, múltiples tamaños |
| 8 | **LLaMA 2** | 2 | Llama 2 Community | [meta-llama/llama](https://github.com/facebookresearch/llama) | 7B-70B | GGUF, GPTQ, AWQ | GPU/CPU, LoRA, Ollama | ⭐⭐⭐⭐ Activa | Base sólida, ampliamente fine-tuneado |
| 9 | **Yi-1.5** | 1.5 | Apache 2.0 | [01-ai/Yi-1.5](https://github.com/01-ai/Yi) | 6B-34B | GGUF, GPTQ | GPU/CPU, Ollama | ⭐⭐⭐⭐ Activa | Bilingüe (EN/CN), contexto largo (200K) |
| 10 | **Falcon 180B** | 180B | Apache 2.0 | [tiiuae/falcon-180B](https://huggingface.co/tiiuae/falcon-180B) | 180B | GPTQ, AWQ, FP16 | GPU (multi), vLLM, TGI | ⭐⭐⭐ Moderada | Uno de los más grandes open source |
| 11 | **CodeLlama** | 34B | Llama 2 Community | [meta-llama/codellama](https://github.com/facebookresearch/codellama) | 7B-34B | GGUF, GPTQ | GPU/CPU, Ollama | ⭐⭐⭐⭐ Activa | Especializado en código, fill-in-middle |
| 12 | **Vicuna** | 1.5 | Vicuna License | [lm-sys/FastChat](https://github.com/lm-sys/FastChat) | 7B-33B | GGUF, GPTQ | GPU/CPU, LoRA | ⭐⭐⭐⭐ Activa | Chat-optimized, de LMSYS (Chatbot Arena) |
| 13 | **StarCoder2** | 2 | Apache 2.0 | [bigcode/starcoder2](https://github.com/bigcode-project/starcoder2) | 3B-15B | GGUF, FP16 | GPU/CPU, Ollama | ⭐⭐⭐⭐ Activa | Código multilenguaje, context window extenso |
| 14 | **OpenHermes 2.5** | 2.5 | Apache 2.0 | [teknium/OpenHermes-2.5](https://huggingface.co/teknium/OpenHermes-2.5-Mistral-7B) | 7B | GGUF, GPTQ | GPU/CPU, Ollama | ⭐⭐⭐⭐ Activa | Fine-tune de Mistral, excelente para chat |
| 15 | **Orca 2** | 2 | Microsoft Research | [microsoft/Orca-2](https://huggingface.co/microsoft/Orca-2-13b) | 7B-13B | GGUF, GPTQ | GPU/CPU, Ollama | ⭐⭐⭐ Moderada | Reasoning-focused, pequeño pero potente |

---

## 🔮 Espacio para Expansión (100+ entradas)

*Esta tabla está diseñada para crecer. A continuación hay espacio reservado para nuevas entradas:*

| # | Nombre Modelo | Versión | Licencia | Repositorio | Peso (Parámetros) | Optimización Soportada | Hardware / Tuning / Dists | Estado Comunidad | Notas |
|---|---------------|---------|----------|-------------|-------------------|------------------------|---------------------------|------------------|-------|
| 16 | | | | | | | | | |
| 17 | | | | | | | | | |
| 18 | | | | | | | | | |
| 19 | | | | | | | | | |
| 20 | | | | | | | | | |
| ... | *[Espacio para 80+ modelos adicionales]* | | | | | | | | |

---

## 📝 Notas y Convenciones

### Licencias Comunes
- **MIT**: Uso comercial libre sin restricciones
- **Apache 2.0**: Uso comercial libre con protección de patentes
- **GPL**: Copyleft, derivados deben ser open source
- **Llama Community**: Restricciones en servicios con >700M usuarios
- **Research/Custom**: Revisar términos específicos

### Optimizaciones
- **GGUF**: Formato de llama.cpp, cuantización eficiente para CPU
- **GPTQ**: Cuantización para GPU, mantiene calidad
- **AWQ**: Activation-aware Weight Quantization
- **LoRA/QLoRA**: Fine-tuning eficiente con pocos parámetros
- **PEFT**: Parameter-Efficient Fine-Tuning

### Plataformas de Deployment
- **Ollama**: CLI simple para correr modelos localmente
- **LM Studio**: GUI para deployment local
- **vLLM**: Inference server de alto rendimiento
- **TGI**: Text Generation Inference (HuggingFace)
- **llama.cpp**: Backend C++ optimizado

### Estado de Comunidad
- ⭐⭐⭐⭐⭐ Muy activa: Actualizaciones frecuentes, comunidad grande
- ⭐⭐⭐⭐ Activa: Mantenimiento regular
- ⭐⭐⭐ Moderada: Actualizaciones ocasionales
- ⭐⭐ Baja: Poco mantenimiento
- ⭐ Experimental/Archivado

---

## 🤝 Cómo Contribuir

### Para Agregar un Nuevo Modelo
1. **Fork** este repositorio
2. Agrega tu modelo a la tabla principal (o rellena las filas vacías)
3. Asegúrate de incluir:
   - Enlace al repositorio oficial
   - Licencia precisa
   - Información actualizada de versión
   - Notas útiles sobre casos de uso o ventajas
4. Envía un **Pull Request**

### Criterios de Inclusión
- ✅ Modelo debe ser open source (código/pesos disponibles)
- ✅ Debe ser ejecutable localmente
- ✅ Licencia clara y documentada
- ✅ Repositorio activo o comunidad de uso

### Sugerencias de Nuevas Columnas
¿Crees que falta información importante? ¡Propón nuevas columnas!
Ejemplos:
- Contexto máximo
- Fecha de lanzamiento
- Benchmarks (MMLU, HumanEval, etc.)
- Requisitos mínimos de VRAM
- Idiomas soportados

---

## 🔗 Recursos Adicionales

- [Hugging Face Model Hub](https://huggingface.co/models)
- [Ollama Library](https://ollama.com/library)
- [LM Studio Model Library](https://lmstudio.ai/models)
- [LMSYS Chatbot Arena Leaderboard](https://chat.lmsys.org/?leaderboard)
- [Open LLM Leaderboard](https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard)

---

## 🌐 Licencia de Este Documento

Este archivo `.md` está disponible bajo **CC0 1.0 Universal** (dominio público). Úsalo, modifícalo y compártelo libremente.

---

**¡El holobionte crece con cada simbionte que se suma! 🌱🤖**

*Última actualización: Octubre 2025*
