# Open Source Stack - Holobionte 1rec3

**Document Version:** 1.0
**Last Updated:** 2025-10-18
**License:** MIT
**Purpose:** Complete open-source technology stack for 4-node distributed AI infrastructure

## Executive Summary

The Holobionte 1rec3 project uses exclusively open-source software to maintain philosophy alignment, cost efficiency, and operational independence.

## Part 1: Operating System Layer

### Nodo 1 (OnePlus Tablet)
- **OS:** Android 13+ (LineageOS 21+)
- **Container Runtime:** Podman (via Termux)
- **Package Manager:** Pkg (Termux)
- **Rationale:** LineageOS removes Google services; Termux provides Linux environment
- **Key Packages:** python3, git, openssh-server

### Nodo 2 (Lenovo ThinkPad)
- **OS:** Arch Linux (minimal installation)
- **Kernel:** linux-zen (low-latency for AI inference)
- **Package Manager:** pacman
- **Rationale:** Bleeding-edge packages for NPU drivers; minimal overhead
- **NPU Support:** AMD XDNA 2 drivers, KTransformers, rocm-core

### Nodo 3 (NERAL-MSI)
- **OS:** Debian 12 Bookworm or Ubuntu 24.04 LTS
- **Kernel:** linux-generic (stable for 24/7 production)
- **Package Manager:** apt
- **Rationale:** Debian stability for mission-critical uptime
- **GPU Drivers:** NVIDIA CUDA 12.x, cuDNN 9.x

### Nodo 4 (Threadripper)
- **OS:** Arch Linux or Ubuntu 24.04 LTS (pending allocation)
- **Kernel:** linux-zen (low-latency priority)
- **GPU Setup:** Dual RTX 6000 Ada driver configuration

---

## Part 2: Containerization

### Docker & Docker Compose
- **License:** Apache 2.0 (Moby)
- **Usage:** Microservices for Ollama, database, API gateway
- **Compose File:** `/etc/docker-compose/holobionte.yml`

### Podman
- **License:** Apache 2.0
- **Advantages:** Daemonless; simpler systemd integration
- **Primary on:** Nodo 1 (Termux); optional on Nodo 2

---

## Part 3: Databases & Storage

### PostgreSQL 16+
- **License:** PostgreSQL License (permissive OSS)
- **Purpose:** Primary relational database for state management
- **Deployment:** Docker container on Nodo 3 (24/7 availability)
- **Features:** JSONB support, full-text search, vector extensions (pgvector)
- **Backup:** Daily encrypted backups to Nextcloud

### SQLite 3.44+
- **License:** Public Domain
- **Purpose:** Lightweight local database on Nodo 1 & 2
- **Use Case:** Offline operation, cached model metadata
- **Sync:** Syncthing to PostgreSQL on Nodo 3

### Redis 7.2+
- **License:** Redis Source Available (compatible with FLOSS)
- **Purpose:** Caching layer, session management
- **Deployment:** Container on Nodo 3 (in-memory, 8GB allocation)
- **Persistence:** AOF (Append-Only File) for durability

---

## Part 4: AI/ML Frameworks

### Ollama (0.3+)
- **License:** MIT
- **Purpose:** Local LLM serving engine
- **Deployment:** Container on each node
- **Models:** Qwen2-57B MoE, K2-Think-32B, DeepSeek-V3 (Nodo 4 only)

### llama.cpp
- **License:** MIT
- **Purpose:** High-performance C++ inference engine
- **Usage:** Fallback on Nodo 1 for lightweight models
- **Optimization:** Quantization (Q4_K_M) for mobile efficiency

### KTransformers
- **License:** Apache 2.0
- **Purpose:** GPU-CPU co-inference with NPU offloading
- **Deployment:** Nodo 2 only (AMD XDNA 2 specific)
- **Model:** K2-Think-32B with KTransformers backend

### LM Studio (Optional)
- **License:** Proprietary (UI wrapper around OSS models)
- **Alternative:** Use Ollama web UI instead (100% OSS)

---

## Part 5: Development & Automation Tools

### Node.js & npm
- **License:** MIT (Node), NPM License
- **Version:** 20 LTS
- **Usage:** Backend API, orchestration scripts

### Python 3.11+
- **License:** PSF (Python Software Foundation)
- **Packages (OSS):**
  - `fastapi` (MIT): Web framework
  - `pydantic` (MIT): Data validation
  - `httpx` (BSD): Async HTTP client
  - `sqlalchemy` (MIT): ORM
  - `psycopg2` (BSD): PostgreSQL adapter
  - `redis` (MIT): Redis client
  - `prometheus_client` (Apache 2.0): Metrics

### Git & GitHub
- **License:** GPL v2
- **Usage:** Version control, CI/CD workflows
- **Repository:** github.com/1rec3/holobionte-1rec3

### n8n (Optional Workflow Automation)
- **License:** Apache 2.0 / Elastic License (source available)
- **Purpose:** No-code workflow orchestration
- **Deployment:** Docker container on Nodo 3
- **Workflows:** Model routing, health checks, data sync

---

## Part 6: Browser Automation

### Playwright
- **License:** Apache 2.0
- **Purpose:** Browser automation for web scraping & testing
- **Deployment:** Python package via pip
- **Browsers:** Chromium (open-source), Firefox
- **Usage:** Test CORAL interface, automation workflows

### Selenium 4+
- **License:** Apache 2.0
- **Purpose:** Legacy browser automation (if needed)
- **Recommendation:** Prefer Playwright for modern projects

---

## Part 7: Monitoring & Observability

### Prometheus 2.48+
- **License:** Apache 2.0
- **Purpose:** Metrics collection from all nodes
- **Retention:** 30 days (configurable)
- **Scrape Interval:** 30 seconds
- **Deployment:** Container on Nodo 3

### Grafana 10.x+
- **License:** AGPL v3 (community) / Grafana Cloud (commercial)
- **Purpose:** Visualization of Prometheus metrics
- **Dashboards:**
  - Node availability (uptime %)
  - Model performance (tokens/sec)
  - GPU utilization per node
  - Request routing distribution
  - Latency percentiles (p50, p95, p99)
- **Deployment:** Container on Nodo 3

### Loki (Optional)
- **License:** AGPL v3
- **Purpose:** Log aggregation across all nodes
- **Alternative:** ELK Stack (Elasticsearch + Logstash + Kibana, also OSS)

---

## Part 8: Networking & Security

### mTLS (Mutual TLS)
- **Certificate Generator:** OpenSSL (Public Domain)
- **Purpose:** Secure inter-node communication
- **Implementation:** Container registry authentication, API endpoints

### VPN/Tunneling
- **WireGuard** (MIT): Lightweight VPN for Nodo 1 remote access
- **Syncthing** (MPL 2.0): Secure peer-to-peer sync

### Firewall
- **iptables** (GPL v2): Built-in Linux firewall rules
- **UFW** (GPL v3): Simplified firewall on Ubuntu nodes
- **Nodo1 Security:** SSH tunnel for remote access only

---

## Part 9: Container Registry & Image Management

### Docker Hub (Public) + Registry (Self-hosted)
- **Purpose:** Store built container images
- **Approach:** Use GitHub Container Registry (ghcr.io) for private images
- **Access:** GitHub PAT (Personal Access Token) authentication

### Image Optimization
- **Multi-stage builds:** Minimize final image size
- **Base Images:** Alpine Linux (minimal OSS base)
- **Security:** Regular image scanning with Trivy (OSS)

---

## Part 10: CI/CD Pipeline

### GitHub Actions
- **License:** Proprietary (but free for OSS)
- **Purpose:** Automated testing and deployment
- **Workflows:**
  - Test PR changes (unit + integration tests)
  - Build and push container images
  - Deploy to staging on Nodo 3
  - Run inference tests on all models

### Quality Assurance
- **Testing Framework:** pytest (MIT)
- **Code Quality:** pylint (GPL v2), black (MIT)
- **Type Checking:** mypy (MIT)

---

## Installation & Deployment Guide

### Quick Start (All Nodes)
```bash
# Update package manager
# Debian/Ubuntu:
sudo apt update && sudo apt upgrade -y

# Arch:
sudo pacman -Syu

# Install core tools
sudo apt install -y git curl wget docker.io python3-pip  # Debian
sudo pacman -S git curl wget docker python-pip  # Arch

# Clone repository
git clone https://github.com/1rec3/holobionte-1rec3.git
cd holobionte-1rec3

# Deploy via Docker Compose
docker-compose -f docker-compose.yml up -d
```

### Nodo 1 (Termux) Setup
```bash
pkg install -y python git openssh
cd storage/downloads
git clone https://github.com/1rec3/holobionte-1rec3.git
# Run locally without Docker (use native Python + llama.cpp)
```

---

## License Compliance Matrix

| Component | License | Copyleft? | Commercial Use? |
|-----------|---------|-----------|----------|
| Debian/Ubuntu | GPL v2 | Yes | Yes |
| Arch Linux | GPL v2 | Yes | Yes |
| PostgreSQL | PostgreSQL | No | Yes |
| Redis | Redis SA | Partial | Yes |
| Docker/Moby | Apache 2.0 | No | Yes |
| Ollama | MIT | No | Yes |
| Prometheus | Apache 2.0 | No | Yes |
| Grafana | AGPL v3 | Yes | Yes* |
| Playwright | Apache 2.0 | No | Yes |
| Python | PSF | No | Yes |

*Grafana community edition (self-hosted) is free; cloud service is commercial.

---

## Version Pinning & Updates

### Stable Release Schedule
- **Monthly:** OS patches (apt dist-upgrade)
- **Quarterly:** Major framework updates (breaking changes reviewed)
- **Continuous:** Security patches (immediate deployment)

### Testing
- **Staging Deployment:** Nodo 3 (before production)
- **Canary Testing:** 10% of Nodo 4 requests to new models
- **Rollback Strategy:** Keep n-1 version in separate container

---

## Next Steps

1. Deploy core services (Docker, PostgreSQL, Redis) on Nodo 3
2. Configure monitoring (Prometheus + Grafana)
3. Set up model serving (Ollama containers per node)
4. Implement intelligent router (MODELO_ASSIGNMENTS.md)
5. Deploy browser automation (Playwright for testing)
6. Monitor system health and adjust resource allocation
