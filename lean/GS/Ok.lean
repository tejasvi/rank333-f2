module
public import R22Port.U_d41d8cd98f00
public import GS.Fam
/-! # The OK masks of rank-1 parts (`G/D2.lean` `okB`, `okC`) from the slices

`okB_bit`: with the slices of the B-part fields (`SlOKn`), bit `b` of `okB r1 t` says `b < nB` and every row of `t` has
parity 0 against the B-part's field; `okC_bit` likewise for C-parts.  `okbOf_bit` / `okcOf_bit`: the masks of a core. -/
@[expose] public section
namespace GS
open G G.D2 Finset

/-- parity of `y &&& x` for 29-bit `y`, `x`, as the sum the slices compute -/
theorem par32_29 (y x : ℕ) (hy : y < 2 ^ 29) (hx : x < 2 ^ 29) :
    (if par32 (y &&& x) = 1 then (1 : ZMod 2) else 0) = ∑ i ∈ range 29, tb y i * tb x i := by
  rw [par32_eq]
  have h1 : (if parN 32 (y &&& x) then (1 : ZMod 2) else 0) = ∑ i ∈ range 29, tb y i * tb x i := by
    rw [parN_eq, sum_range_low _ 29 32 (Nat.and_lt_two_pow _ hx) (by norm_num)]
    exact Finset.sum_congr rfl (fun i _ => tb_land y x i)
  by_cases h : parN 32 (y &&& x)
  · rw [if_pos h] at h1 ⊢; simpa using h1
  · rw [if_neg h] at h1 ⊢; simpa using h1

theorem par32_le_one (z : ℕ) : par32 z = 0 ∨ par32 z = 1 := by
  rw [par32_eq]; split <;> simp

/-- slices of the first `n` fields, as the `SlOK` of `sx_spec` -/
theorem slOK_of {S : Sl29} {P n : ℕ} (h : SlOKn S (fld P) n) :
    SlOK S (fun k => if k < n then fld P k else 0) := by
  intro i hi k
  rw [h i hi k]
  by_cases hk : k < n <;> simp [hk]

theorem tb_one_iff_zmod (z p : ℕ) : tb z p = 1 ↔ z.testBit p = true := tb_eq_one

/-- bit `k` of `sx S y` for the slices of `n` fields below `2^29` -/
theorem sx_bit {S : Sl29} {P n : ℕ} (h : SlOKn S (fld P) n) (hf : ∀ k < n, fld P k < 2 ^ 29) (y : ℕ)
    (hy : y < 2 ^ 29) (k : ℕ) : (sx S y).testBit k = (decide (k < n) && decide (par32 (y &&& fld P k) = 1)) := by
  have hs := sx_spec S _ (slOK_of h) y k
  by_cases hk : k < n
  · simp only [hk, if_true] at hs
    rw [← par32_29 y _ hy (hf k hk)] at hs
    simp only [hk, decide_true, Bool.true_and]
    rcases par32_le_one (y &&& fld P k) with h0 | h1
    · rw [h0] at hs ⊢; simp at hs; rw [tb_eq_zero.mp hs]; simp
    · rw [h1] at hs ⊢; simp at hs; rw [tb_eq_one.mp hs]; simp
  · simp only [hk, if_false] at hs
    have : ∑ i ∈ range 29, tb y i * tb 0 i = 0 := Finset.sum_eq_zero (fun i _ => by simp [tb])
    rw [this] at hs
    rw [tb_eq_zero.mp hs]; simp [hk]

theorem testBit_two_pow_sub_one' (n k : ℕ) : (2 ^ n - 1).testBit k = decide (k < n) := Nat.testBit_two_pow_sub_one n k

/-- **the B-part mask of one term** -/
theorem okB_bit (r1 : R1) (PB1 nB : ℕ) (hS : SlOKn r1.SB (fld PB1) nB) (hA : r1.AB = 2 ^ nB - 1)
    (hf : ∀ b < nB, fld PB1 b < 2 ^ 29) (t : ℕ) (ht : ∀ q < fR t, fYU t q < 2 ^ 29) (b : ℕ) :
    (okB r1 t).testBit b = true ↔ b < nB ∧ ∀ q < fR t, par32 (fYU t q &&& fld PB1 b) = 0 := by
  unfold okB
  suffices key : ∀ n, n ≤ fR t → ((rowsB r1 t n).testBit b = true ↔ b < nB ∧ ∀ q < n, par32 (fYU t q &&& fld PB1 b) = 0) from
    key _ le_rfl
  intro n hn
  induction n with
  | zero => rw [show rowsB r1 t 0 = r1.AB from rfl, hA, testBit_two_pow_sub_one']; simp
  | succ n ih =>
    show (Nat.land (rowsB r1 t n) (Nat.xor r1.AB (sx r1.SB (fYU t n)))).testBit b = true ↔ _
    rw [show Nat.land (rowsB r1 t n) (Nat.xor r1.AB (sx r1.SB (fYU t n))) =
      rowsB r1 t n &&& (r1.AB ^^^ sx r1.SB (fYU t n)) from rfl, Nat.testBit_and, Nat.testBit_xor, hA,
      testBit_two_pow_sub_one', sx_bit hS hf _ (ht n (by omega)) b]
    have ih' := ih (by omega)
    constructor
    · intro h
      simp only [Bool.and_eq_true] at h
      obtain ⟨h1, h2⟩ := (ih'.mp h.1)
      refine ⟨h1, fun q hq => ?_⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hq with hlt | rfl
      · exact h2 q hlt
      · have := h.2
        simp only [h1, decide_true, Bool.true_and] at this
        rcases par32_le_one (fYU t q &&& fld PB1 b) with h0 | h1'
        · exact h0
        · rw [h1'] at this; simp at this
    · rintro ⟨h1, h2⟩
      simp only [Bool.and_eq_true]
      refine ⟨ih'.mpr ⟨h1, fun q hq => h2 q (by omega)⟩, ?_⟩
      rw [h2 n (by omega)]; simp [h1]

/-- **the C-part mask of one term** -/
theorem okC_bit (r1 : R1) (PC1 nC : ℕ) (hS : SlOKn r1.SC (fld PC1) nC) (hA : r1.AC = 2 ^ nC - 1)
    (hf : ∀ c < nC, fld PC1 c < 2 ^ 29) (t : ℕ) (ht : ∀ q < fR t, fXV t q < 2 ^ 29) (c : ℕ) :
    (okC r1 t).testBit c = true ↔ c < nC ∧ ∀ q < fR t, par32 (fld PC1 c &&& fXV t q) = 0 := by
  unfold okC
  suffices key : ∀ n, n ≤ fR t → ((rowsC r1 t n).testBit c = true ↔ c < nC ∧ ∀ q < n, par32 (fld PC1 c &&& fXV t q) = 0) from
    key _ le_rfl
  intro n hn
  induction n with
  | zero => rw [show rowsC r1 t 0 = r1.AC from rfl, hA, testBit_two_pow_sub_one']; simp
  | succ n ih =>
    show (Nat.land (rowsC r1 t n) (Nat.xor r1.AC (sx r1.SC (fXV t n)))).testBit c = true ↔ _
    rw [show Nat.land (rowsC r1 t n) (Nat.xor r1.AC (sx r1.SC (fXV t n))) =
      rowsC r1 t n &&& (r1.AC ^^^ sx r1.SC (fXV t n)) from rfl, Nat.testBit_and, Nat.testBit_xor, hA,
      testBit_two_pow_sub_one', sx_bit hS hf _ (ht n (by omega)) c, Nat.land_comm (fXV t n)]
    have ih' := ih (by omega)
    constructor
    · intro h
      simp only [Bool.and_eq_true] at h
      obtain ⟨h1, h2⟩ := (ih'.mp h.1)
      refine ⟨h1, fun q hq => ?_⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hq with hlt | rfl
      · exact h2 q hlt
      · have := h.2
        simp only [h1, decide_true, Bool.true_and] at this
        rcases par32_le_one (fld PC1 c &&& fXV t q) with h0 | h1'
        · exact h0
        · rw [h1'] at this; simp at this
    · rintro ⟨h1, h2⟩
      simp only [Bool.and_eq_true]
      refine ⟨ih'.mpr ⟨h1, fun q hq => h2 q (by omega)⟩, ?_⟩
      rw [h2 n (by omega)]; simp [h1]

/-- the B-part mask of a core: bit `b` set when it is set in every term's mask (and `b < nB`) -/
theorem okbOf_bit (r1 : R1) (nB : ℕ) (hA : r1.AB = 2 ^ nB - 1) (ts : List ℕ) (b : ℕ) (hb : b < nB)
    (h : ∀ t ∈ ts, (okB r1 t).testBit b = true) : (okbOf r1 ts).testBit b = true := by
  unfold okbOf
  suffices key : ∀ (L : List ℕ) (m : ℕ), m.testBit b = true → (∀ t ∈ L, (okB r1 t).testBit b = true) →
      (L.foldl (fun m t => m &&& okB r1 t) m).testBit b = true from
    key ts _ (by rw [hA, testBit_two_pow_sub_one']; simp [hb]) h
  intro L
  induction L with
  | nil => intro m hm _; exact hm
  | cons t L ih =>
    intro m hm hL
    rw [List.foldl_cons]
    apply ih
    · rw [Nat.testBit_and, hm, hL t List.mem_cons_self]; rfl
    · exact fun t' ht' => hL t' (List.mem_cons_of_mem _ ht')

theorem okcOf_bit (r1 : R1) (nC : ℕ) (hA : r1.AC = 2 ^ nC - 1) (ts : List ℕ) (c : ℕ) (hc : c < nC)
    (h : ∀ t ∈ ts, (okC r1 t).testBit c = true) : (okcOf r1 ts).testBit c = true := by
  unfold okcOf
  suffices key : ∀ (L : List ℕ) (m : ℕ), m.testBit c = true → (∀ t ∈ L, (okC r1 t).testBit c = true) →
      (L.foldl (fun m t => m &&& okC r1 t) m).testBit c = true from
    key ts _ (by rw [hA, testBit_two_pow_sub_one']; simp [hc]) h
  intro L
  induction L with
  | nil => intro m hm _; exact hm
  | cons t L ih =>
    intro m hm hL
    rw [List.foldl_cons]
    apply ih
    · rw [Nat.testBit_and, hm, hL t List.mem_cons_self]; rfl
    · exact fun t' ht' => hL t' (List.mem_cons_of_mem _ ht')

end GS

#print axioms GS.okB_bit
#print axioms GS.okbOf_bit
