module
public import R22Port.U_d41d8cd98f00
public import LX.Mixed
/-! # Lifting between external-leaf lists of the L479 IP (l479x) -/
@[expose] public section
namespace L479X
open E1GS

/-- `Glob` for a larger external-leaf list implies `Glob` for a smaller one -/
theorem glob_cx_mono (e1 e2 : List ℕ) (hsub : ∀ e ∈ e1, e ∈ e2) (x : ℕ → ℕ) (h : Glob (E1G.OK_l479cw.Cx e2) x) :
    Glob (E1G.OK_l479cw.Cx e1) x :=
  L479.glob_ext_mono (C := E1G.OK_l479cw.Cx e1) (ext := e2) hsub h

/-- a job checked under a smaller external-leaf list holds under a larger one -/
theorem jobOK_cx_mono (e1 e2 : List ℕ) (hsub : ∀ e ∈ e1, e ∈ e2) {sl : ℕ → ℕ} {UB S : ℕ}
    (h : JobOK (E1G.OK_l479cw.Cx e1) sl UB S) : JobOK (E1G.OK_l479cw.Cx e2) sl UB S :=
  fun x hg hsl hub hx => h x (glob_cx_mono e1 e2 hsub x hg) hsl hub hx

end L479X
#print axioms L479X.jobOK_cx_mono
