module
public import R22Port.U_d41d8cd98f00
public import GS.Bits
public import G.Base
public import G.Slice
/-! # L0, part 2: field access, list = mask tests, bit-sliced parity (`G/Base.lean`, `G/Slice.lean`)

* `get32_eq` (`get32 P k = fld P k`), `win_eq`, `testBit_win`, `bit_eq`;
* `listChk1_spec` / `listChk32_spec`: an accepted list enumerates the set bits of the mask (bits `k`, resp. `32k`),
  without repetition, and the mask has no other bits;
* `sx_spec`: bit `k` of `sx S y` is the parity of `x_k &&& y` (29 bits) when slice `i` holds bit `i` of every `x_k`. -/
@[expose] public section
namespace GS
open G Finset

theorem M32_eq : M32 = 2 ^ 32 - 1 := by decide

theorem land_two_pow_sub_one (x n : ℕ) : x &&& (2 ^ n - 1) = x % 2 ^ n := Nat.and_two_pow_sub_one_eq_mod x n

theorem shiftLeft_one (n : ℕ) : Nat.shiftLeft 1 n = 2 ^ n := by
  rw [show Nat.shiftLeft 1 n = 1 <<< n from rfl, Nat.shiftLeft_eq, Nat.one_mul]

theorem get32_eq (P k : ℕ) : get32 P k = fld P k := by
  unfold get32 fld
  show (P >>> (32 * k)) &&& M32 = _
  rw [M32_eq, land_two_pow_sub_one, Nat.shiftRight_eq_div_pow]

theorem win_eq (M lo n : ℕ) : win M lo n = M / 2 ^ lo % 2 ^ n := by
  unfold win
  show (M >>> lo) &&& (Nat.shiftLeft 1 n - 1) = _
  rw [shiftLeft_one, land_two_pow_sub_one, Nat.shiftRight_eq_div_pow]

theorem testBit_win (M lo n j : ℕ) : (win M lo n).testBit j = (decide (j < n) && M.testBit (lo + j)) := by
  rw [win_eq, Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.add_comm j]

theorem bit_eq (y p : ℕ) : bit y p = if y.testBit p then 1 else 0 := by
  unfold bit
  show (y >>> p) &&& 1 = _
  rw [Nat.and_one_is_mod, Nat.testBit_eq_decide_div_mod_eq, Nat.shiftRight_eq_div_pow]
  rcases Nat.mod_two_eq_zero_or_one (y / 2 ^ p) with h | h <;> simp [h]

theorem bit_eq_one {y p : ℕ} : Nat.beq (bit y p) 1 = true ↔ y.testBit p = true := by
  rw [bit_eq]; cases y.testBit p <;> simp

theorem testBit_xor_two_pow (M k j : ℕ) : (M ^^^ 2 ^ k).testBit j = xor (M.testBit j) (decide (j = k)) := by
  rw [Nat.testBit_xor, Nat.testBit_two_pow]
  by_cases h : j = k
  · subst h; simp
  · have : k ≠ j := fun e => h e.symm
    simp [h, this]

/-! ## list = mask -/

theorem listChk1_spec : ∀ (L : List ℕ) (M : ℕ), listChk1 L M = true → L.Nodup ∧ ∀ j, M.testBit j = true ↔ j ∈ L
  | [], M, h => by
    have : M = 0 := Nat.eq_of_beq_eq_true h
    subst this; simp
  | k :: L, M, h => by
    have h' : (Nat.beq (bit M k) 1 && listChk1 L (Nat.xor M (Nat.shiftLeft 1 k))) = true := h
    rw [Bool.and_eq_true] at h'
    have hk := bit_eq_one.mp h'.1
    obtain ⟨hnd, hmem⟩ := listChk1_spec L _ h'.2
    have hx : ∀ j, (Nat.xor M (Nat.shiftLeft 1 k)).testBit j = xor (M.testBit j) (decide (j = k)) := by
      intro j; rw [shiftLeft_one]; exact testBit_xor_two_pow M k j
    have hkL : k ∉ L := by
      intro hm; have := (hmem k).mpr hm; rw [hx, hk] at this; simp at this
    refine ⟨List.nodup_cons.mpr ⟨hkL, hnd⟩, fun j => ?_⟩
    by_cases hj : j = k
    · subst hj; simp [hk]
    · have := hmem j; rw [hx] at this; simp only [hj, decide_false, Bool.xor_false] at this
      rw [this]; simp [hj]

theorem listChk32_spec : ∀ (L : List ℕ) (M : ℕ), listChk32 L M = true →
    L.Nodup ∧ ∀ p, M.testBit p = true ↔ ∃ k ∈ L, p = 32 * k
  | [], M, h => by
    have : M = 0 := Nat.eq_of_beq_eq_true h
    subst this; simp
  | k :: L, M, h => by
    have h' : (Nat.beq (bit M (Nat.mul 32 k)) 1 && listChk32 L (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 k)))) = true := h
    rw [Bool.and_eq_true] at h'
    have hk : M.testBit (32 * k) = true := bit_eq_one.mp h'.1
    obtain ⟨hnd, hmem⟩ := listChk32_spec L _ h'.2
    have hx : ∀ p, (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 k))).testBit p = xor (M.testBit p) (decide (p = 32 * k)) := by
      intro p; rw [shiftLeft_one]; exact testBit_xor_two_pow M (32 * k) p
    have hkL : k ∉ L := by
      intro hm
      have := (hmem (32 * k)).mpr ⟨k, hm, rfl⟩
      rw [hx] at this; change (M.testBit (32 * k) ^^ decide (32 * k = 32 * k)) = true at this
      rw [hk] at this; simp at this
    refine ⟨List.nodup_cons.mpr ⟨hkL, hnd⟩, fun p => ?_⟩
    by_cases hp : p = 32 * k
    · subst hp; simp only [List.mem_cons]
      exact ⟨fun _ => ⟨k, Or.inl rfl, rfl⟩, fun _ => hk⟩
    · have := hmem p; rw [hx] at this; simp only [hp, decide_false, Bool.xor_false] at this
      rw [this]
      constructor
      · rintro ⟨k', hk', e⟩; exact ⟨k', List.mem_cons_of_mem _ hk', e⟩
      · rintro ⟨k', hk', e⟩
        rcases List.mem_cons.mp hk' with rfl | h2
        · exact absurd e hp
        · exact ⟨k', h2, e⟩

/-! ## bit-sliced parity -/

theorem tb_natxor (a b p : ℕ) : tb (Nat.xor a b) p = tb a p + tb b p := tb_xor a b p

theorem tb_sel1 (y i S k : ℕ) : tb (sel1 y i S) k = tb y i * tb S k := by
  unfold sel1
  show tb (bit y i * S) k = _
  rw [bit_eq]
  unfold tb
  by_cases h : y.testBit i <;> simp [h]

/-- slice `i` holds bit `i` of every field `x k` -/
def SlOK (S : Sl29) (x : ℕ → ℕ) : Prop := ∀ i < 29, ∀ k, (S.get i).testBit k = (x k).testBit i

/-- **bit-sliced parity**: bit `k` of `sx S y` is the parity of the low 29 bits of `x k &&& y` -/
theorem sx_spec (S : Sl29) (x : ℕ → ℕ) (hS : SlOK S x) (y k : ℕ) :
    tb (sx S y) k = ∑ i ∈ range 29, tb y i * tb (x k) i := by
  have hg : ∀ i < 29, tb (S.get i) k = tb (x k) i := fun i hi => by unfold tb; rw [hS i hi k]
  have h0 : tb S.s0 k = tb (x k) 0 := hg 0 (by norm_num)
  have h1 : tb S.s1 k = tb (x k) 1 := hg 1 (by norm_num)
  have h2 : tb S.s2 k = tb (x k) 2 := hg 2 (by norm_num)
  have h3 : tb S.s3 k = tb (x k) 3 := hg 3 (by norm_num)
  have h4 : tb S.s4 k = tb (x k) 4 := hg 4 (by norm_num)
  have h5 : tb S.s5 k = tb (x k) 5 := hg 5 (by norm_num)
  have h6 : tb S.s6 k = tb (x k) 6 := hg 6 (by norm_num)
  have h7 : tb S.s7 k = tb (x k) 7 := hg 7 (by norm_num)
  have h8 : tb S.s8 k = tb (x k) 8 := hg 8 (by norm_num)
  have h9 : tb S.s9 k = tb (x k) 9 := hg 9 (by norm_num)
  have h10 : tb S.s10 k = tb (x k) 10 := hg 10 (by norm_num)
  have h11 : tb S.s11 k = tb (x k) 11 := hg 11 (by norm_num)
  have h12 : tb S.s12 k = tb (x k) 12 := hg 12 (by norm_num)
  have h13 : tb S.s13 k = tb (x k) 13 := hg 13 (by norm_num)
  have h14 : tb S.s14 k = tb (x k) 14 := hg 14 (by norm_num)
  have h15 : tb S.s15 k = tb (x k) 15 := hg 15 (by norm_num)
  have h16 : tb S.s16 k = tb (x k) 16 := hg 16 (by norm_num)
  have h17 : tb S.s17 k = tb (x k) 17 := hg 17 (by norm_num)
  have h18 : tb S.s18 k = tb (x k) 18 := hg 18 (by norm_num)
  have h19 : tb S.s19 k = tb (x k) 19 := hg 19 (by norm_num)
  have h20 : tb S.s20 k = tb (x k) 20 := hg 20 (by norm_num)
  have h21 : tb S.s21 k = tb (x k) 21 := hg 21 (by norm_num)
  have h22 : tb S.s22 k = tb (x k) 22 := hg 22 (by norm_num)
  have h23 : tb S.s23 k = tb (x k) 23 := hg 23 (by norm_num)
  have h24 : tb S.s24 k = tb (x k) 24 := hg 24 (by norm_num)
  have h25 : tb S.s25 k = tb (x k) 25 := hg 25 (by norm_num)
  have h26 : tb S.s26 k = tb (x k) 26 := hg 26 (by norm_num)
  have h27 : tb S.s27 k = tb (x k) 27 := hg 27 (by norm_num)
  have h28 : tb S.s28 k = tb (x k) 28 := hg 28 (by norm_num)
  unfold sx
  simp only [tb_natxor, tb_sel1]
  rw [h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
  ring

end GS

#print axioms GS.listChk1_spec
#print axioms GS.listChk32_spec
#print axioms GS.sx_spec
