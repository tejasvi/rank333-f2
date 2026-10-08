module
public import R22Port.U_d41d8cd98f00
public import BranchCheck6
public import S6.Leaf6
public import RootSound.DblBits
/-! # v6 ⇒ v6s refinement, part 1: the encodings

`BranchCheck6` (v6, namespace `BC6`) is `BranchCheck6s` (v6s, `BC6s` on top of v5's `BC5`) re-encoded for the kernel:
`sel c a b` / `∧ᵇ` / `∨ᵇ` / `notb` are raw `Bool.rec` steps, `Nat.sub x 1` replaces `Nat.pred x`, `Nat.ble (succ a)`
replaces `Nat.blt a`, records carry the tables `XT = xtab P`, `GT = gtab P`, and the candidate loop runs over mask bits.
This file: the `Bool.rec` encodings, and v6's copies of v5's primitives (equal by unfolding: same bodies).

Kernel note (DESIGN 17.3): every lemma here is either `rfl` between definitions with the same body shape, or a case split
on a `Bool` variable.  Proofs elsewhere rewrite with these lemmas, so the kernel only meets syntactic equalities. -/
@[expose] public section
namespace R6
open BC4

universe u

/-! ## `Bool.rec` encodings -/

theorem sel_eq {α : Sort u} (c : Bool) (a b : α) : @Bool.rec (fun _ => α) b a c = cond c a b := by cases c <;> rfl
theorem cond_and (a b : Bool) : cond a b false = (a && b) := by cases a <;> rfl
theorem cond_or (a b : Bool) : cond a true b = (a || b) := by cases a <;> rfl
theorem cond_not (a : Bool) : cond a false true = !a := by cases a <;> rfl
theorem brec_true {α : Sort u} (a b : α) : @Bool.rec (fun _ => α) b a true = a := rfl
theorem brec_false {α : Sort u} (a b : α) : @Bool.rec (fun _ => α) b a false = b := rfl
/-- `cond true`/`cond false` as propositional rewrites (simp would use the core rfl-lemmas as defeq steps, which the
kernel may re-check by unfolding the bitwise side: DESIGN 17.3) -/
theorem condT {α : Sort u} (a b : α) : cond true a b = a := id rfl
theorem condF {α : Sort u} (a b : α) : cond false a b = b := id rfl

theorem sub1_eq (x : Nat) : Nat.sub x 1 = Nat.pred x := rfl
theorem blt_eq (a b : Nat) : Nat.ble (Nat.succ a) b = Nat.blt a b := rfl

/-! ## v6's copies of v5's primitives -/

theorem bit_eq (n i : Nat) : BC6.bit n i = BC5.bit n i := id rfl
theorem par_eq (v : Nat) : BC6.par v = BC5.par v := id rfl
theorem txc18_eq (X : Nat) : BC6.txc18 X = BC5.txc18 X := id rfl
theorem txr18_eq (X : Nat) : BC6.txr18 X = BC5.txr18 X := id rfl
theorem spr18_eq (c : Nat) : BC6.spr18 c = BC5.spr18 c := id rfl
theorem nperp_eq (v : Nat) : BC6.nperp v = BC5.nperp v := id rfl
theorem perp_eq (v : Nat) : BC6.perp v = BC5.perp v := id rfl
theorem dep32_eq (x : Nat) : BC6.dep32 x = BC5.dep32 x := id rfl
theorem pop11_eq (x : Nat) : BC6.pop11 x = BC5.pop11 x := id rfl
theorem hx_eq (SS X : Nat) : BC6.hx SS X = BC5.hx SS X := id rfl
theorem pop32_eq (x : Nat) : BC6.pop32 x = BC5.pop32 x := id rfl
theorem ucnt_eq (SS ACT X : Nat) : BC6.ucnt SS ACT X = BC5.ucnt SS ACT X := id rfl
theorem gather_eq (P j : Nat) : BC6.gather P j = BC5.gather P j := id rfl
theorem xof_eq (P b : Nat) : BC6.xof P b = BC5.xof P b := id rfl
theorem gof_eq (P c : Nat) : BC6.gof P c = BC5.gof P c := id rfl
theorem rpt_eq (X : Nat) : BC6.rpt X = BC5.rpt X := id rfl
theorem rlm_eq (X : Nat) : BC6.rlm X = BC5.rlm X := id rfl
theorem rrm_eq (X : Nat) : BC6.rrm X = BC5.rrm X := id rfl
theorem lg2_eq (p : Nat) : BC6.lg2 p = BC5.lg2 p := id rfl
theorem sk_eq (k S : Nat) : BC6.sk k S = BC5.sk k S := id rfl
theorem rd_eq (k S : Nat) : BC6.rd k S = BC5.rd k S := by
  unfold BC6.rd BC5.rd; rw [sub1_eq]

/-! ## v6's copies of v6s's new functions -/

theorem hsw_eq (S d K : Nat) : BC6.hsw S d K = BC6s.hsw S d K := id rfl
theorem corrP_eq (P A B : Nat) : BC6.corrP P A B = BC6s.corrP P A B := by
  unfold BC6.corrP BC6s.corrP; rw [spr18_eq]
theorem firstPar_eq (W w : Nat) : BC6.firstPar W w = BC6s.firstPar W w := id rfl
theorem kb18_eq (X : Nat) : BC6.kb18 X = BC6s.kb18 X := id rfl
theorem lkb18_eq (X : Nat) : BC6.lkb18 X = BC6s.lkb18 X := id rfl
theorem rootP_eq (X : Nat) : BC6.rootP X = BC6s.rootP X := by
  unfold BC6.rootP BC6s.rootP; rw [rpt_eq]
theorem rootRk_eq (X : Nat) : BC6.rootRk X = BC6s.rootRk X := id rfl
theorem kerm_eq (X : Nat) : BC6.kerm X = BC6s.kerm X := id rfl
theorem lkerm_eq (X : Nat) : BC6.lkerm X = BC6s.lkerm X := id rfl
theorem lgMask_eq (need t : Nat) : BC6.lgMask need t = BC6s.lgMask need t := id rfl
theorem rk3_eq (v : Nat) : BC6.rk3 v = BC6s.rk3 v := id rfl

end R6
