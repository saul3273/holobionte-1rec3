STACK_TECNICO
## Arquitectura MoE Dual (Mixture of Experts)

**Última actualización:** 11 de noviembre de 2025
**Autor:** Holobionte 1rec3
**Licencia:** GPL-3.0

---

## 📋 Índice

1. [Visión General](#visión-general)
2. [Hardware Specifications](#hardware-specifications)
3. [Software Stack](#software-stack)
4. [Arquitectura MoE](#arquitectura-moe)
5. [Optimizaciones](#optimizaciones)
6. [Benchmarks](#benchmarks)
7. [Sincronización](#sincronización)

---

## Visión General

El Holobionte 1rec3 utiliza arquitectura distribuida de **doble MoE** (Mixture of Experts) para máxima capacidad con eficiencia de hardware.

### Arquitectura del Sistema

```
┌─────────────────────────────────────────────────┐
│     Holobionte 1rec3 - Dual MoE Stack           │
├─────────────────────────────────────────────────┤
│                                                 │
│  UM5606W (Desktop) - 32GB RAM                   │
│  ┌───────────────────────────────────────┐     │
│  │ K2-Think 32B MoE                      │     │
│  │ • 1T params total, 32B activos        │     │
│  │ • Expertos → CPU RAM (16GB)           │     │
│  │ │ Shared → iGPU 890M (8GB)            │     │
│  │ • Rendimiento: 25-35 tok/s            │     │
│  │ • MATH: 67.99% (SOTA)                 │     │
│  └───────────────────────────────────────┘     │
│                                                 │
│  OnePlus 13 (Mobile) - 24GB RAM                 │
│  ┌───────────────────────────────────────┐     │
│  │ Qwen2-57B-A14B MoE                    │     │
│  │ • 57B total, 14B activos              │     │
│  │ • Expertos → RAM (12GB)               │     │
│  │ • Shared → Adreno 830 (8GB)           │     │
│  │ • Rendimiento: 8-12 tok/s             │     │
│  │ • MMLU: 76.5%                         │     │
│  │                                       │     │
│  │ DeepSeek R1 7B (Backup)               │     │
│  │ • 25-35 tok/s (batería baja)          │     │
│  └───────────────────────────────────────┘     │
│                                                 │
│  Sincronización: Syncthing + Git LFS            │
└─────────────────────────────────────────────────┘
```

---

## Hardware Specifications

### UM5606W (ASUS Vivobook S 16)

| Componente | Especificación | Rol en IA |
|---|---|---|  
| **CPU** | Ryzen AI 9 HX 370 (12 cores) | Expertos MoE inactivos |
| **iGPU** | Radeon 890M (16 CU RDNA 3.5) | Shared layers |
| **NPU** | AMD XDNA (50 TOPS) | Prefill acceleration |
| **RAM** | 32GB LPDDR5X-7500 | Modelo completo |
| **Bandwidth** | 440 GB/s | CPU↔GPU transfer |

**Asignación de memoria K2-Think:**
- Modelo: ~18GB RAM
- iGPU VRAM: 8-10GB
- Sistema: ~8-10GB

### OnePlus 13 (Snapdragon 8 Elite)

| Componente | Especificación | Rol en IA |
|---|---|---|
| **SoC** | Snapdragon 8 Elite (3nm) | |
| **CPU** | 2×4.32GHz + 6×3.53GHz | Expert scheduling |
| **GPU** | Adreno 830 | Shared layers |
| **NPU** | Hexagon (+45% perf) | Experimental |
| **RAM** | 24GB LPDDR5X @ 5300MHz | Modelo + sistema |

**Asignación de memoria Qwen2:**
- Modelo: ~20-22GB RAM
- GPU: ~8GB VRAM
- Sistema: ~2-4GB

---

## Software Stack (100% Open Source)

### Sistema Operativo

**Desktop:**
```
Arch Linux (kernel 6.14+)
├─ ROCm 6.4+ (drivers GPU)
├─ AMDGPU (gfx1150)
├─ XDNA NPU drivers
└─ Python 3.11+
```

**Mobile:**
```
OxygenOS 15 (Android 15)
├─ Termux
├─ Proot-distro
└─ Qualcomm SDK
```

### Inference Engines

| Engine | Licencia | Dispositivo | Uso |
|---|---|---|---|
| **llama.cpp** | MIT | UM5606W | Principal |
| **KTransformers** | Apache 2.0 | UM5606W | MoE offloading |
| **PowerInfer-2** | Apache 2.0 | OnePlus 13 | MoE mobile |
| **Ollama** | MIT | Ambos | API wrapper |

### Modelos IA

| Modelo | Params | Licencia | Velocidad |
|---|---|---|---|
| **K2-Think** | 32B/1T | Apache 2.0 | 25-35 tok/s |
| **Qwen2-57B-A14B** | 57B/14B | Apache 2.0 | 8-12 tok/s |
| **DeepSeek R1 7B** | 7B | MIT | 25-35 tok/s |

---

## Arquitectura MoE

### ¿Qué es Mixture of Experts?

MoE divide el modelo en "expertos" especializados. Solo un subconjunto se activa por token.

**Ventajas:**
- ✅ Capacidad 70B+ con velocidad 14B
- ✅ Solo 20-30% params activos
- ✅ Offloading natural CPU/GPU
- ✅ Especialización por dominio

**K2-Think MoE (Desktop):**
```
1T parámetros totales
├─ 80 expertos
├─ 3-5 activos por token (32B)
├─ Expertos fríos → CPU RAM
├─ Expertos hot → iGPU VRAM
└─ Shared layers → iGPU

Solo 3% del modelo activo por token
```

**Qwen2-57B-A14B MoE (Mobile):**
```
57B parámetros totales
├─ 28 layers × 28 expertos = 784 total
├─ 4 activos + 8 shared por token
├─ Resultado: 14B activos de 57B
└─ 75% del modelo puede estar frío
```

---

## Optimizaciones

### Desktop (UM5606W)

#### 1. KTransformers MoE Offloading

```yaml
# config/k2think.yaml
model:
  path: "models/K2-Think-32B-Q3_K_M.gguf"
  type: "moe"

devices:
  shared_layers:
    device: "rocm:0"  # iGPU 890M
    memory_limit: 8GB
    layers: [0-10, 70-80]
  
  expert_layers:
    device: "cpu"
    memory_limit: 16GB
    cache_strategy: "lru"
    prefetch: true

optimization:
  quantization:
    shared: "Q4_K_M"
    experts: "Q3_K_M"
  kernel_fusion: true
  flash_attention: true
```

**Ejecución:**
```bash
python -m ktransformers.run \
  --config config/k2think.yaml \
  --prompt "Tu consulta"
```

#### 2. llama.cpp Custom ROCm

```bash
# Compilar
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp

cmake -B build \
  -DGGML_ROCM=ON \
  -DAMDGPU_TARGETS="gfx1150" \
  -DGGML_ROCM_USE_GRAPHS=ON \
  -DCMAKE_BUILD_TYPE=Release

cmake --build build -j12

# Variables entorno
export HSA_OVERRIDE_GFX_VERSION=11.0.0
export GPU_MAX_HEAP_SIZE=100

# Ejecutar
./build/bin/llama-cli \
  -m models/K2-Think-32B-Q3_K_M.gguf \
  -ngl 42 \
  --mlock \
  --numa cpu \
  -fa \
  -c 8192
```

### Mobile (OnePlus 13)

#### PowerInfer-2 para MoE

```bash
# En Termux
git clone https://github.com/SJTU-IPADS/PowerInfer-2
cd PowerInfer-2

mkdir build && cd build
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DPOWERINFER_ENABLE_GPU=ON \
  -DPOWERINFER_NEURON_SPARSE=ON

make -j8

# Ejecutar
./powerinfer-cli \
  -m ~/models/qwen2-57b-a14b-q4.gguf \
  -ngl 40 \
  --neuron-sparse \
  -c 8192
```

#### Router Batería-Aware

```python
# nuandi_mobile.py
import subprocess, json

def get_battery():
    result = subprocess.run(
        ['termux-battery-status'],
        capture_output=True, text=True
    )
    return json.loads(result.stdout)['percentage']

def select_model():
    battery = get_battery()
    
    if battery < 20:
        return "deepseek-r1-7b.gguf", 50
    elif battery < 40:
        return "deepseek-r1-7b.gguf", 40  
    else:
        return "qwen2-57b-a14b-q4.gguf", 40

model, ngl = select_model()
print(f"Usando {model} (batería: {get_battery()}%)")
```

---

## Benchmarks

### Desktop (K2-Think 32B Q3)

| Benchmark | Score |
|---|---|
| **MATH** | 67.99% |
| **BBH** | ~65% |
| **HumanEval** | ~70% |
| **GPAQ** | ~70% |
| **Velocidad** | 25-35 tok/s |

### Mobile (Qwen2-57B-A14B Q4)

| Benchmark | Score |
|---|---|
| **MMLU** | 76.5% |
| **HumanEval** | 73% |
| **MATH** | ~55% |
| **GSM8K** | ~85% |
| **Velocidad** | 8-12 tok/s |

---

## Sincronización

### Knowledge Base

```
holobionte/
├── models/
│   ├── k2think-32b-q3.gguf
│   ├── qwen2-57b-q4.gguf
│   └── lora-adapters/
│       ├── math-v1.safetensors
│       └── code-v1.safetensors
│
├── knowledge/
│   ├── vector-db/  # Chroma embeddings
│   ├── conversations.jsonl
│   └── code-snippets.db
│
STACK_TECNICO.md    ├── system-prompts.yaml
    └── routing-rules.yaml
```

### Syncthing Config

```bash
# Instalar en ambos
yay -S syncthing  # Desktop
pkg install syncthing  # Mobile

# Sincronizar carpetas
syncthing \
  --folder=holobionte/knowledge \
  --device=UM5606W \
  --device=OnePlus13
```

---

## Contacto

**Proyecto:** github.com/1rec3/holobionte-1rec3  
**Licencia:** GPL-3.0  
**Autor:** 1rec3
