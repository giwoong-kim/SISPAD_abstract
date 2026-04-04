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

### 4.5 실험 설계 제안

#### 실험 1: 특정 반도체 재료에 대한 Sdevice 파일 생성
- 특정 재료(예: SiC, GaN 등)에 대해 PhysAgent로 Sdevice 파일 생성
- 온톨로지 기반 물리 모델 선택 + 문헌 기반 파라미터 설정의 타당성 평가
- Template 수준 생성 vs expert-level 모델링 워크플로우 비교

#### 실험 2: Ontology 유무에 따른 비교
- **Baseline**: LLM에 자연어 설명만 제공 (ontology/literature 없이)
- **Ours**: 온톨로지 + 문헌 지식을 structured context로 함께 제공
- **메트릭**: 물리 모델 완전성, 파라미터 정확도, 생성 파일의 물리적 타당성

#### 실험 3: End-to-End Simulation (가능한 경우)
- 생성된 Sdevice 파일로 실제 Sentaurus 시뮬레이션 실행
- 기존 전문가 작성 파일 대비 결과 비교

### 4.6 Figure 계획

| Fig # | 내용 | 목적 |
|-------|------|------|
| Fig 1 | 온톨로지 서브그래프 시각화 (물리 모델-수식-파라미터 관계) | 온톨로지 구조 설명 (Section III) |
| Fig 2 | PhysAgent 전체 파이프라인 (Ontology + Literature → LLM → Sdevice File) | 방법론 개요 (Section IV) |
| Fig 3 | 특정 재료에 대한 생성 Sdevice 파일 예시 및 물리적 근거 | 결과 설명 (Section V) |

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
