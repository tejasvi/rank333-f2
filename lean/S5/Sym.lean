module
public import R22Port.U_d41d8cd98f00
public import S5.Rec
public import S5.FactsSym
/-! # The GL3 symmetry step

`(a, b, c) ↦ (a, b S, S⁻¹ c)` fixes every first factor and maps decompositions of `T(X)` (for every `X`) to
decompositions: `∑ (b S)(S⁻¹ c)ᵀ = T(X)` because `tr(X b S S⁻¹ c) = tr(X b c)`.  So at the root a branch may restrict
`b_t` to orbit representatives (`ORBM`): every nonzero `b` has an `S` (from the list `G3` of all 168 elements
of `GL3(F2)`, with inverses) with `b S ∈ ORBM` (`orb_fact`, a kernel check). -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

theorem allL_spec {l : List (Nat × Nat)} {f : Nat × Nat → Bool} (h : allL l f = true) : ∀ p ∈ l, f p = true := by
  induction l with
  | nil => intro p hp; exact absurd hp List.not_mem_nil
  | cons q l ih =>
    have h' : (f q && allL l f) = true := h
    rw [Bool.and_eq_true] at h'
    intro p hp
    rcases List.mem_cons.mp hp with e | e
    · rw [e]; exact h'.1
    · exact ih h'.2 p e

theorem anyL_spec {l : List (Nat × Nat)} {f : Nat × Nat → Bool} (h : anyL l f = true) : ∃ p ∈ l, f p = true := by
  induction l with
  | nil => have e : anyL [] f = false := rfl; rw [e] at h; exact absurd h (by decide)
  | cons q l ih =>
    have h' : (f q || anyL l f) = true := h
    rw [Bool.or_eq_true] at h'
    rcases h' with e | e
    · exact ⟨q, List.mem_cons_self, e⟩
    · obtain ⟨p, hp, hf⟩ := ih e; exact ⟨p, List.mem_cons_of_mem _ hp, hf⟩

theorem bitF_mul3 (u v p : Nat) (hp : p < 9) :
    bitF (mul3 u v) p = ∑ l : Fin 3, bitF u (3 * (p / 3) + l.val) * bitF v (3 * l.val + p % 3) := by
  rw [bitF_bf, mul3, mkB_bit]
  simp only [hp, decide_true, Bool.true_and, x3, bf_xor, bf_and, Fin.sum_univ_three, bitF_bf]
  simp

theorem toM3_mul3 (u v : Nat) : toM3 (mul3 u v) = toM3 u * toM3 v := by
  ext i j
  simp only [toM3, Matrix.mul_apply]
  rw [bitF_mul3 u v _ (by omega)]
  have e1 : (3 * i.val + j.val) / 3 = i.val := by omega
  have e2 : (3 * i.val + j.val) % 3 = j.val := by omega
  rw [e1, e2]

theorem toM3_273 : toM3 273 = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> decide

theorem toM3_zero : toM3 0 = 0 := by
  ext i j; simp [toM3, bitF]

theorem eq_zero_of_toM3 (v : Nat) (hv : v < 512) (h : toM3 v = 0) : v = 0 := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.zero_testBit]
  by_cases hi : i < 9
  · have := congrFun (congrFun h ⟨i / 3, by omega⟩) ⟨i % 3, by omega⟩
    simp only [toM3, bitF, Matrix.zero_apply] at this
    rw [show 3 * (i / 3) + i % 3 = i by omega] at this
    cases e : v.testBit i
    · rfl
    · rw [e] at this; exact absurd this (by decide)
  · exact lt512_bit v i hv (by omega)

def ix (a b : Fin 3) : Fin 9 := ⟨3 * a.val + b.val, by have := a.isLt; have := b.isLt; omega⟩

theorem lo_ix (a b : Fin 3) : lo (ix a b) = b := by
  apply Fin.ext; simp only [lo, ix]; omega
theorem hi_ix (a b : Fin 3) : hi (ix a b) = a := by
  apply Fin.ext; simp only [hi, ix]; omega

theorem nv_mul3_left (v k : Nat) (y : Fin 9) :
    nv (mul3 v k) y = ∑ m : Fin 3, nv v (ix (hi y) m) * toM3 k m (lo y) := by
  show bitF (mul3 v k) y.val = _
  rw [bitF_mul3 v k y.val y.isLt]; rfl

theorem nv_mul3_right (k w : Nat) (z : Fin 9) :
    nv (mul3 k w) z = ∑ n : Fin 3, toM3 k (hi z) n * nv w (ix n (lo z)) := by
  show bitF (mul3 k w) z.val = _
  rw [bitF_mul3 k w z.val z.isLt]; rfl

theorem TX_ix (X : M3) (a m n b : Fin 3) : TX X (ix a m) (ix n b) = if m = n then X b a else 0 := by
  unfold TX; rw [lo_ix, hi_ix, lo_ix, hi_ix]

/-- the transformed terms still decompose `T(X)` -/
theorem sym_sum (X : M3) (H : Finset Nat) (b c : Nat → Nat) (k k' : Nat) (hkk : toM3 k' * toM3 k = 1)
    (hd : TX X = ∑ t ∈ H, vecMulVec (nv (b t)) (nv (c t))) :
    TX X = ∑ t ∈ H, vecMulVec (nv (mul3 (b t) k)) (nv (mul3 k' (c t))) := by
  ext y z
  rw [Matrix.sum_apply]
  have hL : ∀ t, nv (mul3 (b t) k) y = ∑ m : Fin 3, nv (b t) (ix (hi y) m) * toM3 k m (lo y) :=
    fun t => nv_mul3_left _ _ _
  have hR : ∀ t, nv (mul3 k' (c t)) z = ∑ n : Fin 3, toM3 k' (hi z) n * nv (c t) (ix n (lo z)) :=
    fun t => nv_mul3_right _ _ _
  simp only [vecMulVec_apply, hL, hR]
  have key : ∀ t, (∑ m : Fin 3, nv (b t) (ix (hi y) m) * toM3 k m (lo y)) *
      (∑ n : Fin 3, toM3 k' (hi z) n * nv (c t) (ix n (lo z))) =
      ∑ m : Fin 3, ∑ n : Fin 3, (toM3 k m (lo y) * toM3 k' (hi z) n) * (nv (b t) (ix (hi y) m) * nv (c t) (ix n (lo z))) := by
    intro t; rw [Finset.sum_mul_sum]
    apply Finset.sum_congr rfl; intro m _; apply Finset.sum_congr rfl; intro n _; ring
  rw [Finset.sum_congr rfl (fun t _ => key t), Finset.sum_comm]
  have inner : ∀ m n : Fin 3, ∑ t ∈ H, nv (b t) (ix (hi y) m) * nv (c t) (ix n (lo z)) =
      if m = n then X (lo z) (hi y) else 0 := by
    intro m n
    have := congrFun (congrFun hd (ix (hi y) m)) (ix n (lo z))
    rw [Matrix.sum_apply] at this
    simp only [vecMulVec_apply] at this
    rw [← this, TX_ix]
  have step : ∀ m : Fin 3, ∑ t ∈ H, ∑ n : Fin 3, (toM3 k m (lo y) * toM3 k' (hi z) n) *
      (nv (b t) (ix (hi y) m) * nv (c t) (ix n (lo z))) = toM3 k' (hi z) m * toM3 k m (lo y) * X (lo z) (hi y) := by
    intro m
    rw [Finset.sum_comm]
    simp only [← Finset.mul_sum, inner]
    rw [Finset.sum_eq_single m]
    · rw [if_pos rfl]; ring
    · intro n _ hn; rw [if_neg (fun e => hn e.symm)]; ring
    · simp
  rw [Finset.sum_congr rfl (fun m _ => step m), ← Finset.sum_mul]
  have hone : ∑ m : Fin 3, toM3 k' (hi z) m * toM3 k m (lo y) = (1 : M3) (hi z) (lo y) := by
    rw [← hkk, Matrix.mul_apply]
  rw [hone, Matrix.one_apply]
  unfold TX
  by_cases e : lo y = hi z
  · rw [if_pos e, if_pos e.symm, one_mul]
  · rw [if_neg e, if_neg (fun x => e x.symm), zero_mul]

/-- **GL3 step.** At the root (no assignment), any decomposition can be moved so that `b_t` is an orbit
representative. -/
theorem sym_transform {T n dom ACT : Nat} {b c : Nat → Nat} (hbc : BC n b c) (hd : HD T n dom b c ACT []) (t : Nat)
    (ht : t < n) : ∃ b' c' : Nat → Nat, BC n b' c' ∧ HD T n dom b' c' ACT [] ∧ ORBM.testBit (b' t) = true := by
  have hv := allLT_spec orb_fact (b t) (hbc t ht).2.1
  have hb0 : (b t == 0) = false := by
    have := (hbc t ht).1; cases e : (b t == 0)
    · rfl
    · rw [beq_iff_eq] at e; omega
  rw [hb0, Bool.false_or] at hv
  obtain ⟨p, hp, hpo⟩ := anyL_spec hv
  have hinv := allL_spec g3_fact p hp
  rw [beq_iff_eq] at hinv
  have hSS : toM3 p.1 * toM3 p.2 = 1 := by rw [← toM3_mul3, hinv, toM3_273]
  have hSS' : toM3 p.2 * toM3 p.1 = 1 := Matrix.mul_eq_one_comm.mp hSS
  refine ⟨fun u => mul3 (b u) p.1, fun u => mul3 p.2 (c u), ?_, ?_, hpo⟩
  · intro u hu
    obtain ⟨h1, h2, h3, h4⟩ := hbc u hu
    have hlt : ∀ x y, mul3 x y < 512 := fun x y => lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)
    refine ⟨Nat.pos_of_ne_zero (fun e => ?_), hlt _ _, Nat.pos_of_ne_zero (fun e => ?_), hlt _ _⟩
    · have h0 : toM3 (b u) * toM3 p.1 = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (b u) = 0 := by
        rw [← Matrix.mul_one (toM3 (b u)), ← hSS, ← Matrix.mul_assoc, h0, Matrix.zero_mul]
      have := eq_zero_of_toM3 _ h2 this; omega
    · have h0 : toM3 p.2 * toM3 (c u) = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (c u) = 0 := by
        rw [← Matrix.one_mul (toM3 (c u)), ← hSS, Matrix.mul_assoc, h0, Matrix.mul_zero]
      have := eq_zero_of_toM3 _ h4 this; omega
  · intro X hX hdom
    have h := hd X hX hdom
    have e0 : resM X [] = TX (toM3 X) := by simp [resM]
    rw [e0] at h ⊢
    exact sym_sum (toM3 X) _ b c p.1 p.2 hSS' h

end S5
