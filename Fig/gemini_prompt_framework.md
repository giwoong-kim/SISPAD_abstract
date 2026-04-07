# Prompt: PhysAgent Framework Diagram

Generate a publication-quality framework architecture diagram for an IEEE academic conference paper.

## Title
**"PhysAgent: Ontology-Guided LLM Framework for TCAD Parameter File Generation"**

## Core Concept
An LLM agent uses a structured physics ontology (accessed via MCP protocol) to understand WHICH parameters a TCAD simulator needs and HOW they relate, retrieves WHAT numerical values from research papers, and generates a validated Sentaurus Device .par file. Two validation gates ensure quality at different stages.

## Layout
Single horizontal main flow (left → right), 6 blocks connected by directional arrows. Below the main flow, a thin secondary strip shows the ontology construction pipeline. Total dimensions: ~16cm wide × ~7cm tall.

---

## Main Flow

### [A] Inputs (left, gray)
Rounded rectangle with two items stacked:
- **User Query** — "Generate IGZO .par file"
- **Research Papers** — literature corpus (Nomura 2004, Kamiya 2010, ...)

Two arrows exit: one → Ontology [B], one → LLM Agent [D] (labeled "literature values").

### [B] TCAD Physics Ontology (blue, prominent)
```
┌──────────────────────────────────┐
│     TCAD Physics Ontology        │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐   │
│  │Ch12│ │Ch15│ │Ch16│ │Ch17│   │
│  └────┘ └────┘ └────┘ └────┘   │
│  91 model groups · 37 sections   │
│  Nodes: equation | parameter     │
│  Edges: uses, depends_on,        │
│         controls, routed_by      │
└──────────────────────────────────┘
```
Inside: small abstract graph icon (5-6 interconnected circles and diamonds).

### [C] MCP Graph Server (cyan, attached below or beside Ontology)
```
┌─────────────────────┐
│  MCP Graph Server    │
│  • explore_node      │
│  • search_graph      │
│  • cross_chapter     │
└─────────────────────┘
```
- Bidirectional arrow between [B] ↔ [C] labeled "graph data"
- Bidirectional arrow between [C] ↔ [D] labeled "tool calls"

### Validation Gate ① (orange diamond, between Ontology and LLM Agent)
- Label: **"Ontology Validation"**
- Sub-items: Spec ↔ Data check, Plan checklist, Multi-Agent verification
- ✗ Fail → dashed arrow back to [B]
- ✓ Pass → solid arrow to [D]

### [D] LLM Agent (green, largest block)
```
┌──────────────────────────────────┐
│       LLM Agent (Claude)         │
│                                  │
│  1. Query ontology via MCP       │
│     → required params & deps     │
│  2. Search literature            │
│     → material property values   │
│  3. Assemble .par file           │
│     → Sentaurus Device syntax    │
└──────────────────────────────────┘
```

### Validation Gate ② (orange diamond, after LLM Agent)
- Label: **"Parameter File Validation"**
- Sub-items: Syntax check, Physical range, Unit consistency
- ✗ Fail → dashed arrow back to [D]
- ✓ Pass → solid arrow to [E]

### [E] Output (right, gray)
- **"Validated .par File"**
- Sub-label: Sentaurus Device ready

---

## Bottom Strip: Ontology Construction Pipeline

A thin horizontal strip below the main flow, small rounded boxes connected by thin gray arrows:

```
Sentaurus Manual (PDF) → Mathpix OCR (.mmd) → Spec Authoring (_specs/) → Plan (_plans/) → JSON Graph Data → MCP Server
```

Vertical arrow from this strip upward into Ontology block [B], showing how the ontology is built and maintained.

---

## Style
- White background, no gradients, no shadows, no 3D effects
- Clean sans-serif font (Helvetica / Arial), labels 9pt, sub-text 7.5pt
- Thin borders: 0.75pt boxes, 1.5pt main arrows
- Color palette (10-15% fill opacity, full-saturation borders):
  - Blue #3B82F6 — Ontology
  - Cyan #0EA5E9 — MCP layer
  - Green #10B981 — LLM Agent
  - Orange #F59E0B — Validation gates
  - Gray #9CA3AF — I/O and infrastructure
  - Red #EF4444 — Fail feedback arrows only
- Output: SVG preferred, or PNG at 600 DPI
- All text in English
- Must remain legible when printed at 50% scale in a two-column IEEE paper
