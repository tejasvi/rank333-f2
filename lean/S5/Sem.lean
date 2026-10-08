module
public import R22Port.U_d41d8cd98f00
public import S5.ElimLA
public import S5.FactsTX
public import S5.FactsRoot
/-! # Semantics of the checker state: residual matrices, packed residuals, hit counts -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

/-- first factor `t` of packed terms -/
def aT (T t : Nat) : Nat := Nat.land (Nat.shiftRight T (Nat.mul 9 t)) 511

theorem aT_lt (T t : Nat) : aT T t < 512 := lt_of_le_of_lt Nat.and_le_right (by norm_num)

/-- the residual `R(X) = T(X) + ∑_{assigned, X(a) = 1} b cᵀ` -/
def resM (X : Nat) (asg : Asg) : Matrix (Fin 9) (Fin 9) F2 :=
  TX (toM3 X) + (asg.map (fun e => if par (e.1 &&& X) = true then vecMulVec (nv e.2.1) (nv e.2.2) else 0)).sum

theorem resM_cons (X : Nat) (e : Nat × Nat × Nat) (asg : Asg) :
    resM X (e :: asg) = resM X asg + (if par (e.1 &&& X) = true then vecMulVec (nv e.2.1) (nv e.2.2) else 0) := by
  simp only [resM, List.map_cons, List.sum_cons]; abel

theorem txc_bit (X i : Nat) (hX : X < 512) (hi : i < 162) : (txc18 X).testBit i = txcSpec X i := by
  have := allLT_spec (allLT_spec txc_fact X hX) i hi; simpa using this
theorem txr_bit (X i : Nat) (hX : X < 512) (hi : i < 162) : (txr18 X).testBit i = txrSpec X i := by
  have := allLT_spec (allLT_spec txr_fact X hX) i hi; simpa using this

theorem tx_entry (X y z : Nat) (hy : y < 9) (hz : z < 9) :
    bf (decide (y % 3 = z / 3) && X.testBit (3 * (z % 3) + y / 3)) =
      TX (toM3 X) ⟨y, hy⟩ ⟨z, hz⟩ := by
  unfold TX
  have e : (lo ⟨y, hy⟩ = hi ⟨z, hz⟩) ↔ y % 3 = z / 3 := by
    simp only [lo, hi, Fin.ext_iff]
  by_cases h : y % 3 = z / 3
  · rw [if_pos (e.mpr h)]; simp [h, toM3, bitF, lo, hi, bf]
  · rw [if_neg (fun x => h (e.mp x))]; simp [h, bf]

/-- the right halves of a packed residual are the identity -/
theorem id18_right (z j : Nat) (hz : z < 9) (hj : j < 9) : ID18.testBit (18 * z + (9 + j)) = decide (j = z) := by
  rw [id18_bit]
  have e1 : (18 * z + (9 + j)) % 18 = 9 + j := by omega
  have e2 : (18 * z + (9 + j)) / 18 = z := by omega
  rw [e1, e2, decide_eq_decide]
  omega

theorem id18_left (z y : Nat) (hy : y < 9) : ID18.testBit (18 * z + y) = false := by
  rw [id18_bit]; simp only [decide_eq_false_iff_not]; omega

theorem term_left (b c z y : Nat) (hb : b < 512) (hc : c < 512) (hy : y < 18) :
    (spr18 c * b).testBit (18 * z + y) = (decide (z < 9) && c.testBit z && b.testBit y) := by
  rw [sparse18_slot (spr18_sparse c hc) (by omega) z y hy, spr18_bit c hc]
  have e : (18 * z % 18 = 0 ∧ 18 * z < 162) ↔ z < 9 := by omega
  rw [show 18 * z / 18 = z by omega]; simp only [e]

theorem lt512_bit (b j : Nat) (hb : b < 512) (hj : 9 ≤ j) : b.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le hb (by
    calc 512 = 2 ^ 9 := by norm_num
      _ ≤ 2 ^ j := Nat.pow_le_pow_right (by norm_num) hj))

theorem resC_nil (X : Nat) (hX : X < 512) : amat (resC X []) = resM X [] ∧ RightId (resC X []) := by
  constructor
  · funext y z
    show bitF (txc18 X ^^^ ID18) (18 * z.val + y.val) = (TX (toM3 X) + ([] : List (Matrix (Fin 9) (Fin 9) F2)).sum) y z
    rw [List.sum_nil, add_zero, bitF_bf, Nat.testBit_xor, txc_bit X _ hX (by omega), id18_left _ _ y.isLt,
      Bool.xor_false, txcSpec, ← tx_entry X y.val z.val y.isLt z.isLt]
    have e1 : (18 * z.val + y.val) % 18 = y.val := by omega
    have e2 : (18 * z.val + y.val) / 18 = z.val := by omega
    rw [e1, e2]; simp [y.isLt]
  · intro z j hz hj
    show (txc18 X ^^^ ID18).testBit _ = _
    have hf : txcSpec X (18 * z + (9 + j)) = false := by
      unfold txcSpec
      rw [decide_eq_false (by omega : ¬ ((18 * z + (9 + j)) % 18 < 9))]
      rfl
    rw [Nat.testBit_xor, txc_bit X _ hX (by omega), id18_right z j hz hj, hf, Bool.false_xor]

theorem resC_step (X : Nat) (asg : Asg) (e : Nat × Nat × Nat) (hb : e.2.1 < 512) (hc : e.2.2 < 512)
    (ih1 : amat (resC X asg) = resM X asg) (ih2 : RightId (resC X asg)) :
    amat (spr18 e.2.2 * e.2.1 ^^^ resC X asg) = resM X asg + vecMulVec (nv e.2.1) (nv e.2.2) ∧
      RightId (spr18 e.2.2 * e.2.1 ^^^ resC X asg) := by
  constructor
  · funext y z
    rw [← ih1]
    show bitF (spr18 e.2.2 * e.2.1 ^^^ resC X asg) (18 * z.val + y.val) =
      bitF (resC X asg) (18 * z.val + y.val) + nv e.2.1 y * nv e.2.2 z
    rw [bitF_bf, bitF_bf, Nat.testBit_xor, term_left _ _ _ _ hb hc (by omega), bf_xor]
    simp only [z.isLt, decide_true, Bool.true_and, bf_and, nv, bitF_bf]
    ring
  · intro z j hz hj
    rw [Nat.testBit_xor, term_left _ _ _ _ hb hc (by omega), lt512_bit _ _ hb (by omega), ih2 z j hz hj]
    simp

/-- `resC X asg` packs `R(X)` by columns -/
theorem resC_sem (X : Nat) (hX : X < 512) : ∀ asg : Asg, (∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) →
    amat (resC X asg) = resM X asg ∧ RightId (resC X asg) := by
  intro asg
  induction asg with
  | nil => intro _; exact resC_nil X hX
  | cons e asg ih =>
    intro hasg
    obtain ⟨ih1, ih2⟩ := ih (fun e' he' => hasg e' (List.mem_cons_of_mem _ he'))
    obtain ⟨hb, hc⟩ := hasg e List.mem_cons_self
    have hR : resC X (e :: asg) = cond (par (e.1 &&& X)) ((spr18 e.2.2 * e.2.1) ^^^ resC X asg) (resC X asg) := rfl
    rw [hR, resM_cons]
    cases hp : par (e.1 &&& X)
    · rw [cond_false, if_neg (by decide), add_zero]
      exact ⟨ih1, ih2⟩
    · rw [cond_true, if_pos rfl]
      exact resC_step X asg e hb hc ih1 ih2

theorem resR_nil (X : Nat) (hX : X < 512) : amat (resR X []) = (resM X [])ᵀ ∧ RightId (resR X []) := by
  constructor
  · funext z y
    show bitF (txr18 X ^^^ ID18) (18 * y.val + z.val) = (TX (toM3 X) + ([] : List (Matrix (Fin 9) (Fin 9) F2)).sum) y z
    rw [List.sum_nil, add_zero, bitF_bf, Nat.testBit_xor, txr_bit X _ hX (by omega), id18_left _ _ z.isLt,
      Bool.xor_false, txrSpec, ← tx_entry X y.val z.val y.isLt z.isLt]
    have e1 : (18 * y.val + z.val) % 18 = z.val := by omega
    have e2 : (18 * y.val + z.val) / 18 = y.val := by omega
    rw [e1, e2]; simp [z.isLt]
  · intro z j hz hj
    show (txr18 X ^^^ ID18).testBit _ = _
    have hf : txrSpec X (18 * z + (9 + j)) = false := by
      unfold txrSpec
      rw [decide_eq_false (by omega : ¬ ((18 * z + (9 + j)) % 18 < 9))]
      rfl
    rw [Nat.testBit_xor, txr_bit X _ hX (by omega), id18_right z j hz hj, hf, Bool.false_xor]

theorem resR_step (X : Nat) (asg : Asg) (e : Nat × Nat × Nat) (hb : e.2.1 < 512) (hc : e.2.2 < 512)
    (ih1 : amat (resR X asg) = (resM X asg)ᵀ) (ih2 : RightId (resR X asg)) :
    amat (spr18 e.2.1 * e.2.2 ^^^ resR X asg) = (resM X asg + vecMulVec (nv e.2.1) (nv e.2.2))ᵀ ∧
      RightId (spr18 e.2.1 * e.2.2 ^^^ resR X asg) := by
  constructor
  · funext z y
    rw [Matrix.transpose_add, Matrix.add_apply, ← ih1]
    show bitF (spr18 e.2.1 * e.2.2 ^^^ resR X asg) (18 * y.val + z.val) =
      bitF (resR X asg) (18 * y.val + z.val) + nv e.2.1 y * nv e.2.2 z
    rw [bitF_bf, bitF_bf, Nat.testBit_xor, term_left _ _ _ _ hc hb (by omega), bf_xor]
    simp only [y.isLt, decide_true, Bool.true_and, bf_and, nv, bitF_bf]
    ring
  · intro z j hz hj
    rw [Nat.testBit_xor, term_left _ _ _ _ hc hb (by omega), lt512_bit _ _ hc (by omega), ih2 z j hz hj]
    simp

/-- `resR X asg` packs `R(X)` by rows -/
theorem resR_sem (X : Nat) (hX : X < 512) : ∀ asg : Asg, (∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) →
    amat (resR X asg) = (resM X asg)ᵀ ∧ RightId (resR X asg) := by
  intro asg
  induction asg with
  | nil => intro _; exact resR_nil X hX
  | cons e asg ih =>
    intro hasg
    obtain ⟨ih1, ih2⟩ := ih (fun e' he' => hasg e' (List.mem_cons_of_mem _ he'))
    obtain ⟨hb, hc⟩ := hasg e List.mem_cons_self
    have hR : resR X (e :: asg) = cond (par (e.1 &&& X)) ((spr18 e.2.1 * e.2.2) ^^^ resR X asg) (resR X asg) := rfl
    rw [hR, resM_cons]
    cases hp : par (e.1 &&& X)
    · rw [cond_false, if_neg (by decide), add_zero]
      exact ⟨ih1, ih2⟩
    · rw [cond_true, if_pos rfl]
      exact resR_step X asg e hb hc ih1 ih2

theorem noasg_spec (X : Nat) : ∀ asg : Asg, noasg X asg = true →
    resC X asg = Nat.xor (txc18 X) ID18 ∧ resR X asg = Nat.xor (txr18 X) ID18 ∧ resM X asg = TX (toM3 X) := by
  intro asg
  induction asg with
  | nil => intro _; exact ⟨rfl, rfl, by simp [resM]⟩
  | cons e asg ih =>
    intro h
    have h' : (!(par (Nat.land e.1 X)) && noasg X asg) = true := h
    simp only [Bool.and_eq_true, Bool.not_eq_true'] at h'
    obtain ⟨h1, h2, h3⟩ := ih h'.2
    have hp : par (e.1 &&& X) = false := h'.1
    refine ⟨?_, ?_, ?_⟩
    · show cond (par (e.1 &&& X)) _ (resC X asg) = _; rw [hp, cond_false]; exact h1
    · show cond (par (e.1 &&& X)) _ (resR X asg) = _; rw [hp, cond_false]; exact h2
    · rw [resM_cons, hp, h3, if_neg (by decide), add_zero]

/-! ## Hit counts -/

/-- the active terms hit by `X` -/
def hitS (T n ACT X : Nat) : Finset Nat :=
  (Finset.range n).filter (fun t => ACT.testBit t = true ∧ par (aT T t &&& X) = true)

theorem mkSSP_bit (T k s : Nat) (hk : k < 9) (hs : s < 32) : ∀ n, n ≤ 32 →
    (mkSSP T n).testBit (32 * k + s) = (decide (s < n) && (aT T s).testBit k) := by
  intro n
  induction n with
  | zero => intro _; simp [mkSSP]
  | succ n ih =>
    intro hn
    show (mkSSP T n ||| (dep32 (aT T n) <<< n)).testBit (32 * k + s) = _
    rw [Nat.testBit_or, ih (by omega), Nat.testBit_shiftLeft, dep32_bit _ (aT_lt T n)]
    by_cases e : s = n
    · subst e
      have e0 : 32 * k + s - s = 32 * k := by omega
      have e1 : 32 * k % 32 = 0 ∧ 32 * k < 288 := by omega
      have e2 : 32 * k / 32 = k := by omega
      rw [e0, e2, decide_eq_true e1]
      simp
    · have e1 : ¬ (32 * k + s ≥ n ∧ (32 * k + s - n) % 32 = 0 ∧ 32 * k + s - n < 288) := by omega
      have e3 : (s < n + 1) ↔ s < n := by omega
      by_cases e2 : 32 * k + s ≥ n
      · have e4 : ¬ ((32 * k + s - n) % 32 = 0 ∧ 32 * k + s - n < 288) := fun x => e1 ⟨e2, x⟩
        simp [e2, e3, e4]
      · simp [e2, e3]

/-- `SS` holds bit `k` of first factor `s` at bit `32k + s` (for the `n` terms) -/
def SSok (T n SS : Nat) : Prop :=
  ∀ k s, k < 9 → s < 32 → SS.testBit (32 * k + s) = (decide (s < n) && (aT T s).testBit k)

theorem mkSSP_ok (T n : Nat) (hn : n ≤ 32) : SSok T n (mkSSP T n) :=
  fun k s hk hs => mkSSP_bit T k s hk hs n hn

theorem hx_SS (T n X s SS : Nat) (hSS : SSok T n SS) (hX : X < 512) (hs : s < 32) :
    (hx SS X).testBit s = (decide (s < n) && par (aT T s &&& X)) := by
  apply bf_inj
  rw [hx_bf _ X s hX hs]
  by_cases hsn : s < n
  · rw [Finset.sum_congr rfl (fun k hk => by rw [hSS k s (Finset.mem_range.mp hk) hs])]
    simp only [hsn, decide_true, Bool.true_and]
    rw [← dot_nv _ X (aT_lt T s), dotProduct]
    simp only [nv, bitF_bf]
    rw [Fin.sum_univ_eq_sum_range (fun k => bf ((aT T s).testBit k) * bf (X.testBit k))]
    apply Finset.sum_congr rfl; intro k _; ring
  · rw [Finset.sum_congr rfl (fun k hk => by rw [hSS k s (Finset.mem_range.mp hk) hs])]
    simp [hsn, bf]

theorem ucnt_eq' (T n ACT X SS : Nat) (hSS : SSok T n SS) (hn : n ≤ 32) (hX : X < 512)
    (hact : ∀ t, ACT.testBit t = true → t < n) : ucnt SS ACT X = (hitS T n ACT X).card := by
  show pop32 (hx SS X &&& ACT) = _
  rw [pop32_eq _ (lt_of_le_of_lt Nat.and_le_left (hx_lt _ _)), cntB_card]
  congr 1
  ext s
  simp only [Finset.mem_filter, Finset.mem_range, Nat.testBit_and, hitS, Bool.and_eq_true]
  constructor
  · rintro ⟨hs, h1, h2⟩
    rw [hx_SS T n X s SS hSS hX hs] at h1
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h1
    exact ⟨h1.1, h2, h1.2⟩
  · rintro ⟨hs, h2, h1⟩
    refine ⟨by omega, ?_, h2⟩
    rw [hx_SS T n X s SS hSS hX (by omega)]
    simp [hs, h1]

theorem ucnt_eq (T n ACT X : Nat) (hn : n ≤ 32) (hX : X < 512) (hact : ∀ t, ACT.testBit t = true → t < n) :
    ucnt (mkSSP T n) ACT X = (hitS T n ACT X).card :=
  ucnt_eq' T n ACT X _ (mkSSP_ok T n hn) hn hX hact

theorem rank_sum_le {ι : Type*} [DecidableEq ι] (S : Finset ι) (β γ : ι → Fin 9 → F2) :
    (∑ s ∈ S, vecMulVec (β s) (γ s)).rank ≤ S.card := by
  rw [sum_vecMulVec_eq]
  calc (facB S β * (facB S γ)ᵀ).rank ≤ (facB S β).rank := Matrix.rank_mul_le_left _ _
    _ ≤ Fintype.card ↥S := Matrix.rank_le_card_width _
    _ = S.card := Fintype.card_coe _

end S5
