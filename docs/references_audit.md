# References Audit — SISPAD_abstract.tex

검증일: 2026-04-23
검증 방법: WebSearch + WebFetch (Google, IEEE Xplore, AIP, ScienceDirect, arXiv, ADS, Semantic Scholar)
대상: `\begin{thebibliography}` 내 10개 엔트리

---

## 요약

| # | Key | 존재 | 형식 | 접근 | 종합 |
|---|---|---|---|---|---|
| 1 | `dtco` | ⚠️ 불명확 | ✓ | — | 🟡 재확인 필요 |
| 2 | `synopsys_tcad` | ✅ | ✓ | ✓ | 🟢 OK |
| 3 | `nguyen` | ✅ | ✓ | ✓ | 🟢 OK |
| 4 | `chattcad` | ✅ | ✓ | ✓ | 🟢 OK |
| 5 | `malts` | ✅ | ✓ | ✓ | 🟢 OK |
| 6 | `agentictcad` | ✅ | ⚠️ 저자 확인 필요 | ✓ | 🟡 경미 |
| 7 | `ontology_tcad` | ✅ | ⚠️ 저자 표기 | ✓ | 🟡 경미 |
| 8 | `bludau1974` | ✅ | ✓ | ✓ | 🟢 OK |
| 9 | `varshni1967` | ✅ | ✓ | ✓ | 🟢 OK |
| 10 | `lang1996` | 🔴 **확인 불가** | ❌ 불완전 | ❌ | 🔴 **제거/교체** |

---

## 개별 상세

### 🟢 검증 통과 (6건)

#### 2. `synopsys_tcad`
- **URL 확인**: `https://www.synopsys.com/manufacturing/tcad.html` 정상 작동
- **페이지 제목**: "Technology Computer Aided Design (TCAD) | Synopsys"
- **결론**: 유효, 수정 불필요

#### 3. `nguyen` — SISPAD 2024
- **확인**: IEEE Xplore, DOI `10.1109/SISPAD62626.2024.10733015`
- **실제 저자**: Le Minh Long Nguyen, Albert Lu, Hiu Yung Wong
- **내 표기**: `L.~M.~L. Nguyen, A.~Lu, and H.~Y.~Wong` ✅ 일치
- **결론**: 유효

#### 4. `chattcad` — ISVLSI 2025
- **확인**: IEEE Xplore doc 11130247, 또한 CSDL computer.org
- **실제 저자**: Zhe Zhang, Sani R. Nassif, Mehdi B. Tahoori
- **내 표기**: `Z.~Zhang, S.~Nassif, and M.~Tahoori` ✅ 일치
- **결론**: 유효

#### 5. `malts` — ISEDA 2025
- **확인**: dblp.org, arXiv에서 인용됨
- **실제 저자**: J. Dou, J. Zhang, B. Ye, Y. Shen, X. Li, Y. Shi, Y. Zhang, Y. Sun (8명)
- **내 표기**: `J.~Dou \textit{et al.}` ✅ 저자 8명이라 et al. 타당
- **결론**: 유효

#### 8. `bludau1974` — J. Appl. Phys. 45(4) 1846–1848, 1974
- **확인**: ADS `1974JAP....45.1846B`, AIP DOI `10.1063/1.1663501`, Semantic Scholar
- **내 표기**: 완전 일치
- **결론**: 유효 (Si bandgap 표준 인용, 고전)

#### 9. `varshni1967` — Physica 34(1) 149–154, 1967
- **확인**: ADS `1967Phy....34..149V`, ScienceDirect DOI `10.1016/0031-8914(67)90062-6`
- **내 표기**: 완전 일치
- **결론**: 유효 (반도체 bandgap 온도 의존성 landmark)

---

### 🟡 경미한 수정 권장 (3건)

#### 1. `dtco` — Ji et al. IEEE TED 71(1) 138–150, 2024
- **검증 결과**: 검색에서 **정확한 논문을 찾지 못함**. "Ji"라는 성만으로 매칭 안 됨
- **위험**: plausible-looking이지만 실존 확인 안 됨. 내가 **fabricated**된 것일 가능성 있음
- **조치**:
  - IEEE Xplore에서 저자 full name과 DOI로 직접 검색 권장
  - 실제 존재하면 저자 first initial 확정 (예: Z. Ji / J. Ji 등)
  - 찾을 수 없으면 다른 **확실한** DTCO 레퍼런스로 교체 (예: Liebmann 2013 SPIE, Kahng 2015 ICCAD 등)

#### 6. `agentictcad` — arXiv:2512.23742
- **확인**: arXiv 페이지 존재, 제목 일치
- **실제 저자**: 검색 결과에 "Guangxi Fan"만 명시됨 → 단독 저자인지, 공저 있는지 **불명확**
- **내 표기**: `G.~Fan \textit{et al.}` → et al.이 맞는지 확인 필요
- **조치**: `https://arxiv.org/abs/2512.23742` 열어 저자 리스트 확인 → 단독이면 `\textit{et al.}` 제거

#### 7. `ontology_tcad` — vercel 사이트
- **URL 확인**: 정상 로딩, 페이지 제목 "Ontology TCAD / Sdevice Ontology"
- **실제 표기 저자**: "Kim Shin-bin and Kim Ki-woong" (사이트에 명시)
- **내 표기**: `PhysAgent Team` → **저자와 불일치**
- **조치**:
  - 논문 저자(Kim Shinbin, Giung Kim 등)와 일치하도록 수정
  - 또는 그냥 저자명 생략 — 예: `"TCAD Physics Ontology," 2026. [Online]. Available: https://ontology-tcad.vercel.app/`
  - **참고**: 사이트는 "18 graph modules"를 언급하지만 제공받은 snapshot은 "19 chapters" — 최근 추가된 chapter가 아직 사이트 deploy 안 됐을 수 있음 (배포 싱크 확인 권장)

---

### 🔴 실존 확인 불가 (1건) — **즉시 조치 필요**

#### 10. `lang1996` — D.V. Lang and C. Henrich, "Silicon electron-affinity measurement," 1996
- **검증 결과**:
  - Google + Semantic Scholar + ADS 검색 → **결과 없음**
  - "D.V. Lang" + "silicon electron affinity" + 1996 → 아무 매칭 없음
  - D.V. Lang은 실존 인물 (Bell Labs, DLTS 개발자) — 실존 인물 이름이지만 이 **특정 논문**은 존재 불확실
  - 공저자 "C. Henrich"은 이름 자체도 불분명 (Heinrich? Henry? 오타 가능성)
- **추정**: 이전 LLM이 플레이스홀더로 만든 **hallucinated citation**일 가능성 높음
- **원래 발췌 시 저자가 부여한 주석**: "[full citation needs verification]" — 이미 의심 플래그 있음
- **조치 (택1)**:
  - **(A) 제거**: 사용하지 않거나 본문 인용이 없다면 삭제
  - **(B) 교체**: Si electron affinity 인용이 필요하면 정확한 출처로 교체. 추천:
    - **S.~M.~Sze, \textit{Physics of Semiconductor Devices}, 3rd ed. Wiley, 2007.** — 교과서, $\chi_{\text{Si}}=4.05$ eV 표준 인용
    - **Ioffe Institute NSM Database** — `http://www.ioffe.ru/SVA/NSM/Semicond/Si/basic.html` (online, 접근 자유)
  - **(C) 확인**: Bell Labs 아카이브나 SSDM/APS 회의록 직접 검색 (가능성 낮음)

---

## 형식 체크리스트 (IEEE style)

- [x] 모든 엔트리에 저자·제목·venue 포함 — 단 `lang1996` 예외 (venue/vol/pp 누락)
- [x] 제목은 `` ` `` quote 사용 (LaTeX 스타일)
- [x] journal/conference 이름 `\textit{}` — 일관
- [x] 페이지 en-dash `--` 사용 — 일관
- [ ] `lang1996`: journal, volume, pages 모두 누락 — IEEE style 미준수

---

## 접근성 체크

| Ref | 직접 링크 | 인증 필요? |
|---|---|---|
| `dtco` | IEEE Xplore (추정) | 네 (구독) |
| `synopsys_tcad` | https://www.synopsys.com/manufacturing/tcad.html | 불필요 |
| `nguyen` | https://ieeexplore.ieee.org/document/10733015/ | 부분 (IEEE 접근) |
| `chattcad` | https://ieeexplore.ieee.org/document/11130247/ | 부분 (IEEE 접근) |
| `malts` | ISEDA 2025 proceedings | IEEE/출판사 접근 |
| `agentictcad` | https://arxiv.org/abs/2512.23742 | 불필요 |
| `ontology_tcad` | https://ontology-tcad.vercel.app/ | 불필요 |
| `bludau1974` | https://doi.org/10.1063/1.1663501 | AIP 구독 |
| `varshni1967` | https://doi.org/10.1016/0031-8914(67)90062-6 | ScienceDirect 구독 |
| `lang1996` | — | 해결 전 접근 불가 |

**리뷰어 접근성 관점**: 대부분 IEEE/AIP/Elsevier 구독 필요하지만 이건 표준. arXiv + vercel 링크는 open. `lang1996` 외엔 문제 없음.

---

## 실행 권장 순서

1. 🔴 **즉시**: `lang1996` 처리 결정 — 제거 vs 교체(Sze 교과서 또는 Ioffe 권장)
2. 🟡 **검증**: `dtco`의 정확한 DOI 확인 (IEEE Xplore 직접) — 못 찾으면 교체
3. 🟡 **확인**: `agentictcad` arXiv 페이지에서 저자 리스트 확인 → `et al.` 유지/제거
4. 🟡 **정리**: `ontology_tcad` 저자 표기를 논문 저자와 맞춤 (또는 생략)

---

*자동 검증 리포트 — 수동 확인이 필요한 항목은 IEEE Xplore/arXiv에서 DOI로 직접 확인 바람.*
