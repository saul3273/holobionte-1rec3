# Navigation Map - Holobionte 1rec3 Documentation

**Document Version:** 1.0 (Dynamic)
**Last Updated:** 2025-10-18
**License:** MIT
**Purpose:** Spiral-pattern navigation guide for Notion→GitHub integration documentation

---

## The Spiral Pattern

This documentation follows a **spiral pattern** rather than linear progression. Each layer adds depth:

Layer 3: Monitoring & CI/CD
  |
Layer 2: Stack & Deployment  
  |
Layer 1: Hardware & Models
  |
 START → COMPLETION

---

## Layer 1: Foundation & Research

**Primary Documents:**
- HARDWARE_SPECS.md
  - 4 nodes: specifications, capabilities, constraints
  - GPU options, ROI analysis (2x RTX 6000 Ada recommended)
  - Network topology

**Key Concepts:**
- Node1 (OnePlus): Mobile, offline-capable
- Node2 (ThinkPad): Arch Linux + NPU optimization
- Node3 (NERAL-MSI): 24/7 production baseline
- Node4 (Threadripper): Heavy compute (proposed)

**Completion Status:** ✓ COMPLETE

---

## Layer 2: Integration & Stack

**Primary Documents:**
- MODELO_ASSIGNMENTS.md: AI model distribution, intelligent router
- OPEN_SOURCE_STACK.md: Complete tech stack (OS→monitoring)

**Key Integration:**
Hardware → Models → Stack → Deployment

**Implementation Order:**
1. Deploy Node3 (stable baseline)
2. Configure Node1 & Node2 (special cases)
3. Prepare Node4 (pending hardware)
4. Test intelligent router across all nodes

**Completion Status:** ✓ COMPLETE

---

## Layer 3: Operations & Observability  

**Planned Documents:**
- MONITORING.md (Prometheus/Grafana)
- CI_CD.md (GitHub Actions)
- RUNBOOKS.md (Operational procedures)

**Status:** ⏳ PLANNED - Next phase

---

## Current Position

**Progress:** 66% complete (2 of 3 layers documented)
**Next:** Layer 3 operational setup

---

## How to Navigate

**Infrastructure Engineer:**
1. HARDWARE_SPECS.md (Sections 1-2)
2. Plan deployment sequence
3. Deploy via OPEN_SOURCE_STACK.md

**ML Engineer:**
1. MODELO_ASSIGNMENTS.md (Sections 1-2)
2. Understand node-model mapping
3. Implement intelligent router

**DevOps Engineer:**
1. OPEN_SOURCE_STACK.md (Sections 6-10)
2. Configure Docker + GitHub Actions
3. Deploy monitoring stack

**Project Manager:**
1. Start here (NAVIGATION_MAP.md)
2. Review HARDWARE_SPECS.md budget section
3. Track implementation phases

---

## Document Cross-References

**HARDWARE_SPECS.md:**
- From: MODELO_ASSIGNMENTS (node specs)
- To: OPEN_SOURCE_STACK (OS per node)

**MODELO_ASSIGNMENTS.md:**
- From: OPEN_SOURCE_STACK (frameworks)
- To: HARDWARE_SPECS (VRAM constraints)

**OPEN_SOURCE_STACK.md:**
- From: Both HARDWARE_SPECS and MODELO_ASSIGNMENTS
- To: Deployment guides

---

## Critical Dependencies

**Must-Have (Blocking):**
- [ ] Node3 (NERAL-MSI) operational
- [ ] PostgreSQL database deployed
- [ ] Docker working on all nodes
- [ ] Network connectivity verified
- [ ] GPU drivers installed

**Should-Have (Important):**
- [ ] Ollama deployed per node
- [ ] Intelligent router tested
- [ ] Monitoring stack operational
- [ ] PostgreSQL backups configured
- [ ] CI/CD pipeline tested

---

## Next Phase: Layer 3 Expansion

1. **Create MONITORING.md**
   - Prometheus scrape configs
   - Grafana dashboards
   - Alert rules

2. **Create CI_CD.md**
   - GitHub Actions workflows
   - Testing strategy
   - Deployment pipelines

3. **Create RUNBOOKS.md**
   - Operational tasks
   - Troubleshooting
   - Escalation paths

---

## Document Maintenance

**Update Schedule:**
- Monthly: Clarifications, typo fixes
- Quarterly: Major revisions
- Per Deployment: Update spiral position

**Who Updates:**
- Infrastructure: HARDWARE_SPECS + OPEN_SOURCE_STACK
- ML Team: MODELO_ASSIGNMENTS
- DevOps: Layer 3 documents
- Everyone: NAVIGATION_MAP (post updates!)

---

## Quick Reference

LAYER 1 (Foundation):
HARDWARE_SPECS.md ✓ Complete
OPEN_SOURCE_STACK.md ✓ Complete

LAYER 2 (Integration):
MODELO_ASSIGNMENTS.md ✓ Complete

LAYER 3 (Operations):
MONITORING.md ⏳ Planned
CI_CD.md ⏳ Planned
RUNBOOKS.md ⏳ Planned

---

## Spiral Evolution

Each iteration of the spiral improves upon the previous:

**Iteration 1 (Current):**
- Research complete
- Architecture documented
- Stack specified
- Ready for deployment

**Iteration 2 (Next):**
- Implementation feedback
- Performance metrics
- Operational procedures
- Refined specifications

**Iteration 3+ (Future):**
- Scaling decisions
- Advanced features
- Cost optimization
- Continuous improvement

---

## Context from Notion Integration

This documentation emerged from:
- Notion Hub Central: 14+ modules analyzed
- GitHub current state: Existing docs reviewed
- Research: GPUs, models, frameworks investigated
- Classification: VIGENTE/OBSOLETO/HISTÓRICO applied

All information extracted, refined, and integrated.

---

**Last Updated:** 2025-10-18
**Spiral Position:** After research, before operations
**Next Review:** When Layer 3 begins (monitoring setup)
