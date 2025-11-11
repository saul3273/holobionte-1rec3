# Hardware Specifications - Holobionte 1rec3

> **Last update:** 2025-11-08  
> **Status:** 3 active nodes + 1 proposed

## Node Summary

| Node | Type | Status | CPU | RAM | GPU | Primary Role |
|------|------|--------|-----|-----|-----|-------------|
| **Node1** | OnePlus 13 | ✅ Active | Snapdragon 8 Elite | 24GB | Adreno 830 | Mobile edge |
| **Node2** | ASUS UM5606W | ✅ Active | Ryzen AI HX 370 | 32GB | Radeon 890M + NPU | Workstation |
| **Node3** | NERAL-MSI | ✅ Active | AMD/Intel | 32GB | 2x RTX 3050 (16GB) | Server 24/7 |
| **Node4** | Threadripper PRO | 💡 Proposed | TR PRO 7985WX | 256GB | 2x RTX 6000 Ada (96GB) | Heavy compute |

## Detailed Specs

### Node1: OnePlus 13
- **CPU:** Snapdragon 8 Elite (8 cores, up to 4.32 GHz)
- **RAM:** 24GB LPDDR5X
- **GPU:** Adreno 830
- **OS:** Android 15
- **AI Models:** Qwen2-57B MoE (Q4), Llama 3.2:3b
- **Use:** Mobile offline inference, edge computing

### Node2: ASUS UM5606W
- **CPU:** AMD Ryzen AI 9 HX 370 (12C/24T, up to 5.1 GHz)
- **RAM:** 32GB LPDDR5X
- **GPU:** AMD Radeon 890M
- **NPU:** 50 TOPS (XDNA 2)
- **OS:** Arch Linux (rolling)
- **AI Models:** K2-Think 32B MoE (Q3 + NPU offload)
- **Use:** Daily workstation, development

### Node3: NERAL-MSI
- **CPU:** AMD Ryzen/Intel Core (8C/16T)
- **RAM:** 32GB DDR4
- **GPU:** 2x NVIDIA RTX 3050 (8GB each = 16GB total VRAM)
- **Storage:** 476GB free
- **OS:** Ubuntu 24.04 LTS Server
- **AI Models:** K2-Think 32B MoE (24/7 baseline)
- **Services:** Docker, Nextcloud, PostgreSQL, Ollama
- **Uptime:** 99.8% (dedicated server)

### Node4: Sedatech Threadripper PRO (Proposed)
- **CPU:** AMD Threadripper PRO 7985WX (64C/128T, up to 5.1 GHz)
- **RAM:** 256GB DDR5 ECC
- **GPU:** 2x NVIDIA RTX 6000 Ada (48GB each = 96GB total)
- **Storage:** 2TB NVMe Gen5 (models) + 4TB Gen4 (datasets)
- **OS:** Ubuntu 24.04 LTS Server
- **AI Models:** DeepSeek-V3 671B (Q4), Qwen2.5-72B, Mixtral 8x22B
- **Cost:** €22,210 total
- **ROI:** ~10 months vs cloud (€2,210/month equivalent)

## GPU Comparison (Node4)

| Spec | H100 1x | RTX 6000 Ada 2x | Winner |
|------|---------|-----------------|--------|
| Cost | €25,000 | €13,600 | **6000 Ada (-46%)** |
| VRAM | 80GB | 96GB | **6000 Ada (+20%)** |
| FP8 native | ✅ Yes | ❌ No | H100 |
| DeepSeek-V3 Q4 | 25 tok/s | 20 tok/s | H100 (+25%) |
| Dual-instance | ❌ No | ✅ Yes | **6000 Ada** |
| Break-even | 13 mo | 10 mo | **6000 Ada** |

**Decision:** 2x RTX 6000 Ada recommended for better ROI and flexibility.

## AI Models by Node

| Model | Params | Node1 | Node2 | Node3 | Node4 |
|-------|--------|-------|-------|-------|-------|
| Llama 3.2:3b | 3B | ✅ 40 t/s | ✅ 60 t/s | ✅ 50 t/s | ✅ 80 t/s |
| Qwen2-57B MoE | 57B (14B active) | ✅ 12 t/s | ❌ | ❌ | ✅ 35 t/s |
| K2-Think 32B MoE | 32B (8B active) | ❌ | ✅ 30 t/s | ✅ 25 t/s | ✅ 50 t/s |
| DeepSeek-V3 | 671B (37B active) | ❌ | ❌ | ❌ | ✅ 22 t/s |
| Qwen2.5-72B | 72B | ❌ | ❌ | ❌ | ✅ 30 t/s |

## Network Topology

```
Internet (1Gbps Fiber)
        │
   [WiFi Router]
        │
  ┌─────┼─────────┐
  │     │         │
Node1 Node2    Node3   Node4*
(WiFi) (WiFi) (Ethernet) (10GbE*)

* = Proposed
```

## Upgrades & Maintenance

### Node3 (NERAL-MSI)
- **Possible:** RAM 32GB → 64GB (+€120)
- **Possible:** GPU RTX 3050 → RTX 4060/4070
- **Life:** 6-8 years with upgrades

### Node4 (Threadripper)
- **RAM:** Expandable to 2TB (8 slots)
- **GPU:** Up to 7 GPUs (7x PCIe 5.0 slots)
- **Life:** 10+ years (professional platform)

## Power Consumption

```yaml
Node1: ~5W idle, 15W load (battery)
Node2: ~15W idle, 65W max load  
Node3: ~80W idle, 400W full load (24/7) ≈ €60/month
Node4: ~150W idle, 1000W+ full load (on-demand) ≈ €60/month

Total infrastructure: ~€120/month electricity
Cloud equivalent: €2,210/month 
**Savings: 94%**
```

## Sources

- [OnePlus 13 Specs](https://www.oneplus.com/es/13)
- [ASUS UM5606W](https://www.asus.com/laptops/for-home/zenbook/zenbook-s-16-um5606/)
- [AMD Threadripper PRO](https://www.amd.com/en/products/processors/workstations/ryzen-threadripper.html)
- [NVIDIA RTX 6000 Ada](https://www.nvidia.com/en-us/design-visualization/rtx-6000/)
- [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3)

---

**Maintained by:** Holobionte 1rec3  
**License:** MIT  
**Last review:** 2025-11-08
