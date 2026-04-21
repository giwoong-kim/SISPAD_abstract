
# Ontology Expansion Plan — MaterialDB `.par` 전체 커버리지

> 목적: `MaterialDB/`의 74개 `.par` 파일에 등장하는 **모든 파라미터 블록**을 현재 ontology(현재 ch12·15·16·17 만 존재)로 표현 가능하게 만들기 위해, `guide/Chapter.md` 상에서 **추가로 작성해야 할 챕터 spec 의 전수 목록**을 정리한다.
>
> 방법: 74개 파일에서 추출된 고유 top-level 섹션 키워드를 모두 모은 뒤, 각 키워드를 `guide/Chapter.md` 의 챕터 번호에 매핑한다. 매핑되지 않은 잔여 항목은 "ontology 스키마 확장" 항목으로 분리한다.

---

## 0. 현재 커버리지

| 챕터 | 상태 | spec 위치 |
|---|---|---|
| **Ch12** Semiconductor Band Structure | ✅ 작성됨 | `_specs/graph/chapters/ch12/` |
| **Ch15** Mobility | ✅ 작성됨 | `_specs/graph/chapters/ch15/` |
| **Ch16** Generation–Recombination | ✅ 작성됨 | `_specs/graph/chapters/ch16/` |
| **Ch17** Traps and Fixed Charges | ✅ 작성됨 | `_specs/graph/chapters/ch17/` |

위 4개 챕터는 .par 의 다음 섹션을 흡수한다 (참고용):
- **ch12**: `Bandgap`, `OldSlotboom`, `Slotboom`, `Bennett`, `JainRoulston`, `TableBGN`, `MultiValley`, `BandstructureParameters`, `LatticeParameters`, `SchroedingerParameters`, `QuantumPotentialParameters`(부분)
- **ch15**: `ConstantMobility`, `DopingDependence`, `PhuMob`, `EnormalDependence`, `IALMob`, `IALMob_SiC`, `ThinLayerMobility`, `Lombardi_highk`, `Coulomb2DMobility`, `CarrierCarrierScattering`, `HighFieldDependence`, `UniBoDopingDependence`, `UniBoEnormalDependence`, `HydroHighFieldDependence`, `RCSMobility`, `RPSMobility`, `BalMob`, `TransferredElectronEffect2`, `NegInterfaceChargeMobility`, `PosInterfaceChargeMobility`, `Hatakeyama`(SiC 전용), `HoppingTransport`(부분)
- **ch16**: `Scharfetter`(SRH), `SurfaceRecombination`, `Auger`, `TrapAssistedAuger`, `TrapAssistedTunneling`, `HurkxTrapAssistedTunneling`, `PooleFrenkel`, `CDL`, `OkutoCrowell`, `Lackner`, `UniBo`, `UniBo2`, `Antoniadis`, `AvalancheFactors`, `Ionization`, `Band2BandTunneling`, `RadiativeRecombination`, `Makram-Ebeid`
- **ch17**: `Traps`, `BarrierTunneling`, `BarrierLowering`

---

## 1. 추가 작성이 필요한 챕터 (.par 키워드 → Chapter.md 챕터)

### 우선순위 A — `guide/part2.mmd` 본문 보유, 즉시 spec 작성 가능

#### **Ch31. Mechanical Stress** (p.962)
- `EffectiveStressModel`, `EffectiveStressModel "100"|"110"`
- `StressMobility`
- `Piezoresistance`
- `QWStrain`
- `MultiValley`(strain-modulated valley shifts) — ch12 와 cross-link
- `LatticeParameters`(strain compliance 측면) — ch12 와 cross-link
- `Piezoelectric_Polarization` / `Piezoelectric_polarization` (GaN/AlN/InN/AlGaN/HfO2/InsulatorX)
- `Polarization` (ferroelectric 과 분리, GaN family)
- **포함 .par**: Silicon, SiliconGermanium*, Siliconc100/c110, GaN, AlN, InN, AlGaN, InGaN, AlInN, AlInGaN

#### **Ch33. Thermal Properties** (p.1042)
- `LatticeHeatCapacity`
- `Kappa`, `Kappa_aniso`
- `CarrierThermalConductivity`
- `TEPower`
- `MMPeltierHeat`
- `ThermalDiffusion`, `HeatFlux` (carrier energy 측면은 ch9 와 분리)
- **포함 .par**: 거의 모든 semiconductor + metal/insulator 전체 (74개 중 ~60개)

---

### 우선순위 B — Chapter.md TOC 에 존재, part2.mmd 외 본문 (Part1/3/4) 필요

#### **Ch7. Poisson Equation and Quasi-Fermi Potentials** (p.243)
- `Epsilon`, `Epsilon_aniso`
- `Epsilon_Inf`, `Epsilon_Inf_aniso` (high-frequency dielectric, ferroelectric/oxide 전용)
- **포함 .par**: 전체 (유전율은 모든 material 에 존재)
- **참고**: 단순 스칼라/텐서 파라미터지만, ferroelectric·optical chapter 들과 cross-link 필요.

#### **Ch9. Lattice and Carrier Temperature Equations** (p.260)
- `EnergyRelaxationTime`
- `EnergyFlux`
- `ThermalDiffusion`(carrier 측)
- `HeatFlux`(carrier 측)
- **포함 .par**: Silicon, GaAs, Ge, SiGe, AlGaAs, InGaAs, InP, GaN family 등 hydrodynamic 지원 semiconductor
- **모델**: Thermodynamic / Hydrodynamic transport

#### **Ch10. Boundary Conditions** (p.273)
- `Schottky{}` (Silicon, Diamond, …)
- `SchottkyResistance`
- `BarrierLowering`(boundary 측면, ch17 와 cross-link)
- **포함 .par**: Silicon, Diamond, GaN, GaAs 등
- **note**: Schottky 는 material 자체가 아닌 contact 속성 → ontology 에 **interface/contact node** 그룹 신설 필요(스키마 확장).

#### **Ch11. Transport Equations in Metals, Organic Materials, and Disordered Media** (p.306)
- `SingletExciton` (Silicon, GaAs 등 일부)
- `HoppingTransport` (organic/disordered semiconductor)
- `Resistivity`, `Resistivity_aniso` (metal: Aluminum, Copper, Cobalt, Gold, Silver, Tungsten, Titanium, TiN, Platinum, Tantalum, Molybdenum, Solder, CobaltSilicide, TiSi2, Silicide …)
- 메탈 work-function, contact 모델 — `Schottky` 와 함께
- **포함 .par**: Aluminum, Copper, Cobalt, CobaltSilicide, Gold, Silver, Molybdenum, Platinum, Tantalum, TiN, TiSi2, Titanium, Tungsten, Solder60_40, Silicide, Metal, PolySi(부분)

#### **Ch14. Quantization** (p.367)
- `SchroedingerParameters`
- `QuantumPotentialParameters`, `QuantumPotentialParameters "100"|"110"|"111"`
- `VanDortQMModel`
- `MLDAQMModel`
- **포함 .par**: Silicon, SiGe variants, Ge, GaAs(부분)
- **note**: 현재는 ch12 에 일부가 흡수되어 있음. orientation variant 와 PMI 연계를 다루는 별도 챕터로 분리 권장.

#### **Ch21. Optical Generation** (p.672)
- `RefractiveIndex`
- `ComplexRefractiveIndex` (wavelength table)
- `Absorption`, `RSSAbsorption`
- `FreeCarrierAbsorption`
- `SpectralConversion`
- **포함 .par**: 거의 모든 semiconductor + 일부 insulator(Oxide, HfO2 …) + metal(반사용)
- **하위 모델**: Wavelength/Temperature/Carrier/Gain dependency, TMM, Raytracing, BPM (필요 범위만 ontology 화)

#### **Ch22. Radiation** (p.797)
- `AlphaParticle`
- `HeavyIon`
- `Radiation`
- **포함 .par**: Silicon, GaAs, Ge, SiC, GaN(일부)

#### **Ch23. Noise, Fluctuations, and Sensitivity** (p.806)
- `MonopolarGRNoise`
- `FlickerGRNoise`
- `Hallscattering`
- **포함 .par**: Silicon, GaAs, Ge, SiC, GaN

#### **Ch24. Tunneling** (p.844)
- `DirectTunnelling`
- `BarrierTunneling` (ch17 와 중복되나 dielectric 측에서 재정의)
- Fowler–Nordheim (현재 .par 에 직접 키워드는 없지만, oxide stack 에 필요)
- **포함 .par**: Silicon, Si3N4, Oxide, HfO2, InterfacialOxide, Anyinsulator, Insulator1/2/3/X, Oxynitride

#### **Ch28. Anisotropic Properties** (p.909)
- 모든 `*_aniso` variant 처리: `Epsilon_aniso`, `Kappa_aniso`, `ConstantMobility_aniso`, `DopingDependence_aniso`, `EnormalDependence_aniso`, `HighFieldDependence_aniso`, `Coulomb2DMobility_aniso`, `NegInterfaceChargeMobility_aniso`, `PosInterfaceChargeMobility_aniso`, `IALMob_aniso`, `IALMob_SiC_aniso`, `ThinLayerMobility_aniso`, `UniBoDopingDependence_aniso`, `UniBoEnormalDependence_aniso`, `HydroHighFieldDependence_aniso`, `OkutoCrowell_aniso`, `TransferredElectronEffect2_aniso`, `Resistivity_aniso`, `Epsilon_Inf_aniso`
- Orientation variant: `"100" | "110" | "111" | "110/100"` — `EnormalDependence`, `IALMob`, `ThinLayerMobility`, `EffectiveStressModel`, `QuantumPotentialParameters`
- **포함 .par**: Silicon, Siliconc100/c110, SiliconGermanium*, SiC variants, GaN, …
- **note**: 단순 챕터가 아니라 ontology **스키마 확장**을 동반해야 함 (orientation 축 도입).

#### **Ch29. Ferroelectric Materials** (p.932)
- `FEPolarization`
- `Polarization` (ferroelectric 측면)
- **포함 .par**: HfO2, AlN, GaN, InN, AlGaN, InsulatorX
- **note**: GaN family 의 `Polarization` 은 piezoelectric(ch31) 과 ferroelectric(ch29) 양쪽 의미가 있어 disambiguation 필요.

#### **Ch35. Quantum Wells** (p.1102) — `guide/part2.mmd` L7 본문 보유
- `QWStrain`(QW 측면, ch31 과 cross-link)
- `BandstructureParameters` (QW band edge)
- **포함 .par**: AlGaAs, InGaAs, InGaAsP, InGaN, AlGaN, GaAsP, GaAsSb, GaInP, AlInGaN, AlInN, GaSb, InAs, InAsP, InP

---

### 우선순위 C — Ontology 범위 밖이거나, 별도 가이드/툴 매뉴얼 필요

| .par 섹션 | 외부 챕터/문서 | 비고 |
|---|---|---|
| `SHEDistribution { … }` | Sentaurus Device Monte Carlo / BTE Guide | Spherical Harmonics Expansion BTE solver. main user guide 외부. |
| `NumericalTable(N)( … )` | 모든 챕터 공통 | 임의 모델의 lookup table override. ontology 에서는 "table-typed parameter" 노드 형태로 흡수. |

---

## 2. 스키마 확장 (챕터와 무관하게 ontology 자체 변경 필요)

다음은 챕터 spec 작성만으로는 표현되지 않으며, `data/bandgap-graph.types.ts` 와 그래프 노드/엣지 모델 자체의 확장이 필요한 항목이다.

1. **Orientation 축** — 같은 equation 의 `"100"|"110"|"111"` variant 를 노드 다중화 없이 표현. 영향 챕터: ch12·15·14·31·28.
2. **Anisotropic(텐서) 파라미터** — `*_aniso` 군. 스칼라 가정 폐기, 축별 파라미터/eigenvector 필드 도입. 영향 챕터: ch7·15·28·31·33.
3. **Valley 리스트형 파라미터** — `eValley(...)`, `hValley(...)` 의 가변 길이 튜플 리스트. 영향 챕터: ch12·31.
4. **Wavelength/Frequency-indexed table 파라미터** — `ComplexRefractiveIndex`, `Absorption`, `RSSAbsorption`. 영향 챕터: ch21.
5. **Material vs Interface vs Contact node 분리** — 현재 그래프는 bulk material 가정. `Schottky`, `*InterfaceCharge*`, `Coulomb2DMobility`, `BarrierLowering`, `InterfacialOxide` 처리를 위해 노드 그룹 분류 재설계.
6. **Material class 분기** — semiconductor / insulator / metal / silicide / gas / photoresist / solder. `Resistivity` 는 metal-only, `Epsilon_Inf` 는 ferroelectric/oxide 위주, `HoppingTransport` 는 organic/disordered. 노드 group 메타데이터에 material class 필드 추가.
7. **Composition/mole-fraction 의존성** — AlGaAs, AlGaN, AlInGaN, GaInP, InGaAsP, SiliconGermanium 등 ternary/quaternary 의 composition-dependent 파라미터. 영향: 거의 모든 챕터. (Chapter.md ch2 "Parameters for Composition-Dependent Materials" p.75 참조)
8. **Doping/orientation/temperature 다중 축 variant** — `SiliconGermaniumc110_highdoping.par` 같은 파일이 시사하는 다축 분기. variant key 를 명시적 차원으로 모델링.

---

## 3. 작성 권장 순서 (단계별 마일스톤)

| Stage | 추가 챕터 | 동반 스키마 확장 | 효과 |
|---|---|---|---|
| **S1** | Ch31 Mechanical Stress, Ch33 Thermal Properties | (3) Valley 리스트 | part2.mmd 본문 보유, Silicon.par 미커버 최대 블록 흡수 |
| **S2** | Ch28 Anisotropic Properties | (1) Orientation 축, (2) Aniso 텐서 | 기존 ch15 의 orientation/aniso variant 정식화 |
| **S3** | Ch7 Poisson(dielectric), Ch14 Quantization | (6) Material class | 모든 .par 의 `Epsilon*` 흡수, ch12 에서 양자화 분리 |
| **S4** | Ch11 Transport in Metals/Organic, Ch10 Boundary Conditions | (5) Material/Interface/Contact 분리 | 메탈 14종, 실리사이드 3종, contact `Schottky` 흡수 |
| **S5** | Ch9 Carrier Temperature | — | Hydrodynamic 모델 키워드 흡수 |
| **S6** | Ch21 Optical Generation | (4) Wavelength table | 광학 파라미터(`RefractiveIndex` 등) 흡수 |
| **S7** | Ch29 Ferroelectric, Ch35 Quantum Wells | — | GaN/HfO2 family 및 III-V QW 디바이스 |
| **S8** | Ch24 Tunneling, Ch23 Noise, Ch22 Radiation | — | 잔여 전수 흡수 |
| **S9** | Composition-dependent material 처리 | (7), (8) | ternary/quaternary `.par` (AlGaAs, AlGaN, InGaAsP, AlInGaN, SiGe …) 정식화 |

---

## 4. 미해결/외부 항목

- `SHEDistribution` — Sentaurus Device Monte Carlo Guide 영역. ontology 직접 흡수 대상 아님.
- `NumericalTable(N)` — 임의 PMI override. 챕터가 아니라 "table parameter" 표현 형식의 문제로 처리.
- `custom/`, `she/` 하위 디렉토리 — 본 분석 범위 외(별도 검토 필요).

---

## 부록 A. 본 문서가 추출한 .par top-level 키워드 출처

추출 명령:
```
cd MaterialDB && for f in *.par; do
  grep -hE '^[A-Z][A-Za-z0-9_]+' "$f" | grep -vE '^\s|=|#' | awk '{print $1}'
done | sort -u
```

총 74개 `.par` 파일에서 약 110여 개의 고유 top-level 섹션 키워드가 식별되었으며, 본 문서 §0–§1 의 매핑이 그 전수에 해당한다(`NumericalTable(N)` 의 인덱스 variant 는 단일 항목으로 통합).
