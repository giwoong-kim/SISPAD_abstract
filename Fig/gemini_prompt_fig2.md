# Gemini Prompt: PhysAgent Framework Overview Diagram

## Goal
Create a **clean, minimal, diagram-heavy academic figure** for an IEEE conference paper. Almost no text — communicate through shapes, arrows, icons, and layout. The figure shows how an LLM agent uses an ontology graph via MCP tools to generate a TCAD parameter file.

## Overall Layout

- **Orientation**: Left-to-right horizontal flow, **4 stages** as columns
- **Title**: "PhysAgent: Ontology-Driven TCAD Parameter File Generation" (top center, bold)
- **Dimensions**: Wide landscape, ~18cm x 7cm
- **Style**: Flat, minimal, no shadows, no 3D. White background. Sans-serif font.
- **Key principle**: MINIMAL TEXT. Use icons, shapes, and spatial layout to convey meaning. Labels should be short (1-3 words max).
- **Color palette**:
  - Stage 1: Blue (#2C5F8A / #D6EAF8)
  - Stage 2: Green (#27AE60 / #D5F5E3)
  - Stage 3: Purple (#8E44AD / #E8DAEF) — represents MCP/tool layer
  - Stage 4: Orange (#E67E22 / #FDEBD0)
  - Arrows between stages: Dark gray, thick (3pt), with arrowheads

---

## Stage 1: "Input"

**Header**: ① Input (small, top of column)

Visual elements (stacked vertically, centered):

1. **User icon** (simple person silhouette) with a speech bubble: 
   - Inside bubble: "IGZO device simulation" (short, one line)

2. **Below, with a "+" symbol connecting them:**
   - A small stack of 2-3 **document/paper icons** (tilted rectangles resembling papers/books)
   - Label underneath: "Literature" (one word only)

**Overall impression**: A user request plus reference materials going into the system.

---

## Stage 2: "Ontology Graph"

**Header**: ② Ontology Graph (small, top of column)

This is the **largest and most prominent stage** — take up ~40% of the figure width.

Show a **detailed subgraph focused on Band Structure / Bandgap** as a concrete example of the ontology:

**Layout**: A network/graph diagram with these nodes and edges:

Nodes (use distinct shapes consistently):
- **Diamond (◆)** = Equation nodes, filled orange (#E67E22):
  - `Eg(T)` (bandgap energy, center-top, large)
  - `χ(T)` (electron affinity, right of Eg)
  - `ni,eff` (effective intrinsic density, below Eg)
  - `ΔEg` (bandgap narrowing, left of ni,eff)

- **Circle (●)** = Parameter nodes, filled green (#27AE60):
  - `T` (temperature, top-left)
  - `Eg,0` (bandgap at 0K, above Eg)
  - `α` (Varshni alpha, left of Eg)
  - `β` (Varshni beta, left of Eg, below α)
  - `χ₀` (affinity at 0K, above χ)

- **Small square (■)** = Constant nodes, filled blue (#3498DB):
  - `kB` (Boltzmann, near ni,eff)

**Edges** (arrows connecting nodes):
- `T` → `Eg(T)` (arrow, labeled "input")
- `Eg,0` → `Eg(T)` 
- `α` → `Eg(T)`
- `β` → `Eg(T)`
- `Eg(T)` → `ni,eff` (arrow, showing dependency)
- `Eg(T)` → `χ(T)` (arrow)
- `χ₀` → `χ(T)`
- `ΔEg` → `ni,eff`
- `kB` → `ni,eff`

**Visual emphasis**: 
- Draw a faint dashed boundary around the whole subgraph labeled "Bandgap & Electron Affinity" 
- Some nodes at the edges should have faded/dotted connections going off-screen (to suggest the graph continues — e.g., `ni,eff` connects to "→ Recombination", `Eg(T)` connects to "→ Mobility")
- This should look like a **real knowledge graph**, not a simple flowchart

**Node legend** (tiny, bottom-right corner of this stage):
- ◆ Equation  ● Parameter  ■ Constant

---

## Stage 3: "MCP Tool"

**Header**: ③ MCP Tool (small, top of column)

This stage shows how the LLM agent queries ONLY the relevant subgraph (not the whole ontology) via an MCP tool call, saving tokens.

Visual elements:

1. **Top**: A small LLM/agent icon (brain or robot icon) with a callout showing a tool call:
   ```
   get_subgraph("BandGap")
   ```
   (shown in a monospace code-style mini box)

2. **Middle**: A **funnel or filter icon** — the full ontology (shown as a large dense cloud/circle on the left of the funnel) gets filtered down to a small clean subgraph (right side of funnel)
   - Left of funnel: dense tangled graph (tiny, abstract — just to show "big")
   - Right of funnel: clean small subgraph (3-4 nodes — matching Stage 2's style but tiny)
   - Label near funnel: "Relevant subgraph only"

3. **Bottom**: A small token/cost indicator:
   - Two bars side by side: 
     - Tall bar (red/gray): "Full graph" 
     - Short bar (green): "Subgraph"
   - This visually shows token savings

**Overall impression**: Selective retrieval, not brute-force context stuffing.

---

## Stage 4: "Output"

**Header**: ④ Generated .par File

Visual elements:

1. **A file/document icon** (rectangle with folded corner), large and prominent
   - File name on top: "IGZO.par"
   - Inside the file, show a **stylized code preview** (just colored blocks representing sections, not actual readable code):
     - A colored bar (green) labeled "Bandgap"
     - A colored bar (blue) labeled "Mobility"  
     - A colored bar (orange) labeled "Recombination"
     - Each bar has tiny placeholder lines (like `───────`) to suggest code content

2. **Below the file**: A small checkmark (✓) icon with label "Physically grounded"

**Overall impression**: A clean, structured output file with physics sections clearly organized.

---

## Connecting Arrows Between Stages

- Stage 1 → Stage 2: Thick arrow, label: "query"
- Stage 2 → Stage 3: Thick arrow, label: "subgraph extraction"  
- Stage 3 → Stage 4: Thick arrow, label: "generation"
- Additionally: A **curved return arrow** from Stage 4 back to Stage 3 (thin, dashed), labeled "validation" — showing the feedback loop

---

## Bottom Bar

A thin horizontal bar spanning the full width, with a simple pipeline in small gray text:

```
Sentaurus Manual → OCR & Parsing → Ontology Construction → MCP Server → LLM Agent → .par File
```

Each step as a small rounded pill/badge connected by arrows (→).

---

## Critical Design Rules

1. **MINIMAL TEXT** — if you can show it with a shape, don't write it
2. Stage 2 (Ontology Graph) should be the visual centerpiece — largest, most detailed
3. All node shapes must be consistent across Stage 2 and Stage 3
4. Minimum font size 8pt — must be readable when printed at column width (~8.5cm)
5. No decorative elements, no clipart, no gradients
6. Color usage should be functional (each color = one meaning), not decorative
7. The figure should be immediately understandable without reading the caption
8. Professional IEEE paper quality — look at figures in Nature, IEEE TED, IEDM for reference
