module
public import R22Port.U_d41d8cd98f00
public import R6.Basic
/-! # v6 ⇒ v6s refinement, part 2: the per-record tables

`tb (xtab P) b = xof P b` and `tb (gtab P) c = gof P c` for `b, c < 512`.  `xtab` and `gtab` are nine doubling steps,
i.e. `DblBits.dbl` over the basis images (`Hx`, `Hg`); entry `j < 512` of `dbl H 9` is `lin H 9 j`
(`DblBits.dbl_spec`), which is `xof` / `gof` bit by bit (S5's `xof_bf` / `gof_bf`). -/
@[expose] public section
namespace R6
open BC4 RootSound

/-- basis images of `x`: `x(e_i)` is the high half of slot `i` of `P` -/
def Hx (P i : Nat) : Nat := (P >>> (18 * i + 9)) % 512
/-- basis images of `g`: `g(e_i) = gather P (9 + i)` -/
def Hg (P i : Nat) : Nat := BC5.gather P (9 + i)

theorem Hx_lt (P i : Nat) : Hx P i < 512 := Nat.mod_lt _ (by norm_num)
theorem Hg_lt (P i : Nat) : Hg P i < 512 := S5.gather_lt _ _

theorem land511 (x : Nat) : Nat.land x 511 = x % 512 := by
  rw [Nat.land_eq, show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]

theorem tb_eq (T j : Nat) : BC6.tb T j = DblBits.tb T j := by
  unfold BC6.tb DblBits.tb
  rw [land511, Nat.shiftRight_eq', Nat.mul_eq]

/-! ## The doubling steps -/

theorem R9_0 : DblBits.R9 0 = 1 := by simp [DblBits.R9]
theorem R9_1 : DblBits.R9 1 = BC6.R91 := by rw [DblBits.R9_succ, R9_0]; decide +kernel
theorem R9_2 : DblBits.R9 2 = BC6.R92 := by rw [DblBits.R9_succ, R9_1]; decide +kernel
theorem R9_3 : DblBits.R9 3 = BC6.R93 := by rw [DblBits.R9_succ, R9_2]; decide +kernel
theorem R9_4 : DblBits.R9 4 = BC6.R94 := by rw [DblBits.R9_succ, R9_3]; decide +kernel
theorem R9_5 : DblBits.R9 5 = BC6.R95 := by rw [DblBits.R9_succ, R9_4]; decide +kernel
theorem R9_6 : DblBits.R9 6 = BC6.R96 := by rw [DblBits.R9_succ, R9_5]; decide +kernel
theorem R9_7 : DblBits.R9 7 = BC6.R97 := by rw [DblBits.R9_succ, R9_6]; decide +kernel
theorem R9_8 : DblBits.R9 8 = BC6.R98 := by rw [DblBits.R9_succ, R9_7]; decide +kernel

/-- one doubling step of `xtab`/`gtab` as written in v6, with the basis image `h` -/
def step6 (T h R sh : Nat) : Nat := Nat.lor T (Nat.shiftLeft (Nat.xor T (Nat.mul h R)) sh)

theorem step6_eq (T h k : Nat) : step6 T h (DblBits.R9 k) (9 * 2 ^ k) = DblBits.dstep T h k := by
  unfold step6 DblBits.dstep
  rw [Nat.lor_eq, Nat.shiftLeft_eq', Nat.xor_eq, Nat.mul_eq]

theorem dbl9 (H : Nat → Nat) : DblBits.dbl H 9 =
    DblBits.dstep (DblBits.dstep (DblBits.dstep (DblBits.dstep (DblBits.dstep (DblBits.dstep (DblBits.dstep
      (DblBits.dstep (DblBits.dstep 0 (H 0) 0) (H 1) 1) (H 2) 2) (H 3) 3) (H 4) 4) (H 5) 5) (H 6) 6) (H 7) 7) (H 8) 8 := rfl

theorem dstep0 (h : Nat) : DblBits.dstep 0 h 0 = Nat.shiftLeft h 9 := by
  unfold DblBits.dstep
  rw [R9_0, Nat.zero_xor, Nat.mul_one, Nat.zero_or, Nat.shiftLeft_eq']
  norm_num

theorem xtab_def (P : Nat) : BC6.xtab P =
    step6 (step6 (step6 (step6 (step6 (step6 (step6 (step6 (Nat.shiftLeft (Nat.land (Nat.shiftRight P 9) 511) 9)
      (Nat.land (Nat.shiftRight P 27) 511) BC6.R91 18) (Nat.land (Nat.shiftRight P 45) 511) BC6.R92 36)
      (Nat.land (Nat.shiftRight P 63) 511) BC6.R93 72) (Nat.land (Nat.shiftRight P 81) 511) BC6.R94 144)
      (Nat.land (Nat.shiftRight P 99) 511) BC6.R95 288) (Nat.land (Nat.shiftRight P 117) 511) BC6.R96 576)
      (Nat.land (Nat.shiftRight P 135) 511) BC6.R97 1152) (Nat.land (Nat.shiftRight P 153) 511) BC6.R98 2304 := rfl

theorem gtab_def (P : Nat) : BC6.gtab P =
    step6 (step6 (step6 (step6 (step6 (step6 (step6 (step6 (Nat.shiftLeft (BC6.gather P 9) 9)
      (BC6.gather P 10) BC6.R91 18) (BC6.gather P 11) BC6.R92 36) (BC6.gather P 12) BC6.R93 72)
      (BC6.gather P 13) BC6.R94 144) (BC6.gather P 14) BC6.R95 288) (BC6.gather P 15) BC6.R96 576)
      (BC6.gather P 16) BC6.R97 1152) (BC6.gather P 17) BC6.R98 2304 := rfl

theorem hx_slot (P i : Nat) : Nat.land (Nat.shiftRight P (18 * i + 9)) 511 = Hx P i := by
  rw [land511, Nat.shiftRight_eq']; rfl

theorem hg_slot (P i : Nat) : BC6.gather P (9 + i) = Hg P i := by
  unfold Hg; rw [gather_eq]

theorem step6_1 (T h : Nat) : step6 T h BC6.R91 18 = DblBits.dstep T h 1 := by rw [← R9_1]; exact step6_eq T h 1
theorem step6_2 (T h : Nat) : step6 T h BC6.R92 36 = DblBits.dstep T h 2 := by rw [← R9_2]; exact step6_eq T h 2
theorem step6_3 (T h : Nat) : step6 T h BC6.R93 72 = DblBits.dstep T h 3 := by rw [← R9_3]; exact step6_eq T h 3
theorem step6_4 (T h : Nat) : step6 T h BC6.R94 144 = DblBits.dstep T h 4 := by rw [← R9_4]; exact step6_eq T h 4
theorem step6_5 (T h : Nat) : step6 T h BC6.R95 288 = DblBits.dstep T h 5 := by rw [← R9_5]; exact step6_eq T h 5
theorem step6_6 (T h : Nat) : step6 T h BC6.R96 576 = DblBits.dstep T h 6 := by rw [← R9_6]; exact step6_eq T h 6
theorem step6_7 (T h : Nat) : step6 T h BC6.R97 1152 = DblBits.dstep T h 7 := by rw [← R9_7]; exact step6_eq T h 7
theorem step6_8 (T h : Nat) : step6 T h BC6.R98 2304 = DblBits.dstep T h 8 := by rw [← R9_8]; exact step6_eq T h 8

theorem xtab_dbl (P : Nat) : BC6.xtab P = DblBits.dbl (Hx P) 9 := by
  rw [xtab_def, dbl9, hx_slot P 0, hx_slot P 1, hx_slot P 2, hx_slot P 3, hx_slot P 4, hx_slot P 5, hx_slot P 6,
    hx_slot P 7, hx_slot P 8, ← dstep0, step6_1, step6_2, step6_3, step6_4, step6_5, step6_6, step6_7, step6_8]

theorem gtab_dbl (P : Nat) : BC6.gtab P = DblBits.dbl (Hg P) 9 := by
  rw [gtab_def, dbl9, hg_slot P 0, hg_slot P 1, hg_slot P 2, hg_slot P 3, hg_slot P 4, hg_slot P 5, hg_slot P 6,
    hg_slot P 7, hg_slot P 8, ← dstep0, step6_1, step6_2, step6_3, step6_4, step6_5, step6_6, step6_7, step6_8]

/-! ## `lin` is `xof` / `gof` -/

theorem lin_lt (H : Nat → Nat) (hH : ∀ i, H i < 512) : ∀ k j, DblBits.lin H k j < 512 := by
  intro k
  induction k with
  | zero => intro j; simp [DblBits.lin]
  | succ k ih =>
    intro j
    simp only [DblBits.lin]
    split_ifs
    · exact Nat.xor_lt_two_pow (n := 9) (ih j) (hH k)
    · simpa using ih j

theorem lin_bf (H : Nat → Nat) (t : Nat) : ∀ k j, S5.bf ((DblBits.lin H k j).testBit t) =
    ∑ i ∈ Finset.range k, S5.bf (j.testBit i) * S5.bf ((H i).testBit t) := by
  intro k
  induction k with
  | zero => intro j; simp [DblBits.lin, S5.bf]
  | succ k ih =>
    intro j
    simp only [DblBits.lin, Nat.testBit_xor, S5.bf_xor, ih, Finset.sum_range_succ]
    congr 1
    cases j.testBit k <;> simp [S5.bf]

theorem Hx_bit (P i t : Nat) (ht : t < 9) : (Hx P i).testBit t = P.testBit (18 * i + (9 + t)) := by
  unfold Hx
  rw [show (512 : Nat) = 2 ^ 9 by norm_num, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]
  simp [ht, Nat.add_assoc]

theorem Hg_bit (P i h : Nat) (hh : h < 9) : (Hg P i).testBit h = P.testBit (18 * h + (9 + i)) := by
  unfold Hg; rw [S5.gather_bit]; simp [hh]

theorem lin_xof (P b : Nat) (hb : b < 512) : DblBits.lin (Hx P) 9 b = BC5.xof P b := by
  apply DblBits.eq_of_tb (lin_lt _ (Hx_lt P) 9 b) (S5.xof_lt P b)
  intro t ht
  apply S5.bf_inj
  rw [lin_bf, S5.xof_bf P b t hb ht]
  refine Finset.sum_congr rfl (fun i hi => ?_)
  rw [Hx_bit P i t ht]

theorem lin_gof (P c : Nat) (hc : c < 512) : DblBits.lin (Hg P) 9 c = BC5.gof P c := by
  apply DblBits.eq_of_tb (lin_lt _ (Hg_lt P) 9 c) (S5.gof_lt P c)
  intro h hh
  apply S5.bf_inj
  rw [lin_bf, S5.gof_bf P c h hc hh]
  refine Finset.sum_congr rfl (fun i hi => ?_)
  rw [Hg_bit P i h hh]

/-- **Tables.** Entry `b` of `xtab P` is `xof P b`, entry `c` of `gtab P` is `gof P c`. -/
theorem tb_xtab (P b : Nat) (hb : b < 512) : BC6.tb (BC6.xtab P) b = BC5.xof P b := by
  rw [tb_eq, xtab_dbl, ((DblBits.dbl_spec (Hx P) (Hx_lt P) 9).2 b (by norm_num; omega)), lin_xof P b hb]

theorem tb_gtab (P c : Nat) (hc : c < 512) : BC6.tb (BC6.gtab P) c = BC5.gof P c := by
  rw [tb_eq, gtab_dbl, ((DblBits.dbl_spec (Hg P) (Hg_lt P) 9).2 c (by norm_num; omega)), lin_gof P c hc]

end R6
