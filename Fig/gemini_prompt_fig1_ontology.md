# Gemini Prompt: Fig 1 — PhysAgent Ontology System Architecture

## Goal
Generate a **high-quality, publication-ready academic diagram** with 3 layers for an IEEE conference paper (SISPAD 2026). The diagram shows: (1) how a TCAD physics ontology is constructed from the Sentaurus manual, (2) the ontology graph itself, and (3) how LLMs access the ontology via MCP (Model Context Protocol) tools. Must be readable when printed at single-column width (~8.5 cm).

---

## Overall Layout — CRITICAL 3D SLAB REQUIREMENT

**THIS IS THE MOST IMPORTANT DESIGN REQUIREMENT:**

Every single layer MUST be rendered as a **3D isometric rectangular slab/platform** — a solid box shape with:
- A visible **top face** (where the content sits)
- A visible **right side face** (showing depth/thickness, ~15-20px tall, slightly darker shade of the layer's color)
- A visible **bottom edge** of the side face
- The slab is viewed from a **top-right isometric angle** (~30° tilt), so the top face appears as a parallelogram, NOT a flat rectangle

Think of each layer as a **thick colored book or a floating shelf** seen from above-right. Like stacking 3 thick hardcover books on top of each other with gaps between them.

**DO NOT** render layers as flat 2D rectangles with just a border. Each layer MUST look like a physical 3D object with visible thickness and depth.

Reference: See the attached ontology.jpg — notice how each layer (Application, Visualization, Data, Collection) is drawn as a 3D slab with visible side faces.

### Order (top to bottom):
1. **Layer 3 (TOP)**: AI Layer — LLM via MCP (uppermost slab)
2. **Layer 2 (MIDDLE)**: Ontology Graph (largest slab, visual centerpiece)
3. **Layer 1 (BOTTOM)**: Collection — Source Documents (thinnest slab)

### Other layout specs:
- Dimensions: ~16cm wide x 12cm tall
- Background: White
- Style: Clean isometric. Sans-serif font (Arial).
- **Layer height ratio**: Layer 3-AI (25%) — Layer 2-Ontology (55%) — Layer 1-Collection (20%)
- **Vertical gap between slabs**: ~0.8cm
- Left side of each slab: a vertical label indicating the layer name (rotated 90°)

---

## Layer 1 (Bottom): "Collection — Source Documents"

**Height**: ~15% of total. Compact single-row bar.
**Background**: Very light gray (#F5F5F5)

Content: 3 items in a horizontal row, evenly spaced, each with a small icon + one-line label:

```
[PDF icon]              [Formula icon]           [Table icon]
Sentaurus Manual        Physics Equations         Material Tables
(Ch12–17)               (.mmd)                    (Appendices)
```

- Icons should be simple, monochrome, ~20px
- **Downward arrows (↓)** from this layer into Layer 2, labeled: "OCR + Parsing"

---

## Layer 2 (Middle): "Ontology Graph"

**Height**: ~55% of total. This is the **visual centerpiece**.
**Background**: White

### Show 4 physics model clusters in a horizontal row:

Each cluster is a **rounded rectangle with dashed border**, containing nodes and edges:

**Cluster 1: "Bandgap" (leftmost)**
- Diamond nodes (filled orange #E67E22): `Eg(T)`, `χ(T)`, `ni,eff`
- Circle nodes (filled green #27AE60): `T`, `Eg,0`, `α`, `β`
- Square node (filled blue #3498DB): `kB`
- Arrows connecting: T→Eg(T), Eg,0→Eg(T), α→Eg(T), β→Eg(T), Eg(T)→ni,eff, Eg(T)→χ(T)

**Cluster 2: "Mobility"**
- Diamond nodes: `μ_dop`, `μ_hfs`
- Circle nodes: `N`, `E`, `μ₀`
- Arrows: N→μ_dop, μ₀→μ_dop, E→μ_hfs, μ_dop--→μ_hfs (dashed, "feeds")

**Cluster 3: "Recombination"**
- Diamond nodes: `SRH`, `Auger`, `Rad`
- Circle node: `τ`
- Arrows: τ→SRH, τ→Auger

**Cluster 4: "Traps" (rightmost)**
- Diamond node: `R_trap`
- Circle node: `E_t`
- Arrow: E_t→R_trap

### Cross-cluster dependency arrows:
- Dashed arrow from Bandgap's `ni,eff` → Recombination's `SRH` (label: "depends")
- Dashed arrow from Bandgap's `ni,eff` → Mobility's `μ_dop` (dotted)
- Dashed arrow from Recombination's `SRH` → Traps' `R_trap` (label: "extends")

### Node legend (small, bottom-right corner):
```
◆ Equation   ● Parameter   ■ Constant
── uses      ╌╌ cross-group dependency
```

### Bottom bar of Layer 2:
Tiny monospace gray text showing file names:
```
bandgap-graph.json · mobility-graph.json · recombination-graph.json · avalanche-graph.json
```

---

## Layer 3 (Top): "AI Layer — LLM via MCP"

**Height**: ~30% of total.
**Background**: Very light purple (#F5F0FF)

### Layout: Left side = LLM icons, Center = MCP connection, Right = Output

**Left side — "LLM Agents" (3 model logos in a row):**
- **Claude logo** (Anthropic's official Claude logo — the stylized orange/brown circular mark)
- **ChatGPT logo** (OpenAI's official black/green circular logo)
- **Gemini logo** (Google's official Gemini star/sparkle logo in blue)
- Below the 3 logos, one shared label: "General-purpose LLMs"
- Use the **actual recognizable brand logos** — readers should instantly identify which models are supported

**Center — MCP Connection:**
- A prominent **bidirectional double arrow (↕)** between Layer 2 and Layer 3
- The arrow passes through a rounded box labeled **"MCP Server"**
- Inside or beside the MCP Server box, show 2-3 small tool call examples:
  ```
  get_subgraph("Bandgap")
  get_parameters("SRH")
  validate_file(output)
  ```
  (in tiny monospace, stacked vertically)
- The upward arrow (↑) is labeled: **"structured subgraph"**
- The downward arrow (↓) is labeled: **"tool call"**

**Right side — Output:**
- A file icon (rectangle with folded corner) labeled **"IGZO.par"**
- Inside the file, show 3 colored section bars:
  - Green bar: "Bandgap"
  - Blue bar: "Mobility"
  - Orange bar: "Recombination"
- Below the file: small checkmark (✓) + "Physically grounded"

### Flow arrows within Layer 3:
```
[LLM icons] --tool call--> [MCP Server] --subgraph--> [LLM icons] --generate--> [.par File]
```

---

## Key Visual Relationships Between Layers

1. **Layer 1 (bottom) → Layer 2 (middle)**: Upward arrows labeled "OCR + Parsing" (source documents become ontology)
2. **Layer 2 (middle) ↔ Layer 3 (top)**: Bidirectional arrows through MCP Server (LLM queries ontology, gets subgraphs back)
3. **Layer 3 (top) → Output**: Arrow from LLM to .par file (generation)

**Arrow direction**: Information flows upward (bottom to top): Source → Ontology → LLM → Output

---

## Critical Design Rules

### Visibility & Weight
1. **All borders and arrows: minimum 2pt stroke weight.** Thin 1pt lines disappear when printed small. Use 2-3pt for normal elements, 4pt for key arrows (MCP connection).
2. **Minimum font size 10pt** when printed at 8.5cm width. If a label can't fit at 10pt, remove the label — don't shrink it.
3. **Node shapes must be large enough to read**: diamonds/circles minimum 20px diameter. Fill them with solid color so they're visible even at small sizes.
4. **High contrast only**: dark text on light backgrounds. No light gray text on white — use medium gray (#666) minimum.

### Simplicity
5. **Minimize text.** Each cluster label = 1 word (Bandgap, Mobility, Recombination, Traps). Node labels = 1-3 characters max (Eg, T, μ, τ). Remove any label that isn't essential.
6. **No paragraphs, no sentences.** If you need more than 3 words for a label, it's too long. Use icons/shapes instead.
7. **Remove the tool call code examples** from MCP Server box — just label it "MCP Server" with two arrow labels ("tool call ↓" and "subgraph ↑"). The code examples add clutter.
8. **Remove the JSON file names** bar at the bottom of Layer 2. Not needed.

### Structure
9. **Layer 2 is the hero** — largest, most detailed, most visual weight
10. **Maximum 5 colors**: orange (equations), green (parameters), blue (constants), purple (AI layer), gray (structure)
11. LLM icons should use **actual brand logos** (Claude, ChatGPT, Gemini)
12. MCP bidirectional arrows = **thickest element in the whole figure** (4pt)
13. The diagram should be understandable in **5 seconds** without reading the caption
14. Export at 300 DPI, prefer vector (SVG/PDF)
15. Think IEDM / VLSI Symposium / Nature Electronics figure quality
