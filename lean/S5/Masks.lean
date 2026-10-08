module
public import R22Port.U_d41d8cd98f00
public import S5.Elim
public import S5.Facts
public import S5.FactsNP
/-! # Bit semantics of the checker's masks and folds: `par`, `perp`, `gather`, `lmC`, `kerM`, `xof`, `gof`, `hx`,
`pop32` -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

/-- a 9-bit number as a vector of `F2^9` -/
def nv (w : Nat) : Fin 9 → F2 := fun i => bitF w i.val

theorem par_eq (v : Nat) (hv : v < 512) : par v = xorBits v 9 := by
  have := allLT_spec par_fact v hv; simpa using this

theorem bf_xorBits (v k : Nat) : bf (xorBits v k) = ∑ i ∈ Finset.range k, bf (v.testBit i) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show bf (xor (xorBits v k) (v.testBit k)) = _
    rw [bf_xor, ih, Finset.sum_range_succ]

theorem bf_inj {a b : Bool} (h : bf a = bf b) : a = b := by
  cases a <;> cases b <;> first | rfl | exact absurd h (by decide)

/-- `w · v` as the parity of `w &&& v` -/
theorem dot_nv (w v : Nat) (hw : w < 512) : nv w ⬝ᵥ nv v = bf (par (w &&& v)) := by
  rw [par_eq _ (lt_of_le_of_lt Nat.and_le_left hw), bf_xorBits, ← Fin.sum_univ_eq_sum_range]
  simp only [dotProduct, nv, bitF_bf, Nat.testBit_and, bf_and]

theorem nperp_bit (v w : Nat) (hv : v < 512) (hw : w < 512) : (nperp v).testBit w = par (w &&& v) := by
  have := allLT_spec (allLT_spec nperp_fact v hv) w hw; simpa using this

theorem perp_bit (v w : Nat) (hv : v < 512) (hw : w < 512) : (perp v).testBit w = !par (w &&& v) := by
  show (M512 ^^^ nperp v).testBit w = _
  rw [Nat.testBit_xor, m512_eq, Nat.testBit_two_pow_sub_one, nperp_bit v w hv hw]; simp [hw]

theorem testBit_511 (j : Nat) : Nat.testBit 511 j = decide (j < 9) := by
  rw [show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]

theorem testBit_M32 (j : Nat) : M32.testBit j = decide (j < 32) := by
  rw [m32_eq, Nat.testBit_two_pow_sub_one]

/-! ## `gather`, `lmC`, `kerM` -/

theorem gather_spec (P j : Nat) : gather P j = mkB (fun h => P.testBit (18 * h + j)) 9 := by
  rw [gather_eq]
  have hlt : mkB (fun h => P.testBit (18 * h + j)) 9 < 512 :=
    lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)
  have e : (P >>> j) &&& REP18 = spr18 (mkB (fun h => P.testBit (18 * h + j)) 9) := by
    apply Nat.eq_of_testBit_eq; intro i
    rw [cand_bit, spr18_bit _ hlt, mkB_bit]
    by_cases h : i % 18 = 0 ∧ i < 162
    · have e1 : j + i = 18 * (i / 18) + j := by omega
      have e2 : i / 18 < 9 := by omega
      simp [h, e1, e2]
    · simp [h]
  rw [e]
  have := allLT_spec gcore_fact _ hlt
  simpa using this

theorem gather_bit (P j h : Nat) : (gather P j).testBit h = (decide (h < 9) && P.testBit (18 * h + j)) := by
  rw [gather_spec, mkB_bit]

theorem gather_lt (P j : Nat) : gather P j < 512 := by
  rw [gather_spec]; exact lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)

def lmLoop (P PM k acc : Nat) : Nat := @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun j ih acc => ih (cond (bit PM j) acc (Nat.land acc (perp (Nat.lor (gather P j) (Nat.shiftLeft 1 j)))))) k acc

theorem lmC_mem (P PM w : Nat) (hw : w < 512)
    (h : ∀ j, j < 9 → PM.testBit j = false → par (w &&& (gather P j ||| 2 ^ j)) = false) :
    (lmC P PM).testBit w = true := by
  have key : ∀ k, k ≤ 9 → ∀ acc, acc.testBit w = true → (lmLoop P PM k acc).testBit w = true := by
    intro k
    induction k with
    | zero => intro _ acc hacc; exact hacc
    | succ k ih =>
      intro hk acc hacc
      show Nat.testBit (lmLoop P PM k (cond (bit PM k) acc
        (Nat.land acc (perp (Nat.lor (gather P k) (Nat.shiftLeft 1 k)))))) w = true
      apply ih (by omega)
      rw [bit_eq]
      cases hb : PM.testBit k
      · show (acc &&& perp (gather P k ||| 1 <<< k)).testBit w = true
        have hlt : gather P k ||| 2 ^ k < 512 := by
          have h1 : gather P k < 2 ^ 9 := lt_of_lt_of_eq (gather_lt P k) (by norm_num)
          have h2 : 2 ^ k < 2 ^ 9 := Nat.pow_lt_pow_right (by norm_num) (by omega)
          have := Nat.or_lt_two_pow h1 h2
          simpa using this
        rw [Nat.testBit_and, hacc, Nat.one_shiftLeft, perp_bit _ w hlt hw, h k (by omega) hb]; rfl
      · exact hacc
  exact key 9 le_rfl M512 (by rw [m512_eq, Nat.testBit_two_pow_sub_one]; simpa using hw)

def kmLoop (M k acc : Nat) : Nat := @Nat.rec (fun _ => Nat → Nat) (fun acc => acc)
    (fun z ih acc => ih (cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 0) acc
      (Nat.land acc (perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) M18) 9))))) k acc

theorem rgt_lt (M z : Nat) : ((M >>> (18 * z)) &&& M18) >>> 9 < 512 := by
  rw [Nat.shiftRight_eq_div_pow]
  have := land_m18_lt (M >>> (18 * z))
  apply Nat.div_lt_of_lt_mul; norm_num at this ⊢; omega

theorem kerM_mem (M w : Nat) (hw : w < 512)
    (h : ∀ z, z < 9 → par (w &&& (((M >>> (18 * z)) &&& M18) >>> 9)) = false) : (kerM M).testBit w = true := by
  have key : ∀ k, k ≤ 9 → ∀ acc, acc.testBit w = true → (kmLoop M k acc).testBit w = true := by
    intro k
    induction k with
    | zero => intro _ acc hacc; exact hacc
    | succ k ih =>
      intro hk acc hacc
      show (kmLoop M k (cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 0) acc
        (Nat.land acc (perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 9))))).testBit w = true
      apply ih (by omega)
      cases Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 k)) M18) 0
      · show (acc &&& perp (((M >>> (18 * k)) &&& M18) >>> 9)).testBit w = true
        rw [Nat.testBit_and, hacc, perp_bit _ w (rgt_lt M k) hw, h k (by omega)]; rfl
      · exact hacc
  exact key 9 le_rfl M512 (by rw [m512_eq, Nat.testBit_two_pow_sub_one]; simpa using hw)

theorem rgt_bit (M z j : Nat) (hj : j < 9) :
    (((M >>> (18 * z)) &&& M18) >>> 9).testBit j = M.testBit (18 * z + (9 + j)) := by
  rw [Nat.testBit_shiftRight, Nat.testBit_and, Nat.testBit_shiftRight, m18_eq, Nat.testBit_two_pow_sub_one]
  simp [show 9 + j < 18 by omega]

/-! ## The folds `xof`, `gof`, `hx` -/

theorem sprRH_bit (b i : Nat) (hb : b < 512) :
    (spr18 b * RH9).testBit i = (decide (9 ≤ i % 18 ∧ i < 162) && b.testBit (i / 18)) := by
  rw [testBit_sparse_mul (by norm_num) _ RH9 (by decide) (spr18_sparse b hb), spr18_bit b hb, rh9_bit]
  have e1 : 18 * (i / 18) % 18 = 0 := by omega
  have e2 : (18 * (i / 18) < 162) ↔ i < 162 := by omega
  have e3 : 18 * (i / 18) / 18 = i / 18 := by omega
  have e4 : i % 18 < 18 := by omega
  simp only [e1, e2, e3, e4, true_and, and_true]
  by_cases h1 : 9 ≤ i % 18 <;> by_cases h2 : i < 162 <;> simp [h1, h2]

theorem xof_bf (P b j : Nat) (hb : b < 512) (hj : j < 9) :
    bf ((xof P b).testBit j) = ∑ h ∈ Finset.range 9, bf (b.testBit h) * bf (P.testBit (18 * h + (9 + j))) := by
  unfold xof
  simp only [Nat.land_eq, Nat.xor_eq, Nat.shiftRight_eq', Nat.mul_eq, Nat.testBit_and, Nat.testBit_xor,
    Nat.testBit_shiftRight, testBit_511, sprRH_bit b _ hb]
  interval_cases j <;> simp [Finset.sum_range_succ, bf_xor, bf_and, bf_false, bf_true] <;> ring

theorem xof_lt (P b : Nat) : xof P b < 512 := by
  show Nat.land _ 511 < 512
  exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem cREPR_bit (c i : Nat) (hc : c < 512) :
    (c * REPR).testBit i = (decide (9 ≤ i % 18 ∧ i < 162) && c.testBit (i % 18 - 9)) := by
  have e : c * REPR = REP18 * (c * 2 ^ 9) := by
    rw [show REPR = REP18 * 2 ^ 9 by decide +kernel]; ring
  rw [e, testBit_sparse_mul (by norm_num) _ _ (by omega) rep18_sparse, rep18_bit, Nat.testBit_mul_two_pow]
  have e1 : 18 * (i / 18) % 18 = 0 := by omega
  have e2 : (18 * (i / 18) < 162) ↔ i < 162 := by omega
  simp only [e1, e2, true_and]
  cases c.testBit (i % 18 - 9) <;> by_cases h1 : 9 ≤ i % 18 <;> simp [h1]

theorem gof_bf (P c h : Nat) (hc : c < 512) (hh : h < 9) :
    bf ((gof P c).testBit h) = ∑ j ∈ Finset.range 9, bf (c.testBit j) * bf (P.testBit (18 * h + (9 + j))) := by
  unfold gof
  rw [gather_bit]
  simp only [Nat.land_eq, Nat.xor_eq, Nat.shiftRight_eq', Nat.mul_eq, Nat.testBit_and, Nat.testBit_xor,
    Nat.testBit_shiftRight, cREPR_bit c _ hc]
  interval_cases h <;> simp [Finset.sum_range_succ, bf_xor, bf_and, bf_false, bf_true] <;> ring

theorem gof_lt (P c : Nat) : gof P c < 512 := gather_lt _ _

theorem depM32_bit (X i : Nat) (hX : X < 512) :
    (dep32 X * M32).testBit i = (decide (i < 288) && X.testBit (i / 32)) := by
  have hs : ∀ j, (dep32 X).testBit j = true → j % 32 = 0 := by
    intro j hj; rw [dep32_bit X hX] at hj; simp at hj; omega
  rw [testBit_sparse_mul (by norm_num) _ M32 (by rw [m32_eq]; omega) hs, dep32_bit X hX, testBit_M32]
  have e1 : 32 * (i / 32) % 32 = 0 := by omega
  have e2 : (32 * (i / 32) < 288) ↔ i < 288 := by omega
  have e3 : 32 * (i / 32) / 32 = i / 32 := by omega
  have e4 : i % 32 < 32 := by omega
  simp [e1, e2, e3, e4]

theorem hx_bf (SS X s : Nat) (hX : X < 512) (hs : s < 32) :
    bf ((hx SS X).testBit s) = ∑ k ∈ Finset.range 9, bf (X.testBit k) * bf (SS.testBit (32 * k + s)) := by
  unfold hx
  simp only [Nat.land_eq, Nat.xor_eq, Nat.shiftRight_eq', Nat.mul_eq, Nat.testBit_and, Nat.testBit_xor,
    Nat.testBit_shiftRight, testBit_M32, depM32_bit X _ hX]
  interval_cases s <;> simp [Finset.sum_range_succ, bf_xor, bf_and, bf_false, bf_true] <;> ring

theorem hx_lt (SS X : Nat) : hx SS X < 2 ^ 32 := by
  show Nat.land _ M32 < 2 ^ 32
  rw [m32_eq]; exact Nat.and_lt_two_pow _ (by omega)

/-! ## Counting -/

theorem pop11_eq (x : Nat) (hx : x < 2048) : pop11 x = cntB x 11 := by
  have := allLT_spec pop11_fact x hx; simpa using this

theorem cntB_congr (x y k : Nat) (h : ∀ i, i < k → x.testBit i = y.testBit i) : cntB x k = cntB y k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show cntB x k + (x.testBit k).toNat = cntB y k + (y.testBit k).toNat
    rw [ih (fun i hi => h i (by omega)), h k (by omega)]

theorem cntB_split (x a b : Nat) : cntB x (a + b) = cntB x a + cntB (x >>> a) b := by
  induction b with
  | zero => rfl
  | succ b ih =>
    show cntB x (a + b) + (x.testBit (a + b)).toNat = cntB x a + (cntB (x >>> a) b + ((x >>> a).testBit b).toNat)
    rw [ih, Nat.testBit_shiftRight]; omega

theorem pop32_eq (x : Nat) (hx : x < 2 ^ 32) : pop32 x = cntB x 32 := by
  show pop11 (x &&& 2047) + (pop11 ((x >>> 11) &&& 2047) + pop11 (x >>> 22)) = cntB x 32
  have h2047 : (2047 : Nat) = 2 ^ 11 - 1 := by norm_num
  have hlt : ∀ y, y &&& 2047 < 2048 := fun y => lt_of_le_of_lt Nat.and_le_right (by norm_num)
  have h22 : x >>> 22 < 2048 := by
    rw [Nat.shiftRight_eq_div_pow]; apply Nat.div_lt_of_lt_mul; norm_num at hx ⊢; omega
  rw [pop11_eq _ (hlt x), pop11_eq _ (hlt _), pop11_eq _ h22]
  have c1 : cntB (x &&& 2047) 11 = cntB x 11 := cntB_congr _ _ _ (fun i hi => by
    rw [Nat.testBit_and, h2047, Nat.testBit_two_pow_sub_one]; simp [hi])
  have c2 : cntB ((x >>> 11) &&& 2047) 11 = cntB (x >>> 11) 11 := cntB_congr _ _ _ (fun i hi => by
    rw [Nat.testBit_and, h2047, Nat.testBit_two_pow_sub_one]; simp [hi])
  have c3 : cntB (x >>> 22) 11 = cntB (x >>> 22) 10 := by
    show cntB (x >>> 22) 10 + ((x >>> 22).testBit 10).toNat = _
    rw [Nat.testBit_shiftRight, Nat.testBit_lt_two_pow (lt_of_lt_of_le hx (by norm_num))]; rfl
  have e : x >>> 11 >>> 11 = x >>> 22 := by rw [← Nat.shiftRight_add]
  rw [c1, c2, c3, show (32 : Nat) = 11 + (11 + 10) by norm_num, cntB_split, cntB_split, e]

theorem cntB_sum (x k : Nat) : cntB x k = ∑ i ∈ Finset.range k, (x.testBit i).toNat := by
  induction k with
  | zero => rfl
  | succ k ih => show cntB x k + _ = _; rw [ih, Finset.sum_range_succ]

theorem cntB_card (x k : Nat) : cntB x k = ((Finset.range k).filter (fun i => x.testBit i = true)).card := by
  rw [cntB_sum, Finset.card_filter]
  apply Finset.sum_congr rfl; intro i _; cases x.testBit i <;> rfl

end S5
