module
public import R22Port.U_d41d8cd98f00
public import Br.Bridge
/-! # The type facts of `KD.Types` from the Gram-state checkers' statements (bridge, part 6)

Each premise of `KD.typeFacts95_of` follows from the matching `NoFam_*` statement of `G.Interface` (proved by the
checkers) and the orbit completeness of the anchor states, through `bridge_inv` / `bridge_r2`; `NoDelta0`'s `n3 ≥ 1` part
is the hand proof `hand_d0`.

* `noDelta0 : NoFam_17_5_0 → OrbitComplete2 → KD.NoDelta0`
* `noType_19_0_3`, `noType_18_2_2`, `noType_17_4_1 : NoFam_* → OrbitComplete3 1 → KD.NoType …`
* `noType_17_3_2`, `noType_18_1_3 : NoFam_* → OrbitComplete3 2 → KD.NoType …`
* `typeFacts`: all of them give `KD.TypeFacts` (the run's `--typecut 95`). -/
@[expose] public section
namespace G.Br
open RootSound R3RT.Spec

/-- `bridge_d` at `d = 0` (rank-2 anchor, type `(17,5,0)`) -/
theorem bridge_d0 (hoc : OrbitComplete2) (A : Dec22) (h2 : 1 ≤ KD.nType A 2) (hs : KD.rankSum A = 27) :
    ∃ t0 ∈ reps0, ∃ F : List State, Family 0 (t0 :: F) ∧
      KD.nType A 1 ≤ count 1 F ∧ KD.nType A 2 - 1 ≤ count 2 F ∧ KD.nType A 3 ≤ count 3 F :=
  bridge_r2 hoc A h2 hs

/-- `bridge_d` at `d = 1` (invertible anchor) -/
theorem bridge_d1 (hoc : OrbitComplete3 1) (A : Dec22) (h3 : 1 ≤ KD.nType A 3) (hs : KD.rankSum A = 28) :
    ∃ t0 ∈ reps 1, ∃ F : List State, Family 1 (t0 :: F) ∧
      KD.nType A 1 ≤ count 1 F ∧ KD.nType A 2 ≤ count 2 F ∧ KD.nType A 3 - 1 ≤ count 3 F :=
  bridge_inv 1 hoc A h3 hs

/-- `bridge_d` at `d = 2` (invertible anchor) -/
theorem bridge_d2 (hoc : OrbitComplete3 2) (A : Dec22) (h3 : 1 ≤ KD.nType A 3) (hs : KD.rankSum A = 29) :
    ∃ t0 ∈ reps 2, ∃ F : List State, Family 2 (t0 :: F) ∧
      KD.nType A 1 ≤ count 1 F ∧ KD.nType A 2 ≤ count 2 F ∧ KD.nType A 3 - 1 ≤ count 3 F :=
  bridge_inv 2 hoc A h3 hs

theorem noDelta0 (h175 : NoFam_17_5_0) (hoc : OrbitComplete2) : KD.NoDelta0 := by
  intro A hA
  by_cases h3 : 1 ≤ KD.nType A 3
  · exact hand_d0 A hA h3
  · have hsum := KD.type_sum A
    have hr := KD.rankSum_eq A
    have hn3 : KD.nType A 3 = 0 := by omega
    obtain ⟨t0, ht0, F, hF, c1, c2, c3⟩ := bridge_r2 hoc A (by omega) hA
    exact h175 t0 ht0 ⟨F, hF, by omega, by omega, by omega⟩

/-- the `Δ = 1` and `Δ = 2` types with an invertible first factor -/
theorem noType_of (d n1 n2 n3 : ℕ) (h3 : 1 ≤ n3) (hd : n1 + 2 * n2 + 3 * n3 = 27 + d)
    (h : ∀ t0 ∈ reps d, NoFamily d t0 n1 n2 (n3 - 1)) (hoc : OrbitComplete3 d) : KD.NoType n1 n2 n3 := by
  rintro A ⟨e1, e2, e3⟩
  have hr := KD.rankSum_eq A
  obtain ⟨t0, ht0, F, hF, c1, c2, c3⟩ := bridge_inv d hoc A (by omega) (by omega)
  exact h t0 ht0 ⟨F, hF, by omega, by omega, by omega⟩

theorem noType_19_0_3 (h : NoFam_19_0_3) (hoc : OrbitComplete3 1) : KD.NoType 19 0 3 :=
  noType_of 1 19 0 3 (by norm_num) (by norm_num) h hoc

theorem noType_18_2_2 (h : NoFam_18_2_2) (hoc : OrbitComplete3 1) : KD.NoType 18 2 2 :=
  noType_of 1 18 2 2 (by norm_num) (by norm_num) h hoc

theorem noType_17_4_1 (h : NoFam_17_4_1) (hoc : OrbitComplete3 1) : KD.NoType 17 4 1 :=
  noType_of 1 17 4 1 (by norm_num) (by norm_num) h hoc

theorem noType_17_3_2 (h : NoFam_17_3_2) (hoc : OrbitComplete3 2) : KD.NoType 17 3 2 :=
  noType_of 2 17 3 2 (by norm_num) (by norm_num) h hoc

theorem noType_18_1_3 (h : NoFam_18_1_3) (hoc : OrbitComplete3 2) : KD.NoType 18 1 3 :=
  noType_of 2 18 1 3 (by norm_num) (by norm_num) h hoc

/-- **The type facts** (`KD.TypeFacts`, `--typecut 95`) from the checkers' nine statements. -/
theorem typeFacts (h175 : NoFam_17_5_0) (h1903 : NoFam_19_0_3) (h1822 : NoFam_18_2_2) (h1741 : NoFam_17_4_1)
    (h1732 : NoFam_17_3_2) (h1813 : NoFam_18_1_3) (oc0 : OrbitComplete2) (oc1 : OrbitComplete3 1)
    (oc2 : OrbitComplete3 2) : KD.TypeFacts :=
  KD.typeFacts_of (noDelta0 h175 oc0) (noType_19_0_3 h1903 oc1) (noType_18_2_2 h1822 oc1)
    (noType_17_4_1 h1741 oc1) (noType_17_3_2 h1732 oc2) (noType_18_1_3 h1813 oc2)

end G.Br

#print axioms G.Br.excess_system
#print axioms G.Br.hand_d0
#print axioms G.Br.bridge_inv
#print axioms G.Br.bridge_r2
#print axioms G.Br.bridge_d0
#print axioms G.Br.bridge_d1
#print axioms G.Br.bridge_d2
#print axioms G.Br.noDelta0
#print axioms G.Br.noType_19_0_3
#print axioms G.Br.noType_18_2_2
#print axioms G.Br.noType_17_4_1
#print axioms G.Br.noType_17_3_2
#print axioms G.Br.noType_18_1_3
#print axioms G.Br.typeFacts
