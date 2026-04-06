# TCAD Ontology Component Mapping

## 1. Basic Concept Mapping

| Ontology Term | Graph DB Term | TCAD Ontology Term |
|---|---|---|
| Class | Label / Node | Node Type (`equation` \| `parameter`) |
| Property | Property | Node Fields (`latex`, `section`, `equationKind`, `parameterKind`, etc.) |
| Relation | Edge | Edge Type (`uses`, `depends_on`, `controls`, `related_to`, `routed_by`) |
| Entity | Entity Node | Node Instance (e.g., `eq_Eg_T`, `param_T`) |
| Action | — | Model Activation (`always` \| `optional` \| `materialSpecific`) |

## 2. Node Classification

| Classification | Value | Description |
|---|---|---|
| **Node Type** | `equation` | Equations (with Eq. number in source) |
| | `parameter` | Parameters / Constants / Control variables |
| **Equation Kind** | `primary` | Main governing equation |
| | `correction` | Correction factor |
| | `auxiliary` | Supporting equation |
| **Parameter Kind** | `constant` | Fixed constant |
| | `variable` | Variable parameter |
| | `control` | Model selection flag |
| **Key Equation Role** | `hub` | Central equation of a model group |
| | `output` | Derived / output equation |

## 3. Edge (Relation) Types

| Edge Type | Ontology Meaning | Description |
|---|---|---|
| `uses` | Dependency | Equation consumes a parameter or another equation |
| `depends_on` | Reference | Value computation requires another node |
| `controls` | Control | Control parameter determines model activation |
| `related_to` | Association | Logical association |
| `routed_by` | Routing | Conditional branching path |

## 4. Group Structure (91 groups, 3 categories)

| Group Category | Ontology Meaning | Examples |
|---|---|---|
| `fundamental` | Core physical principles | `CoreBandgap`, `CoreIntrinsicDensity` |
| `physicsModel` | Specific physics models | `Slotboom`, `Masetti`, `SRH_Core` |
| `auxiliary` | Corrections & helpers | `FermiCorrection`, `Limiting` |

## 5. Model Relations

| Relation Type | Description |
|---|---|
| `mutually_exclusive` | Cannot be used simultaneously (choose one) |
| `incompatible` | Not compatible |
| `compatible` | Can coexist |

## 6. Chapter (Section) Structure — 37 sections across 5 graph files

| Graph File | Representative Sections |
|---|---|
| `bandgap-graph.json` | BandGapAndElectronAffinity, IntrinsicDensity, EffectiveMassAndDOS |
| `mobility-graph.json` | MobilityIntro, DopingDependent, HighFieldSaturation, PhilipsUnified |
| `recombination-graph.json` | SRH, Auger, Radiative, Bimolecular |
| `avalanche-graph.json` | Avalanche, BandToBand, NonlocalTunneling |
| `traps-graph.json` | TrapDistributions, TrapOccupation, TrapDegradation |
