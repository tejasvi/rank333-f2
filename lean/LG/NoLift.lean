module
public import R22Port.U_d41d8cd98f00
public import S5.Leaf
/-! # The NOLIFT leaf statement of the L479 glue (agreed with leaf2 and hcls, 2026-10-07)

`E = {0, 1, 10, 11}` (class 479 of `K3eD_Cls`), `p = 1`, `q = 10`.  The functionals `X0 = 1` (`X0(p) = 1`, `X0(q) = 0`)
and `X1 = 2` (`X1(p) = 0`, `X1(q) = 1`) represent two of the three classes of functionals nonzero on `E`; the third is
`X0 ^^^ X1 = 3`.  For a decomposition `(b, c)` of `T mod E` with the record's first factors (as in `S5.NoDecomp`):
* `Lift n b c Y`: the affine space `T(Y) + span{b_t c_tᵀ}` contains a nonzero rank-1 matrix (`S` = the terms whose bit
  `Y(a_t)` is flipped by the lift; the space depends neither on the representatives `a_t` nor on `Y` within its class
  modulo `E^⊥`);
* `NoLift T n dom Y1 Y2`: no such decomposition lifts in both `Y1` and `Y2`.
A leaf record `r` (`E1.leafRec`, mode `01`, `DOM = E^⊥`) is refuted for L479 by `NoLift3 (leafT r) (leafN r) (leafDom6 r)`
(all three pairs), or by `S5.NoDecomp (leafT r) (leafN r) (leafDom6 r)` (UNSAT). -/
@[expose] public section
namespace L479
open RootSound BC4 BC5 S5 Matrix

/-- the functional `X0`: `X0(1) = 1`, `X0(10) = 0` -/
def X0 : ℕ := 1
/-- the functional `X1`: `X1(1) = 0`, `X1(10) = 1` -/
def X1 : ℕ := 2

/-- `Y` lifts: some matrix of `T(Y) + span{b_t c_tᵀ : t < n}` is a nonzero rank-1 matrix -/
def Lift (n : ℕ) (b c : ℕ → ℕ) (Y : ℕ) : Prop :=
  ∃ S ⊆ Finset.range n, ∃ u v : Fin 9 → F2, u ≠ 0 ∧ v ≠ 0 ∧
    TX (toM3 Y) + ∑ t ∈ S, vecMulVec (nv (b t)) (nv (c t)) = vecMulVec u v

/-- no decomposition of `T mod E` with the record's first factors (`T`, `n`, domain `dom`) lifts in both `Y1` and `Y2` -/
def NoLift (T n dom Y1 Y2 : ℕ) : Prop :=
  ∀ b c : ℕ → ℕ, BC n b c →
    (∀ X, X < 512 → dom.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range n).filter (fun t => par (aT T t &&& X) = true),
        vecMulVec (nv (b t)) (nv (c t))) →
    ¬ (Lift n b c Y1 ∧ Lift n b c Y2)

/-- the SAT-leaf refutation: at most one of the three classes lifts -/
def NoLift3 (T n dom : ℕ) : Prop :=
  NoLift T n dom X0 X1 ∧ NoLift T n dom X0 (X0 ^^^ X1) ∧ NoLift T n dom X1 (X0 ^^^ X1)

end L479
