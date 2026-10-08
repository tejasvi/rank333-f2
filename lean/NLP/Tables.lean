module
public import R22Port.U_d41d8cd98f00
public import NLP.M8
public import BranchCheck7s
/-! # NLP.Tables: every native table entry is the kernel checker's table value (kernel `decide`)

Each lemma checks a whole table once (`decide +kernel` over the index range) against the kernel definition it replaces. -/
@[expose] public section
namespace NL
open Nat

/-- the value of nine 18-bit slots -/
def S9.toNat (P : S9) : Nat :=
  P.s0 + 2 ^ 18 * (P.s1 + 2 ^ 18 * (P.s2 + 2 ^ 18 * (P.s3 + 2 ^ 18 * (P.s4 + 2 ^ 18 * (P.s5 + 2 ^ 18 * (P.s6 +
    2 ^ 18 * (P.s7 + 2 ^ 18 * P.s8)))))))

/-- slots below `2^18` -/
def S9.WF (P : S9) : Prop :=
  P.s0 < 2 ^ 18 ∧ P.s1 < 2 ^ 18 ∧ P.s2 < 2 ^ 18 ∧ P.s3 < 2 ^ 18 ∧ P.s4 < 2 ^ 18 ∧ P.s5 < 2 ^ 18 ∧ P.s6 < 2 ^ 18 ∧
    P.s7 < 2 ^ 18 ∧ P.s8 < 2 ^ 18

/-- `S9.WF` as a `Bool` (for table checks) -/
def S9.wfb (P : S9) : Bool :=
  Nat.blt P.s0 262144 && Nat.blt P.s1 262144 && Nat.blt P.s2 262144 && Nat.blt P.s3 262144 && Nat.blt P.s4 262144 &&
    Nat.blt P.s5 262144 && Nat.blt P.s6 262144 && Nat.blt P.s7 262144 && Nat.blt P.s8 262144

theorem S9.wf_of_wfb (P : S9) (h : P.wfb = true) : P.WF := by
  unfold S9.wfb at h; unfold S9.WF
  simp only [Bool.and_eq_true, Nat.blt_eq] at h
  omega

theorem npar_fact : ∀ v < 512, npar v = BC5.par v := by decide +kernel
theorem pop11_fact : ∀ x < 2048, pop11 x = BC5.pop11 x := by decide +kernel
theorem nperpM_fact : ∀ v < 512, (nperpM v).toNat = BC5.nperp v := by decide +kernel
theorem rlm_fact : ∀ X < 512, (rlm X).toNat = BC5.rlm X := by decide +kernel
theorem rrm_fact : ∀ X < 512, (rrm X).toNat = BC5.rrm X := by decide +kernel
theorem kerm_fact : ∀ X < 512, (kerm X).toNat = BC6s.kerm X := by decide +kernel
theorem lkerm_fact : ∀ X < 512, (lkerm X).toNat = BC6s.lkerm X := by decide +kernel
theorem corbM_fact : ∀ b < 512, (corbM b).toNat = BC7T.corbM b := by decide +kernel
theorem rootP_fact : ∀ X < 512, (rootP X).toNat = BC6s.rootP X ∧ (rootP X).wfb = true := by decide +kernel
theorem rootRk_fact : ∀ X < 512, rootRk X = BC6s.rootRk X := by decide +kernel
theorem rpm_fact : ∀ X < 512, RPMT.getD X 0 = Nat.land (Nat.shiftRight (BC5.rpt X) 162) 511 := by decide +kernel
theorem txc_fact : ∀ X < 512, (TXCS.getD X default).toNat = BC5.txc18 X ∧ (TXCS.getD X default).wfb = true := by
  decide +kernel
theorem txr_fact : ∀ X < 512, (TXRS.getD X default).toNat = BC5.txr18 X ∧ (TXRS.getD X default).wfb = true := by
  decide +kernel
theorem id18_fact : ID18S.toNat = BC4.ID18 ∧ ID18S.wfb = true := by decide +kernel
theorem rge_fact : ∀ k < 4, (RGEV.getD k default).toNat = Nat.land (Nat.shiftRight BC6.RGE (Nat.mul 512 k)) BC4.M512 := by
  decide +kernel
theorem rk3_fact : ∀ v < 512, rk3 v = BC6s.rk3 v := by decide +kernel
theorem orbm_fact : ORBM8.toNat = BC4.ORBM := by decide +kernel
theorem allnz_fact : ALLNZ8.toNat = BC4.ALLNZ := by decide +kernel
theorem m512_fact : M5128.toNat = BC4.M512 := by decide +kernel
theorem pw_fact : ∀ k < 63, pw k = 2 ^ k := by decide +kernel

/-- the six packed vectors of `V` in the high halves of 18-bit slots `0 … 5` (the kernel's `kb18` layout) -/
def enc18 (V : Nat) : Nat :=
  Nat.land V 511 * 2 ^ 9 + Nat.land (Nat.shiftRight V 9) 511 * 2 ^ 27 + Nat.land (Nat.shiftRight V 18) 511 * 2 ^ 45 +
    Nat.land (Nat.shiftRight V 27) 511 * 2 ^ 63 + Nat.land (Nat.shiftRight V 36) 511 * 2 ^ 81 +
    Nat.land (Nat.shiftRight V 45) 511 * 2 ^ 99

theorem kbp_fact : ∀ X < 512, BC6s.kb18 X = enc18 (KBP.getD X 0) ∧ BC6s.lkb18 X = enc18 (LKBP.getD X 0) := by
  decide +kernel

end NL
