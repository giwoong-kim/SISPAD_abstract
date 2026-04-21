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
│  └─────────────────────────────────────────────────────────────┘    │
│                         ↓                                           │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │  [D] Ontology Expansion and Validation                      │    │
│  │  Spec → Plan → Impl 방향성 동기화 워크플로우                 │    │
│  │  새 모델/재료 추가 시 retraining 없이 온톨로지만 확장         │    │
│  │  Shared Node Registry + 자동 검증으로 일관성 유지             │    │
│  │                    ┌──── Fig: expansion model ────┐          │    │
│  └────────────────────┴──────────────────────────────┘          │    │
└──────────────────────────────┬──────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────┐
│                     IV. RESULT (04_result.tex)                       │
│                                                                     │
│  [실험 1] 특정 재료 SDevice 파일 생성                                │
│    - Library 재료 (SiC, GaN): TCAD Library 모델과 비교 → 정확도 검증 │
│    - Non-library 재료 (IGZO): 확장적 적용 가능성 시연                │
│    → Fig 4: 생성 결과 비교 테이블 + 파일 예시                        │
│                                                                     │
│  [실험 2] Ontology 유무 비교 (Ablation)                              │
│    - Baseline: Guide PDF + LLM (ontology/MCP 없이)                  │
│    - Ours: LLM + ontology (MCP subgraph) + literature               │
│    - 메트릭: 모델 완전성, 파라미터 정확도, 물리적 타당성             │
│                                                                     │
│  [실험 3] File Validation (자동 검증)                                │
│    - ontology compliance + syntax + physics validation               │
│    → Fig 5: 자동 검증 파이프라인                                     │
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

## Figures

| Fig | 위치 | 내용 | 파일 | 상태 |
|-----|------|------|------|------|
| Fig 1 | Sec III | PhysAgent 전체 파이프라인 (Input → Ontology → MCP Tool → .par File) | `Fig/framework.jpg` | 간략화 필요 |
| Fig 2 | Sec III | 온톨로지 서브그래프 (Bandgap 중심 노드-엣지 관계도) | `Fig/ontology.jpg` | 간략화 필요 |
| Fig 3 | Sec III | 온톨로지 확장/검증 모델 (Spec → Plan → Impl 동기화) | `Fig/expansion.validation_model.jpg` | 간략화 필요 |
| Fig 4 | Sec IV | 생성 결과: Library 재료 비교 + IGZO 파라미터 파일 예시 | TBD | 실험 후 |
| Fig 5 | Sec IV | 자동 검증 파이프라인 (ontology + syntax + physics) | TBD | 실험 후 |

---

## Key Message (한 줄)

> SDevice 물리 모델 설정이 TCAD의 핵심 챌린지 → PhysAgent는 SFT/synthetic data 대신 **ontology + literature**로 knowledge structure를 구축하여 범용 LLM이 expert-level SDevice 파일을 생성하도록 한다.

---

## Contribution 요약 (3개)

1. **TCAD Physics Ontology** — Sentaurus 가이드 기반, 물리 모델/수식/파라미터의 의존 관계를 그래프로 구조화
2. **Literature-Driven Domain Knowledge** — 재료별 모델링 노하우를 문헌에서 추출하여 온톨로지 보완
3. **Physically Grounded SDevice Generation** — ontology + literature를 LLM context로 활용, template을 넘어 물리적으로 근거 있는 파일 생성
