# AI Model Assignments - Holobionte 1rec3

> **Last update:** 2025-11-08  
> **Philosophy:** Distributed capabilities > Rigid roles

## Core Principle

**We don't use rigid roles.** Instead:
- ✅ **Capabilities:** What each model can do
- ✅ **Optimal contexts:** When to use each model  
- ✅ **Fallbacks:** What to do if a node is unavailable
- ✅ **Procedures:** How to orchestrate distributed models

## Model Matrix by Node

| Model | Params | Architecture | Node1 | Node2 | Node3 | Node4 |
|-------|--------|--------------|-------|-------|-------|-------|
| **Llama 3.2:3b** | 3B | Dense | ✅ 40 t/s | ✅ 60 t/s | ✅ 50 t/s | ✅ 80 t/s |
| **Qwen2-57B MoE** | 57B (14B active) | MoE | ✅ 12 t/s | ❌ | ❌ | ✅ 35 t/s |
| **K2-Think 32B** | 32B (~8B active) | MoE | ❌ | ✅ 30 t/s | ✅ 25 t/s | ✅ 50 t/s |
| **DeepSeek-V3** | 671B (37B active) | MoE | ❌ | ❌ | ❌ | ✅ 22 t/s |
| **Qwen2.5-72B** | 72B | Dense | ❌ | ❌ | ❌ | ✅ 30 t/s |
| **Mixtral 8x22B** | 176B (44B active) | MoE | ❌ | ❌ | ❌ | ✅ 35 t/s |

t/s = tokens per second

## Intelligent Router

```python
def route_request(prompt, context):
    complexity = analyze_complexity(prompt)
    location = get_user_location()
    availability = check_nodes_health()
    
    # Priority 1: High complexity → Node4 (DeepSeek-V3)
    if complexity > 0.8 and availability['node4']:
        return send_to_node4(prompt)
    
    # Priority 2: Mobile offline → Node1 (edge)
    if location == 'mobile' and not has_internet():
        return send_to_node1(prompt)
    
    # Priority 3: Baseline 24/7 → Node3 (server)
    if availability['node3']:
        return send_to_node3(prompt)
    
    # Fallback: Node2 (workstation)
    return send_to_node2(prompt)
```

## Node1: OnePlus 13 (24GB)

### Primary: Qwen2-57B-Instruct-MoE (Q4_K_M)
- **Framework:** PowerInfer-2 (GPU offload Adreno 830)
- **Quantization:** Q4_K_M (4-bit)
- **VRAM:** 20GB allocated
- **Performance:** 8-12 tokens/sec
- **Optimal for:** Mobile offline reasoning, long-form generation

### Fallback: Llama 3.2:3b
- **VRAM:** 2-3GB
- **Performance:** 25-40 tokens/sec  
- **Use when:** Battery <20%, quick responses needed

## Node2: ASUS UM5606W (32GB + NPU 50 TOPS)

### Primary: K2-Think-32B-MoE (Q3_K_M)
- **Framework:** KTransformers (NPU offloading via ONNX)
- **Quantization:** Q3_K_M (3-bit)
- **VRAM:** 16GB (iGPU Radeon 890M)
- **NPU offload:** 50 TOPS for attention layers
- **Performance:** 25-35 tokens/sec
- **Optimal for:** Code generation, technical analysis, debugging

```python
from ktransformers import KTransformersModel

model = KTransformersModel(
    "K2-Think-32B-MoE-Q3",
    device_map="auto",
    use_npu=True,
    max_memory={0: "16GB", "npu": "8GB"}
)
```

### Secondary: Qwen2.5-Coder-7B
- **VRAM:** 5GB
- **Performance:** 45-60 tokens/sec
- **Use when:** Speed >40 t/s needed, simple code tasks

## Node3: NERAL-MSI (32GB + 2x RTX 3050)

### Primary: K2-Think-32B-MoE (Q3_K_M)
- **Framework:** Ollama + vLLM
- **GPU:** 1x RTX 3050 (8GB VRAM)
- **Performance:** 20-30 tokens/sec
- **Availability:** 24/7 (dedicated server)
- **Optimal for:** Always-available API, automation, webhooks

```bash
# Ollama service
sudo systemctl enable ollama
sudo systemctl start ollama

# API endpoint
curl http://192.168.1.100:11434/api/generate \
  -d '{"model": "k2-think:32b-q3_k_m", "prompt": "..."}'  
```

### Secondary: Hermes (Llama 3.2:3b)
- **VRAM:** 2-3GB
- **Performance:** 35-50 tokens/sec
- **Use when:** K2-Think saturated, simple queries

## Node4: Threadripper PRO (256GB + 2x RTX 6000 Ada) - Proposed

### Primary: DeepSeek-V3-671B (Q4_K_M)
- **Framework:** vLLM with Tensor Parallelism
- **Quantization:** Q4_K_M (single GPU) or BF16 (2-way TP)
- **Performance:** 20-25 tokens/sec (Q4), 8-12 t/s (BF16)
- **Optimal for:** Deep reasoning, complex analysis, research synthesis

```bash
# Single GPU (Q4 quantized)
vllm serve deepseek-ai/DeepSeek-V3 \
  --quantization awq \
  --gpu-memory-utilization 0.95 \
  --max-model-len 16384

# Tensor Parallel 2-way (BF16)
vllm serve deepseek-ai/DeepSeek-V3 \
  --dtype bfloat16 \
  --tensor-parallel-size 2 \
  --max-model-len 32768
```

### Secondary: Qwen2.5-72B-Instruct (Q4_K_M)
- **VRAM:** 42GB (single GPU)
- **Performance:** 25-35 tokens/sec
- **Optimal for:** Production code generation, large codebase refactoring

### Tertiary: Mixtral-8x22B (Q4_K_M)  
- **VRAM:** 35GB
- **Performance:** 30-40 tokens/sec
- **Context:** 65536 tokens
- **Optimal for:** Speed/quality balance, huge context windows

## Multi-Instance Configuration

```yaml
# Node4: 2x RTX 6000 Ada (48GB each)

GPU 0: DeepSeek-V3 Q4 (42GB)
  Port: 8000
  Use: Deep reasoning

GPU 1: Qwen2.5-72B Q4 (42GB)  
  Port: 8001
  Use: Production code

# Nginx routing
upstream ai_backend {
    server localhost:8000;  # DeepSeek (complex)
    server localhost:8001;  # Qwen (code)
}
```

## Failover Strategy

```yaml
Scenario 1: Node3 down (main server)
  1. Health check detects failure (5s timeout)
  2. Nginx redirects to Node2 (backup)
  3. Alert to Mattermost
  4. Manual restart Node3

Scenario 2: Node4 unavailable  
  1. Complex queries → queue in Redis
  2. Fallback to Node3 (lower quality, available)
  3. Process queue when Node4 returns

Scenario 3: Internet down
  1. Local nodes continue (LAN)
  2. Node1 fully offline-capable
  3. Nextcloud sync when internet returns
```

## MoE Architecture Benefits

```yaml
Traditional (dense):
  Llama 70B → 70B params active
  VRAM: ~140GB (FP16)

MoE (sparse):
  Qwen2-57B → 57B total, 14B active
  VRAM: ~30GB (FP16), ~18GB (Q4)
  
Advantage: 4x less VRAM, similar speed
```

## Metrics & Monitoring

```yaml
Prometheus metrics:
  - ollama_requests_total (counter)
  - ollama_latency_seconds (histogram)
  - vllm_tokens_per_second (gauge)
  - node_health_status (gauge)

Grafana dashboards:
  - Node availability (uptime %)
  - Model performance (tokens/sec)
  - GPU utilization per node
  - Request routing distribution
```

---

**Maintained by:** Holobionte 1rec3  
**License:** MIT  
**Last review:** 2025-11-08
