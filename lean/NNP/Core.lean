module
public import R22Port.U_5494dbbdd51c
public import NN.Core
public import L5.Pk5
/-! # NNP.Core: the views of `NN.Core` (limb arrays, byte arrays, counters) as Nats, bit by bit

* `natL_testBit`: bit `i` of the Nat of limbs `[off, off+len)` is bit `i % 64` of limb `off + i / 64` (and 0 above `64 len`);
* `popL_eq`: the limb popcount is `L5.pcnt` of the view;
* `bitL_eq`, `fieldL_eq`: single bits and fields of a view;
* `fld_natU`: a 7-bit field of the packed counters is the stored byte (all bytes below 128). -/
@[expose] public section
namespace NNP
open NN

theorem natL_zero (a : Array UInt64) (off : Nat) : natL a off 0 = 0 := rfl
theorem natL_succ (a : Array UInt64) (off n : Nat) : natL a off (n + 1) = a[off]!.toNat + 2 ^ 64 * natL a (off + 1) n := rfl

theorem natL_testBit (a : Array UInt64) : ∀ (len off i : Nat),
    (natL a off len).testBit i = (decide (i < 64 * len) && a[off + i / 64]!.toNat.testBit (i % 64))
  | 0, off, i => by simp [natL]
  | len + 1, off, i => by
    rw [natL_succ, Nat.add_comm, Nat.testBit_two_pow_mul_add _ (UInt64.toNat_lt _)]
    by_cases hi : i < 64
    · rw [if_pos hi, Nat.div_eq_of_lt hi, Nat.mod_eq_of_lt hi, decide_eq_true (by omega)]
      simp
    · rw [if_neg hi, natL_testBit a len (off + 1) (i - 64)]
      have h1 : off + 1 + (i - 64) / 64 = off + i / 64 := by omega
      have h2 : (i - 64) % 64 = i % 64 := by omega
      rw [h1, h2]
      congr 1
      exact decide_eq_decide.mpr (by omega)

theorem natL_lt (a : Array UInt64) : ∀ (len off : Nat), natL a off len < 2 ^ (64 * len)
  | 0, off => by simp [natL]
  | len + 1, off => by
    rw [natL_succ]
    have h1 := UInt64.toNat_lt a[off]!
    have h2 := natL_lt a len (off + 1)
    calc a[off]!.toNat + 2 ^ 64 * natL a (off + 1) len < 2 ^ 64 + 2 ^ 64 * natL a (off + 1) len := by omega
      _ = 2 ^ 64 * (natL a (off + 1) len + 1) := by ring
      _ ≤ 2 ^ 64 * 2 ^ (64 * len) := Nat.mul_le_mul_left _ h2
      _ = 2 ^ (64 * (len + 1)) := by rw [← pow_add]; ring_nf

theorem natL_congr (a b : Array UInt64) : ∀ (len offa offb : Nat), (∀ k < len, a[offa + k]! = b[offb + k]!) →
    natL a offa len = natL b offb len
  | 0, _, _, _ => rfl
  | len + 1, offa, offb, h => by
    rw [natL_succ, natL_succ, natL_congr a b len (offa + 1) (offb + 1) (fun k hk => by
      have := h (k + 1) (by omega); rwa [show offa + (k + 1) = offa + 1 + k by omega,
        show offb + (k + 1) = offb + 1 + k by omega] at this)]
    have := h 0 (by omega); simp only [Nat.add_zero] at this; rw [this]

/-- the low word of a view -/
theorem natL_mod (a : Array UInt64) (len off : Nat) : natL a off (len + 1) % 2 ^ 64 = a[off]!.toNat := by
  rw [natL_succ, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (UInt64.toNat_lt _)]

theorem natL_shr (a : Array UInt64) (len off : Nat) : natL a off (len + 1) >>> 64 = natL a (off + 1) len := by
  rw [natL_succ, Nat.shiftRight_eq_div_pow, Nat.add_mul_div_left _ _ (by positivity),
    Nat.div_eq_of_lt (UInt64.toNat_lt _), Nat.zero_add]

/-- splitting a view -/
theorem natL_add (a : Array UInt64) : ∀ (m n off : Nat), natL a off (m + n) = natL a off m + 2 ^ (64 * m) * natL a (off + m) n
  | 0, n, off => by simp [natL]
  | m + 1, n, off => by
    rw [show m + 1 + n = (m + n) + 1 by omega, natL_succ, natL_add a m n (off + 1), natL_succ,
      show off + 1 + m = off + (m + 1) by omega, pow_succ]
    ring_nf

/-! ## Popcounts -/

theorem popTab_spec : ∀ v < 256, (popTab.get! v).toNat = L5.pcnt 8 v := by decide +kernel

theorem byte_toNat (x : UInt64) (k : Nat) (hk : k < 64) : ((x >>> k.toUInt64) &&& 255).toNat = (x.toNat >>> k) % 256 := by
  rw [UInt64.toNat_and, UInt64.toNat_shiftRight]
  have e1 : (k.toUInt64).toNat % 64 = k := by
    rw [Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_eq_of_lt (show k < 2 ^ 64 by omega), Nat.mod_eq_of_lt hk]
  rw [e1, show ((255 : UInt64)).toNat = 2 ^ 8 - 1 from rfl, Nat.and_two_pow_sub_one_eq_mod]

theorem pcnt_byte (x k : Nat) : L5.pcnt 8 ((x >>> k) % 256) = L5.pcnt 8 (x >>> k) := by
  rw [show (256 : Nat) = 2 ^ 8 by norm_num, L5.pcnt_mod]

theorem pop64_eq (x : UInt64) : pop64 x = L5.pcnt 64 x.toNat := by
  unfold pop64
  by_cases hx : x == 0
  · rw [if_pos hx]
    have : x = 0 := by simpa using hx
    subst this; simp [L5.pcnt_zero_x]
  rw [if_neg hx]
  have hb : ∀ k : Nat, k < 64 → (popTab.get! ((x >>> k.toUInt64) &&& 255).toNat).toNat = L5.pcnt 8 (x.toNat >>> k) := by
    intro k hk
    rw [popTab_spec _ (by rw [byte_toNat x k hk]; exact Nat.mod_lt _ (by norm_num)), byte_toNat x k hk, pcnt_byte]
  have h0 : (popTab.get! (x &&& 255).toNat).toNat = L5.pcnt 8 x.toNat := by
    have := hb 0 (by norm_num)
    rw [show (x >>> (0 : Nat).toUInt64) = x from by simp] at this
    rw [this, Nat.shiftRight_zero]
  rw [h0, show ((8 : UInt64)) = (8 : Nat).toUInt64 from rfl, hb 8 (by norm_num),
    show ((16 : UInt64)) = (16 : Nat).toUInt64 from rfl, hb 16 (by norm_num),
    show ((24 : UInt64)) = (24 : Nat).toUInt64 from rfl, hb 24 (by norm_num),
    show ((32 : UInt64)) = (32 : Nat).toUInt64 from rfl, hb 32 (by norm_num),
    show ((40 : UInt64)) = (40 : Nat).toUInt64 from rfl, hb 40 (by norm_num),
    show ((48 : UInt64)) = (48 : Nat).toUInt64 from rfl, hb 48 (by norm_num),
    show ((56 : UInt64)) = (56 : Nat).toUInt64 from rfl, hb 56 (by norm_num)]
  set y := x.toNat
  have a1 := L5.pcnt_add 8 56 y
  have a2 := L5.pcnt_add 8 48 (y >>> 8)
  have a3 := L5.pcnt_add 8 40 (y >>> 16)
  have a4 := L5.pcnt_add 8 32 (y >>> 24)
  have a5 := L5.pcnt_add 8 24 (y >>> 32)
  have a6 := L5.pcnt_add 8 16 (y >>> 40)
  have a7 := L5.pcnt_add 8 8 (y >>> 48)
  simp only [← Nat.shiftRight_add] at a2 a3 a4 a5 a6 a7
  norm_num at a1 a2 a3 a4 a5 a6 a7
  omega

theorem popL_eq (a : Array UInt64) : ∀ (n off : Nat), popL a off n = L5.pcnt (64 * n) (natL a off n)
  | 0, off => rfl
  | n + 1, off => by
    rw [popL, popL_eq a n (off + 1), pop64_eq, show 64 * (n + 1) = 64 + 64 * n by ring, L5.pcnt_add, natL_shr]
    congr 1
    apply L5.pcnt_congr; intro j hj
    rw [natL_testBit, Nat.div_eq_of_lt hj, Nat.mod_eq_of_lt hj, decide_eq_true (by omega), Nat.add_zero,
      Array.getElem!_eq_getD]
    rfl

/-! ## Bits and fields -/

/-! ## Counters -/

theorem natU7_lt (U : ByteArray) (hU : ∀ j, j < 512 → (U.get! j).toNat < 128) : ∀ n, n ≤ 512 → natU7 U n < 2 ^ (7 * n)
  | 0, _ => by simp [natU7]
  | n + 1, hn => by
    rw [natU7]
    have h1 := natU7_lt U hU n (by omega)
    have h2 := hU n (by omega)
    calc natU7 U n + (U.get! n).toNat * 2 ^ (7 * n) < 2 ^ (7 * n) + (U.get! n).toNat * 2 ^ (7 * n) := by omega
      _ = ((U.get! n).toNat + 1) * 2 ^ (7 * n) := by ring
      _ ≤ 128 * 2 ^ (7 * n) := Nat.mul_le_mul_right _ (by omega)
      _ = 2 ^ (7 * (n + 1)) := by rw [show (128 : Nat) = 2 ^ 7 by norm_num, ← pow_add]; ring_nf

/-- field `X` of the packed counters -/
theorem fld_natU7 (U : ByteArray) (hU : ∀ j, j < 512 → (U.get! j).toNat < 128) :
    ∀ n, n ≤ 512 → ∀ X, X < n → (natU7 U n >>> (7 * X)) % 128 = (U.get! X).toNat
  | 0, _, X, hX => absurd hX (by omega)
  | n + 1, hn, X, hX => by
    rw [natU7]
    rcases Nat.lt_or_ge X n with hXn | hXn
    · -- the new field lies above field X
      have hlt := natU7_lt U hU n (by omega)
      have e : (natU7 U n + (U.get! n).toNat * 2 ^ (7 * n)) >>> (7 * X) % 128 = (natU7 U n >>> (7 * X)) % 128 := by
        rw [Nat.shiftRight_eq_div_pow, Nat.shiftRight_eq_div_pow]
        have hsplit : 2 ^ (7 * n) = 2 ^ (7 * X) * 2 ^ (7 * (n - X)) := by rw [← pow_add]; congr 1; omega
        rw [hsplit, show (U.get! n).toNat * (2 ^ (7 * X) * 2 ^ (7 * (n - X))) =
          2 ^ (7 * X) * ((U.get! n).toNat * 2 ^ (7 * (n - X))) by ring, Nat.add_mul_div_left _ _ (by positivity)]
        have h128 : 128 ∣ (U.get! n).toNat * 2 ^ (7 * (n - X)) := by
          apply Dvd.dvd.mul_left
          rw [show (128 : Nat) = 2 ^ 7 by norm_num]; exact Nat.pow_dvd_pow 2 (by omega)
        obtain ⟨c, hc⟩ := h128
        rw [hc, Nat.add_mul_mod_self_left]
      rw [e]; exact fld_natU7 U hU n (by omega) X hXn
    · have hX' : X = n := by omega
      subst hX'
      have hlt := natU7_lt U hU X (by omega)
      rw [Nat.shiftRight_eq_div_pow, Nat.add_mul_div_right _ _ (Nat.two_pow_pos _), Nat.div_eq_of_lt hlt,
        Nat.zero_add, Nat.mod_eq_of_lt (hU X (by omega))]

/-! ## Limbs given by a function -/

/-- the Nat of the limbs `f 0, …, f (n-1)` -/
def natF (f : Nat → UInt64) : Nat → Nat
  | 0 => 0
  | n + 1 => natF f n + (f n).toNat * 2 ^ (64 * n)

theorem natF_lt (f : Nat → UInt64) : ∀ n, natF f n < 2 ^ (64 * n)
  | 0 => by simp [natF]
  | n + 1 => by
    rw [natF]
    have h1 := natF_lt f n
    have h2 := UInt64.toNat_lt (f n)
    calc natF f n + (f n).toNat * 2 ^ (64 * n) < 2 ^ (64 * n) + (f n).toNat * 2 ^ (64 * n) := by omega
      _ = ((f n).toNat + 1) * 2 ^ (64 * n) := by ring
      _ ≤ 2 ^ 64 * 2 ^ (64 * n) := Nat.mul_le_mul_right _ (by omega)
      _ = 2 ^ (64 * (n + 1)) := by rw [← pow_add]; ring_nf

theorem natF_testBit (f : Nat → UInt64) : ∀ (n i : Nat),
    (natF f n).testBit i = (decide (i < 64 * n) && (f (i / 64)).toNat.testBit (i % 64))
  | 0, i => by simp [natF]
  | n + 1, i => by
    have e : natF f (n + 1) = 2 ^ (64 * n) * (f n).toNat + natF f n := by rw [natF]; ring
    rw [e, Nat.testBit_two_pow_mul_add _ (natF_lt f n)]
    by_cases hi : i < 64 * n
    · rw [if_pos hi, natF_testBit f n i, decide_eq_true hi, decide_eq_true (by omega)]
    · rw [if_neg hi]
      by_cases hi2 : i < 64 * (n + 1)
      · rw [decide_eq_true hi2, Bool.true_and]
        have h1 : i / 64 = n := by omega
        have h2 : i % 64 = i - 64 * n := by omega
        rw [h1, h2]
      · rw [decide_eq_false hi2, Bool.false_and]
        exact Nat.testBit_lt_two_pow (lt_of_lt_of_le (UInt64.toNat_lt _) (Nat.pow_le_pow_right (by norm_num) (by omega)))

theorem natF_congr (f g : Nat → UInt64) (n : Nat) (h : ∀ k < n, f k = g k) : natF f n = natF g n := by
  induction n with
  | zero => rfl
  | succ n ih => rw [natF, natF, ih (fun k hk => h k (by omega)), h n (by omega)]

theorem natF_zero (n : Nat) : natF (fun _ => 0) n = 0 := by
  induction n with
  | zero => rfl
  | succ n ih => rw [natF, ih]; simp

theorem getElem!_eq_getD' (a : Array UInt64) (i : Nat) : a[i]! = a.getD i 0 := Array.getElem!_eq_getD

theorem natL_eq_natF (a : Array UInt64) (off : Nat) : ∀ n, natL a off n = natF (fun k => a.getD (off + k) 0) n := by
  intro n
  apply Nat.eq_of_testBit_eq; intro i
  rw [natL_testBit, natF_testBit, getElem!_eq_getD', Nat.add_comm off]

theorem getD_lt {α : Type} (a : Array α) (i : Nat) (d : α) (h : i < a.size) : a.getD i d = a[i] := by
  simp [Array.getD_eq_getD_getElem?, h]

theorem getD_ge {α : Type} (a : Array α) (i : Nat) (d : α) (h : a.size ≤ i) : a.getD i d = d := by
  simp [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none h]

theorem getD_range_map {α : Type} (n : Nat) (g : Nat → α) (k : Nat) (d : α) :
    ((Array.range n).map g).getD k d = if k < n then g k else d := by
  split
  · rename_i hk; rw [getD_lt _ _ _ (by simpa using hk)]; simp
  · rename_i hk; rw [getD_ge _ _ _ (by simp; omega)]

theorem natL_range_map (n : Nat) (g : Nat → UInt64) : natL ((Array.range n).map g) 0 n = natF g n := by
  rw [natL_eq_natF]; apply natF_congr; intro k hk; rw [getD_range_map, if_pos (by omega), Nat.zero_add]

theorem size_range_map {α : Type} (n : Nat) (g : Nat → α) : ((Array.range n).map g).size = n := by simp

/-! ## Word bits -/

theorem tb_and (a b : UInt64) (j : Nat) : (a &&& b).toNat.testBit j = (a.toNat.testBit j && b.toNat.testBit j) := by
  rw [UInt64.toNat_and, Nat.testBit_and]

theorem tb_or (a b : UInt64) (j : Nat) : (a ||| b).toNat.testBit j = (a.toNat.testBit j || b.toNat.testBit j) := by
  rw [UInt64.toNat_or, Nat.testBit_or]

theorem tb_not (a : UInt64) (j : Nat) : (~~~a).toNat.testBit j = (decide (j < 64) && !a.toNat.testBit j) := by
  rw [UInt64.toNat_not, show UInt64.size - 1 - a.toNat = 2 ^ 64 - (a.toNat + 1) by
    have := UInt64.toNat_lt a; simp only [UInt64.size]; omega]
  exact Nat.testBit_two_pow_sub_succ (UInt64.toNat_lt a) j

theorem tb_lt64 (a : UInt64) (j : Nat) (hj : 64 ≤ j) : a.toNat.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le (UInt64.toNat_lt _) (Nat.pow_le_pow_right (by norm_num) hj))

theorem tb_zero (j : Nat) : (0 : UInt64).toNat.testBit j = false := by simp

theorem toNat_toUInt64_mod64 (s : Nat) (hs : s < 64) : (s.toUInt64).toNat % 64 = s := by
  rw [Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_eq_of_lt (show s < 2 ^ 64 by omega), Nat.mod_eq_of_lt hs]

theorem tb_shl_ones (s j : Nat) (hs : s < 64) :
    ((0xFFFFFFFFFFFFFFFF : UInt64) <<< s.toUInt64).toNat.testBit j = (decide (s ≤ j ∧ j < 64)) := by
  rw [UInt64.toNat_shiftLeft, toNat_toUInt64_mod64 s hs, Nat.testBit_mod_two_pow, Nat.testBit_shiftLeft,
    show ((0xFFFFFFFFFFFFFFFF : UInt64)).toNat = 2 ^ 64 - 1 from rfl, Nat.testBit_two_pow_sub_one]
  by_cases h1 : j < 64 <;> by_cases h2 : s ≤ j <;> simp [h1, h2] <;> omega

theorem tb_one_shl (s j : Nat) (hs : s < 64) : ((1 : UInt64) <<< s.toUInt64).toNat.testBit j = decide (j = s) := by
  rw [UInt64.toNat_shiftLeft, toNat_toUInt64_mod64 s hs, show ((1 : UInt64)).toNat = 1 from rfl, Nat.one_shiftLeft,
    Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by norm_num) hs), Nat.testBit_two_pow]
  exact decide_eq_decide.mpr ⟨Eq.symm, Eq.symm⟩

/-- the bit test of the checker: `(x >>> s) &&& 1 == 1` -/
theorem bitTest (x : UInt64) (s : Nat) (hs : s < 64) : ((x >>> s.toUInt64) &&& 1 == 1) = x.toNat.testBit s := by
  have e : ((x >>> s.toUInt64) &&& 1).toNat = (x.toNat >>> s) % 2 := by
    rw [UInt64.toNat_and, UInt64.toNat_shiftRight, toNat_toUInt64_mod64 s hs, show ((1 : UInt64)).toNat = 1 from rfl,
      Nat.and_one_is_mod]
  rw [Nat.testBit, Nat.one_and_eq_mod_two]
  cases h : (x.toNat >>> s) % 2 == 1
  · simp only [beq_eq_false_iff_ne, ne_eq] at h
    rw [show ((x >>> s.toUInt64) &&& 1 == 1) = false from by
      simp only [beq_eq_false_iff_ne, ne_eq]; intro he; apply h; rw [← e, he]; rfl]
    simp [h]
  · simp only [beq_iff_eq] at h
    rw [show ((x >>> s.toUInt64) &&& 1 == 1) = true from by
      simp only [beq_iff_eq]; apply UInt64.toNat.inj; rw [e, h]; rfl]
    simp [h]

theorem bitL_eq (a : Array UInt64) (off i len : Nat) (hi : i < 64 * len) : bitL a off i = (natL a off len).testBit i := by
  rw [natL_testBit, decide_eq_true hi, Bool.true_and, Array.getElem!_eq_getD]
  unfold bitL
  exact bitTest _ _ (Nat.mod_lt _ (by norm_num))

/-- a field of at most 64 bits of the limbs of `a` (from limb 0): the view of all limbs, shifted and masked -/
theorem fieldL_eq (a : Array UInt64) (s w : Nat) (hw : w ≤ 64) :
    fieldL a 0 s w = (natL a 0 a.size >>> s) % 2 ^ w := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, natL_testBit]
  unfold fieldL
  simp only [Nat.zero_add]
  set q := s / 64 with hq
  set r := s % 64 with hr
  have hr64 : r < 64 := Nat.mod_lt _ (by norm_num)
  have hs : s = 64 * q + r := by omega
  -- the mask
  have hmsk : ∀ j', ((if w ≥ 64 then (0xFFFFFFFFFFFFFFFF : UInt64) else ((1 : UInt64) <<< w.toUInt64) - 1)).toNat.testBit j' =
      decide (j' < w) := by
    intro j'
    split
    · rename_i hw64
      rw [show ((0xFFFFFFFFFFFFFFFF : UInt64)).toNat = 2 ^ 64 - 1 from rfl, Nat.testBit_two_pow_sub_one]
      congr 1; apply propext; omega
    · rename_i hw64
      have e : (((1 : UInt64) <<< w.toUInt64) - 1).toNat = 2 ^ w - 1 := by
        rw [UInt64.toNat_sub, UInt64.toNat_shiftLeft, toNat_toUInt64_mod64 w (by omega),
          show ((1 : UInt64)).toNat = 1 from rfl, Nat.one_shiftLeft,
          Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by norm_num) (by omega : w < 64))]
        have : 1 ≤ 2 ^ w := Nat.one_le_two_pow
        have : 2 ^ w < 2 ^ 64 := Nat.pow_lt_pow_right (by norm_num) (by omega)
        rw [show 2 ^ 64 - 1 + 2 ^ w = (2 ^ w - 1) + 2 ^ 64 by omega, Nat.add_mod_right, Nat.mod_eq_of_lt (by omega)]
      rw [e, Nat.testBit_two_pow_sub_one]
  rw [tb_and, hmsk, tb_or]
  by_cases hjw : j < w
  · simp only [decide_eq_true hjw, Bool.and_true, Bool.true_and]
    have hj64 : j < 64 := by omega
    -- low part
    have hlo : (a.getD q 0 >>> r.toUInt64).toNat.testBit j = (a.getD q 0).toNat.testBit (r + j) := by
      rw [UInt64.toNat_shiftRight, toNat_toUInt64_mod64 r hr64, Nat.testBit_shiftRight]
    rw [hlo, Array.getElem!_eq_getD]
    by_cases hr0 : r = 0
    · rw [if_pos hr0, tb_zero, Bool.or_false]
      have h1 : (s + j) / 64 = q := by omega
      have h2 : (s + j) % 64 = r + j := by omega
      rw [h1, h2]
      by_cases hin : s + j < 64 * a.size
      · rw [decide_eq_true hin, Bool.true_and]; rfl
      · rw [decide_eq_false hin, Bool.false_and, getD_ge _ _ _ (by omega), tb_zero]
    · rw [if_neg hr0]
      have hhi : (a.getD (q + 1) 0 <<< (64 - r).toUInt64).toNat.testBit j =
          (decide (64 - r ≤ j) && (a.getD (q + 1) 0).toNat.testBit (j - (64 - r))) := by
        rw [UInt64.toNat_shiftLeft, toNat_toUInt64_mod64 (64 - r) (by omega), Nat.testBit_mod_two_pow,
          Nat.testBit_shiftLeft]
        simp [hj64]
      rw [hhi]
      by_cases hrj : r + j < 64
      · rw [decide_eq_false (show ¬ (64 - r ≤ j) by omega), Bool.false_and, Bool.or_false]
        have h1 : (s + j) / 64 = q := by omega
        have h2 : (s + j) % 64 = r + j := by omega
        rw [h1, h2]
        by_cases hin : s + j < 64 * a.size
        · rw [decide_eq_true hin, Bool.true_and]; rfl
        · rw [decide_eq_false hin, Bool.false_and, getD_ge _ _ _ (by omega), tb_zero]
      · rw [tb_lt64 _ _ (by omega), Bool.false_or, decide_eq_true (show 64 - r ≤ j by omega), Bool.true_and]
        have h1 : (s + j) / 64 = q + 1 := by omega
        have h2 : (s + j) % 64 = j - (64 - r) := by omega
        rw [h1, h2]
        by_cases hin : s + j < 64 * a.size
        · rw [decide_eq_true hin, Bool.true_and]; rfl
        · rw [decide_eq_false hin, Bool.false_and, getD_ge _ _ _ (by omega), tb_zero]
  · simp only [decide_eq_false hjw, Bool.and_false, Bool.false_and]

/-! ## Loops -/

theorem allN_go (f : Nat → Bool) (n : Nat) : ∀ k i, n - i = k →
    (allN.go f n i = true ↔ ∀ j, i ≤ j → j < n → f j = true) := by
  intro k
  induction k with
  | zero =>
    intro i hk
    rw [allN.go, if_neg (by omega)]
    exact ⟨fun _ j hj1 hj2 => absurd hj2 (by omega), fun _ => rfl⟩
  | succ k ih =>
    intro i hk
    rw [allN.go, if_pos (by omega)]
    by_cases hf : f i = true
    · rw [if_pos hf, ih (i + 1) (by omega)]
      constructor
      · intro h j hj1 hj2
        rcases Nat.eq_or_lt_of_le hj1 with rfl | hlt
        · exact hf
        · exact h j (by omega) hj2
      · intro h j hj1 hj2; exact h j (by omega) hj2
    · rw [if_neg hf]
      constructor
      · intro h; exact absurd h (by decide)
      · intro h; exact absurd (h i le_rfl (by omega)) hf

theorem allN_iff (f : Nat → Bool) (n : Nat) : allN f n = true ↔ ∀ j < n, f j = true := by
  unfold allN; rw [allN_go f n n 0 (by omega)]
  exact ⟨fun h j hj => h j (by omega) hj, fun h j _ hj => h j hj⟩

theorem orN_go (f : Nat → UInt64) (n b : Nat) : ∀ k i acc, n - i = k →
    ((orN.go f n i acc).toNat.testBit b = true ↔
      acc.toNat.testBit b = true ∨ ∃ j, i ≤ j ∧ j < n ∧ (f j).toNat.testBit b = true) := by
  intro k
  induction k with
  | zero =>
    intro i acc hk
    rw [orN.go, if_neg (by omega)]
    exact ⟨fun h => Or.inl h, fun h => h.elim id (fun ⟨j, hj1, hj2, _⟩ => absurd hj2 (by omega))⟩
  | succ k ih =>
    intro i acc hk
    rw [orN.go, if_pos (by omega), ih (i + 1) _ (by omega), tb_or, Bool.or_eq_true]
    constructor
    · rintro ((h | h) | ⟨j, hj1, hj2, hj⟩)
      · exact Or.inl h
      · exact Or.inr ⟨i, le_rfl, by omega, h⟩
      · exact Or.inr ⟨j, by omega, hj2, hj⟩
    · rintro (h | ⟨j, hj1, hj2, hj⟩)
      · exact Or.inl (Or.inl h)
      · rcases Nat.eq_or_lt_of_le hj1 with rfl | hlt
        · exact Or.inl (Or.inr hj)
        · exact Or.inr ⟨j, by omega, hj2, hj⟩

theorem orN_testBit (f : Nat → UInt64) (n b : Nat) :
    (orN f n).toNat.testBit b = true ↔ ∃ j < n, (f j).toNat.testBit b = true := by
  unfold orN; rw [orN_go f n b n 0 0 (by omega)]
  simp only [tb_zero, Bool.false_eq_true, false_or]
  exact ⟨fun ⟨j, _, hj2, hj⟩ => ⟨j, hj2, hj⟩, fun ⟨j, hj2, hj⟩ => ⟨j, by omega, hj2, hj⟩⟩

theorem sumN_go (f : Nat → Nat) (n : Nat) : ∀ k i acc, n - i = k →
    sumN.go f n i acc = acc + ∑ j ∈ Finset.Ico i n, f j := by
  intro k
  induction k with
  | zero =>
    intro i acc hk
    rw [sumN.go, if_neg (by omega), Finset.Ico_eq_empty (by omega), Finset.sum_empty, Nat.add_zero]
  | succ k ih =>
    intro i acc hk
    rw [sumN.go, if_pos (by omega), ih (i + 1) _ (by omega), Finset.sum_eq_sum_Ico_succ_bot (a := i) (b := n) (by omega)]
    ring

theorem sumN_eq (f : Nat → Nat) (n : Nat) : sumN f n = ∑ j ∈ Finset.range n, f j := by
  unfold sumN; rw [sumN_go f n n 0 0 (by omega), Nat.zero_add, Finset.range_eq_Ico]

theorem sumFrom_go (f : Nat → Nat) (n : Nat) : ∀ k i acc, n - i = k →
    sumFrom.go f n i acc = acc + ∑ j ∈ Finset.Ico i n, f j := by
  intro k
  induction k with
  | zero =>
    intro i acc hk
    rw [sumFrom.go, if_neg (by omega), Finset.Ico_eq_empty (by omega), Finset.sum_empty, Nat.add_zero]
  | succ k ih =>
    intro i acc hk
    rw [sumFrom.go, if_pos (by omega), ih (i + 1) _ (by omega), Finset.sum_eq_sum_Ico_succ_bot (a := i) (b := n) (by omega)]
    ring

theorem sumFrom_eq (f : Nat → Nat) (a n : Nat) : sumFrom f a n = ∑ j ∈ Finset.Ico a n, f j := by
  unfold sumFrom; rw [sumFrom_go f n (n - a) a 0 rfl, Nat.zero_add]

/-- the popcount of function limbs -/
theorem sum_pop_eq (f : Nat → UInt64) : ∀ n, ∑ k ∈ Finset.range n, pop64 (f k) = L5.pcnt (64 * n) (natF f n)
  | 0 => by simp [natF, L5.pcnt]
  | n + 1 => by
    rw [Finset.sum_range_succ, sum_pop_eq f n, pop64_eq, show 64 * (n + 1) = 64 * n + 64 by ring, L5.pcnt_add]
    congr 1
    · apply L5.pcnt_congr; intro j hj
      rw [natF_testBit, natF_testBit, decide_eq_true hj, decide_eq_true (by omega)]
    · apply L5.pcnt_congr; intro j hj
      rw [Nat.testBit_shiftRight, natF_testBit, decide_eq_true (by omega), Bool.true_and,
        show (64 * n + j) / 64 = n by omega, show (64 * n + j) % 64 = j by omega]

end NNP
