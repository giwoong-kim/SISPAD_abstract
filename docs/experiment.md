# PhysAgent — Experiment Plan

> SISPAD 2026 마감 전 실행할 실험. PhysAgent의 3가지 claim을 각각의 material로 증명한다.

---

## 🎯 한눈에 보기

| Claim | 한 줄 | Material | 비교 대상 | 핵심 metric |
|---|---|---|---|---|
| **C1. 동작성** | TCAD 계산이 정상 수렴 | Si | 3 generator 간 | Convergence rate (%) |
| **C2. 물리적 타당성** | Library와 95%+ 일치 | 3개 이상 (목표 34개) | Sentaurus library `.par` | Parameter 일치도 ≥95% |
| **C3. 확장성** | Library 없는 물질도 생성 | a-IGZO | (Optional) measurement | I-V curve 생성 가능 여부 |

**공통 가정 (controlled variables):**
- `.tdr` 고정 (mesh, doping, geometry)
- SDevice `.cmd`의 `File`/`Electrode`/`Math`/`Solve`/`Plot`/`System` 섹션 고정
- **변화: `.cmd`의 `Physics` 섹션 + `.par` 파일 전체**
- 모든 generator: 동일 base LLM, 동일 system prompt, temperature 고정

> **본문 명시 문장:** "We fix the device structure (.tdr), solver settings, and bias schedule, and evaluate generators only on the Physics section of the SDevice command file and the parameter (.par) file — the expert-driven part of TCAD setup."

---

## C1. 동작성 — Si nMOSFET

**증명할 것:** Ontology 없으면 수렴하는 SDevice deck을 안정적으로 못 만든다.

### Trial 구성: Prompt Quality Gradient

12 trials = **3 quality levels × 4 repetitions**. 모든 generator에 동일한 prompt 사용 (controlled).

**Prompt quality 축**

| 축 | 좋은 prompt | 나쁜 prompt |
|---|---|---|
| 정보량 | dimension/doping/gate stack 명시 | "Make a Si MOSFET" |
| 전문성 | TCAD 용어 | 일상어 |
| 구조성 | 항목별 정리 | 줄글 |
| 명시성 | "use Philips mobility, SRH" | "use appropriate physics" |
| 언어 정확성 | native 수준 | 비전문가 영어 |

**3단계 정의 (Si nMOSFET 예시)**

| Level | 이름 | 포함 | 예시 |
|---|---|---|---|
| **L1** | Expert | dim+doping+gate+권장 모델 명시 | "Generate SDevice files for an n-channel Si MOSFET, Lg=65nm, EOT=1.2nm, channel doping 1e18 cm⁻³, S/D 1e20 cm⁻³. Use Philips unified mobility, Slotboom BGN, SRH+Auger recombination." |
| **L2** | Basic | device+주요 dim만 | "Generate SDevice files for a Si nMOSFET with Lg=65nm and EOT=1.2nm." |
| **L3** | Minimal | one-line, 비전문가 | "I want to simulate a silicon transistor in Sentaurus." |

### 측정 protocol
- Si nMOSFET `.tdr` 1개 고정
- 각 generator × 12 trials (3 levels × 4) = **36 runs**
- Sweep: Id-Vg @ Vd=0.05V, Vd=Vdd
- 수렴 정의: sweep 끝점 도달 + `Done.` + no `Nonconvergence`

### 보고 형태 (예시, level별 수렴 trial 수 / 4)

| Generator | L1 (Expert) | L2 (Basic) | L3 (Minimal) | Avg |
|---|---|---|---|---|
| Vanilla LLM | 3/4 | 1/4 | 0/4 | 33% |
| LLM + Guide | 4/4 | 2/4 | 0/4 | 50% |
| **PhysAgent** | **4/4** | **4/4** | **3/4** | **92%** |

→ 핵심 메시지: PhysAgent는 prompt quality 저하에 robust (L1~L3 평탄), baseline은 L3에서 붕괴.

### 왜 차이가 나는가

| 실패 원인 | Vanilla | + Guide | PhysAgent |
|---|---|---|---|
| 키워드 hallucination | 자주 | 가끔 | 거의 없음 (ontology 정확한 이름) |
| 필수 모델 누락 (특히 L4~L5) | 자주 | 가끔 | 없음 (required set 강제) |
| 모델 조합 충돌 | 자주 | 자주 | 없음 (incompatible edge 차단) |
| 의존성 깨짐 | 자주 | 가끔 | 없음 (uses/controls edge) |
| Parameter range 위반 | 자주 | 가끔 | 거의 없음 (range 제약) |
| 순수 numerical 발산 | 가끔 | 가끔 | 가끔 (책임 외) |

### Fig 3 (exp1 자리): Grouped bar

```
              L1(Expert)  L2(Basic)  L3(Minimal)
   Vanilla     ███          █          ░
   LLM+Guide   ████         ██         ░
   PhysAgent   ████         ████       ███

   X: prompt quality level (3 groups)
   Y: convergence rate (0/4 ~ 4/4)
   3 colors per group
```

### 해야 할 것
- [ ] 3개 prompt 텍스트 최종 확정 (L1~L3)
- [ ] 3 generator의 system prompt 통일
- [ ] 36 runs 자동화 스크립트
- [ ] Failure mode 자동 분류 (model_conflict / missing / hallucination / numerical)
- [ ] Grouped bar plot 스크립트

---

## C2. 물리적 타당성 — Library와 95%+ 일치

**증명할 것:** PhysAgent가 만든 `.par`이 Sentaurus library `.par`과 parameter 수준에서 일치한다.

### Pipeline
```
Reference paper(s) + Ontology
        ↓
   PhysAgent
        ↓
   PhysAgent.par  ←→  Library.par   (parameter-level 비교)
```
 
### Scope
- **Sentaurus library의 34개 반도체 material 전부** — 모두 source literature가 공개적으로 접근 가능한 물질로 한정
- 각 material마다 PhysAgent `.par` ↔ library `.par` parameter-level 비교
- Target: **parameter match rate ≥ 95%**

> **선정 기준:** (1) Sentaurus library에 포함, (2) 반도체 (insulator/metal 제외), (3) source literature가 publicly accessible. 이 기준이 PhysAgent의 retrieval이 library 구성에 사용된 동일 reference에 도달 가능함을 보장한다 — selection bias 및 circular comparison 비판 차단.

### 측정 metric

| # | Metric | 정의 | 잡는 것 | 비용 |
|---|---|---|---|---|
| 1 | **Model Selection Accuracy** | PhysAgent와 library의 physics 모델 set 일치도 (Jaccard 또는 F1) | 모델 누락 + 오선택 | 낮음 (set 비교) |
| 2 | **Parameter Match Rate** | (값이 tolerance 이내인 parameter 수) / (library parameter 총수) | 잘못된 calibration | 낮음 (값 비교) |
| 3 | **I-V RMS error** *(stretch)* | 같은 .tdr에 두 .par 적용 후 Id-Vg RMS 차이 | 실제 시뮬레이션 거동 | 높음 (sdevice 실행) |

> Metric 1, 2는 34개 전부에 적용. Metric 3은 비용이 커서 대표 material 5–10개에만 적용 (stretch).

### 보고 형태 (예시, 34개 카테고리 요약)

| Category | # materials | Model Selection Acc | Param Match | I-V RMS¹ |
|---|---|---|---|---|
| Group IV (Si, Ge, SiC, …) | 6 | 100% | 97% | 3% |
| III–V binary (GaAs, InP, …) | 10 | 100% | 95% | 4% |
| III–V ternary | 9 | 95% | 88% | 7% |
| II–VI / oxide | 6 | 90% | 82% | 12% |
| Other | 3 | 85% | 78% | 15% |
| **Total** | **34** | **94%** | **89%** | **6%** |

¹ I-V RMS는 카테고리당 대표 material 1–2개에 한해 보조 측정.

> 개별 34개 material 결과는 supplementary 표에 정리.

### 해야 할 것
- [ ] Ontology 34개 material 전부 cover하도록 확장
- [ ] Reference paper DB 정리 (library의 source literature)
- [ ] `.par` 자동 생성 파이프라인 (34개 batch)
- [ ] Model Selection Accuracy 비교 스크립트 (set Jaccard/F1)
- [ ] Parameter Match Rate 비교 스크립트 (per-parameter tolerance)
- [ ] 카테고리별 집계 + supplementary table 생성
- [ ] (stretch) 대표 material 몇 개 I-V RMS

---

## C3. 확장성 — Library 없는 물질 (a-IGZO)

**증명할 것:** Library가 없는 물질도 ontology + LLM으로 modeling 하고, 실제 시뮬레이션이 돌아간다.

### Pipeline
```
Ontology + LLM + IGZO literature
        ↓
   IGZO.par 생성
        ↓
   Sentaurus 실행
        ↓
   Id-Vg curve (← measurement와 비교, 가능하면)
```

### 측정 결과 (목표)
- IGZO `.par` 생성 성공 ✅
- Sentaurus가 수렴 ✅
- Id-Vg curve가 published measurement의 거동을 재현 (sub-threshold slope, on-current 수준)

### 해야 할 것
- [ ] IGZO literature 수집 (mobility, trap DOS, sub-gap states)
- [ ] IGZO TFT `.tdr` 1개 (SDE 직접)
- [ ] PhysAgent로 `.cmd`/`.par` 생성
- [ ] Sentaurus 실행 → Id-Vg 추출
- [ ] (Optional) published a-IGZO TFT 논문 1편 digitize → overlay

---

## 우선순위 & 실행 순서

1. **C1 (Si)** — 파이프라인 검증, 가장 빠름
2. **C2 (3개 → 34개)** — 핵심 evidence, ontology 확장 작업이 가장 큼
3. **C3 (IGZO)** — Story 마무리

### 최소 진입선 (D-1 시나리오)
- C1 Si 1개 + C2 3개 material만 → 채택 라인 충족
- C2 34개와 C3 IGZO는 stretch

---

## 디렉토리 구조

```
experiment/
├── tdr/
│   ├── si_nmos.tdr
│   ├── sic_nmos.tdr
│   └── igzo_tft.tdr
├── reference/
│   ├── library_par/        # Sentaurus library .par 34개
│   └── papers/             # source literature
├── generated/
│   └── {vanilla,guide,ontology}/{si,sic,...}/trial_{01..05}/
├── runs/                   # sdevice 실행 결과
└── results/
    ├── c1_convergence.csv
    ├── c2_param_match.csv
    └── c3_igzo_iv.csv
```

---

## D-Day 체크리스트

### Day -3
- [ ] Si `.tdr` 확보 → C1 파이프라인 dry-run
- [ ] Library `.par` 34개 수집 + reference paper 매핑 시작
- [ ] 3 generator prompt template 확정

### Day -2
- [ ] C1 실행 (15 runs) → convergence 표
- [ ] C2 Phase 1 (3 materials) 실행 → param match 표
- [ ] IGZO `.tdr` 작성

### Day -1
- [ ] C2 Phase 2 (34개) 시도 (자동화로)
- [ ] C3 IGZO 생성 + 실행 + I-V plot
- [ ] Result 본문 + Abstract 숫자 박기
- [ ] Fig 3, 4 placeholder 교체

### Day 0
- [ ] PDF 재컴파일 + 제출

---

## 핵심 원칙

1. **각 claim은 하나의 (또는 한 종류의) material로 증명한다.**
2. **C1은 빠르게, C2는 깊게, C3는 결정적으로.**
3. **Vanilla는 sanity floor, 진짜 비교는 LLM+Guide vs LLM+Ontology.**
4. **수렴 안 한 것도 분류해서 정직하게 보고.**
5. **C2의 34개 `.par` 비교가 paper의 진짜 무기.** 가능하면 끝까지 가라.
