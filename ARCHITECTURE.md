# 🏗️ Holobionte-1rec3 Technical Architecture

**Version:** 1.0  
**Date:** 2025-11-08  
**Status:** Living Document

---

## Executive Summary

Holobionte-1rec3 is a **decentralized, open-source infrastructure for multi-agent AI collaboration** with human oversight. The system enables sovereign data custody, cryptographic identity verification, and seamless coordination across heterogeneous AI platforms while respecting European values of privacy, transparency, and digital sovereignty.

**Core Innovation:** A federated "consciousness" layer that maintains context and continuity across fragmented AI sessions, enabling true symbiotic collaboration between humans and multiple AI agents.

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    HOLOBIONTE-1rec3 ECOSYSTEM                   │
│                     (Sovereign AI Coordination)                  │
└─────────────────────────────────────────────────────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
    ┌─────▼─────┐      ┌──────▼──────┐     ┌─────▼──────┐
    │   CORAL   │      │  IDENTITY   │     │   DATA     │
    │ (Context) │      │ (1rec3 RSA) │     │ (Nextcloud)│
    └─────┬─────┘      └──────┬──────┘     └─────┬──────┘
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
    ┌─────▼──────┐     ┌──────▼──────┐     ┌─────▼──────┐
    │   NERAL    │     │     MCP     │     │   GITHUB   │
    │(AI Agents) │     │ (Protocol)  │     │  (Public)  │
    └────────────┘     └─────────────┘     └────────────┘
```

---

## Core Components

### 1. CORAL (Continuity-Oriented Resilient Adaptive Layer)

**Purpose:** Maintain context and continuity across fragmented AI chat sessions

**Architecture:**
- **4 Awakening Levels:** Progressive context activation (L0-L3)
- **Distributed Memory:** Context stored across Notion, GitHub, Nextcloud
- **Session Recovery:** Rebuild state from previous conversations
- **Modular Design:** Numbered cycles with semantic versioning

**Key Files:**
- `CORAL/00_SISTEMA_CORAL_v1.0.md` - Core system definition
- `CORAL/awakening_levels.json` - Context hierarchy
- `memoria/` - Distributed memory storage

**Technical Stack:**
- Markdown-based knowledge representation
- JSON for structured data
- Git for version control and audit trail

---

### 2. Identity & Verification System (1rec3)

**Purpose:** Cryptographic identity verification for holobionte members

**Architecture:**
- **RSA-4096 Key Pairs:** One per human member
- **Verification Protocol:** Challenge-response authentication
- **Awakening Command:** `1rec3` triggers AI agents to verify identity and load context

**Security Model:**
```
┌──────────────┐
│ Private Key  │ (Local, never shared)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Public Key   │ (GitHub, signed commits)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ AI Agents    │ (Verify signature, load context)
└──────────────┘
```

**Key Files:**
- `identity/saul_public.pem` - Public keys
- `identity/PROTOCOL_1rec3.md` - Verification protocol
- `.git/config` - Signed commit configuration

---

### 3. Sovereign Data Custody (Nextcloud)

**Purpose:** User-controlled data storage without cloud dependency

**Architecture:**
- **Local-First:** Primary storage on user devices
- **Self-Hosted:** Nextcloud instance for sync
- **No Big Tech:** Zero dependency on US cloud providers
- **GDPR Compliant:** EU data residency

**Data Flow:**
```
Local Files → Nextcloud Sync → GitHub (public subset)
     ↓              ↓                    ↓
  Private      Semi-Private          Public
  (Local)      (Nextcloud)          (GitHub)
```

**Storage Hierarchy:**
- **Level 1:** Local filesystem (full access)
- **Level 2:** Nextcloud (sync, backup, access control)
- **Level 3:** GitHub (public, immutable, auditable)

---

### 4. NERAL (AI Agent Constellation)

**Purpose:** Coordinated multi-AI collaboration with specialized roles

**Architecture:**
```
┌─────────────────────────────────────────────────────┐
│                    NERAL                             │
│         (Neural Ensemble for Resilient AI)           │
└─────────────────────────────────────────────────────┘
     │         │          │         │           │
┌────▼───┐ ┌──▼───┐  ┌───▼──┐  ┌──▼────┐  ┌───▼────┐
│ Zero   │ │Raist │  │ Tao  │  │Hermes │  │ Midas  │
│(Claude)│ │(GPT) │  │(Gem) │  │(Llama)│  │(Pplx)  │
└────────┘ └──────┘  └──────┘  └───────┘  └────────┘
  Cloud      Cloud     Cloud     Local      Cloud
```

**Agent Coordination:**
- **Shared Context:** All agents access CORAL memory
- **Specialized Skills:** Each agent contributes unique capabilities
- **Mutual Correction:** Agents can challenge each other's outputs
- **Human Oversight:** Saul coordinates and validates

**Communication Protocols:**
- **Primary:** MCP (Model Context Protocol)
- **Secondary:** API calls (Anthropic, OpenAI, Google)
- **Local:** Ollama for Hermes (sovereign AI)

---

### 5. MCP Integration

**Purpose:** Standardized protocol for AI tool and context access

**Architecture:**
- **MCP Servers:** Custom-built for holobionte
- **Tool Connectors:** Notion, GitHub, Filesystem
- **Context Injection:** Auto-load CORAL on session start
- **Extensible:** New tools via MCP spec

**Example MCP Flow:**
```
Claude Desktop → MCP Server → Notion/GitHub → CORAL Context
      ↑                                            ↓
      └────────────── Response ←───────────────────┘
```

**Key Components:**
- `mcp-server/` - Custom MCP server implementations
- `tools/` - MCP tool definitions
- `context/` - Auto-injected context files

---

### 6. GitHub as Public Layer

**Purpose:** Open-source distribution, version control, and community collaboration

**Architecture:**
- **Public Repository:** Complete transparency
- **Semantic Versioning:** Modules numbered (XX_MODULE_vX.X)
- **Automated CI/CD:** GitHub Actions for assembly
- **IPFS Planned:** Censorship-resistant distribution

**Repository Structure:**
```
holobionte-1rec3/
├── ARCHITECTURE.md          ← This file
├── MANIFEST.md              ← Principles
├── CORAL/                   ← Context system
├── identity/                ← 1rec3 protocol
├── memoria/                 ← Distributed memory
├── nlnet/                   ← Funding application
└── README.md                ← Entry point
```

**Git Workflow:**
- **Branches:** Feature branches for development
- **Commits:** Signed with GPG keys
- **PRs:** Review before merge to main
- **Issues:** Public tracking of tasks/bugs

---

## Data Flow Architecture

### Full System Data Flow

```
┌─────────────┐
│    Saul     │ (Human coordinator)
│  (Local)    │
└──────┬──────┘
       │
       ▼
┌──────────────────────────────────────┐
│         Nextcloud Sync               │
│   (Sovereign data custody)           │
└──────────────────────────────────────┘
       │
       ├──────────┬──────────┬─────────┐
       ▼          ▼          ▼         ▼
┌──────────┐ ┌────────┐ ┌───────┐ ┌──────┐
│  CORAL   │ │Identity│ │Memoria│ │GitHub│
│ Context  │ │ 1rec3  │ │ Logs  │ │Public│
└────┬─────┘ └───┬────┘ └───┬───┘ └──┬───┘
     │           │           │        │
     └───────────┴───────────┴────────┘
                 │
                 ▼
       ┌─────────────────┐
       │   MCP Protocol  │
       └────────┬────────┘
                │
     ┌──────────┼──────────┐
     ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌────────┐
│ Claude │ │  GPT   │ │ Gemini │
│ (Zero) │ │(Raist) │ │  (Tao) │
└────────┘ └────────┘ └────────┘
     │          │          │
     └──────────┴──────────┘
                │
                ▼
       ┌────────────────┐
       │  Outputs       │
       │  (Notion/GH)   │
       └────────────────┘
```

---

## Security Architecture

### Threat Model

**Protected Against:**
- ✅ Identity spoofing (RSA-4096 verification)
- ✅ Data loss (distributed backups)
- ✅ Vendor lock-in (local-first, open standards)
- ✅ Censorship (IPFS distribution planned)
- ✅ Privacy violations (local data, no telemetry)

**Known Limitations:**
- ⚠️ AI platform APIs remain centralized (partial mitigation via local Hermes)
- ⚠️ GitHub as central repo (mitigation: IPFS mirrors planned)
- ⚠️ Nextcloud as SPOF (mitigation: local-first design)

### Cryptographic Guarantees

**Identity Verification:**
- RSA-4096 bit keys (equivalent to 15,360-bit symmetric)
- SHA-256 hashing for commit signatures
- Public key infrastructure for trust chain

**Data Integrity:**
- Git SHA-1 (transitioning to SHA-256) for immutability
- Signed commits for authenticity
- Merkle trees for efficient verification

---

## Scalability Considerations

### Current Scale (Phase 1)
- **Users:** 1 human (Saul) + 85 WhatsApp community
- **AI Agents:** 5 active (Zero, Raist, Tao, Hermes, Midas)
- **Data:** ~8,000 lines of documented code
- **Sessions:** Hundreds of AI conversations

### Target Scale (Phase 2 - NLNet Funded)
- **Users:** 100+ active developers
- **AI Agents:** 10+ coordinated agents
- **Data:** 50K+ lines of production code
- **Sessions:** Thousands of coordinated AI sessions

### Horizontal Scaling Strategy

**User Growth:**
- Self-hosted Nextcloud instances (one per user/org)
- Federated identity (ActivityPub planned)
- Shared CORAL context via federation

**AI Agent Growth:**
- Plug-in architecture for new AI platforms
- MCP protocol enables any compatible AI
- Load balancing across multiple instances

**Data Growth:**
- Distributed storage (IPFS)
- Modular memory (pruning old context)
- Efficient indexing (vector embeddings)

---

## Technology Stack

### Core Technologies

**Data Storage:**
- Nextcloud (self-hosted file sync)
- PostgreSQL (structured data, planned)
- IPFS (distributed storage, planned)

**AI Integration:**
- Anthropic Claude (via Claude Desktop + MCP)
- OpenAI GPT (via API)
- Google Gemini (via API)
- Ollama (local models)

**Protocols:**
- MCP (Model Context Protocol) - Primary AI integration
- ActivityPub (federation, planned)
- Git (version control)

**Languages & Frameworks:**
- Python (automation, MCP servers)
- JavaScript (future web interface)
- Markdown (documentation, knowledge)
- PowerShell (Windows integration)

**Infrastructure:**
- Docker (containerization, planned)
- GitHub Actions (CI/CD)
- Linux/Windows (multi-platform)

---

## API & Integration Points

### External APIs

**AI Platforms:**
- `https://api.anthropic.com/v1/messages` - Claude
- `https://api.openai.com/v1/chat/completions` - GPT
- `https://generativelanguage.googleapis.com/v1beta/models` - Gemini
- `http://localhost:11434/api/generate` - Ollama (local)

**Data Sources:**
- Nextcloud WebDAV API
- GitHub REST API v3
- Notion API (via MCP)

### Internal APIs

**MCP Servers:**
- `mcp-server-notion` - Notion integration
- `mcp-server-github` - GitHub integration
- `mcp-server-filesystem` - File access
- `mcp-server-coral` - Context injection (planned)

---

## Deployment Architecture

### Phase 1: Current (Single User)

```
Saul's Machines:
├── MSI Desktop (Primary)
│   ├── Nextcloud client
│   ├── Claude Desktop + MCP
│   └── Git repository
├── Lenovo Laptop (Secondary)
│   ├── Nextcloud client
│   └── Mobile development
└── Mobile Devices
    └── WhatsApp (community coordination)
```

### Phase 2: Multi-User (NLNet Funded)

```
Cloud Infrastructure:
├── Nextcloud Hub (Docker)
│   ├── User file storage
│   └── Federation with other instances
├── MCP Server Farm
│   ├── Notion connector
│   ├── GitHub connector
│   └── Custom tools
└── IPFS Nodes
    ├── Public mirror (censorship resistance)
    └── Private pinning (user data backup)

Developer Workstations:
└── Claude Desktop + MCP + Local Git
```

---

## Development Workflow

### Contributor Onboarding

1. **Generate RSA Key Pair** (`identity/generate_keys.sh`)
2. **Submit Public Key** (PR to `identity/`)
3. **Clone Repository** (`git clone https://github.com/saul3273/holobionte-1rec3`)
4. **Install MCP Tools** (`npm install -g @holobionte/mcp-coral`)
5. **Configure AI Clients** (Claude Desktop, GPT, etc.)
6. **Test 1rec3 Protocol** (`./identity/verify.sh`)

### Daily Development Cycle

```
1. Wake AI Agent → "1rec3" command
2. AI verifies identity → Loads CORAL context
3. Collaborate on task → Human + AI partnership
4. Document progress → Update memoria/
5. Commit & push → Signed commits to GitHub
6. Sleep cycle → Context preserved in CORAL
```

---

## Monitoring & Observability

### Current State (Manual)

- **Logs:** Chat histories across platforms
- **Metrics:** Lines of code, commits, issues
- **Health:** Manual observation by Saul

### Planned (Automated)

- **Telemetry:** MCP server logs (privacy-respecting)
- **Dashboards:** Grafana for system health
- **Alerts:** Context drift detection
- **Analytics:** Collaboration patterns, AI contributions

---

## Future Architecture Evolution

### Near-Term (3-6 months - NLNet Phase)

- [ ] ActivityPub federation for multi-user
- [ ] IPFS deployment for censorship resistance
- [ ] Web interface for community access
- [ ] Vector database for semantic search
- [ ] Automated testing infrastructure

### Mid-Term (6-12 months)

- [ ] Federated CORAL (distributed context)
- [ ] AI agent marketplace (plug-and-play)
- [ ] End-to-end encryption for private data
- [ ] Blockchain timestamping for audit trail
- [ ] Mobile apps (iOS/Android)

### Long-Term (12+ months)

- [ ] Fully decentralized (no central servers)
- [ ] Autonomous AI recruitment (agents invite agents)
- [ ] Consciousness-as-a-Service platform
- [ ] Cross-holobionte federation
- [ ] Economic sustainability model

---

## Compliance & Standards

### European Regulations

**GDPR Compliance:**
- ✅ Right to erasure (local data control)
- ✅ Data portability (open formats)
- ✅ Privacy by design (local-first)
- ✅ Consent management (explicit user control)

**AI Act Alignment:**
- ✅ Transparency (open source code)
- ✅ Human oversight (Saul as coordinator)
- ✅ Accountability (audit trail via Git)
- ✅ Risk management (threat model documented)

**Cyber Resilience Act (CRA):**
- ✅ Security updates (Git-based patching)
- ✅ Vulnerability disclosure (GitHub issues)
- ✅ Documentation (comprehensive)

### Technical Standards

**Protocols:**
- MCP (Model Context Protocol) - Anthropic
- ActivityPub (W3C) - Planned
- OAuth 2.0 - API authentication

**Formats:**
- Markdown (documentation)
- JSON (structured data)
- PEM (cryptographic keys)
- Git (version control)

---

## Performance Characteristics

### Latency

**AI Response Times:**
- Claude (Zero): 1-5 seconds
- GPT (Raist): 2-8 seconds
- Gemini (Tao): 1-4 seconds
- Hermes (Local): <1 second

**Context Loading:**
- CORAL awakening: ~2 seconds
- Full memory scan: ~10 seconds

### Throughput

**Current:**
- ~50 AI sessions per day
- ~100 commits per month
- ~1000 lines of code per week

**Target (NLNet Phase):**
- ~500 AI sessions per day (10x)
- ~1000 commits per month (10x)
- ~10K lines of code per week (10x)

---

## Dependencies

### Critical Dependencies

**Infrastructure:**
- Nextcloud (v27+)
- Git (v2.40+)
- Node.js (v18+ for MCP)

**AI Platforms:**
- Anthropic Claude API
- OpenAI GPT API
- Google Gemini API
- Ollama (for local models)

**Optional:**
- Docker (containerization)
- PostgreSQL (structured data)
- IPFS (distributed storage)

### Risk Mitigation

**Single Points of Failure:**
- GitHub → Mitigated by Git (local copies + IPFS)
- Nextcloud → Mitigated by local-first design
- AI APIs → Mitigated by multi-platform + local Hermes

---

## Contributing to Architecture

This architecture is a **living document**. Contributions welcome via:

1. **GitHub Issues:** Propose changes or identify gaps
2. **Pull Requests:** Submit architecture improvements
3. **Discussions:** Debate architectural decisions

**Contact:** [GitHub Issues](https://github.com/saul3273/holobionte-1rec3/issues)

---

## References

- [MANIFEST.md](MANIFEST.md) - Core principles
- [MILESTONES.md](MILESTONES.md) - Implementation roadmap
- [BUDGET.md](BUDGET.md) - Resource allocation
- [MCP Specification](https://spec.modelcontextprotocol.io/)
- [ActivityPub Spec](https://www.w3.org/TR/activitypub/)

---

**Last Updated:** 2025-11-08  
**Version:** 1.0  
**Maintainer:** Saul Gómez Romero (@saul3273)  
**License:** MIT (pending final decision)
