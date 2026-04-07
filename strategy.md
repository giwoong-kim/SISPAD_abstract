# LLM-based TCAD Code Generation 논문 분석 및 Ontology 기반 논문 전략

## 1. 기존 논문 분석

### Paper 1: TCAD Structure Input File Generation Using LLM (Nguyen et al., SISPAD 2024)

**구조**: I. Introduction → II. Data Generation → III. LLM Fine-Tuning → IV. In-Context Learning → V. Conclusions

**핵심 내용**:
- Sentaurus Structure Editor(SSE) nanowire 입력 파일 생성에 LLM 적용
- 7,000개 nanowire 데이터를 템플릿 기반으로 생성 (18개 파라미터 변형)
- Llama-2-7B, Llama-3-8B를 LoRA로 fine-tuning
- In-context one-shot learning: GPT-4o, Claude 3.5 Sonnet에서 성공
- **한계**: 단일 구조(nanowire)에 한정, 메시/시뮬레이션 미포함, 물리 모델 이해 없음

---

### Paper 2: AgenticTCAD (Fan et al., arXiv Jan 2026)

**구조**: I. Introduction → II. Preliminaries and Related Works → III. Methodology (Dataset Construction / Fine-Tuning / Multi-Agent Workflow) → IV. Experiments and Results → V. Conclusion

**핵심 내용**:
- **End-to-end 프레임워크**: SDE + SDevice 코드 생성 + 디바이스 최적화
- 전문가 제작 TCAD 데이터셋 (SDE/SDevice) + LLM 기반 augmentation pipeline
- Qwen2.5-14B-Instruct 모델 fine-tuning (30,000 샘플, 5 epochs, 107시간)
- 3-Stage Multi-Agent:
  - Stage 1: Code Generation Agent (fine-tuned LLM)
  - Stage 2: TCAD Simulation + Post-processing
  - Stage 3: Device Optimization Agent (DeepSeek V3.1 reasoning)
- 2nm NS-FET 최적화: IRDS-2024 스펙 달성 (25 iterations, 4.2시간 vs 전문가 7.1일)
- **한계**: 물리 모델 선택의 근거가 LLM의 implicit knowledge에 의존, 온톨로지 없음

---

### Paper 3: ChatTCAD (Zhang et al., ISVLSI 2025)

**구조**: I. Introduction → II. Related Work → III. Methodology (Function Block Decomposition / Python Wrapper / Prompt Engineering for SFM & CDM) → IV. Results → V. Conclusion

**핵심 내용**:
- TCL → Python 함수 래핑으로 LLM 생성 난이도 감소
- 5개 기능 블록 분해: Region, Doping, Contact, Global Mesh, Refined Mesh
- GPT-4o로 합성 데이터셋 생성 → Llama-3-8B fine-tuning (~10,000 샘플)
- **SFM** (Single-Function Mode): 개별 블록 생성/디버깅
- **CDM** (Complete-Device Mode): Tabular Chain-of-Thought로 전체 디바이스 생성
- trigger-root-branch-leaf 키워드 전략, mutation/fault injection으로 robustness 확보
- Block-level BLEU > 0.96 (BJT, SiGeHBT 대비)
- **한계**: 2D 구조에 한정, SDevice 미지원, 물리 모델 선택 로직 없음

---

### Paper 4: MALTS (Dou et al., ISEDA 2025)

**구조**: I. Introduction → II. Background → III. Our Proposed Framework (Layout Info Extraction / Structure Calculation / Input File Generation) → IV. Result and Analysis → V. Conclusion

**핵심 내용**:
- **Layout-to-TCAD**: GDSII 파일 → 3D TCAD 구조 자동 생성
- 3-Phase Multi-Agent (ChatGPT-4o 기반):
  1. Layout Information Extraction (GDSII → 레이어 테이블)
  2. Structure Calculation (레이어 → 구조 데이터, auxiliary layer description 활용)
  3. Input File Generation (code example + process info → SSE 코드)
- FreePDK45 기반 평가: NMOS, PMOS, Inverter, NAND, NOR
- One-shot learning + RAG (Sentaurus User Guide 참조)
- **한계**: fine-tuning 없이 프롬프트 엔지니어링에 의존, 물리 모델/시뮬레이션 설정 자동화 없음

---

## 2. 기존 연구의 공통 Gap 분석

| Gap | 설명 |
|-----|------|
| **물리 모델 선택 근거 부재** | 모든 논문이 구조(SDE) 생성에 집중. SDevice의 물리 모델(mobility, recombination, bandgap 등) 선택은 하드코딩하거나 implicit하게 처리. "왜 이 모델을 쓰는가"에 대한 체계적 근거 없음 |
| **수식 간 의존성 미반영** | TCAD 물리 모델은 수식 간 복잡한 의존 관계가 있음 (예: bandgap → intrinsic density → recombination). 기존 연구는 이 관계를 모델링하지 않음 |
| **온톨로지/지식 그래프 활용 없음** | 모든 연구가 텍스트 기반 프롬프트나 fine-tuning에만 의존. 구조화된 도메인 지식(ontology)을 활용한 연구 전무 |
| **물리적 일관성 검증 부재** | 생성된 코드의 구문 검증은 하지만, 물리적 일관성(모델 간 호환성, 파라미터 범위 등) 검증 메커니즘 없음 |
| **Hallucination 대응 미흡** | LLM이 존재하지 않는 TCAD 명령어나 비물리적 파라미터를 생성하는 문제에 대한 체계적 대응 부족 |

---

## 3. Ontology 기반 접근의 차별화 포인트

우리 프로젝트(ontology_TCAD)는 Sentaurus Device 매뉴얼의 물리 수식을 **노드-엣지 그래프(온톨로지)**로 구조화했다. 이는 기존 연구들이 갖지 못한 핵심 자산이다:

1. **수식 의존성 그래프**: 수백 개의 equation/parameter/constant 노드와 input/specialCase/pairwise 엣지
2. **챕터별 물리 모델 계층**: Bandgap, Carrier Density, Mobility, Recombination 등 체계적 분류
3. **모델 선택 경로 추적**: "이 디바이스에 이 물리 모델이 왜 필요한가"를 그래프 탐색으로 설명 가능
4. **Grounded Generation**: LLM이 온톨로지를 참조하여 hallucination 없이 물리 모델 설정 생성

---

## 4. 논문 전략: Ontology-Guided LLM for Physics-Aware TCAD Simulation Setup

### 4.1 제목

- **"PhysAgent: Physics informed ontology grounded Modeling and file generator"**

### 4.2 핵심 Contribution (3개)

1. **Sentaurus TCAD Guide 기반 Ontology**: Sentaurus Device 매뉴얼의 물리 모델, 수식, 조건, 파라미터 및 이들 간의 관계를 구조화한 온톨로지. 수식 간 의존성, 모델 변형(specialCase), 파라미터 공유 관계를 명시적으로 인코딩. Synthetic training data에 의존하지 않는 knowledge-driven 접근.

2. **Literature-Driven Domain Knowledge 통합**: 온톨로지만으로는 표현하기 어려운 재료별/디바이스별 모델링 노하우를 논문 기반 도메인 지식으로 보완. 특정 반도체 재료에 대한 expert-level 모델링 워크플로우 지원.

3. **Physically Grounded Sdevice File Generation**: 온톨로지 + 문헌 지식을 결합하여 LLM이 template 수준을 넘어 물리적으로 근거 있는 Sdevice 파일을 생성. 기존 연구의 implicit 물리 지식 의존을 explicit ontology + literature 참조로 대체.

### 4.3 논문 구조 (SISPAD 4-page format, 현재 tex 기준)

```
I. INTRODUCTION
   - DTCO/TCAD의 중요성 (반도체 스케일링 한계)
   - 핵심 챌린지: 구조 생성이 아닌 Sdevice 물리 모델 설정과 파라미터 파일 생성
   - 기존 LLM-TCAD 연구 한계 간결 요약 (SDE 중심, SFT 데이터 부족, 물리 모델 선택 미비)
     → Introduction 후반부에서 경쟁 논문 비교를 간결하게 처리 (다른 논문들의 공통 패턴)
   - 고성능 범용 LLM 활용 + knowledge structure 구축이 핵심
   - PhysAgent 소개 및 contribution 요약

II. RELATED WORK (= Background)
   → 경쟁 논문 비교가 아닌, 배경 지식 설명 섹션 (다른 논문들의 공통 패턴)
   A. TCAD Simulation
      - TCAD의 역할, SDE vs SDevice의 차이
      - SDevice 물리 모델 설정의 복잡성과 전문성 요구
   B. LLM for Code Generation / EDA
      - LLM의 코드 생성 능력, EDA 분야 적용 사례
      - TCAD 도메인 적용의 현황과 한계
   C. Ontology in Engineering (optional, 분량에 따라)
      - 공학 도메인에서의 온톨로지 활용 사례
      - TCAD 물리 모델에 온톨로지를 적용한 연구는 전무

III. PROPOSED FRAMEWORK (= Methodology)
   → Ontology와 LLM Modeling을 하나의 방법론 섹션으로 통합 (다른 논문들의 공통 패턴)
   A. Framework Overview
      - 전체 파이프라인: Ontology + Literature → LLM → Sdevice 파일
      - Fig: 전체 파이프라인 다이어그램
   B. TCAD Physics Ontology
      - Sentaurus TCAD 가이드 기반 온톨로지 구조
      - 노드 타입 (equation, parameter, constant)
      - 엣지 타입 (input, specialCase, pairwise)과 의미
      - 물리 모델 간 관계와 의존성 구조화
      - Fig: 온톨로지 서브그래프 시각화
   C. Literature-Driven Domain Knowledge
      - 특정 반도체 재료에 대한 논문 기반 모델링 지식 통합
      - 온톨로지로 표현하기 어려운 경험적 노하우 보완
   D. Ontology-Guided Sdevice File Generation
      - 온톨로지 그래프 탐색으로 관련 물리 모델/파라미터 서브그래프 추출
      - LLM 프롬프트에 structured context로 주입
      - Physically grounded Sdevice 파일 생성
   E. Ontology Expansion and Validation
      - Spec → Plan → Impl 방향성 동기화 워크플로우
      - 새 물리 모델/재료 추가 시 retraining 없이 온톨로지만 확장
      - Shared Node Registry + 자동 검증으로 일관성 유지
      - Fig: 확장/검증 모델 다이어그램
      - SFT 대비 핵심 차별점: 확장성과 유지보수성

IV. RESULT
   - 생성된 Sdevice 파일의 물리적 타당성 평가
   - 특정 반도체 재료에 대한 case study
   - Template 수준 vs expert-level 모델링 비교

V. CONCLUSION
```

**참고: 다른 논문들의 섹션 구조 패턴**
- Nguyen: Intro → Data Gen → LLM Fine-Tuning → ICL with LLM → Conclusion
- AgenticTCAD: Intro → Preliminaries & Related Works (TCAD/EDA+LLM/Agent) → Methodology → Results → Conclusion
- ChatTCAD: Intro → Related Work (LLM in EDA/TCAD Sim/ML for TCAD) → Methodology → Results → Conclusion
- MALTS: Intro → Background (Layout/TCAD/LLM) → Proposed Framework → Results → Conclusion

→ 공통점: (1) Related Work/Background는 배경 설명, 경쟁 논문 비교는 Intro에서 처리
          (2) 방법론은 하나의 섹션으로 통합

### 4.4 기존 논문 대비 포지셔닝

```
                    SDE Code    SDevice Code    Physics     Ontology    Validation
                    Structure   Mesh  I-V  C-V  Model Sel.  Guided      
Nguyen (2024)       O           X     X    X    X           X           X
ChatTCAD (2025)     O           O     X    X    X           X           X
MALTS (2025)        O           O     X    X    X           X           X
AgenticTCAD (2026)  O           O     O    O    Implicit    X           X
Ours                (X)         (X)   O    O    Explicit    O           O
```

**핵심 포지셔닝**: 기존 연구들은 SFT 기반으로 구조(SDE) 코드 생성에 집중했다면, PhysAgent는 synthetic training data 없이 온톨로지 + 문헌 지식으로 physically grounded Sdevice 파일 생성에 집중. 고성능 범용 LLM이 빠르게 발전하는 상황에서, 별도 모델을 fine-tuning하는 것보다 TCAD 도메인의 knowledge structure를 구축하는 것이 핵심.

### 4.5 실험 설계

#### 실험 1: 특정 반도체 재료에 대한 SDevice 파일 생성
- **Library 재료 (SiC, GaN)**: PhysAgent로 생성한 모델을 Sentaurus TCAD Library의 기존 모델과 비교 → 물리적 타당성 및 정확도 검증
- **Non-library 재료 (IGZO)**: Library에 없는 재료에 대해 모델 생성 → 온톨로지 + 문헌 기반으로 확장적 적용 가능성 시연
- → **Fig 4**: 생성된 파라미터 파일 예시 + Library 대비 비교 테이블

#### 실험 2: Ontology 유무에 따른 비교 (Ablation)
- **Baseline**: Sentaurus Guide PDF + LLM (온톨로지/MCP 없이 직접 프롬프트)
- **Ours**: LLM + 온톨로지 (MCP tool로 서브그래프 추출) + 문헌 지식
- **메트릭**: 물리 모델 완전성 (필수 모델 포함 비율), 파라미터 정확도 (문헌 대비 오차), 물리적 타당성 (모델 간 일관성)

#### 실험 3: File Validation (자동 검증)
- 생성된 파일이 온톨로지 구조를 준수하는지 (필수 파라미터 누락 없음)
- Sentaurus에서 실행 가능한지 (문법/구문 검증)
- 물리적으로 타당한지 (파라미터 범위, 모델 간 호환성)
- → **Fig 5**: 자동 검증 파이프라인 다이어그램

### 4.6 Figure 계획

| Fig # | 내용 | 위치 |
|-------|------|------|
| Fig 1 | PhysAgent 전체 파이프라인 (Input → Ontology Graph → MCP Tool → .par File) | Sec III |
| Fig 2 | 온톨로지 서브그래프 시각화 (Bandgap 중심 노드-엣지 관계도) | Sec III |
| Fig 3 | 온톨로지 확장/검증 모델 (Spec → Plan → Impl 동기화) | Sec III |
| Fig 4 | 생성 결과: Library 재료 비교 + IGZO 파라미터 파일 예시 | Sec IV |
| Fig 5 | 자동 검증 파이프라인 (ontology compliance + syntax + physics validation) | Sec IV |

### 4.7 예상 리뷰어 질문 및 대비

1. **"온톨로지를 수동으로 만드는 비용이 크지 않은가?"**
   → Sentaurus TCAD 가이드 기반 one-time construction이며, 가이드 버전 업데이트 시 incremental update 가능. 커뮤니티 공유 가능한 공개 자산.

2. **"왜 fine-tuning이 아니라 knowledge structure 기반인가?"**
   → 공개 TCAD 데이터가 부족한 상황에서 SFT는 근본적 한계. GPT/Claude 등 범용 LLM이 빠르게 발전하므로, 별도 모델을 fine-tuning하기보다 이들이 TCAD 도메인에서 올바르게 작동할 수 있는 knowledge structure를 구축하는 것이 더 효과적.

3. **"실제 시뮬레이션 결과와의 비교가 필요하다"**
   → Sentaurus 라이선스가 있다면 end-to-end 실험 필수. 없다면 전문가 평가(expert evaluation)로 대체 가능하지만, 설득력이 약해짐.

4. **"특정 반도체 재료란 구체적으로 무엇인가?"**
   → 문헌 기반 도메인 지식이 확보된 재료(예: SiC, GaN 등)에 대해 시연. 온톨로지는 재료 독립적이지만, 문헌 지식이 재료별 전문성을 제공.

---

## 5. 작업 로드맵

### Phase 1: 온톨로지 완성 및 쿼리 인터페이스 (현재 진행 중)
- [ ] 주요 챕터(Bandgap, Carrier Density, Mobility, Recombination) 온톨로지 완성
- [ ] 그래프 쿼리 API: "디바이스 유형 → 필요 물리 모델 서브그래프" 추출

### Phase 2: LLM 파이프라인 구축
- [ ] 온톨로지 서브그래프 → LLM 프롬프트 변환기
- [ ] SDevice 코드 생성 프롬프트 템플릿 설계
- [ ] Physics consistency checker (그래프 기반 검증)

### Phase 3: 실험 및 평가
- [ ] Baseline vs Ontology-guided 비교 실험
- [ ] Case study (2-3개 디바이스 유형)
- [ ] 전문가 평가 또는 시뮬레이션 검증

### Phase 4: 논문 작성
- [ ] SISPAD 2026 template 기반 4페이지 작성
- [ ] Figure 제작 (온톨로지 시각화, 파이프라인, 결과)

---

## 6. 핵심 메시지 (한 줄 요약)

> **TCAD의 핵심 챌린지는 구조 생성이 아니라 Sdevice 물리 모델 설정과 파라미터 파일 생성이다. PhysAgent는 synthetic training data 대신 Sentaurus TCAD 가이드 기반 온톨로지와 문헌 기반 도메인 지식을 결합하여, template 수준을 넘어 특정 반도체 재료에 대한 expert-level 모델링 워크플로우를 지원하는 physically grounded Sdevice 파일을 생성한다.**

---

## 7. Introduction 전략 및 기존 연구 비교 논거

### 7.1 기존 4개 논문의 근본적 한계 정리

#### A. SFT의 확장성 문제: Synthetic Training Data의 본질적 한계

기존 연구들(Nguyen, ChatTCAD, AgenticTCAD)은 모두 Supervised Fine-Tuning(SFT)에 의존하며, 합성 학습 데이터를 다음과 같이 생성한다:

- **Nguyen**: 단 1개의 nanowire 템플릿에서 18개 파라미터(두께, 도핑 농도, 재료 등)의 숫자만 랜덤하게 바꿔 7,000쌍을 생성
- **ChatTCAD**: GPT-4o로 합성 데이터 ~10,000쌍을 생성하되, 5개 기능 블록(Region, Doping, Contact, Mesh)별로 분리 생성
- **AgenticTCAD**: 전문가 작성 baseline 스크립트 22개를 기반으로 파라미터 variation을 통해 30,000쌍으로 확장 (code augmentation)

**핵심 문제**: 이 방식은 결국 소수의 baseline 코드에서 숫자만 조금씩 바꿔 뻥튀기하는 것이다. 구조적으로 새로운 디바이스 유형이나 재료를 다루려면 매번 전문가가 새 baseline을 작성하고 다시 augmentation → fine-tuning을 반복해야 한다. **특정 분야에 한정적이고 확장성이 없다.**

#### B. 물리 모델과 파라미터 파일의 부재

기존 연구들의 커버리지를 보면:

| 논문 | SDE (구조) | Mesh | SDevice (시뮬) | Physics Model 선택 | Parameter File |
|------|-----------|------|---------------|-------------------|----------------|
| Nguyen | ✅ | ❌ | ❌ | ❌ | ❌ |
| ChatTCAD | ✅ | ✅ | ❌ | ❌ | ❌ |
| MALTS | ✅ | ✅ | ❌ | ❌ | ❌ |
| AgenticTCAD | ✅ | ✅ | ✅ (SDevice) | **Implicit** (2-3개 고정) | ❌ |

- **AgenticTCAD**는 유일하게 SDevice를 건드리지만, **물리 모델(Physical Model)과 파라미터 파일(Parameter File)은 절대 건드리지 않는다.** SDevice 학습 데이터를 보면 physics 모델은 2-3개의 고정 조합만 있고, 파라미터 파일은 아예 포함되지 않는다. 즉, "어떤 물리 모델을 왜 선택하는가", "재료별 파라미터를 어떻게 설정하는가"는 전혀 다루지 않는다.
- **나머지 3개 논문**은 SDE(구조) 생성에만 집중하며 SDevice 자체를 다루지 않는다.

#### C. TCAD의 본질과의 괴리

TCAD의 존재 이유는 **소자의 물리적 거동을 해석하고 예측하는 것**이다. 이를 위해서는:

1. **적절한 물리 모델 선택**: 디바이스 유형, 재료, 동작 조건에 따라 mobility model, recombination model, bandgap model 등을 올바르게 선택해야 한다
2. **정확한 파라미터 설정**: 재료별 물리 파라미터(effective mass, lattice constant, affinity 등)를 문헌/실험 기반으로 정확히 설정해야 한다
3. **물리 모델 간 일관성**: bandgap narrowing → intrinsic density → recombination 등 모델 간 의존 관계를 이해하고 일관되게 설정해야 한다

**기존 논문들은 이 중 어느 것도 다루지 않는다.** 구조를 예쁘게 만들어도 물리 모델이 잘못되면 시뮬레이션 결과는 의미가 없다. 이것이 PhysAgent가 SDE가 아닌 SDevice의 물리 모델 설정과 파라미터 파일 생성에 집중하는 이유다.

#### D. Introduction 논거 흐름 (요약)

1. **상투적 도입**: 반도체 스케일링 한계 → DTCO 중요성 → TCAD 필수 → 그러나 전문성 요구 → LLM 활용 가능성
2. **기존 연구 요약**: 최근 LLM-TCAD 연구들은 SDE 코드 생성(구조, 메싱)에 집중. SFT 기반으로 소수 baseline에서 숫자만 변형한 합성 데이터로 학습. 특정 구조에 한정적이고 확장성 부족.
3. **핵심 Gap 지적**: 그러나 TCAD의 본질은 물리 해석/예측이며, 이를 위한 **SDevice 물리 모델 선택과 파라미터 파일 생성**은 기존 연구에서 전혀 다루지 않음. AgenticTCAD만 SDevice를 일부 다루나 물리 모델과 파라미터는 고정.
4. **우리의 제안**: PhysAgent는 SFT 대신 TCAD 가이드 기반 온톨로지와 문헌 지식을 결합하여, LLM이 물리적으로 근거 있는 SDevice 설정과 파라미터 파일을 생성할 수 있도록 한다. 재료나 디바이스가 바뀌어도 온톨로지 확장만으로 대응 가능.
