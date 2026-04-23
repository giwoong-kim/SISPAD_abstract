# PhysAgent 초록 — 일관성 검토 & 리뷰어 시각 (SISPAD, 추가 실험 불가)

작성일: 2026-04-23 (최초) / 2026-04-23 Phase 1 완료
범위: 현재 커밋 기준 전 섹션

## 진행 상태 (라이브 업데이트)

| Phase | 항목 | 상태 |
|---|---|---|
| Phase 1.1 | 🔴 3.B–4 도구 용어 통일 (4 tools 이름 그대로) | ✅ 완료 |
| Phase 1.2 | 🔴 `ontology_mcp` ↔ PhysAgent 등가 문장 | ✅ 완료 |
| Phase 1.3 | 🔴 서론 "materials" 톤다운 → "physical configurations" | ✅ 완료 |
| Phase 1.4a | 🔴 3.C (Ontology Expansion) 삭제 | ✅ 완료 |
| Phase 1.4b | 🔴 4 본문 압축 → PDF 2페이지 복귀 | ✅ 완료 (3 → 2 pages) |
| — | 보너스: Fig 3 본문 참조 추가 | ✅ 완료 |
| — | 보너스: "(.cmd Physics block + .par)" 순서 정정 | ✅ 완료 |
| — | 보너스: "production-grade" 삭제 | ✅ 완료 |
| — | 보너스: "merely shifts failure mode" → honest coverage framing | ✅ 완료 |
| Phase 2 | 🟡 Parser-pass metric scope 명시 (M4 방어) | ✅ 완료 |
| Phase 2 | 🟡 결론에 수치 반영 (10/10 vs 0/10, 71\%) | ✅ 완료 |
| Phase 2 | 🟡 Fig 3 caption에 "raw trial-by-trial" 명시 (M5 방어) | ✅ 완료 |
| Phase 3 | 🟢 Ontology 규모 정량화 (M8) | ✅ 완료 (Fig 1 caption) |
| Phase 3 | 🟢 전체 ontology 토큰 수 실측 (400K → 458K) | ✅ 완료 (3.B) |
| Phase 3 | 🟢 Reproducibility 1-liner | ⏳ 대기 |
| Phase 3 | 🟢 Hallucinated keyword 예시 | ⏳ 대기 |
| Phase 3 | 🟢 분산 리포트 | ⏳ 대기 |

## Phase 1 결과 요약

- **Section 4** `~210 → ~160 words` 축소
- **3.C 삭제**로 Ontology Expansion 고아 제거
- **용어 일관**: 4에서 `get_chapter` / `get_reference` / `ontology_overview` 3.B 이름 그대로 사용 (`build_syntax`는 deck 조립 단계이므로 평가 축에서는 자연스럽게 빠짐)
- **네이밍 bridging**: "(\texttt{ontology\_mcp}, the PhysAgent configuration)" 삽입
- **Honest framing**: `manual_mmd_subset`의 coverage 39→54% 증가를 **인정**하고, parser 실패 원인은 "LLM cannot reliably lift structural keywords from prose"로 재기술
- **수치 일관**: 4에서도 "200K context window" 표현으로 3.B와 통일 ("100× more tokens" 프레이밍 폐기)

## Phase 2 결과 요약

- **4 본문**: "parser acceptance certifies structural validity; simulation convergence and measurement match are beyond this abstract's scope." 삽입 → M4 자가-제한
- **결론**: 수치 1줄 추가 → "10/10 parser pass at 71\% section coverage, versus 0/10 for both baselines"
- **Fig 3 caption**: "raw trial-by-trial outcomes (not aggregated)" 명시 → M5의 "집계 아닌가?" 의심 차단
- PDF 2페이지 유지 (3993860 bytes)

## 남은 리스크 (Phase 3)

- M7 (hallucinated keyword 근거): 예시 1개 추가로 해결 (e.g., SPICE-style \texttt{mu0})
- M8 (ontology 규모 미공개): 3.A 또는 Fig 1 caption에서 정량화 필요
- m5 (reproducibility): 모델 버전/seed/prompt URL 1줄

---

*아래 Part 1–4는 원본 분석 (변경 없음, 레퍼런스용)*

---

범위: 현재 커밋(`bf1dd1f` / 3-page draft) 기준 전 섹션

---

## Part 1. 내부 일관성 (저자 관점)

### 🔴 Must-fix

#### 1. 3.B와 4의 도구 명명·개수 충돌
- **3.B**: 4개 tool (`ontology_overview`, `get_chapter`, `get_reference`, `build_syntax`)
- **4**: "three independent tool-accessible axes" — (a) per-model activation syntax, (b) equation-anchored retrieval, (c) explicit list of required sections
- `build_syntax`가 4에서 누락. 매핑 관계가 불명시.

**Fix**: 4에서 "three tool outputs that support `ontology_mcp`" 같이 용어 통일하고 4개 도구로 표기 일치.

#### 2. 생성기 네이밍 스위치 (PhysAgent ↔ ontology_mcp)
- 초록·서론·3장 전체: "PhysAgent"
- 4: `no_source` / `manual_mmd_subset` / `ontology_mcp` — PhysAgent라는 이름이 전혀 안 나옴.

**Fix**: 4의 도입부에 "(\texttt{ontology\_mcp}, the PhysAgent configuration)" 한 번 brigding.

#### 3. 서론의 "materials generalization" 약속 미이행
- 서론: "limits generalization to unseen device architectures or **materials**"
- 서론: "**material-specific knowledge**"
- 실제 4: Si nMOSFET 단일

**Fix**: 추가 실험 불가이므로 서론을 톤다운 — "material-specific physical models" 같은 안전한 표현으로 materials 일반화 주장 축소.

#### 4. 페이지 오버플로우 (3 → 2 pages 복귀 필수)
SISPAD abstract는 2페이지 제한. 현재 3페이지.

**Fix 우선순위**:
- 3.C(Ontology Expansion) 삭제 or 1줄 축약 (지금은 40여 워드, 아래 5번 참조)
- 4 본문의 수식어 제거: "by interpolating from adjacent domains (circuit simulators, general semiconductor literature)" → 삭제
- 4의 결론문장 "These results demonstrate that in LLM-driven TCAD generation the structure—not the volume—of context sets the ceiling on output quality, and that a domain ontology coupled with on-demand tool access is a necessary condition for production-grade deck generation." → 한 줄로 축약

---

### 🟡 Should-fix

#### 5. 3.C(Ontology Expansion)가 고아
Spec/Plan/Impl 동기화 워크플로우 설명이 있으나, 4에서 검증·참조 없음. Fig 1/2도 이걸 안 보여줌.

**Fix**: 삭제 권장 (페이지 예산 확보). 유지하려면 3.B 끝에 "expansion is supported without retraining via a Spec/Plan/Impl sync workflow (not evaluated here)" 한 줄 merge.

#### 6. "14 required parameter sections" 맥락 부재
4에서 갑자기 등장, 정의 없음.

**Fix**: "14 canonical \texttt{.par} sections (e.g., Bandgap, Epsilon, eDOSMass, ConstantMobility, ...)"로 예시 추가 OR Fig 4 caption에 이동.

#### 7. Fig 3 본문 미참조
Trial 테이블(Fig 3)이 4의 "0/10, 0/10, 10/10" 데이터 그 자체인데 `\ref` 누락.

**Fix**: 본문에 `Fig.~\ref{fig:exp1}` 추가.

#### 8. Physics block 위치 불일치
- 3.A: "The physics block in the \texttt{.cmd} file"
- 4: "(.par parameter file + Physics block)" → Physics block이 .par 독립처럼 읽힘

**Fix**: 4 첫 문장을 "(\texttt{.cmd} Physics block + \texttt{.par})"로 순서 뒤집기.

#### 9. 결론이 4의 수치를 반영 안 함
현재 결론 1문장, 정성적 서술만.

**Fix**: "PhysAgent achieved 10/10 parser pass with 71\% section coverage, vs 0/10 for both raw-text and no-context baselines" 한 줄 추가.

#### 10. 토큰 프레이밍 불일치
- 3.B: 400k ontology / 200k context
- 4: "100× more tokens than no_source" (상대 배수만)

**Fix**: 4에서 "~180K system tokens, occupying ~88\% of the 200K context window"로 3.B와 같은 단위 사용.

---

## Part 2. 리뷰어 관점 (adversarial — 있는 결과 한정)

> *"The paper has a clear thesis but its experimental scaffolding is narrower than its claims, and several baseline choices make the comparison structurally favorable to the proposed method."*

### 🔴 Major concerns

#### M1. "Materials generalization" claim vs single-material evaluation
저자는 서론에서 "limits generalization to unseen device architectures or materials"와 "material-specific knowledge"를 두 번 강조한다. 그러나 실험은 **Si nMOSFET 1건**뿐이다. Materials 일반화에 대한 주장은 **empirically unsupported**이며, 서론의 motivation과 4의 scope 사이 간격이 크다.

> **Action**: 서론에서 materials 단어를 삭제 혹은 "across physical models"로 약화. 현 실험 범위와 일치시킬 것.

#### M2. "Production-grade deck generation" — scope에 비해 강한 주장
하나의 device (Si nMOSFET), 하나의 material, 10 trials로 "production-grade"는 무리다. Production이 무엇을 의미하는지(IV match? convergence? yield?) 정의되지 않았고, 실제로는 **parser pass + section presence** 2개 지표만으로 판정됐다.

> **Action**: "production-ready"가 아닌 "parser-valid and section-complete" 정도로 완화. conclusion에서도 동일.

#### M3. Baseline 선택의 구조적 편향 — `manual_mmd_subset`은 straw-man
`manual_mmd_subset`은 **raw text dump**로, 현대 LLM 파이프라인에서 아무도 이렇게 안 쓴다. 표준 비교 기준은:
- **Chunked RAG baseline** (manual을 embedding + retrieval)
- **Structured summary** (매뉴얼을 미리 정리한 구조화 문서)

두 baseline 모두 부재하고, "raw dump" vs "ontology+tools" 비교는 **ontology가 이기도록 설계된 게임**이다.

> **Action**: 한계 인정 섹션에 "we compare to a raw-text baseline rather than RAG; structured retrieval baselines remain to be evaluated" 한 줄 명시.

#### M4. Parser pass ≠ physically correct
`sdevice` parser 통과는 syntactic validity만 보증하고, deck이 수렴하는지(**convergence**), 생성된 `.par`가 실제 측정과 일치하는지(**IV match**)는 검증되지 않았다. 즉 "parser pass = 10/10"은 **가장 약한 정의의 "successful execution"**이다.

> **Action**: "parser-level validation" / "structural validity"로 metric명 재명명. 4의 첫 문장과 Fig 3 caption에서 명시.

#### M5. 통계적 유의성 / 분산 리포트 없음
10 trials per condition인데 trial-to-trial 분산이 리포트되지 않았다. `ontology_mcp`의 71% coverage는 평균인지 단일 값인지 불명. 만약 trial마다 55~85%로 튀었다면 결론이 달라진다.

> **Action**: Fig 3 caption 또는 본문에 "(mean ± std across 10 trials)" 추가. 현재 데이터로 분산만 구해 넣으면 됨.

#### M6. `manual_mmd_subset`의 coverage 54% vs `no_source` 39% — LLM이 매뉴얼을 **쓰긴 썼다**
저자의 논지는 "raw text 주입해도 실패한다"이지만, 54% > 39%라는 사실은 **매뉴얼이 실제로 부분적으로 기여**했음을 보여준다. "merely shifts the failure mode"라는 서술은 이 15%p 증가를 덮는다.

> **Action**: "raw-text injection improves coverage (39→54\%) but not parser pass, as the LLM cannot reliably parse structural keywords from prose" — 솔직하게 서술.

#### M7. "Hallucinated keywords by interpolating from adjacent domains (circuit simulators, general semiconductor literature)" — 근거 부재
이 claim은 정성적이고, 어떤 방식으로 "adjacent domain에서 왔다"를 판단했는지 명시 없음. 1-2개 예시(실제 hallucinated keyword가 SPICE/Verilog-A에서 왔다는 등) 없이는 **subjective claim**.

> **Action**: 구체 예시 1개 추가 — e.g., "e.g., the LLM emitted \texttt{mu0}, a SPICE-style mobility keyword absent from SDevice."

#### M8. Ontology 구축 과정이 미검증
"We construct a directed graph from the Sentaurus TCAD guide"만 있고, 수동인지 자동인지, 커버리지가 어느 정도인지 리포트 없음. Ontology가 PhysAgent의 **home turf**라면, coverage 71%가 사실 "PhysAgent가 자기 ontology를 얼마나 활용하는가"일 뿐, 일반 SDevice 능력이 아닐 수 있다.

> **Action**: 3.A 또는 Fig 1 caption에 "the ontology currently encodes N equations / M parameters spanning K chapters of the SDevice manual"로 정량화. 3.B/4의 claim에 자연적 limit이 붙음.

#### M9. Context window 논증의 취약성
3.B는 "Claude Sonnet의 200k context, 400k ontology라 주입 불가"를 MCP 필요성의 근거로 든다. 그러나 이는 **모델 선택의 부산물**이다. Claude Opus (1M), GPT-4 Turbo (128K), Gemini 1.5 (1M) 등 다른 모델에서는 전면 주입이 가능하거나 불가능해진다. 즉, "왜 MCP가 필요한가"가 **architecture-agnostic argument가 아니다**.

> **Action**: "Even with extended-context models, selective retrieval reduces unnecessary token cost and preserves parameter-level provenance via citation tags" — context argument를 token cost / provenance로 전환.

#### M10. Prior work 비교 부재
서론은 `nguyen, chattcad, malts, agentictcad`를 인용하고 "none adequately addresses physics model selection"이라 주장하지만, 4에서 이들과의 **직접 수치 비교가 없다**. 특히 AgenticTCAD는 SDevice를 다룬다고 서론에 인정했으므로, 최소한의 comparative discussion은 기대된다.

> **Action**: 4 끝이나 conclusion에 "our coverage metric is not directly comparable to AgenticTCAD's fixed-configuration approach, which omits `.par` files entirely"로 포지셔닝.

---

### 🟡 Minor concerns

#### m1. "14 required parameter sections" — magic number
어떤 14개인가? 선정 기준은? 14 선정이 자의적이면 coverage 숫자도 자의적이 된다.

> **Action**: 정의와 목록을 appendix/caption에 명시.

#### m2. Prompt engineering confound
세 조건이 **동일 prompt**를 쓰는지 확인 필요. 만약 `ontology_mcp`는 tool use를 유도하는 추가 instruction을 포함한다면, 비교는 **prompt design + knowledge source 복합 변수**가 된다.

> **Action**: "identical system prompt" 강조, 차이는 knowledge-source 주입 방식에만 있다고 명시.

#### m3. Fig 3의 uniform 패턴 (K×10, ✓×10)
모든 trial이 동일 failure mode로 떨어지는 것은 **stylized visualization**처럼 보인다. 실제 데이터가 이렇게 균일한가? 만약 실험 결과를 단순화한 것이라면, 이는 **데이터 무결성 우려**를 일으킴.

> **Action**: Fig 3이 실제 raw 결과면 caption에 "raw trial-by-trial outcomes, not aggregated"를 명시. 집계면 "summarized" 표기.

#### m4. Citation tag provenance 검증 부재
3.B는 "each parameter inherits the citation... enabling parameter-level provenance"를 주장하지만, 4에서 **인용의 정확성 감사(audit)**가 이뤄지지 않았다. 가령 10% citation이 부정확하면 provenance claim이 훼손된다.

> **Action**: Fig 4의 캡션에 "All parameter values shown are verifiable against their cited sources."와 같이 명시적으로 감사 주장 — 또는 제한 인정.

#### m5. Reproducibility 부족
- Claude Sonnet 버전(`4-6`? `4-7`?) 미명시
- Temperature, top_p, seed 미명시
- Prompt 원문 미공개

> **Action**: Reproducibility 문장 1줄 — "Claude Sonnet 4.6, temperature 0, prompts at [ontology-tcad.vercel.app]" 등.

#### m6. "3.C Ontology Expansion"은 검증 없는 서술
Spec/Plan/Impl 동기화가 실제로 작동함은 실험으로 증명되지 않음. 2페이지 초록에서 검증 없는 프레임워크 제안은 **공간 낭비 + 의심스러움**.

> **Action**: 삭제.

---

## Part 3. SISPAD 리뷰 점수 예측 (있는 결과 기준, 수정 없이)

| 항목 | 점수 (1-5) | 코멘트 |
|---|---|---|
| Novelty | 4 | Ontology + MCP + LLM 조합은 TCAD에서 신선함 |
| Technical depth | 2.5 | Parser pass 수준에 그침, convergence/IV match 없음 |
| Experimental rigor | 2 | 1 material, 1 device, 10 trials, no statistics |
| Baselines | 2 | Raw-text baseline은 straw-man, RAG/prior work 부재 |
| Clarity | 3.5 | 3.B–4 용어 불일치, "14 sections" 맥락 부재 |
| Reproducibility | 2 | 모델 버전/prompt/seed 미공개 |
| Impact | 3 | Framework은 유망, 증명은 초기 |

**예상 판정**: *Weak Accept* (border-line). 수정 없이 내면 **Weak Reject** 가능성.

---

## Part 4. 2페이지 제약 하에서의 최소 조치 (우선순위)

### Phase 1 — 즉시 (페이지 복귀 + 일관성)
1. 🔴 **3.C 삭제** → 페이지 확보 + 고아 섹션 제거
2. 🔴 **4 도입부에 `ontology_mcp = PhysAgent` 등가 문장** 추가
3. 🔴 **4의 "three axes" → 3.B의 "4 tools" 용어로 일치**
4. 🔴 **서론 materials 어구 톤다운**

### Phase 2 — 1시간 내 (honest framing)
5. 🟡 **"production-grade" → "parser-valid, section-complete"**
6. 🟡 **"merely shifts" 서술 수정 → raw-text의 부분 기여(39→54%) 솔직 서술**
7. 🟡 **Fig 3에 `Fig.~\ref{fig:exp1}` 본문 참조 추가 + "raw trial outcomes" caption 명시**
8. 🟡 **Parser-pass metric 명시: "structural validity; convergence and IV match are out of scope"**

### Phase 3 — 여유 있으면 (reviewer hardening)
9. 🟢 **Ontology 규모 정량화** (chapter 수, equation 수, parameter 수)
10. 🟢 **Reproducibility 1-liner** (모델 버전/temp/prompt URL)
11. 🟢 **Hallucinated keyword 예시 1개** (SPICE-style)
12. 🟢 **변동성 리포트** ("mean ± std across 10 trials" caption)

---

*작성자: review session w/ Claude Opus — 이 문서는 저자 내부 검토용, 본 초록에 포함되지 않음.*
