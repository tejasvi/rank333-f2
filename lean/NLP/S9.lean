module
public import R22Port.U_d41d8cd98f00
public import NLP.Tables
public import S5.Masks
/-! # NLP.S9: nine 18-bit slots refine the kernel's packed 162-bit matrices

`S9.toNat` packs slot `z` at bits `18z .. 18z+17`.  For well-formed slots (`S9.WF`: each `< 2^18`) bit `18z + j` of the value
is bit `j` of slot `z`.  The native `xof`, `gof`, `corrP`, `sprM`, `S9.xor`, `resC`, `resR`, `gather` compute the kernel's
`BC5.xof`, `BC5.gof`, `BC6s.corrP`, `spr18 c * b`, `^^^`, `BC5.resC`, `BC5.resR`, `BC5.gather` on the values. -/
@[expose] public section
namespace NL
open Nat S5

/-- slot `z` (`z < 9`) -/
def S9.sl (P : S9) : Nat → Nat
  | 0 => P.s0 | 1 => P.s1 | 2 => P.s2 | 3 => P.s3 | 4 => P.s4 | 5 => P.s5 | 6 => P.s6 | 7 => P.s7 | _ => P.s8

theorem S9.wf_sl (P : S9) (hP : P.WF) (z : Nat) : P.sl z < 2 ^ 18 := by
  unfold S9.WF at hP
  unfold S9.sl
  split <;> omega

theorem S9.wf_of_sl (P : S9) (h : ∀ z < 9, P.sl z < 2 ^ 18) : P.WF :=
  ⟨h 0 (by norm_num), h 1 (by norm_num), h 2 (by norm_num), h 3 (by norm_num), h 4 (by norm_num), h 5 (by norm_num),
    h 6 (by norm_num), h 7 (by norm_num), h 8 (by norm_num)⟩

theorem tb18A {a b j : Nat} (ha : a < 2 ^ 18) (hj : j < 18) : (a + 2 ^ 18 * b).testBit j = a.testBit j := by
  rw [Nat.add_comm, Nat.testBit_two_pow_mul_add b ha, if_pos hj]
theorem tb18B {a b : Nat} (ha : a < 2 ^ 18) (m : Nat) : (a + 2 ^ 18 * b).testBit (18 + m) = b.testBit m := by
  rw [Nat.add_comm, Nat.testBit_two_pow_mul_add b ha, if_neg (by omega)]; congr 1; omega

/-- **bit `18z + j` of the value is bit `j` of slot `z`** -/
theorem S9.testBit_toNat (P : S9) (hP : P.WF) (z j : Nat) (hz : z < 9) (hj : j < 18) :
    P.toNat.testBit (18 * z + j) = (P.sl z).testBit j := by
  obtain ⟨h0, h1, h2, h3, h4, h5, h6, h7, h8⟩ := hP
  unfold S9.toNat
  interval_cases z
  · simp only [Nat.mul_zero, Nat.zero_add, tb18A h0 hj, S9.sl]
  · rw [show 18 * 1 + j = 18 + j by omega]; simp only [tb18B h0, tb18A h1 hj, S9.sl]
  · rw [show 18 * 2 + j = 18 + (18 + j) by omega]; simp only [tb18B h0, tb18B h1, tb18A h2 hj, S9.sl]
  · rw [show 18 * 3 + j = 18 + (18 + (18 + j)) by omega]; simp only [tb18B h0, tb18B h1, tb18B h2, tb18A h3 hj, S9.sl]
  · rw [show 18 * 4 + j = 18 + (18 + (18 + (18 + j))) by omega]
    simp only [tb18B h0, tb18B h1, tb18B h2, tb18B h3, tb18A h4 hj, S9.sl]
  · rw [show 18 * 5 + j = 18 + (18 + (18 + (18 + (18 + j)))) by omega]
    simp only [tb18B h0, tb18B h1, tb18B h2, tb18B h3, tb18B h4, tb18A h5 hj, S9.sl]
  · rw [show 18 * 6 + j = 18 + (18 + (18 + (18 + (18 + (18 + j))))) by omega]
    simp only [tb18B h0, tb18B h1, tb18B h2, tb18B h3, tb18B h4, tb18B h5, tb18A h6 hj, S9.sl]
  · rw [show 18 * 7 + j = 18 + (18 + (18 + (18 + (18 + (18 + (18 + j)))))) by omega]
    simp only [tb18B h0, tb18B h1, tb18B h2, tb18B h3, tb18B h4, tb18B h5, tb18B h6, tb18A h7 hj, S9.sl]
  · rw [show 18 * 8 + j = 18 + (18 + (18 + (18 + (18 + (18 + (18 + (18 + j))))))) by omega]
    simp only [tb18B h0, tb18B h1, tb18B h2, tb18B h3, tb18B h4, tb18B h5, tb18B h6, tb18B h7, S9.sl]

theorem lt_slot {a b k : Nat} (ha : a < 2 ^ 18) (hb : b < 2 ^ k) : a + 2 ^ 18 * b < 2 ^ (18 + k) := by
  rw [Nat.pow_add]
  have : 2 ^ 18 * b + 2 ^ 18 ≤ 2 ^ 18 * 2 ^ k := by rw [← Nat.mul_succ]; exact Nat.mul_le_mul_left _ hb
  omega

theorem S9.toNat_lt (P : S9) (hP : P.WF) : P.toNat < 2 ^ 162 := by
  obtain ⟨h0, h1, h2, h3, h4, h5, h6, h7, h8⟩ := hP
  unfold S9.toNat
  exact lt_slot h0 (lt_slot h1 (lt_slot h2 (lt_slot h3 (lt_slot h4 (lt_slot h5 (lt_slot h6 (lt_slot h7 h8)))))))

theorem S9.testBit_hi (P : S9) (hP : P.WF) (i : Nat) (hi : 162 ≤ i) : P.toNat.testBit i = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le (P.toNat_lt hP) (Nat.pow_le_pow_right (by norm_num) hi))

/-- a value below `2^162` with the slots' bits is the slots' value -/
theorem S9.toNat_eq (P : S9) (hP : P.WF) (y : Nat) (hy : y < 2 ^ 162)
    (h : ∀ z < 9, ∀ j < 18, (P.sl z).testBit j = y.testBit (18 * z + j)) : P.toNat = y := by
  apply Nat.eq_of_testBit_eq; intro i
  by_cases hi : i < 162
  · rw [show i = 18 * (i / 18) + i % 18 by omega, S9.testBit_toNat P hP _ _ (by omega) (by omega)]
    exact h _ (by omega) _ (by omega)
  · rw [S9.testBit_hi P hP i (by omega),
      Nat.testBit_lt_two_pow (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) (by omega)))]

/-- slot `z` of the value -/
theorem S9.slot_toNat (P : S9) (hP : P.WF) (z : Nat) (hz : z < 9) :
    Nat.land (Nat.shiftRight P.toNat (Nat.mul 18 z)) BC4.M18 = P.sl z := by
  apply Nat.eq_of_testBit_eq; intro j
  show ((P.toNat >>> (18 * z)) &&& BC4.M18).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, m18_eq, Nat.testBit_two_pow_sub_one]
  by_cases hj : j < 18
  · rw [show 18 * z + j = 18 * z + j from rfl, S9.testBit_toNat P hP z j hz hj]; simp [hj]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (P.wf_sl hP z) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hj]

/-! ## Small helpers -/

theorem tb_cond0 (c : Bool) (x j : Nat) : (cond c x 0).testBit j = (c && x.testBit j) := by cases c <;> simp

theorem tb_rh (x j : Nat) (hj : j < 9) : (rh x).testBit j = x.testBit (9 + j) := by
  show ((x >>> 9) &&& 511).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]
  simp [hj]

theorem rh_lt (x : Nat) : rh x < 512 := by
  unfold rh; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem nbit_eq (n i : Nat) : nbit n i = n.testBit i := S5.bit_eq n i

theorem npar_eq (v : Nat) (hv : v < 512) : npar v = BC5.par v := npar_fact v hv

theorem npar_bf (v : Nat) (hv : v < 512) : bf (npar v) = ∑ i ∈ Finset.range 9, bf (v.testBit i) := by
  rw [npar_eq v hv, S5.par_eq v hv, S5.bf_xorBits]

theorem cond_lt (c : Bool) (x : Nat) (k : Nat) (h : x < 2 ^ k) : cond c x 0 < 2 ^ k := by
  cases c
  · simp
  · simpa using h

theorem xor9_lt {a b : Nat} (ha : a < 512) (hb : b < 512) : a ^^^ b < 512 := Nat.xor_lt_two_pow (n := 9) ha hb

/-! ## `xof`, `gof` -/

theorem cond_rh_lt (c : Bool) (s : Nat) : cond c (rh s) 0 < 512 := by
  cases c
  · simp
  · exact rh_lt s

theorem xof_lt' (P : S9) (b : Nat) : xof P b < 512 := by
  unfold xof
  have h := cond_rh_lt
  exact xor9_lt (xor9_lt (xor9_lt (xor9_lt (xor9_lt (xor9_lt (xor9_lt (xor9_lt (h _ _) (h _ _)) (h _ _)) (h _ _)) (h _ _))
    (h _ _)) (h _ _)) (h _ _)) (h _ _)

/-- **`xof` on slots is the kernel's `xof` on the value** -/
theorem xof_eq (P : S9) (hP : P.WF) (b : Nat) (hb : b < 512) : xof P b = BC5.xof P.toNat b := by
  apply Nat.eq_of_testBit_eq; intro j
  by_cases hj : j < 9
  · apply S5.bf_inj
    rw [S5.xof_bf _ b j hb hj]
    have hs : ∀ h, h < 9 → P.toNat.testBit (18 * h + (9 + j)) = (P.sl h).testBit (9 + j) :=
      fun h hh => S9.testBit_toNat P hP h (9 + j) hh (by omega)
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, hs 0 (by norm_num), hs 1 (by norm_num), hs 2 (by norm_num),
      hs 3 (by norm_num), hs 4 (by norm_num), hs 5 (by norm_num), hs 6 (by norm_num), hs 7 (by norm_num),
      hs 8 (by norm_num)]
    unfold xof
    simp only [Nat.testBit_xor, tb_cond0, tb_rh _ j hj, nbit_eq, S5.bf_xor, S5.bf_and, S9.sl]
    ring
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (xof_lt' P b) (by
        calc 512 = 2 ^ 9 := by norm_num
          _ ≤ 2 ^ j := Nat.pow_le_pow_right (by norm_num) (by omega))),
      Nat.testBit_lt_two_pow (lt_of_lt_of_le (S5.xof_lt _ b) (by
        calc 512 = 2 ^ 9 := by norm_num
          _ ≤ 2 ^ j := Nat.pow_le_pow_right (by norm_num) (by omega)))]

theorem lt512_le (j : Nat) (hj : ¬ j < 9) : 512 ≤ 2 ^ j :=
  calc 512 = 2 ^ 9 := by norm_num
    _ ≤ 2 ^ j := Nat.pow_le_pow_right (by norm_num) (by omega)

theorem tb_or_lt (x : Nat) (hx : x < 512) (j : Nat) (hj : ¬ j < 9) : x.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le hx (lt512_le j hj))

theorem cond_lit_lt (p : Bool) (k : Nat) (hk : k < 512) : cond p k 0 < 512 := by cases p <;> simp [hk]

theorem gof_lt' (P : S9) (c : Nat) : gof P c < 512 := by
  unfold gof
  have h := fun p k (hk : k < 512) => cond_lit_lt p k hk
  exact Nat.or_lt_two_pow (n := 9) (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow
    (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow (h _ 1 (by norm_num)) (h _ 2 (by norm_num)))
    (h _ 4 (by norm_num))) (h _ 8 (by norm_num))) (h _ 16 (by norm_num))) (h _ 32 (by norm_num))) (h _ 64 (by norm_num)))
    (h _ 128 (by norm_num))) (h _ 256 (by norm_num))

/-- bit `h` of the native `gof` -/
theorem gof_bit (P : S9) (c h : Nat) (hh : h < 9) : (gof P c).testBit h = npar (Nat.land (rh (P.sl h)) c) := by
  show (cond (npar (Nat.land (rh P.s0) c)) (2 ^ 0) 0 ||| cond (npar (Nat.land (rh P.s1) c)) (2 ^ 1) 0 |||
    cond (npar (Nat.land (rh P.s2) c)) (2 ^ 2) 0 ||| cond (npar (Nat.land (rh P.s3) c)) (2 ^ 3) 0 |||
    cond (npar (Nat.land (rh P.s4) c)) (2 ^ 4) 0 ||| cond (npar (Nat.land (rh P.s5) c)) (2 ^ 5) 0 |||
    cond (npar (Nat.land (rh P.s6) c)) (2 ^ 6) 0 ||| cond (npar (Nat.land (rh P.s7) c)) (2 ^ 7) 0 |||
    cond (npar (Nat.land (rh P.s8) c)) (2 ^ 8) 0).testBit h = _
  simp only [Nat.testBit_or, tb_cond0, Nat.testBit_two_pow]
  interval_cases h <;> simp [S9.sl]

/-- **`gof` on slots is the kernel's `gof` on the value** -/
theorem gof_eq (P : S9) (hP : P.WF) (c : Nat) (hc : c < 512) : gof P c = BC5.gof P.toNat c := by
  apply Nat.eq_of_testBit_eq; intro h
  by_cases hh : h < 9
  · apply S5.bf_inj
    rw [S5.gof_bf _ c h hc hh, gof_bit P c h hh,
      npar_bf (Nat.land (rh (P.sl h)) c) (lt_of_le_of_lt Nat.and_le_left (rh_lt _))]
    apply Finset.sum_congr rfl
    intro j hj
    have hj9 : j < 9 := Finset.mem_range.mp hj
    rw [Nat.land_eq, Nat.testBit_and, S5.bf_and, tb_rh _ j hj9, S9.testBit_toNat P hP h (9 + j) hh (by omega), mul_comm]
  · rw [tb_or_lt _ (gof_lt' P c) h hh, tb_or_lt _ (S5.gof_lt _ c) h hh]

/-! ## Slot-wise constructions -/

theorem S9.xor_sl (x y : S9) (z : Nat) (hz : z < 9) : (x.xor y).sl z = x.sl z ^^^ y.sl z := by
  unfold S9.xor S9.sl; interval_cases z <;> rfl

theorem S9.xor_wf (x y : S9) (hx : x.WF) (hy : y.WF) : (x.xor y).WF :=
  S9.wf_of_sl _ (fun z hz => by
    rw [S9.xor_sl x y z hz]; exact Nat.xor_lt_two_pow (x.wf_sl hx z) (y.wf_sl hy z))

theorem S9.toNat_xor (x y : S9) (hx : x.WF) (hy : y.WF) : (x.xor y).toNat = x.toNat ^^^ y.toNat :=
  S9.toNat_eq _ (S9.xor_wf x y hx hy) _ (Nat.xor_lt_two_pow (x.toNat_lt hx) (y.toNat_lt hy)) (fun z hz j hj => by
    rw [S9.xor_sl x y z hz, Nat.testBit_xor, Nat.testBit_xor, S9.testBit_toNat x hx z j hz hj,
      S9.testBit_toNat y hy z j hz hj])

/-- the kernel's sparse product `spr18 c * v` (`v < 2^18`): bit `i` is bit `i % 18` of `v` when `c` has bit `i / 18` -/
theorem spr_mul_bit (c v : Nat) (hc : c < 512) (hv : v < 2 ^ 18) (i : Nat) :
    (BC5.spr18 c * v).testBit i = (decide (i < 162) && c.testBit (i / 18) && v.testBit (i % 18)) := by
  rw [S5.testBit_sparse_mul (by norm_num) _ v hv (S5.spr18_sparse c hc), S5.spr18_bit c hc]
  have e1 : 18 * (i / 18) % 18 = 0 := by omega
  have e2 : (18 * (i / 18) < 162) ↔ (i < 162) := by omega
  have e3 : 18 * (i / 18) / 18 = i / 18 := by omega
  simp only [e1, e3, true_and]
  by_cases h : i < 162
  · simp [h, show 18 * (i / 18) < 162 by omega]
  · simp [h, show ¬ (18 * (i / 18) < 162) by omega]

theorem spr_mul_lt (c v : Nat) (hc : c < 512) (hv : v < 2 ^ 18) : BC5.spr18 c * v < 2 ^ 162 :=
  Nat.lt_pow_two_of_testBit _ (fun i hi => by rw [spr_mul_bit c v hc hv]; simp [show ¬ i < 162 by omega])

theorem sprM_sl (c b z : Nat) (hz : z < 9) : (sprM c b).sl z = cond (nbit c z) b 0 := by
  unfold sprM S9.sl; interval_cases z <;> rfl

theorem sprM_wf (c b : Nat) (hb : b < 2 ^ 18) : (sprM c b).WF :=
  S9.wf_of_sl _ (fun z hz => by rw [sprM_sl c b z hz]; cases nbit c z <;> simp <;> omega)

/-- **`sprM c b` is the kernel's `spr18 c * b`** -/
theorem sprM_eq (c b : Nat) (hc : c < 512) (hb : b < 2 ^ 18) : (sprM c b).toNat = BC5.spr18 c * b :=
  S9.toNat_eq _ (sprM_wf c b hb) _ (spr_mul_lt c b hc hb) (fun z hz j hj => by
    rw [sprM_sl c b z hz, tb_cond0, spr_mul_bit c b hc hb, nbit_eq]
    have e1 : (18 * z + j) / 18 = z := by omega
    have e2 : (18 * z + j) % 18 = j := by omega
    simp [e1, e2, show 18 * z + j < 162 by omega])

theorem corrP_sl (P : S9) (A B z : Nat) (hz : z < 9) :
    (corrP P A B).sl z = cond (nbit A z) (P.sl z ^^^ Nat.mul B 512) (P.sl z) := by
  unfold corrP S9.sl; interval_cases z <;> rfl

theorem corrP_wf (P : S9) (hP : P.WF) (A B : Nat) (hB : B < 512) : (corrP P A B).WF :=
  S9.wf_of_sl _ (fun z hz => by
    rw [corrP_sl P A B z hz]
    have h1 := P.wf_sl hP z
    have h2 : Nat.mul B 512 < 2 ^ 18 := by show B * 512 < 2 ^ 18; omega
    cases nbit A z
    · simpa using h1
    · simpa using Nat.xor_lt_two_pow h1 h2)

/-- **`corrP` on slots is the kernel's `corrP` on the value** -/
theorem corrP_eq (P : S9) (hP : P.WF) (A B : Nat) (hA : A < 512) (hB : B < 512) :
    (corrP P A B).toNat = BC6s.corrP P.toNat A B := by
  have hB9 : B <<< 9 < 2 ^ 18 := by rw [Nat.shiftLeft_eq]; omega
  show _ = P.toNat ^^^ (BC5.spr18 A * (B <<< 9))
  apply S9.toNat_eq _ (corrP_wf P hP A B hB) _ (Nat.xor_lt_two_pow (P.toNat_lt hP) (spr_mul_lt A _ hA hB9))
  intro z hz j hj
  rw [corrP_sl P A B z hz, Nat.testBit_xor, spr_mul_bit A _ hA hB9, S9.testBit_toNat P hP z j hz hj, nbit_eq]
  have e1 : (18 * z + j) / 18 = z := by omega
  have e2 : (18 * z + j) % 18 = j := by omega
  have e3 : Nat.mul B 512 = B <<< 9 := by rw [Nat.shiftLeft_eq]; rfl
  rw [e1, e2, e3]
  cases A.testBit z <;> simp [show 18 * z + j < 162 by omega, Nat.testBit_xor]

end NL
