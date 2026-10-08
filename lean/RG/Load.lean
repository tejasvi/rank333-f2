module
public import R22Port.U_9909f085c8e6
public import RG.Job
public import E1N.Load
/-! # The per-IP data: `E1N.mkIPD` satisfies `IPRel`

* `toW_spec`: the word split (halving, then 64-bit steps) gives the 32-bit words of a chunk.
* `wbits_spec`: a field of at most 32 bits read from the words (`UInt64` arithmetic) is the field of the chunk.
* `mkIPD_rel`: `mkIPD 7 15 6 11 C.R C.N UB ch C.GP leaf` describes `C`, `slc ch`, `UB`, `UBR`, given the static per-IP facts
  and the leaf hook's contract. -/
@[expose] public section
namespace E1NRG
open E1N Finset E1GS

/-! ## Words of a chunk -/

theorem getD_append (a b : Array ℕ) (t : ℕ) : (a ++ b).getD t 0 = if t < a.size then a.getD t 0 else b.getD (t - a.size) 0 := by
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_append]
  split <;> rfl

theorem getD_push_lt (a : Array ℕ) (x t : ℕ) (ht : t < a.size) : (a.push x).getD t 0 = a.getD t 0 := by
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_push, if_neg (Nat.ne_of_lt ht)]

theorem getD_push_eq (a : Array ℕ) (x : ℕ) : (a.push x).getD a.size 0 = x := by
  simp [Array.getD_eq_getD_getElem?]

theorem toWSeq_spec : ∀ (k n : ℕ) (acc : Array ℕ), (E1N.toWSeq n k acc).size = acc.size + k ∧
    (∀ t < acc.size, (E1N.toWSeq n k acc).getD t 0 = acc.getD t 0) ∧
    ∀ t < k, (E1N.toWSeq n k acc).getD (acc.size + t) 0 = n / 2 ^ (32 * t) % 2 ^ 32
  | 0, n, acc => by simp [E1N.toWSeq]
  | 1, n, acc => by
    refine ⟨by simp [E1N.toWSeq], fun t ht => ?_, fun t ht => ?_⟩
    · exact getD_push_lt acc _ t ht
    · rw [show t = 0 by omega]; simp only [E1N.toWSeq, Nat.add_zero, getD_push_eq]; simp
  | k + 2, n, acc => by
    have hlo : (n.toUInt64 &&& 0xFFFFFFFF).toNat = n % 2 ^ 32 := by
      rw [UInt64.toNat_and, Nat.toUInt64_eq, UInt64.toNat_ofNat']
      rw [show (0xFFFFFFFF : UInt64).toNat = 2 ^ 32 - 1 from rfl, Nat.and_two_pow_sub_one_eq_mod,
        Nat.mod_mod_of_dvd _ (by norm_num)]
    have hhi : (n.toUInt64 >>> 32).toNat = n / 2 ^ 32 % 2 ^ 32 := by
      rw [UInt64.toNat_shiftRight, Nat.toUInt64_eq, UInt64.toNat_ofNat', show (32 : UInt64).toNat % 64 = 32 from rfl,
        Nat.shiftRight_eq_div_pow]
      rw [show (2 : ℕ) ^ 64 = 2 ^ 32 * 2 ^ 32 by norm_num, Nat.mod_mul_right_div_self]
    obtain ⟨h1, h2, h3⟩ := toWSeq_spec k (n >>> 64)
      ((acc.push (n.toUInt64 &&& 0xFFFFFFFF).toNat).push (n.toUInt64 >>> 32).toNat)
    simp only [Array.size_push] at h1 h2 h3
    have e : E1N.toWSeq n (k + 2) acc = E1N.toWSeq (n >>> 64) k
        ((acc.push (n.toUInt64 &&& 0xFFFFFFFF).toNat).push (n.toUInt64 >>> 32).toNat) := rfl
    rw [e]
    refine ⟨by rw [h1]; omega, fun t ht => ?_, fun t ht => ?_⟩
    · rw [h2 t (by omega), getD_push_lt _ _ t (by simp; omega), getD_push_lt _ _ t ht]
    · by_cases h0 : t = 0
      · subst h0
        rw [h2 _ (by omega), getD_push_lt _ _ _ (by simp), Nat.add_zero, getD_push_eq, hlo]; simp
      by_cases h1' : t = 1
      · subst h1'
        rw [h2 _ (by omega), show acc.size + 1 = (acc.push (n.toUInt64 &&& 0xFFFFFFFF).toNat).size by simp,
          getD_push_eq, hhi]
      · rw [show acc.size + t = acc.size + 1 + 1 + (t - 2) by omega, h3 (t - 2) (by omega), Nat.shiftRight_eq_div_pow,
          Nat.div_div_eq_div_mul, ← pow_add, show 64 + 32 * (t - 2) = 32 * t by omega]

theorem toWAcc_spec (n k : ℕ) (acc : Array ℕ) : (E1N.toWAcc n k acc).size = acc.size + k ∧
    (∀ t < acc.size, (E1N.toWAcc n k acc).getD t 0 = acc.getD t 0) ∧
    ∀ t < k, (E1N.toWAcc n k acc).getD (acc.size + t) 0 = n / 2 ^ (32 * t) % 2 ^ 32 := by
  induction k using Nat.strong_induction_on generalizing n acc with
  | _ k ih =>
    rw [E1N.toWAcc]
    split
    · exact toWSeq_spec k n acc
    · next hk =>
      dsimp only
      have hh1 : k / 2 < k := by omega
      have hh2 : k - k / 2 < k := by omega
      obtain ⟨a1, a2, a3⟩ := ih _ hh1 (n &&& ((1 <<< (32 * (k / 2))) - 1)) acc
      generalize hA : E1N.toWAcc (n &&& ((1 <<< (32 * (k / 2))) - 1)) (k / 2) acc = A at a1 a2 a3
      obtain ⟨b1, b2, b3⟩ := ih _ hh2 (n >>> (32 * (k / 2))) A
      refine ⟨by rw [b1, a1]; omega, fun t ht => ?_, fun t ht => ?_⟩
      · rw [b2 t (by omega), a2 t ht]
      · by_cases htl : t < k / 2
        · rw [b2 _ (by omega), a3 t htl, Nat.one_shiftLeft, Nat.and_two_pow_sub_one_eq_mod, mod_div_mod _ _ _ _ (by omega)]
        · rw [show acc.size + t = A.size + (t - k / 2) by omega, b3 _ (by omega), Nat.shiftRight_eq_div_pow,
            Nat.div_div_eq_div_mul, ← pow_add, show 32 * (k / 2) + 32 * (t - k / 2) = 32 * t by omega]

theorem toW_spec (n : ℕ) : ∀ k, (E1N.toW n k).size = k ∧ ∀ t < k, (E1N.toW n k).getD t 0 = n / 2 ^ (32 * t) % 2 ^ 32 := by
  intro k
  obtain ⟨h1, -, h3⟩ := toWAcc_spec n k (Array.mkEmpty k)
  have e0 : (Array.mkEmpty k : Array ℕ).size = 0 := rfl
  refine ⟨by unfold E1N.toW; rw [h1, e0]; omega, fun t ht => ?_⟩
  unfold E1N.toW
  have := h3 t ht
  rw [e0, Nat.zero_add] at this
  exact this

theorem toNat_u64 (W : ℕ) (h : W < 2 ^ 64) : W.toUInt64.toNat = W := by
  rw [UInt64.toNat_ofNat', Nat.mod_eq_of_lt h]

/-- the `UInt64` field read of `wbits` on two words -/
theorem wbits_val (W0 W1 b k : ℕ) (h0 : W0 < 2 ^ 32) (h1 : W1 < 2 ^ 32) (hb : b < 32) (hk : k ≤ 32) :
    (((W0.toUInt64 >>> b.toUInt64) ||| (W1.toUInt64 <<< (32 - b).toUInt64)) &&& (((1 : UInt64) <<< k.toUInt64) - 1)).toNat
      = (W0 + 2 ^ 32 * W1) / 2 ^ b % 2 ^ k := by
  have e0 := toNat_u64 W0 (by omega)
  have e1 := toNat_u64 W1 (by omega)
  have eb := toNat_u64 b (by omega)
  have eb' := toNat_u64 (32 - b) (by omega)
  have hb64 : b % 64 = b := Nat.mod_eq_of_lt (by omega)
  have hb64' : (32 - b) % 64 = 32 - b := Nat.mod_eq_of_lt (by omega)
  rw [UInt64.toNat_and, UInt64.toNat_or, UInt64.toNat_shiftRight, UInt64.toNat_shiftLeft, toNat_mask k (by omega),
    e0, e1, eb, eb', hb64, hb64', Nat.and_two_pow_sub_one_eq_mod]
  have hlt : W1 <<< (32 - b) < 2 ^ 64 := by
    rw [Nat.shiftLeft_eq]
    calc W1 * 2 ^ (32 - b) < 2 ^ 32 * 2 ^ (32 - b) := Nat.mul_lt_mul_of_pos_right h1 (by positivity)
      _ = 2 ^ (64 - b) := by rw [← pow_add]; congr 1; omega
      _ ≤ 2 ^ 64 := Nat.pow_le_pow_right (by norm_num) (by omega)
  rw [Nat.mod_eq_of_lt hlt]
  have hlo : W0 >>> b < 2 ^ (32 - b) := by
    rw [Nat.shiftRight_eq_div_pow, Nat.div_lt_iff_lt_mul (by positivity), ← pow_add]
    calc W0 < 2 ^ 32 := h0
      _ = 2 ^ (32 - b + b) := by congr 1; omega
  rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hlo, Nat.shiftLeft_eq, Nat.shiftRight_eq_div_pow]
  congr 1
  have e : W0 + 2 ^ 32 * W1 = W0 + 2 ^ b * (2 ^ (32 - b) * W1) := by
    rw [← mul_assoc, ← pow_add, show b + (32 - b) = 32 by omega]
  rw [e, Nat.add_mul_div_left _ _ (by positivity)]
  ring

/-- a field of `k ≤ 32` bits at bit `p` of a number given by its 32-bit words (`p + k` within them) -/
theorem wbits_spec (n K : ℕ) (p k : ℕ) (hk : k ≤ 32) (hpk : p + k ≤ 32 * K) :
    E1N.wbits (E1N.toW n K) p k = n / 2 ^ p % 2 ^ k := by
  obtain ⟨hs, hw⟩ := toW_spec n K
  unfold E1N.wbits
  have ha : p >>> 5 = p / 32 := by rw [Nat.shiftRight_eq_div_pow]
  have hb : p &&& 31 = p % 32 := by rw [show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  rw [ha, hb]
  have hget : ∀ t, (E1N.toW n K).getD t 0 < 2 ^ 32 := by
    intro t
    by_cases ht : t < K
    · rw [hw t ht]; exact Nat.mod_lt _ (by positivity)
    · simp [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none (by omega : (E1N.toW n K).size ≤ t)]
  rw [wbits_val _ _ _ k (hget _) (hget _) (Nat.mod_lt _ (by norm_num)) hk]
  by_cases hk0 : k = 0
  · subst hk0; rw [pow_zero, Nat.mod_one, Nat.mod_one]
  have haK : p / 32 < K := by omega
  have hp : p = 32 * (p / 32) + p % 32 := by omega
  rw [hw _ haK]
  conv_rhs => rw [hp, pow_add, ← Nat.div_div_eq_div_mul]
  generalize hM : n / 2 ^ (32 * (p / 32)) = M
  by_cases ha1 : p / 32 + 1 < K
  · rw [hw _ ha1, show 32 * (p / 32 + 1) = 32 * (p / 32) + 32 by ring, pow_add, ← Nat.div_div_eq_div_mul, hM]
    -- `M % 2^32 + 2^32 (M / 2^32 % 2^32) = M % 2^64`
    rw [show M % 2 ^ 32 + 2 ^ 32 * (M / 2 ^ 32 % 2 ^ 32) = M % 2 ^ (32 + 32) from (mod_split M 32 32).symm]
    rw [mod_div_mod M 64 (p % 32) k (by omega)]
  · -- the field lies in word `p / 32`; the next word does not reach it
    have hk' : p % 32 + k ≤ 32 := by omega
    have hW0 : (M % 2 ^ 32 + 2 ^ 32 * (E1N.toW n K).getD (p / 32 + 1) 0) % 2 ^ 32 = M % 2 ^ 32 := by
      rw [Nat.add_mul_mod_self_left, Nat.mod_mod]
    rw [← mod_div_mod _ 32 (p % 32) k hk', hW0, mod_div_mod M 32 (p % 32) k hk']

/-! ## The slot table -/

theorem chunkL_eq (ch : ℕ → ℕ) (c : ℕ) : E1G.chunkL ch c = ch c := by
  cases c <;> rfl

theorem slc_eq (ch : ℕ → ℕ) (i : ℕ) : E1G.slc ch i = ch (i / 64) / 2 ^ (264 * (i % 64)) % 2 ^ 264 := by
  show Nat.land (Nat.shiftRight (E1G.chunkL ch (Nat.shiftRight i 6)) (Nat.mul 264 (Nat.land i 63))) E1G.MSL = _
  rw [chunkL_eq, MSL_eq]
  show (ch (i >>> 6) >>> (264 * (i &&& 63))) &&& (2 ^ 264 - 1) = _
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, Nat.shiftRight_eq_div_pow,
    show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]

/-! ## Fields of `mkIPD` (symbolic parameters: no array of concrete size is ever unfolded) -/

theorem ofFn_getD {α : Type} (m : ℕ) (f : Fin m → α) (c : ℕ) (hc : c < m) (d : α) : (Array.ofFn f).getD c d = f ⟨c, hc⟩ := by
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_pos hc, Option.getD_some]

theorem ofFn_getD_ge {α : Type} (m : ℕ) (f : Fin m → α) (c : ℕ) (hc : ¬ c < m) (d : α) : (Array.ofFn f).getD c d = d := by
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_neg hc, Option.getD_none]

section fields
variable (lb sib satb gb R N UB : ℕ) (ch GP : ℕ → ℕ) (leaf : Array ℕ → ByteArray → ℕ → ℕ → Bool)

theorem mkIPD_sm_getD (t : ℕ) (ht : t < 2 ^ sib * ((2 ^ lb - 1 + 31) / 32)) :
    (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).sm.getD t 0 =
      E1N.wbits ((Array.ofFn (n := 2 ^ (sib - 6)) fun c => E1N.toW (ch c.1) (2 * (2 * (2 ^ lb - 1) + 10))).getD
        ((t / ((2 ^ lb - 1 + 31) / 32)) >>> 6) #[])
        ((2 * (2 ^ lb - 1) + 10) * ((t / ((2 ^ lb - 1 + 31) / 32)) &&& 63) + 32 * (t % ((2 ^ lb - 1 + 31) / 32)))
        (min 32 (2 ^ lb - 1 - 32 * (t % ((2 ^ lb - 1 + 31) / 32)))) := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_pos ht, Option.getD_some]

theorem mkIPD_sm_ge (t : ℕ) (ht : ¬ t < 2 ^ sib * ((2 ^ lb - 1 + 31) / 32)) :
    (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).sm.getD t 0 = 0 := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_neg ht, Option.getD_none]

theorem mkIPD_sc_getD (i : ℕ) (hi : i < 2 ^ sib) :
    (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).sc.getD i 0 =
      E1N.wbits ((Array.ofFn (n := 2 ^ (sib - 6)) fun c => E1N.toW (ch c.1) (2 * (2 * (2 ^ lb - 1) + 10))).getD
        (i >>> 6) #[]) ((2 * (2 ^ lb - 1) + 10) * (i &&& 63) + 2 * (2 ^ lb - 1)) 5 := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_pos hi, Option.getD_some]

theorem mkIPD_sc_ge (i : ℕ) (hi : ¬ i < 2 ^ sib) : (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).sc.getD i 0 = 0 := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_neg hi, Option.getD_none]

theorem mkIPD_gp_getD (t : ℕ) (ht : t < 2 ^ gb * (2 ^ lb - 1)) :
    (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).gp.getD t 0 =
      ((Array.ofFn (n := 2 ^ gb) fun g => GP g.1).getD (t / (2 ^ lb - 1)) 0 >>> (lb * (t % (2 ^ lb - 1)))) &&&
        ((1 <<< lb) - 1) := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_pos ht, Option.getD_some]

theorem mkIPD_ub_getD (x : ℕ) (hx : x < 2 ^ lb - 1) :
    (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).ub.getD x 0 = (UB >>> (2 ^ lb * x)) &&& ((1 <<< 2 ^ lb) - 1) := by
  unfold E1N.mkIPD; dsimp only
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, dif_pos hx, Option.getD_some]

theorem mkIPD_mw : (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).mw = (2 ^ lb - 1 + 31) / 32 := rfl
theorem mkIPD_ns : (E1N.mkIPD lb sib satb gb R N UB ch GP leaf).ns = 2 ^ sib := rfl

end fields

/-- `E1N.scap` by a propositional rewrite (an `unfold` here is a defeq change, and the kernel then unfolds
`Array.getD` of the concrete table first and evaluates the size of a `2 ^ 15`-entry `Array.ofFn`) -/
theorem scap_def (D : IPD) (i : ℕ) : E1N.scap D i = D.sc.getD i 0 := rfl

theorem sbit_def (D : IPD) (i x : ℕ) :
    E1N.sbit D i x = ((D.sm.getD (D.mw * i + (x >>> 5)) 0 >>> (x &&& 31)) &&& 1 == 1) := rfl

/-- the native IP data of `E1N.mkIPD` with E1P widths satisfy `IPRel` -/
theorem mkIPD_rel (C : E1G.Ctx) (UB UBR : ℕ) (ch : ℕ → ℕ) (leaf : Array ℕ → ByteArray → ℕ → ℕ → Bool)
    (hN : C.N ≤ 127) (hUB : UB = V (fun l => E1G.fld UB l)) (hUBR : UBR = VR (fun l => E1G.fld UB l))
    (hub : ∀ x < 127, E1G.fld UB x ≤ 2 ^ 32)
    (hleaf : ∀ labs B q e, leaf labs B q e = true → labs.size = C.R → (∀ t < labs.size, af labs t < 127) →
      E1G.leafOK C (pk 7 (af labs) labs.size) (win B q e) = true) :
    IPRel (E1N.mkIPD 7 15 6 11 C.R C.N UB ch C.GP leaf) C (E1G.slc ch) UB UBR := by
  have hmw : (2 ^ 7 - 1 + 31) / 32 = 4 := by norm_num
  have hnl : 2 ^ 7 - 1 = 127 := by norm_num
  have hsw : 2 * (2 * (2 ^ 7 - 1) + 10) = 528 := by norm_num
  have hsw' : 2 * (2 ^ 7 - 1) + 10 = 264 := by norm_num
  have hchW : ∀ c < 2 ^ 9, (Array.ofFn (n := 2 ^ (15 - 6)) fun c : Fin (2 ^ (15 - 6)) =>
      E1N.toW (ch c.1) (2 * (2 * (2 ^ 7 - 1) + 10))).getD c #[] = E1N.toW (ch c) 528 := by
    intro c hc; rw [ofFn_getD _ _ c hc, hsw]
  have hsl : ∀ i, E1G.slc ch i < 2 ^ 264 := fun i => by rw [slc_eq]; exact Nat.mod_lt _ (by positivity)
  refine ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, hN, hsl, ?_, ?_, ?_, ?_, ?_, ?_, hub, hUB, hUBR, hleaf⟩
  · intro i hi x hx
    rw [sbit_def]
    rw [bit_eq, mkIPD_mw, hmw]
    have hx5 : x >>> 5 = x / 32 := by rw [Nat.shiftRight_eq_div_pow]
    have hx31 : x &&& 31 = x % 32 := by rw [show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
    rw [hx5, hx31, mkIPD_sm_getD _ _ _ _ _ _ _ _ _ _ _ (by rw [hmw]; omega), hmw,
      show (4 * i + x / 32) / 4 = i by omega, show (4 * i + x / 32) % 4 = x / 32 by omega,
      show i >>> 6 = i / 64 by rw [Nat.shiftRight_eq_div_pow],
      show i &&& 63 = i % 64 by rw [show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod],
      hchW _ (by omega), hsw', hnl, wbits_spec _ 528 _ _ (by omega) (by omega)]
    rw [Nat.testBit_mod_two_pow, decide_eq_true (by omega), Bool.true_and, Nat.testBit_div_two_pow, smask,
      Nat.testBit_mod_two_pow, decide_eq_true hx, Bool.true_and, slc_eq, Nat.testBit_mod_two_pow,
      decide_eq_true (by omega), Bool.true_and, Nat.testBit_div_two_pow]
    congr 1; omega
  · intro x
    rw [sbit_def]
    rw [mkIPD_mw, mkIPD_ns, hmw, mkIPD_sm_ge _ _ _ _ _ _ _ _ _ _ _ (by rw [hmw]; omega)]
    simp
  · intro i hi
    rw [scap_def]
    rw [mkIPD_sc_getD _ _ _ _ _ _ _ _ _ _ _ hi,
      show i >>> 6 = i / 64 by rw [Nat.shiftRight_eq_div_pow],
      show i &&& 63 = i % 64 by rw [show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod],
      hchW _ (by omega), hsw', hnl, wbits_spec _ 528 _ _ (by omega) (by omega), E1GS.scap, slc_eq,
      show (32 : ℕ) = 2 ^ 5 by norm_num, mod_div_mod _ 264 254 5 (by omega), Nat.div_div_eq_div_mul, ← pow_add]
  · rw [scap_def, mkIPD_ns, mkIPD_sc_ge _ _ _ _ _ _ _ _ _ _ _ (by omega)]
  · intro g hg x hx
    rw [mkIPD_gp_getD _ _ _ _ _ _ _ _ _ _ _ (by norm_num; omega), hnl,
      show (127 * g + x) / 127 = g by omega, show (127 * g + x) % 127 = x by omega, ofFn_getD _ _ g (by norm_num; omega)]
    dsimp only
    rw [gpf, Nat.shiftRight_eq_div_pow, Nat.one_shiftLeft, Nat.and_two_pow_sub_one_eq_mod]
  · intro x hx
    rw [af, mkIPD_ub_getD _ _ _ _ _ _ _ _ _ _ _ (by norm_num; omega)]
    show (UB >>> (2 ^ 7 * x)) &&& ((1 <<< 2 ^ 7) - 1) = (UB >>> (128 * x)) &&& E1G.FM
    rw [FM_eq, Nat.one_shiftLeft]; norm_num

end E1NRG
