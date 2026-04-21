# PhysAgent — SISPAD 2026 Mock Review

> SISPAD 2026 program committee 관점의 모의 리뷰. TCAD 전문가, LLM-for-EDA 연구자, device physicist, foundry 매니저 4인 패널 가정.

---

## 📌 현재 상태 (2026-04-07 기준)

### ✅ 완료된 보강
- **3 claim 구조 확립** (C1 수렴 / C2 library 95% 일치 / C3 IGZO)
- **Controlled experiment framing** (`.tdr`/`Math`/`Solve` 고정, Physics+`.par`만 변화)
- **Library reference provenance** 가정으로 격상 ("library도 literature에서 왔다" → "PhysAgent가 동일 mapping 재현")
- **74개 library `.par` 비교** 라는 ambitious 검증 target 설정
- **Mini-ablation** (Si/SiC/GaAs)으로 ontology marginal gain 분리
- **3 generator** (Vanilla / LLM+Guide / PhysAgent) 정의 명확화
- **Framework section 정리** (subsection 4 → 3, literature를 generation에 통합)
- **2-page 안에 들어옴**

### ❌ 아직 안 한 것 (실행)
- 실제 Sentaurus 실행 결과 0건
- C1 수렴률 숫자 없음
- C2 library 비교 숫자 없음
- C3 IGZO I-V plot 없음
- Abstract에 정량 숫자 없음
- Fig 3, Fig 4 placeholder 그대로

---

## 🔥 지금 해야 할 것 (Top Priority)

> 설계는 끝났다. **실행만 남았다.** 1번이 여전히 채택/탈락을 가른다.

1. **C1 실행** — Si nMOSFET 1 .tdr × 3 generator × 5 trials = 15 runs
   - 산출물: convergence rate 표 (Fig 3 자리)
2. **C2 phase 1 실행** — 3 material(Si, SiC, GaAs) PhysAgent vs library
   - 산출물: parameter match rate 표 + I-V overlay 1장 (Fig 4 자리)
3. **Abstract에 숫자 박기** — C1, C2 결과로 마지막 문장 1개
4. **C2 phase 2 (74개 확장)** — 시간 되면 자동화로
5. **C3 IGZO** — 1 deck 생성 + Sentaurus 실행 + (가능하면) measurement overlay
6. **Ontology scale 수치 명시** (framework section A에 한 줄)

### ❌ 함정 (여전히 유효)
- Ontology 더 키우기, 새 material 추가, MCP 디테일 강조

---

## 📊 채택 확률표 (업데이트)

| 시나리오 | 채택 확률 | 비고 |
|---|---|---|
| **현재 상태 (설계 완료, 실행 0)** | **35–45%** | 이전 25–35%에서 격상. 3 claim framing과 provenance 격상이 컸음 |
| C1 실행 + Abstract 숫자 | **55–65%** | reject 라인 통과 |
| C1 + C2 phase 1 (3개) | **70–80%** | "구체적 결과" 라인 통과 |
| C1 + C2 phase 2 (74개) | **85–90%** | SISPAD 강력 후보 |
| 위 + C3 IGZO 성공 | **90%+** | 결정적 evidence 완성 |

### D-Day별 권장
| 남은 시간 | 액션 |
|---|---|
| 4일+ | C1 + C2 74개 + C3 |
| 3일 | C1 + C2 phase 1 + C3 |
| 2일 | C1 + C2 phase 1 |
| 1일 | C1 + abstract 숫자 |
| 반나절 | C1 사력, "preliminary" 라벨로라도 |

---

## 종합 평가

| 항목 | 점수 |
|---|---|
| Originality | 4/5 |
| Technical Soundness | 2/5 |
| Experimental Validation | 1/5 |
| Relevance to SISPAD | 4/5 |
| Clarity | 3/5 |
| **Overall** | **Weak Reject (보완 시 Accept)** |

**핵심:** 아이디어는 신선하고 SISPAD scope에 부합. 그러나 **정량 결과가 전무**. 마감 전 최소 1개 디바이스 I-V 비교 확보가 acceptance의 전제조건.

---

## Reviewer #1 — TCAD Industry Expert (2/5)

**Strengths**
- SDevice physics 자동화는 진짜 산업 pain point. 문제 정의 정확.
- Sentaurus guide의 ontology화는 vendor-neutral knowledge representation으로 의미 있음.

**Concerns**
- "Physically grounded" 정의가 약함. Parameter range check은 lint지 physics 검증이 아님.
- Library model 비교 protocol 모호 (Vth? SS? Id?).
- Quantum correction, traps, self-heating 같은 advanced model 다루는가?
- **Convergence**가 SDevice의 진짜 어려움. 수렴률 보고 필수.

---

## Reviewer #2 — LLM-for-EDA Researcher (3/5)

**Strengths**
- SFT-free + ontology 접근으로 기존 SFT 연구의 generalization 한계 정면 돌파.
- AgenticTCAD가 2–3 fixed config만 다룬다는 비판 정확.

**Concerns**
- **AgenticTCAD와 head-to-head 비교 부재**. 직전 SOTA 인용했으면 비교는 필수.
- **Baseline unfair**: "vanilla LLM" vs PhysAgent는 ontology 효과 부풀림. Manual-RAG baseline 필요.
- Literature-driven knowledge가 black box (출처/추출법/규모 불명).
- "Without synthetic data"는 RAG면 당연. Framing 약함.

---

## Reviewer #3 — Device Physicist (2/5)

**Strengths**
- IGZO 같은 emerging material ambition은 가치 있음.
- BGN → ni → recombination dependency 표현은 방향성 옳음.

**Concerns**
- Material-specific 깊이 의심. SiC mobility는 polytype·interface trap dependent. Literature 단순 인용으로 cover 가능?
- GaN polarization charge, IGZO oxygen vacancy trap 같은 material-defining physics 포함되는가?
- Literature 값은 deposition 조건에 따라 1–2 order 변동. 단순 인용은 위험.
- **Library model 비교는 circular**. Measurement 비교가 필수.

---

## Reviewer #4 — Foundry TCAD Manager (3/5)

**Strengths**
- 신입이 SDevice 익히는 데 6개월 → 자동화 가치 큼.
- Ontology public 공개는 reproducibility 가산점.
- "No retraining" + incremental expansion은 vendor update 주기와 부합.

**Concerns**
- Sentaurus guide의 ontology화 IP/license 이슈. Disclaimer 필요.
- **Vendor lock-in** (Silvaco/GTS는?). Vendor-neutrality future work 한 줄.
- User input format 추상적 (doping, gate stack, dimension은 어떻게?).
- Failure mode 분석 부재. "조용히 틀리는 것"이 산업 deployment 최대 리스크.

---

## 4명 합의 사항

1. **결과 부재가 최대 reject 사유.** 4명 중 3명이 "현 상태 reject".
2. **Baseline 약함.** Manual-RAG 추가 필요.
3. **Physics validation 정의 격상.** Range check은 lint.
4. **Ontology scale 숫자 부재.**
5. **AgenticTCAD 정량 비교 부재.**

> **만장일치:** "SiC MOSFET I-V plot 1장이 reject와 accept를 가른다."
