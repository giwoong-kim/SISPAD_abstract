# PhysAgent - Paper Structure (2-page abstract + figures)

> **Target**: SISPAD 2026 | 2 pages (A4) | figures + tables included | ~600 words total

---

## Flow Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                        ABSTRACT (00_abstract.tex)                   │
│  DTCO/TCAD 중요 → 핵심 챌린지: SDevice 물리 모델 설정               │
│  → PhysAgent: ontology + literature → physically grounded SDevice   │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│                   I. INTRODUCTION (01_introduction.tex)              │
│                                                                     │
│  [배경] 반도체 스케일링 한계 → DTCO/TCAD 중요성                      │
│       ↓                                                             │
│  [문제] 핵심은 구조 생성이 아닌 SDevice 물리 모델 + 파라미터          │
│       ↓                                                             │
│  [기존 한계] SFT 기반 접근: 데이터 부족, 물리 모델 선택 미비          │
│       ↓                                                             │
│  [우리 주장] fine-tuning 대신 knowledge structure 구축               │
│       ↓                                                             │
│  [제안] PhysAgent = ontology + literature → expert-level SDevice     │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│                  II. RELATED WORK (02_related_work.tex)              │
│                     (= Background, 배경 지식 설명)                   │
│                                                                     │
│  ┌─────────────────────────┐  ┌──────────────────────────────────┐  │
│  │ TCAD Simulation         │  │ LLM for Code Gen in EDA          │  │
│  │ - SDE vs SDevice        │  │ - LLM 코드 생성 능력             │  │
│  │ - SDevice = 전문성 필요  │  │ - TCAD 적용: SDE만, SDevice X   │  │
│  └─────────────────────────┘  └──────────────────────────────────┘  │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│             III. PROPOSED FRAMEWORK (03_proposed_framework.tex)      │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │  [A] TCAD Physics Ontology                                  │    │
│  │  Sentaurus Guide → directed graph                           │    │
│  │  Nodes: equation / parameter / constant                     │    │
│  │  Edges: input / specialCase / pairwise                      │    │
│  │  → 모델 간 의존성 구조화 (bandgap→density→recombination)    │    │
│  │                          ┌──── Fig: ontology subgraph ────┐ │    │
│  └──────────────────────────┴────────────────────────────────┘ │    │
│                         +                                       │    │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │  [B] Literature-Driven Domain Knowledge                     │    │
│  │  재료별 모델링 노하우 (SiC, GaN 등)                          │    │
│  │  검증된 모델 조합 + 캘리브레이션된 파라미터                    │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                         ↓                                           │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │  [C] Ontology-Guided Generation                             │    │
│  │  ontology subgraph + literature → structured LLM context    │    │
│  │  → physically grounded SDevice file                         │    │
│  │                    ┌──── Fig: pipeline diagram ────┐         │    │
│  └────────────────────┴──────────────────────────────┘         │    │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│                     IV. RESULT (04_result.tex)                       │
│                                                                     │
│  - 특정 반도체 재료 case study                                       │
│  - w/ ontology vs w/o ontology 비교                                  │
│  - 생성된 SDevice 파일의 물리적 타당성 평가                           │
│  TODO: 실험 결과 채우기                                              │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│                    V. CONCLUSION (05_conclusion.tex)                 │
│                                                                     │
│  PhysAgent = ontology + literature → SDevice 생성                    │
│  SFT 대신 knowledge structure → expert-level 모델링 지원             │
└─────────────────────────────────────────────────────────────────────┘
```

---

## File Map

| Section | File | Status | Words |
|---------|------|--------|-------|
| Abstract | `sections/00_abstract.tex` | Draft | ~110 |
| I. Introduction | `sections/01_introduction.tex` | Draft | ~140 |
| II. Related Work | `sections/02_related_work.tex` | Draft | ~100 |
| III. Proposed Framework | `sections/03_proposed_framework.tex` | Draft | ~190 |
| IV. Result | `sections/04_result.tex` | TODO | ~30 |
| V. Conclusion | `sections/05_conclusion.tex` | Draft | ~40 |
| **Total** | | | **~610** |
| Main | `SISPAD_abstract.tex` | OK | - |

---

## Figures (TODO)

| Fig | 위치 | 내용 | 파일 |
|-----|------|------|------|
| Fig 1 | Sec III | PhysAgent 전체 파이프라인 (Ontology + Literature → LLM → SDevice) | `Fig/pipeline.png` |
| Fig 2 | Sec III | 온톨로지 서브그래프 (bandgap → density → recombination) | `Fig/ontology.png` |

---

## Key Message (한 줄)

> SDevice 물리 모델 설정이 TCAD의 핵심 챌린지 → PhysAgent는 SFT/synthetic data 대신 **ontology + literature**로 knowledge structure를 구축하여 범용 LLM이 expert-level SDevice 파일을 생성하도록 한다.

---

## Contribution 요약 (3개)

1. **TCAD Physics Ontology** — Sentaurus 가이드 기반, 물리 모델/수식/파라미터의 의존 관계를 그래프로 구조화
2. **Literature-Driven Domain Knowledge** — 재료별 모델링 노하우를 문헌에서 추출하여 온톨로지 보완
3. **Physically Grounded SDevice Generation** — ontology + literature를 LLM context로 활용, template을 넘어 물리적으로 근거 있는 파일 생성
