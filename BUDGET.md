# 💰 Holobionte-1rec3 Budget Breakdown

**Version:** 1.0  
**Date:** 2025-11-08  
**Funding Source:** NGI0 Commons Fund  
**Total Request:** €50,000  
**Duration:** 6 months (Dec 2025 - May 2026)

---

## Executive Summary

This budget supports the development of **holobionte-1rec3** from prototype to production-ready infrastructure for sovereign, multi-AI collaboration. Funds will be allocated across 6 milestones with emphasis on **technical development (60%)**, **security & testing (20%)**, **community building (15%)**, and **infrastructure (5%)**.

**Value Proposition:** €50K investment enables 100+ developers to deploy sovereign AI infrastructure, challenging US Big Tech monopoly on AI collaboration tools.

---

## Budget Overview

| Category | Amount | % of Total |
|----------|--------|------------|
| **Development** | €30,000 | 60% |
| **Security & Testing** | €10,000 | 20% |
| **Community & Outreach** | €7,500 | 15% |
| **Infrastructure** | €2,500 | 5% |
| **TOTAL** | **€50,000** | **100%** |

---

## Milestone-Based Budget Allocation

| Milestone | Duration | Budget | Key Activities |
|-----------|----------|--------|----------------|
| M1: Foundation & Documentation | 2 months | €8,000 | Technical docs, MCP servers |
| M2: Federation & Identity | 2 months | €12,000 | ActivityPub, security audit |
| M3: Web Interface & Access | 2 months | €10,000 | React app, REST API |
| M4: IPFS & Decentralization | 2 months | €8,000 | IPFS, distributed CORAL |
| M5: Testing & Hardening | 1 month | €7,000 | Test suite, optimization |
| M6: Community & Launch | 1 month | €5,000 | Community, public launch |
| **TOTAL** | **6 months** | **€50,000** | |

---

## Detailed Work Package Breakdown

### Work Package 1: Core Development (€30,000)

#### WP1.1: Documentation & Developer Experience (€4,000)

**Effort:** 50 hours @ €80/hr

**Tasks:**
- Technical architecture documentation (15h)
- API reference guides (10h)
- Deployment & configuration guides (10h)
- Contributing guidelines (5h)
- Security documentation (5h)
- Tutorial videos (5h)

**Deliverables:**
- ARCHITECTURE.md, API_REFERENCE.md, DEPLOYMENT.md
- CONTRIBUTING.md, SECURITY.md
- 3-5 video tutorials

**Justification:**  
Comprehensive documentation is critical for open-source adoption. NLNet reviewers expect high-quality docs that enable community contributions without direct maintainer involvement.

---

#### WP1.2: MCP Server Infrastructure (€4,000)

**Effort:** 50 hours @ €80/hr

**Tasks:**
- mcp-server-coral (context injection) (15h)
- mcp-server-identity (1rec3 verification) (12h)
- mcp-server-holobionte (custom tools) (10h)
- Integration tests & CI/CD (8h)
- npm packaging & publishing (5h)

**Deliverables:**
- 3 npm packages: @holobionte/mcp-coral, mcp-identity, mcp-holobionte
- Test suite with 90%+ coverage
- GitHub Actions CI/CD

**Justification:**  
MCP protocol is emerging standard for AI tool integration. Building reusable MCP servers enables other projects to leverage our infrastructure.

---

#### WP1.3: ActivityPub Federation (€8,000)

**Effort:** 100 hours @ €80/hr

**Tasks:**
- ActivityPub server implementation (40h)
- Actor, Inbox, Outbox endpoints (15h)
- Federation protocol (following, followers) (15h)
- WebFinger discovery (5h)
- Interop testing with Mastodon (10h)
- Documentation & examples (15h)

**Deliverables:**
- ActivityPub-compliant server
- Federation with 2+ external instances
- Interop with Mastodon verified
- Federation guide published

**Justification:**  
ActivityPub enables decentralized social coordination without central servers. This aligns with EU digital sovereignty values and breaks dependency on US platforms.

---

#### WP1.4: Enhanced Identity System (€4,000)

**Effort:** 50 hours @ €80/hr

**Tasks:**
- Multi-user identity management (15h)
- Key generation & secure storage (10h)
- Delegation & temporary access tokens (8h)
- Key rotation & revocation (7h)
- Audit logging & verification trail (10h)

**Deliverables:**
- Multi-user identity system
- Key management tools
- Revocation infrastructure
- Audit log implementation

**Justification:**  
Robust identity management is foundational for trustless collaboration. RSA-4096 keys with proper key lifecycle management exceed industry standards.

---

#### WP1.5: Web Application Frontend (€7,000)

**Effort:** 87.5 hours @ €80/hr

**Tasks:**
- React + TypeScript setup (5h)
- UI/UX design (15h)
- CORAL memory viewer (15h)
- Multi-agent chat interface (20h)
- Identity management UI (12h)
- Accessibility implementation (WCAG 2.1 AA) (10h)
- Mobile responsiveness (5h)
- Internationalization (EN, ES) (5.5h)

**Deliverables:**
- Progressive Web App (PWA)
- Accessible (WCAG 2.1 AA compliant)
- Mobile-responsive
- Multilingual support

**Justification:**  
Non-technical users need web access to participate in holobionte. Accessibility ensures inclusion of users with disabilities (EU Accessibility Act compliance).

---

#### WP1.6: REST API & Client SDKs (€3,000)

**Effort:** 37.5 hours @ €80/hr

**Tasks:**
- FastAPI or Express backend (12h)
- OpenAPI specification (8h)
- Rate limiting & auth (OAuth 2.0) (7h)
- Webhook system (5h)
- JavaScript SDK (3h)
- Python SDK (2.5h)

**Deliverables:**
- RESTful API with OpenAPI docs
- Rate-limited, authenticated
- 2 client SDKs (JS, Python)

**Justification:**  
API-first design enables diverse client applications. Client SDKs lower barrier to entry for developers.

---

### Work Package 2: Decentralization & Resilience (€8,000)

#### WP2.1: IPFS Integration (€5,000)

**Effort:** 62.5 hours @ €80/hr

**Tasks:**
- IPFS node deployment (10h)
- Content addressing migration (15h)
- Pinning service (cluster setup) (12h)
- IPNS for mutable content (8h)
- HTTP gateway (7h)
- Monitoring & alerting (5h)
- Documentation (5.5h)

**Deliverables:**
- Self-hosted IPFS cluster (3+ nodes)
- Repository fully mirrored on IPFS
- Public gateway at ipfs.holobionte.org
- 99.9% uptime guarantee

**Justification:**  
IPFS provides censorship-resistant storage, eliminating GitHub as single point of failure. Critical for European digital sovereignty.

---

#### WP2.2: Distributed CORAL (€3,000)

**Effort:** 37.5 hours @ €80/hr

**Tasks:**
- CRDT research & selection (5h)
- Automerge or Yjs integration (12h)
- Sync protocol implementation (10h)
- Conflict resolution logic (5h)
- Performance optimization (3h)
- Testing & validation (2.5h)

**Deliverables:**
- CRDT-based CORAL
- P2P sync via WebRTC
- Conflict-free context merging

**Justification:**  
Distributed CORAL enables offline-first operation and removes Nextcloud as single point of failure. CRDTs ensure eventual consistency without central coordination.

---

### Work Package 3: Security & Quality Assurance (€10,000)

#### WP3.1: External Security Audit (€4,000)

**Vendor:** Independent security firm (TBD)

**Scope:**
- Identity system (RSA keys, verification)
- API authentication (OAuth 2.0)
- Data encryption (E2E for private data)
- Federation security (HTTP signatures)
- Web application (OWASP Top 10)

**Deliverables:**
- Security audit report (public summary)
- Vulnerability remediation plan
- Penetration test results
- Security best practices guide

**Justification:**  
External audit by independent security experts is standard for NGI0 projects handling sensitive data. Demonstrates commitment to security-by-design.

---

#### WP3.2: Comprehensive Testing (€4,000)

**Effort:** 50 hours @ €80/hr

**Tasks:**
- Unit test suite (Jest, pytest) (15h)
- Integration testing (E2E workflows) (12h)
- Load testing (k6 or Locust) (8h)
- Chaos engineering (failure injection) (5h)
- Security testing (OWASP ZAP) (5h)
- CI/CD integration (5h)

**Deliverables:**
- 95%+ code coverage
- Load test: 100 concurrent users
- Security scan: 0 high/critical vulns
- Automated testing in CI/CD

**Justification:**  
Rigorous testing ensures production-readiness. 95% coverage is industry best practice for critical infrastructure.

---

#### WP3.3: Performance Optimization (€2,000)

**Effort:** 25 hours @ €80/hr

**Tasks:**
- Database query optimization (8h)
- Redis caching layer (5h)
- CDN for static assets (3h)
- Code splitting & lazy loading (4h)
- Profiling & bottleneck analysis (5h)

**Deliverables:**
- <200ms API response time (p95)
- <2s web app initial load
- Support 100 concurrent users

**Justification:**  
Performance directly impacts user experience. Fast response times are competitive advantage over bloated proprietary tools.

---

### Work Package 4: Community & Outreach (€7,500)

#### WP4.1: Community Infrastructure (€3,000)

**Effort:** 37.5 hours @ €80/hr

**Tasks:**
- Documentation site (Hugo or Docusaurus) (8h)
- GitHub Discussions setup (2h)
- Matrix chat room (3h)
- Newsletter infrastructure (2h)
- Social media strategy (5h)
- Content creation (blog posts, videos) (12.5h)
- Community moderation guidelines (5h)

**Deliverables:**
- docs.holobionte.org
- Active discussion forum
- Matrix room for real-time support
- Monthly newsletter
- Code of conduct

**Justification:**  
Active community is essential for open-source sustainability. Diverse communication channels (forum, chat, newsletter) accommodate different user preferences.

---

#### WP4.2: Public Launch & Marketing (€2,000)

**Effort:** 25 hours @ €80/hr

**Tasks:**
- Press release & media outreach (5h)
- Conference talk submissions (FOSDEM, NGI events) (4h)
- Demo instances (sandbox deployment) (6h)
- Launch event (virtual meetup) (4h)
- Partnership outreach (3h)
- Blog posts & case studies (3h)

**Deliverables:**
- Press release to tech media
- 1+ conference talk accepted
- Public demo at demo.holobionte.org
- Virtual launch event
- 3+ blog posts

**Justification:**  
Strategic marketing amplifies impact. Targeting tech press and academic conferences raises visibility within target developer audience.

---

#### WP4.3: User Onboarding & Support (€1,500)

**Effort:** 18.75 hours @ €80/hr

**Tasks:**
- Getting started guide (5h)
- Video tutorials (5h)
- FAQ documentation (3h)
- Community support (ongoing) (5.75h)

**Deliverables:**
- Onboarding guide
- 3-5 video tutorials
- Comprehensive FAQ
- <24h response time in support

**Justification:**  
Low-friction onboarding is critical for adoption. Video tutorials accommodate visual learners.

---

#### WP4.4: Translation & Localization (€1,000)

**Effort:** 12.5 hours @ €80/hr

**Tasks:**
- Spanish localization (5h)
- German localization (optional, if budget) (5h)
- Translation infrastructure (i18n) (2.5h)

**Deliverables:**
- English + Spanish UI/docs
- German (stretch goal)

**Justification:**  
Multilingual support is EU value. Spanish prioritized given project origins in Spain.

---

### Work Package 5: Infrastructure & Operations (€2,500)

#### WP5.1: Server & Hosting (€1,500)

**Cost Breakdown:**
- IPFS cluster (3 nodes × €15/mo × 6mo) = €270
- Web application hosting (€30/mo × 6mo) = €180
- Database (PostgreSQL) (€20/mo × 6mo) = €120
- CDN (Cloudflare or similar) (€10/mo × 6mo) = €60
- Domain names (holobionte.org, etc.) = €50
- SSL certificates (Let's Encrypt - free) = €0
- Monitoring (Grafana Cloud) (€15/mo × 6mo) = €90
- **Subtotal:** €770
- **Buffer (contingency):** €730

**Deliverables:**
- Production infrastructure
- 99.9% uptime SLA
- Monitoring & alerting

**Justification:**  
Infrastructure costs are modest due to self-hosting and FOSS tools. Buffer covers unexpected expenses (e.g., traffic spikes).

---

#### WP5.2: Software Licenses & Tools (€500)

**Cost Breakdown:**
- GitHub Copilot (for faster development) (€10/mo × 6mo) = €60
- Design tools (Figma or similar) = €100
- Load testing (k6 Cloud) = €50
- Security tools (OWASP ZAP, etc. - mostly FOSS) = €50
- Miscellaneous tools = €240

**Justification:**  
Minimal tooling costs due to FOSS preference. Copilot accelerates development. Design tools for professional UI/UX.

---

#### WP5.3: Contingency & Admin (€500)

**Purpose:**  
Cover unforeseen expenses:
- Legal (licenses, trademarks)
- Accounting (if required by NLNet)
- Unexpected technical challenges
- Exchange rate fluctuations

**Justification:**  
10% contingency is prudent project management practice.

---

## Personnel

### Core Team

**Saul Gómez Romero** (Project Lead)
- **Rate:** €80/hr
- **Commitment:** 20 hrs/week × 26 weeks = 520 hours
- **Total:** €41,600 (83% of budget)

**Responsibilities:**
- Overall project coordination
- Core development (MCP servers, CORAL, identity)
- Technical documentation
- Community management

**Justification:**  
Saul is the holobionte creator with deep context. Rate reflects senior developer / architect level in European market.

---

### External Contractors

**Security Auditor** (TBD)
- **Cost:** €4,000 (fixed price)
- **Deliverable:** Comprehensive security audit report

**Frontend Developer** (optional, if needed)
- **Rate:** €70/hr
- **Commitment:** ~40 hours
- **Total:** €2,800 (included in WP1.5 budget)

**Community Manager** (optional, if needed)
- **Rate:** €50/hr
- **Commitment:** ~30 hours
- **Total:** €1,500 (included in WP4 budget)

**Justification:**  
External expertise accelerates specialized tasks. Rates below Saul's reflect less seniority or different skill markets.

---

## Budget Allocation by Month

| Month | Milestone | Budget | Cumulative |
|-------|-----------|--------|------------|
| Month 1 | M1 Start | €4,000 | €4,000 |
| Month 2 | M1 Complete | €4,000 | €8,000 |
| Month 3 | M2 Start | €6,000 | €14,000 |
| Month 4 | M2 Complete | €6,000 | €20,000 |
| Month 5 | M3 Start | €5,000 | €25,000 |
| Month 6 | M3 Complete | €5,000 | €30,000 |
| Month 7 | M4 Start | €4,000 | €34,000 |
| Month 8 | M4 Complete | €4,000 | €38,000 |
| Month 9 | M5 Complete | €7,000 | €45,000 |
| Month 10 | M6 Complete | €5,000 | €50,000 |

**Note:** Months 1-10 span actual 6-month period due to overlapping milestones.

---

## Payment Schedule (Proposed for NLNet)

### Milestone-Based Payments

| Payment | Trigger | Amount | % of Total |
|---------|---------|--------|------------|
| **Initial** | Grant signed | €10,000 | 20% |
| **Payment 2** | M1 Complete | €8,000 | 16% |
| **Payment 3** | M2 Complete | €12,000 | 24% |
| **Payment 4** | M3 Complete | €10,000 | 20% |
| **Payment 5** | M4 Complete | €8,000 | 16% |
| **Final** | M5 + M6 Complete | €2,000 | 4% |
| **TOTAL** | | **€50,000** | **100%** |

**Rationale:**  
Front-loading 20% enables infrastructure setup and initial development. Milestone-based payments ensure accountability.

---

## Budget Justification for NLNet Reviewers

### Why €50,000?

**Comparable Projects:**
- VulnerableCode (multiple NGI0 grants): Similar complexity
- ActivityPods 3.0: Federation + encryption
- Manyfold: Self-hosted platform + ActivityPub

**Value Proposition:**
- €50K → Infrastructure serving 100+ users
- €500 per user for fully sovereign AI tools
- 10+ open-source components reusable by other projects
- Challenges US Big Tech monopoly on AI collaboration

### Why 6 Months?

**Realistic Timeline:**
- 2 months: Foundation & documentation
- 2 months: Federation & security
- 2 months: Web interface & decentralization
- 1 month: Testing & optimization
- 1 month: Community & launch

**Aggressive but Achievable:**
- Prototype already exists (proof of concept)
- Full-time commitment from Saul
- Clear technical roadmap
- No research risk (all proven technologies)

### Frugal Budget

**Cost Savings:**
- Self-hosting (vs. commercial cloud)
- FOSS tools (vs. proprietary licenses)
- Volunteer community contributions
- Reusing existing open-source components

**No Overhead:**
- No office rent
- No corporate structure
- No sales/marketing team
- No executive compensation

---

## Return on Investment (ROI)

### Quantitative Benefits

**For Developers:**
- Save €1,000+/year avoiding proprietary AI tool subscriptions
- 10x productivity with multi-AI coordination
- Sovereign data control (GDPR compliance built-in)

**For European Ecosystem:**
- Reduce dependency on US Big Tech AI platforms
- Enable local innovation in AI collaboration
- Train 100+ developers in federated systems

**For NGI0 Programme:**
- Demonstrates EU leadership in sovereign AI
- Contributes to Next Generation Internet vision
- Creates reusable open-source components

### Qualitative Benefits

- **Digital Sovereignty:** European alternative to OpenAI, Anthropic monopolies
- **Privacy:** Local-first, end-to-end encrypted where needed
- **Transparency:** Fully open-source, auditable
- **Accessibility:** WCAG 2.1 AA compliant
- **Sustainability:** Community-driven, no VC pressure

---

## Budget Transparency & Accountability

### Public Reporting

- **Monthly Updates:** Progress reports on GitHub
- **OpenCollective:** (optional) Public financial dashboard
- **NLNet Reports:** Quarterly reports per grant agreement

### Expense Tracking

- All expenses documented with receipts
- Time tracking for hourly work
- Public budget vs. actuals reports

---

## Sustainability Beyond NLNet Funding

### Post-Grant Revenue Streams (Optional)

- **Support Contracts:** Enterprise deployments
- **Hosting Service:** Managed holobionte instances
- **Training & Consulting:** Workshops for organizations
- **Grants & Donations:** OpenCollective, GitHub Sponsors

**Note:** Revenue generation is NOT required for open-source viability. Community contributions can sustain project.

---

## Risk Budget

### Contingency Allocation (€2,500)

**Potential Overruns:**
- Security audit more expensive than quoted (€1,000)
- Performance optimization requires more work (€500)
- Hosting costs higher than estimated (€300)
- Translation costs exceed budget (€200)
- Legal fees (trademark, licenses) (€500)

**Mitigation:**  
10% contingency (€5K) built into personnel buffer. Can reduce scope if needed.

---

## Conclusion

This **€50,000 budget** over **6 months** is **realistic, frugal, and impactful**. It transforms holobionte-1rec3 from prototype to production infrastructure, serving 100+ developers and challenging US Big Tech AI monopolies.

**Key Strengths:**
- ✅ Itemized work packages with clear deliverables
- ✅ Milestone-based payment schedule
- ✅ Transparent reporting mechanisms
- ✅ Strong ROI for European digital sovereignty
- ✅ Sustainable beyond grant period

---

## Appendices

### Appendix A: Hourly Rate Justification

**€80/hr for Senior Developer in Spain:**
- Spanish average software dev: €40-60/hr
- Senior/Architect level: €60-100/hr
- Comparable to EU rates: Germany (€80-120), France (€70-100)
- Includes self-employment taxes (~30% in Spain)
- No employee benefits, vacation, or overhead

**Market Benchmarks:**
- Toptal senior devs: €100-200/hr
- Upwork senior devs: €60-150/hr
- NGI0 precedent: Similar rates approved for other projects

### Appendix B: Open Source Software Used (Cost Savings)

**Development:**
- PostgreSQL (FOSS) vs. Oracle (€10K+/year) → **Saves €10K**
- React (FOSS) vs. proprietary UI frameworks → **Saves €5K**
- Nextcloud (FOSS) vs. Dropbox Business (€2K/year) → **Saves €1K**

**Infrastructure:**
- Linux (FOSS) vs. Windows Server (€1K+/year) → **Saves €1K**
- IPFS (FOSS) vs. AWS S3 (€500+/year) → **Saves €500**
- Let's Encrypt (FOSS) vs. commercial SSL (€200/year) → **Saves €200**

**Total Savings:** €18K+ per year by using FOSS

---

**Last Updated:** 2025-11-08  
**Version:** 1.0  
**Prepared by:** Zero (Claude) & Saul Gómez Romero  
**For:** NLNet NGI0 Commons Fund Application
