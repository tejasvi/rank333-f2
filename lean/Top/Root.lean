module
public import R22Port.U_d41d8cd98f00
public import Top.Base
public import KD.Canon
/-! # Top/Root: the root of the case (II) tree is the single node `(1, 0)`

prof7 has no node for the empty prefix: the tree's roots are first-level nodes `(2^l, l)`.  `KD.caseII_empty` asks that every
first label `l` be a node of the tree or empty.  For case (II) only `l = 0` is needed:
* `canon_has0`: a canonical `Dec22` with a rank-1 first factor has label 0 (`vecL 0 = 1`, a rank-1 matrix).  The group is
  transitive on rank-1 matrices (the point witnesses `PW`: rank 1 ↦ `0x1`); if label 0 were missing, the image of the set
  would contain `1`, whose key is the smallest of all nonzero codes, so the image would be lex-smaller.
* `root_caseII`: for `0 < l`, no canonical case-(II) `Dec22` lies below `(2^l, l)` (its label 0 is not in the prefix). -/
@[expose] public section
set_option exponentiation.threshold 50000
namespace Top
open RootSound RT HC R3RT.Spec Finset

theorem vecL_0 : R3RT.vecL 0 = 1 := by decide +kernel

/-- rank-1 codes have point witnesses of class 492 (`k = 0`) -/
def rk1N (n : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun v b => b && (!(Nat.beq (rkOf v) 1) || Nat.beq (pwK v) 0)) n

theorem rk1_rec (n : ℕ) (h : rk1N n = true) : ∀ v < n, rkOf v = 1 → pwK v = 0 := by
  unfold rk1N at h
  induction n with
  | zero => intro v hv; exact absurd hv (Nat.not_lt_zero v)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun v b => b && (!(Nat.beq (rkOf v) 1) || Nat.beq (pwK v) 0)) n &&
        (!(Nat.beq (rkOf n) 1) || Nat.beq (pwK n) 0)) = true := h
    rw [Bool.and_eq_true] at h'
    intro v hv hr
    rcases Nat.lt_succ_iff_lt_or_eq.mp hv with hlt | heq
    · exact ih h'.1 v hlt hr
    · subst heq
      have h2 := h'.2
      rw [show Nat.beq (rkOf v) 1 = true by simp [hr]] at h2
      simpa using h2

theorem rk1N_512 : rk1N 512 = true := by decide +kernel

/-- nonzero codes have keys at least 1 (`labN 0 = 0`, labels are keyed `l + 1`) -/
def keyN (n : ℕ) : Bool := Nat.rec (motive := fun _ => Bool) true (fun v b => b && Nat.ble 1 (C3.labN (v + 1))) n

theorem key_rec (n : ℕ) (h : keyN n = true) : ∀ v < n, 1 ≤ C3.labN (v + 1) := by
  unfold keyN at h
  induction n with
  | zero => intro v hv; exact absurd hv (Nat.not_lt_zero v)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun v b => b && Nat.ble 1 (C3.labN (v + 1))) n &&
        Nat.ble 1 (C3.labN (n + 1))) = true := h
    rw [Bool.and_eq_true] at h'
    intro v hv
    rcases Nat.lt_succ_iff_lt_or_eq.mp hv with hlt | heq
    · exact ih h'.1 v hlt
    · subst heq; simpa using h'.2

theorem keyN_511 : keyN 511 = true := by decide +kernel
theorem labN_1 : C3.labN 1 = 1 := by decide +kernel

/-- **a canonical `Dec22` with a rank-1 first factor has label 0** -/
theorem canon_has0 (A : Dec22) (hcan : A.Canon) (s : Fin 22) (hr : rkOf (A.av s) = 1) : A.Has 0 := by
  refine ⟨by norm_num, ?_⟩
  by_contra hno
  push Not at hno
  set v := A.av s with hv
  have hv0 : 0 < v := Nat.pos_of_ne_zero (A.ne s)
  have hk : pwK v = 0 := rk1_rec 512 rk1N_512 v (A.lt s) hr
  have hok := points_rec 511 pointsN_511 (v - 1) (by have := A.lt s; omega)
  rw [Nat.sub_add_cancel hv0] at hok
  unfold pointOK at hok
  simp only [Bool.and_eq_true, Nat.blt_eq] at hok
  obtain ⟨⟨⟨hP, hQ⟩, _⟩, himg⟩ := hok
  rw [hk, Nat.add_zero, HC.kM_492] at himg
  -- the image of v is 1
  set g := C3.actN (pwT v) (pwP v) (pwQ v) with hg
  have hgv : g v = 1 := by
    have hlt : g v < 512 := C3.actN_lt _ _ _ _
    have hne : g v ≠ 0 := fun h0 => A.ne s (C3.actN_inj (t := pwT v) hP hQ (A.lt s) (by norm_num)
      (by show g v = C3.actN (pwT v) (pwP v) (pwQ v) 0; rw [h0, C3.actN_zero]))
    have h3 : (3 : ℕ).testBit (g v) = true := himg
    have : g v < 2 := by
      by_contra hge
      rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (by norm_num : 3 < 2 ^ 2)
        (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h3
      exact absurd h3 (by decide)
    omega
  apply hcan g ⟨pwT v, pwP v, pwQ v, hP, hQ, rfl⟩
  refine ⟨1, ?_, ?_, ?_⟩
  · rw [Finset.mem_image]; exact ⟨v, Finset.mem_image.mpr ⟨s, Finset.mem_univ _, hv.symm⟩, hgv⟩
  · intro h1
    obtain ⟨t, _, ht⟩ := Finset.mem_image.mp h1
    exact hno t (by rw [ht, vecL_0])
  · intro x hx hkey
    obtain ⟨t, _, rfl⟩ := Finset.mem_image.mp hx
    rw [C3.labK_lt (A.lt t), C3.labK_lt (by norm_num : (1 : ℕ) < 512), labN_1] at hkey
    have := key_rec 511 keyN_511 (A.av t - 1) (by have := A.lt t; have := A.ne t; omega)
    rw [Nat.sub_add_cancel (Nat.pos_of_ne_zero (A.ne t))] at this
    omega

theorem exists_rk1 (A : Dec22) (hII : R3RT.Spec.CaseII A) : ∃ s, rkOf (A.av s) = 1 := by
  unfold R3RT.Spec.CaseII R3RT.Spec.nType at hII
  obtain ⟨s, hs⟩ := Finset.card_pos.mp (by omega : 0 < (univ.filter (fun s : Fin 22 => rkOf (A.av s) = 1)).card)
  exact ⟨s, (Finset.mem_filter.mp hs).2⟩

/-- **only the first-level node `(1, 0)` is needed at the root of case (II)** -/
theorem root_caseII (l : ℕ) (hl0 : 0 < l) (hl : l < 511) :
    ∀ A : Dec22, A.Canon → R3RT.Spec.CaseII A → ¬ Below A (2 ^ l) l := by
  intro A hcan hII hb
  obtain ⟨s, hs⟩ := exists_rk1 A hII
  have h0 := canon_has0 A hcan s hs
  have := (hb 0 (by norm_num) (by omega)).mp h0
  rw [Nat.testBit_two_pow] at this
  simp at this
  omega

end Top
