module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_Final
public import R3RT.SpecO
public import S6.LG
/-! # The verified row table over a universe of decompositions (case II, class 479 raised)

The row table's soundness (`RT.entry_soundN`, `RT.clos_sound`, `RT.K3eD.row_factN`) is stated for all decompositions
(`FactN`). With class 479 raised to 21 only in case (II), the class facts hold only for the decompositions of a universe `Ω`
(`R3RT.SpecO.ClassFactsC Ω lb`). Every step of the soundness proof fixes one decomposition, apart from the entry theorem,
which moves it by the entry's C3 element. So everything holds over any `Ω` that is invariant under rank-preserving changes
of the first factors (`RankInv`; `CaseK lo hi` is, `caseK_rankInv`).

* `FactD m k A`: decomposition `A` has at least `k` first factors outside `m`.
* `move A hP hQ`: `A` moved by a C3 element. It keeps every first factor's rank (`rkOf_actN`).
* `entry_soundΩ`: the entry theorem over `Ω`.
* `clos_soundΩ`, `hclosΩ`: the closure classes.
* `row_factΩ`: every kept row of `K3eD` over `Ω`, from `ClassFactsC Ω lb` for any `lb ≥ cLB`. -/
@[expose] public section
set_option backward.proofsInPublic true
namespace RT.Om
open BC4 BC5 RootSound Matrix Finset

abbrev Dec22 := R3RT.Spec.Dec22

/-- decomposition `A` has at least `k` first factors outside `m` -/
def FactD (m k : ℕ) (A : Dec22) : Prop := k ≤ (univ.filter (fun s => m.testBit (A.av s) = false)).card

/-- `Ω` depends on the first factors only through their ranks -/
def RankInv (Ω : Dec22 → Prop) : Prop := ∀ A A' : Dec22, (∀ s, rkOf (A'.av s) = rkOf (A.av s)) → Ω A → Ω A'

theorem caseK_rankInv (lo hi : ℕ) : RankInv (R3RT.SpecO.CaseK lo hi) := by
  intro A A' h hA
  have e : R3RT.Spec.nType A' 1 = R3RT.Spec.nType A 1 := by unfold R3RT.Spec.nType; simp only [h]
  unfold R3RT.SpecO.CaseK at *; rw [e]; exact hA

theorem rkOf_tab : S5.allLT 512 (fun v => rkOf v == BC6s.rk3 v) = true := by decide +kernel

theorem rkOf_rank (v : ℕ) (hv : v < 512) : rkOf v = (toM3 v).rank := by
  rw [← S6.rk3_rank v hv]; have := S5.allLT_spec rkOf_tab v hv; simpa using this

theorem rkOf_actN {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) (v : ℕ) (hv : v < 512) :
    rkOf (C3.actN t P Q v) = rkOf v := by
  rw [rkOf_rank _ (C3.actN_lt _ _ _ _), rkOf_rank _ hv]
  obtain ⟨hP1, -⟩ := C3.gl_inv hP
  obtain ⟨-, hQ2⟩ := C3.gl_inv hQ
  rw [C3.toM3_actN, Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_left_inverse hQ2),
    Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hP1)]
  cases t
  · rfl
  · exact Matrix.rank_transpose _

/-- `A` moved by the C3 element `(t, P, Q)` -/
noncomputable def move (A : Dec22) (t : Bool) {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) : Dec22 where
  av := fun s => C3.actN t P Q (A.av s)
  b := (C3.isDecomp_actN (t := t) A.dec hP hQ).choose
  c := (C3.isDecomp_actN (t := t) A.dec hP hQ).choose_spec.choose
  lt := fun s => C3.actN_lt t P Q (A.av s)
  ne := fun s h0 => A.ne s (C3.actN_inj hP hQ (A.lt s) (by norm_num) (by rw [h0, C3.actN_zero]))
  inj := fun s s' h => A.inj (C3.actN_inj hP hQ (A.lt s) (A.lt s') h)
  dec := (C3.isDecomp_actN (t := t) A.dec hP hQ).choose_spec.choose_spec

theorem move_rk (A : Dec22) (t : Bool) {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) (s : Fin 22) :
    rkOf ((move A t hP hQ).av s) = rkOf (A.av s) := rkOf_actN hP hQ _ (A.lt s)

/-- `FactN` gives the fact for every decomposition -/
theorem factD_of_factN {m k : ℕ} (h : FactN 22 m k) (A : Dec22) : FactD m k A := h A.av A.b A.c A.lt A.ne A.inj A.dec

/-- **Entry theorem over a universe.** -/
theorem entry_soundΩ (Ω : Dec22 → Prop) (hΩ : RankInv Ω) (CL e : Nat)
    (hcls : ∀ A, Ω A → FactD (kM CL (eCls e)) (cLB CL (eCls e)) A) (h : entryOK 22 CL e = true) :
    ∀ A, Ω A → FactD (dualM e) (22 - eCap e) A := by
  unfold entryOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hsd⟩, hP⟩, hQ⟩, hmap⟩, hR⟩ := h
  have hgen := mapsIn_spec CL e hmap
  intro A hA
  have hA' : Ω (move A (eT e) hP hQ) := hΩ A _ (move_rk A (eT e) hP hQ) hA
  have hk := hcls _ hA'
  unfold FactD at hk ⊢
  refine le_trans (by omega) (le_trans hk (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e2 : (dualM e).testBit (A.av s)
  · rfl
  · exfalso
    rw [← hsd] at e2
    obtain ⟨_, hin⟩ := spanM_ind e (fun w => inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) w) = true)
      (by show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) 0) = true
          rw [actN_zero]; exact inK_zero _ _) hgen
      (fun x y hx hy h1 h2 => by
        show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (x ^^^ y)) = true
        rw [actN_xor _ _ _ _ _ hx hy]; exact inK_xor (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _) h1 h2)
      (A.av s) e2
    have hin' : inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (A.av s)) = true := hin
    have hs' : (kM CL (eCls e)).testBit ((move A (eT e) hP hQ).av s) = false := hs
    simp only [move] at hs'
    rw [kM_testBit _ _ _ (C3.actN_lt _ _ _ _), hin'] at hs'
    exact absurd hs' (by decide)

end RT.Om

namespace RT.Om
open BC4 BC5 RootSound Matrix Finset

/-- **Closure rows over a universe**: `RT.clos_sound` for one decomposition (it only ever uses the row facts at that
decomposition) -/
theorem clos_soundΩ (m kb d k : Nat) (ws : List Nat) (hm : ∀ v, m.testBit v = true → ∃ j < 2 ^ d, ptK kb d j = v)
    (hok : closOK kb d k ws = true) (A : Dec22) (hW : ∀ w ∈ ws, FactD (dualM w) (22 - eCap w) A) : FactD m (22 - k) A := by
  obtain ⟨av, b, c, hav, hnz, hinj, hd⟩ := A
  unfold FactD at hW ⊢
  simp only at hW ⊢
  unfold closOK at hok
  simp only [Bool.and_eq_true, Nat.ble_eq, List.all_eq_true, List.mem_range, Bool.or_eq_true, beq_iff_eq, bne_iff_ne,
    ne_eq] at hok
  obtain ⟨⟨hd4, hnz0⟩, hbr⟩ := hok
  have hpow : 2 ^ d ≤ 16 := by
    calc 2 ^ d ≤ 2 ^ 4 := Nat.pow_le_pow_right (by norm_num) hd4
      _ = 16 := by norm_num
  classical
  set A := (Finset.univ : Finset (Fin 22)).filter (fun s => m.testBit (av s) = true) with hA
  have hcompl : (Finset.univ.filter (fun s => m.testBit (av s) = false)).card = 22 - A.card := by
    have := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin 22)))
      (p := fun s => m.testBit (av s) = true)
    simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at this
    rw [← hA] at this
    omega
  rw [hcompl]
  suffices hAk : A.card ≤ k by omega
  by_contra hlt
  push_neg at hlt
  have hcoord : ∀ s ∈ A, ∃ j < 2 ^ d, ptK kb d j = av s := by
    intro s hs; rw [hA, Finset.mem_filter] at hs; exact hm _ hs.2
  choose! jf hjf using hcoord
  have hjinj : Set.InjOn jf (A : Set (Fin 22)) := by
    intro s hs s' hs' e
    apply hinj
    rw [← (hjf s hs).2, ← (hjf s' hs').2, e]
  set J := A.image jf with hJ
  have hJcard : J.card = A.card := Finset.card_image_of_injOn hjinj
  obtain ⟨J', hJ'J, hJ'card⟩ := Finset.exists_subset_card_eq (show k + 1 ≤ J.card by omega)
  have hJ'lt : ∀ i ∈ J', i < 2 ^ d := by
    intro i hi
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp (hJ'J hi)
    exact (hjf s hs).1
  have hJ'0 : 0 ∉ J' := by
    intro h0
    obtain ⟨s, hs, e⟩ := Finset.mem_image.mp (hJ'J h0)
    have := (hjf s hs).2
    rw [e, ptK_zero] at this
    exact hnz s this.symm
  set X := ∑ i ∈ J', 2 ^ i with hX
  have hXbit : ∀ i, X.testBit i = decide (i ∈ J') := testBit_sum_two_pow J'
  have hXlt : X < 2 ^ (2 ^ d) := by
    apply Nat.lt_pow_two_of_testBit
    intro i hi
    rw [hXbit]
    simp only [decide_eq_false_iff_not]
    intro hm'; have := hJ'lt i hm'; omega
  have hX0 : X % 2 = 0 := by
    have := hXbit 0
    rw [Nat.testBit_zero] at this
    simp only [hJ'0, decide_false, decide_eq_false_iff_not] at this
    omega
  have hpcX : pc16 X = k + 1 := by
    rw [pc16_eq, ← hJ'card]
    congr 1
    ext i
    simp only [Finset.mem_filter, Finset.mem_range, hXbit, decide_eq_true_eq]
    constructor
    · exact fun h => h.2
    · intro h; exact ⟨lt_of_lt_of_le (hJ'lt i h) hpow, h⟩
  obtain ⟨w', hw'mem, hcap⟩ := bruteOK_spec d k _ hbr X hXlt hX0 hpcX
  obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hw'mem
  simp only at hcap
  have hle : pc16 (X &&& idxM kb d (dualM w)) ≤
      (Finset.univ.filter (fun s => (dualM w).testBit (av s) = true)).card := by
    rw [pc16_eq]
    have hsub : (Finset.range 16).filter (fun i => (X &&& idxM kb d (dualM w)).testBit i = true) ⊆
        (A.filter (fun s => (dualM w).testBit (av s) = true)).image jf := by
      intro i hi
      rw [Finset.mem_filter, Nat.testBit_and, Bool.and_eq_true, hXbit, decide_eq_true_eq] at hi
      obtain ⟨_, hiJ, hiW⟩ := hi
      obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp (hJ'J hiJ)
      refine Finset.mem_image.mpr ⟨s, Finset.mem_filter.mpr ⟨hs, ?_⟩, rfl⟩
      rw [idxM_testBit _ _ _ _ (hjf s hs).1, (hjf s hs).2] at hiW
      exact hiW
    refine le_trans (Finset.card_le_card hsub) (le_trans Finset.card_image_le (Finset.card_le_card ?_))
    intro s hs
    rw [Finset.mem_filter] at hs ⊢
    exact ⟨Finset.mem_univ _, hs.2⟩
  have hfw := hW w hw
  have hsplit := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin 22)))
    (p := fun s => (dualM w).testBit (av s) = true)
  simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at hsplit
  omega

end RT.Om
