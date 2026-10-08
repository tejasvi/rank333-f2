module
public import R22Port.U_d41d8cd98f00
public import HC.Final
public import HC.ClassLB
public import R3RT.L1v5Spec
public import Top.PointsData
/-! # Top/Base: the steps of the top-level theorem proved here

* `rank_ge_22`: Rudich–Rousseau's bound in the decomposition form (class 495, the zero subspace, at 22: `HC.rr_fact`).
* From a 22-term decomposition to `R3RT.Spec.Dec22` with nonzero `b`, `c` (`dec22_of`):
  - a zero first factor leaves 21 nonzero ones (`ge22_nz`);
  - a zero `b` or `c` makes the term droppable, leaving 21 terms (`drop_one`);
  - two equal first factors `v` put two terms in the point `{0, v}`, whose bound is 21 (`point_fact`): for rank 2 and 3 by
    RR (classes 493, 494), for rank 1 by **the point lemma** `ClassLB 492 21`, each transported to `v` by a group element
    (`PW`, checked for all 511 codes by `pointsN_511`).
* `dec22_bc`: every `Dec22` has nonzero `b`, `c` (RR), so the leaves' theorem (`KD.leaf_node_dead`) gives node emptiness.
* `rank_ge_23_of_cases`: the rank is at least 23 if no `Dec22` with nonzero `b`, `c` falls in case (I) (`≤ 12` rank-1 first
  factors), case (I13) (`= 13`) or case (II) (`≥ 14`); the case split is exhaustive by arithmetic. -/
@[expose] public section
set_option exponentiation.threshold 50000
namespace Top
open RootSound RT HC Finset

/-- **The theorem to prove**: every decomposition of `<3,3,3>` over F2 has at least 23 terms. -/
def RankGe23 : Prop := ∀ (n : ℕ) (a b c : Fin n → M3), IsDecomp a b c → 23 ≤ n

/-! ## 1. RR: at least 22 nonzero first factors -/

theorem kM_495 : kM K3eD_Cls.CL 495 = 1 := by decide +kernel
theorem rrLB_495 : rrLB 495 = 22 := by decide +kernel
theorem rrLB_493 : rrLB 493 = 21 := by decide +kernel
theorem rrLB_494 : rrLB 494 = 21 := by decide +kernel

theorem fact_zero (hrr : RRAll) : Fact 1 22 := by
  have h := rr_fact_K3eD hrr 495 (by norm_num)
  rwa [kM_495, rrLB_495] at h

theorem one_testBit_false (w : ℕ) : (1 : ℕ).testBit w = false ↔ w ≠ 0 := by
  rw [← Bool.not_eq_true, Nat.testBit_one_eq_true_iff_self_eq_zero]

/-- **RR**: every decomposition has at least 22 terms with a nonzero first factor -/
theorem ge22_nz (hrr : RRAll) {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) : 22 ≤ (univ.filter (fun s => av s ≠ 0)).card := by
  have h := fact_zero hrr n av b c hav hd
  refine le_trans h (le_of_eq (congrArg card (filter_congr fun s _ => ?_)))
  exact one_testBit_false (av s)

/-- **Rudich–Rousseau's bound**, as decompositions: at least 22 terms -/
theorem rank_ge_22 (hrr : RRAll) : ∀ (n : ℕ) (a b c : Fin n → M3), IsDecomp a b c → 22 ≤ n := by
  intro n a b c hd
  have hd' : IsDecomp (fun s => toM3 (encM (a s))) b c := by simpa only [toM3_encM] using hd
  have h := ge22_nz hrr (fun s => encM (a s)) b c (fun s => encM_lt _) hd'
  exact le_trans h (le_trans (card_le_univ _) (by simp))

/-! ## 2. Zero `b` or `c`: the term drops, leaving fewer than 22 -/

theorem isDecomp_sub {n : ℕ} {av : Fin n → ℕ} {b c : Fin n → M3} (hd : IsDecomp (fun s => toM3 (av s)) b c)
    (p : Fin n → Prop) [DecidablePred p] (hp : ∀ s, ¬ p s → b s = 0 ∨ c s = 0) (e : Fin (Fintype.card {s // p s}) ≃ {s // p s}) :
    IsDecomp (fun i => toM3 (av (e i).1)) (fun i => b (e i).1) (fun i => c (e i).1) := by
  intro i j j' k k' i'
  rw [← hd i j j' k k' i']
  rw [Equiv.sum_comp e (fun x : {s // p s} => toM3 (av x.1) i j * b x.1 j' k * c x.1 k' i')]
  rw [← Finset.sum_subtype (univ.filter p) (fun x => by simp) (fun s => toM3 (av s) i j * b s j' k * c s k' i')]
  rw [Finset.sum_filter]
  refine Finset.sum_congr rfl fun s _ => ?_
  by_cases h : p s
  · rw [if_pos h]
  · rw [if_neg h]
    rcases hp s h with h | h <;> simp [h]

/-- a decomposition with at most 22 terms has no term with `b = 0` or `c = 0` -/
theorem drop_one (hrr : RRAll) {n : ℕ} (hn : n ≤ 22) (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (s0 : Fin n) (h0 : b s0 = 0 ∨ c s0 = 0) : False := by
  classical
  let p : Fin n → Prop := fun s => b s ≠ 0 ∧ c s ≠ 0
  have hp : ∀ s, ¬ p s → b s = 0 ∨ c s = 0 := by
    intro s hs; simp only [p, not_and_or, not_not] at hs; exact hs
  let e := (Fintype.equivFin {s // p s}).symm
  have hd0 := isDecomp_sub hd p hp e
  have h := ge22_nz hrr (fun i => av (e i).1) (fun i => b (e i).1) (fun i => c (e i).1) (fun i => hav _) hd0
  have hlt : Fintype.card {s // p s} < n := by
    have : Fintype.card {s // p s} < Fintype.card (Fin n) :=
      Fintype.card_subtype_lt (p := p) (x := s0) (by simp only [p, not_and_or, not_not]; exact h0)
    simpa using this
  have h2 := le_trans h (card_le_univ _)
  simp only [Finset.card_univ, Fintype.card_fin] at h2
  omega

/-! ## 3. Points: two equal first factors -/

def pwT (v : ℕ) : Bool := (PW >>> (21 * v)) % 2 == 1
def pwP (v : ℕ) : ℕ := (PW >>> (21 * v + 1)) % 512
def pwQ (v : ℕ) : ℕ := (PW >>> (21 * v + 10)) % 512
def pwK (v : ℕ) : ℕ := (PW >>> (21 * v + 19)) % 4

/-- the witness of `v`: invertible `P`, `Q`, a class `492 + k` (`k < 3`) whose subspace holds the image of `v` -/
def pointOK (v : ℕ) : Bool :=
  C3.isGL (pwP v) && C3.isGL (pwQ v) && Nat.blt (pwK v) 3 &&
    (kM K3eD_Cls.CL (492 + pwK v)).testBit (C3.actN (pwT v) (pwP v) (pwQ v) v)

def pointsN (n : ℕ) : Bool := Nat.rec (motive := fun _ => Bool) true (fun v b => b && pointOK (v + 1)) n

theorem points_rec (n : ℕ) (h : pointsN n = true) : ∀ v < n, pointOK (v + 1) = true := by
  unfold pointsN at h
  induction n with
  | zero => intro v hv; exact absurd hv (Nat.not_lt_zero v)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun v b => b && pointOK (v + 1)) n && pointOK (n + 1)) = true := h
    rw [Bool.and_eq_true] at h'
    intro v hv
    rcases Nat.lt_succ_iff_lt_or_eq.mp hv with hlt | heq
    · exact ih h'.1 v hlt
    · subst heq; exact h'.2

theorem pointsN_511 : pointsN 511 = true := by decide +kernel

/-- the point mask of `{0, v}` -/
def pmask (v : ℕ) : ℕ := 1 ||| (1 <<< v)

theorem pmask_bit (v w : ℕ) : (pmask v).testBit w = true ↔ w = 0 ∨ w = v := by
  unfold pmask
  rw [Nat.testBit_or, Bool.or_eq_true, Nat.testBit_one_eq_true_iff_self_eq_zero, Nat.one_shiftLeft,
    Nat.testBit_two_pow]
  simp only [decide_eq_true_eq]
  constructor
  · rintro (h | h)
    · exact Or.inl h
    · exact Or.inr h.symm
  · rintro (h | h)
    · exact Or.inl h
    · exact Or.inr h.symm

theorem kM_zero_bit (CL c : ℕ) : (kM CL c).testBit 0 = true := by
  rw [kM_testBit CL c 0 (by norm_num)]; exact inK_zero CL c

/-- **every point `{0, v}` has bound 21**: RR for ranks 2, 3; the point lemma for rank 1 -/
theorem point_fact (hrr : RRAll) (h492 : ClassLB 492 21) (v : ℕ) (hv0 : 0 < v) (hv : v < 512) : Fact (pmask v) 21 := by
  have hok := points_rec 511 pointsN_511 (v - 1) (by omega)
  rw [Nat.sub_add_cancel hv0] at hok
  unfold pointOK at hok
  simp only [Bool.and_eq_true, Nat.blt_eq] at hok
  obtain ⟨⟨⟨hP, hQ⟩, hk⟩, himg⟩ := hok
  have hcls : Fact (kM K3eD_Cls.CL (492 + pwK v)) 21 := by
    generalize pwK v = k at hk ⊢
    interval_cases k
    · exact h492
    · have h := rr_fact_K3eD hrr 493 (by norm_num); rwa [rrLB_493] at h
    · have h := rr_fact_K3eD hrr 494 (by norm_num); rwa [rrLB_494] at h
  refine fact_transport (t := pwT v) hP hQ (fun w _ hm => ?_) hcls
  rcases (pmask_bit v w).mp hm with h | h
  · subst h; rw [actN_zero]; exact kM_zero_bit _ _
  · subst h; exact himg

/-- **distinct first factors**: in a 22-term decomposition with nonzero first factors no two are equal -/
theorem inj_of_points (hrr : RRAll) (h492 : ClassLB 492 21) (av : Fin 22 → ℕ) (b c : Fin 22 → M3)
    (hav : ∀ s, av s < 512) (hnz : ∀ s, av s ≠ 0) (hd : IsDecomp (fun s => toM3 (av s)) b c) : Function.Injective av := by
  intro s t hst
  by_contra hne
  have hf := point_fact hrr h492 (av s) (Nat.pos_of_ne_zero (hnz s)) (hav s) 22 av b c hav hd
  have hsub : univ.filter (fun u => (pmask (av s)).testBit (av u) = false) ⊆ (univ.erase s).erase t := by
    intro u hu
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hu
    simp only [Finset.mem_erase, Finset.mem_univ, and_true]
    refine ⟨fun hut => ?_, fun hus => ?_⟩
    · subst hut; rw [← hst, (pmask_bit _ _).mpr (Or.inr rfl)] at hu; exact absurd hu (by decide)
    · subst hus; rw [(pmask_bit _ _).mpr (Or.inr rfl)] at hu; exact absurd hu (by decide)
  have hc := card_le_card hsub
  rw [card_erase_of_mem (by simp [Ne.symm hne]), card_erase_of_mem (mem_univ s)] at hc
  simp only [Finset.card_univ, Fintype.card_fin] at hc
  omega

/-! ## 4. From 22 terms to `Dec22` -/

/-- **a 22-term decomposition is a `Dec22`** (22 distinct nonzero first factors), with nonzero `b`, `c` -/
theorem dec22_of (hrr : RRAll) (h492 : ClassLB 492 21) (a b c : Fin 22 → M3) (hd : IsDecomp a b c) :
    ∃ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0 := by
  have hav : ∀ s, encM (a s) < 512 := fun s => encM_lt _
  have hd' : IsDecomp (fun s => toM3 (encM (a s))) b c := by simpa only [toM3_encM] using hd
  have hnz : ∀ s, encM (a s) ≠ 0 := by
    have h := ge22_nz hrr (fun s => encM (a s)) b c hav hd'
    have hall : univ.filter (fun s => encM (a s) ≠ 0) = univ :=
      eq_univ_of_card _ (le_antisymm (card_le_univ _) (by simpa using h))
    intro s
    have : s ∈ univ.filter (fun s => encM (a s) ≠ 0) := by rw [hall]; exact mem_univ s
    exact (mem_filter.mp this).2
  have hinj := inj_of_points hrr h492 (fun s => encM (a s)) b c hav hnz hd'
  have hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0 := by
    intro s
    by_contra h
    exact drop_one hrr le_rfl (fun s => encM (a s)) b c hav hd' s (by
      rcases not_and_or.mp h with h | h
      · exact Or.inl (not_not.mp h)
      · exact Or.inr (not_not.mp h))
  exact ⟨⟨fun s => encM (a s), b, c, hav, hnz, hinj, hd'⟩, hbc⟩

/-- **every `Dec22` has nonzero `b`, `c`** (RR): what the leaf theorem `KD.leaf_node_dead` needs -/
theorem dec22_bc (hrr : RRAll) (A : R3RT.Spec.Dec22) : ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0 := by
  intro s
  by_contra h
  exact drop_one hrr le_rfl A.av A.b A.c A.lt A.dec s (by
    rcases not_and_or.mp h with h | h
    · exact Or.inl (not_not.mp h)
    · exact Or.inr (not_not.mp h))

/-! ## 5. The case split -/

/-- case (I): at most 12 rank-1 first factors (`--maxr1 12`, `--rord 321`) -/
def CaseIEmpty : Prop :=
  ∀ A : R3RT.Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → R3RT.Spec.nType A 1 ≤ 12 → False
/-- case (I13): exactly 13 rank-1 first factors (`--minr1 13 --maxr1 13`, `--rord 321`) -/
def CaseI13Empty : Prop :=
  ∀ A : R3RT.Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → R3RT.Spec.nType A 1 = 13 → False
/-- case (II): at least 14 rank-1 first factors (`--minr1 14`, `--rord 123`) -/
def CaseIIEmpty : Prop :=
  ∀ A : R3RT.Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → R3RT.Spec.CaseII A → False

/-- **the top-level reduction**: RR, the point lemma and the three cases give the rank bound -/
theorem rank_ge_23_of_cases (hrr : RRAll) (h492 : ClassLB 492 21) (hI : CaseIEmpty) (hI13 : CaseI13Empty)
    (hII : CaseIIEmpty) : RankGe23 := by
  intro n a b c hd
  by_contra hlt
  rw [not_le] at hlt
  have h22 := rank_ge_22 hrr n a b c hd
  obtain rfl : n = 22 := by omega
  obtain ⟨A, hbc⟩ := dec22_of hrr h492 a b c hd
  rcases (by omega : R3RT.Spec.nType A 1 ≤ 12 ∨ R3RT.Spec.nType A 1 = 13 ∨ 14 ≤ R3RT.Spec.nType A 1) with h | h | h
  · exact hI A hbc h
  · exact hI13 A hbc h
  · exact hII A hbc h

end Top
