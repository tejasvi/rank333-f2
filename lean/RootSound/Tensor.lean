module
public import R22Port.U_19374fe6f2a0
public import RootSound.LinAlg
public import Mathlib.Data.ZMod.Basic
public import Mathlib.Algebra.Field.ZMod
public import Mathlib.Algebra.BigOperators.Fin
/-! # The tensor <3,3,3> over F2, decompositions, and the contraction by a functional

Coordinates as in prof7/tsolve: a first factor `a` is a 3x3 matrix with `a i j` (bit `3i+j`), `b` has coordinate
`y = 3j+k`, `c` has coordinate `z = 3k+i`, and `T = ∑ e_ij ⊗ e_jk ⊗ e_ki`. -/
@[expose] public section
open Matrix

namespace RootSound

/-- `ZMod 2` with only its field structure exposed, so every ring operation on matrices over `F2` uses the instances
derived from `Field F2` (the general lemmas of `LinAlg` are stated for a field; matching `ZMod.commRing` against
`Field.toCommRing` is a costly unification). -/
instance fact_prime_two_rs : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
def F2 : Type := ZMod 2
instance : Field F2 := inferInstanceAs (Field (ZMod 2))
instance : DecidableEq F2 := inferInstanceAs (DecidableEq (ZMod 2))
instance : Fintype F2 := inferInstanceAs (Fintype (ZMod 2))
abbrev M3 := Matrix (Fin 3) (Fin 3) F2

/-- `T = ∑_s a_s ⊗ b_s ⊗ c_s` for `T = <3,3,3>` -/
def IsDecomp {n : ℕ} (a b c : Fin n → M3) : Prop :=
  ∀ i j j' k k' i' : Fin 3,
    (∑ s, a s i j * b s j' k * c s k' i') = if j = j' ∧ k = k' ∧ i = i' then 1 else 0

/-- `X(a) = ∑ X_ij a_ij` -/
def pair (X a : M3) : F2 := ∑ i, ∑ j, X i j * a i j

def hi (y : Fin 9) : Fin 3 := ⟨y.val / 3, by omega⟩
def lo (y : Fin 9) : Fin 3 := ⟨y.val % 3, by omega⟩

/-- `b` as a vector, coordinate `y = 3j+k` -/
def vecB (b : M3) : Fin 9 → F2 := fun y => b (hi y) (lo y)
/-- `c` as a vector, coordinate `z = 3k+i` -/
def vecC (c : M3) : Fin 9 → F2 := fun z => c (hi z) (lo z)

/-- `T(X)`, the 9x9 matrix of `(b, c) ↦ tr(X b c)`: entry `(y = 3j+k, z = 3k'+i)` is `X i j` if `k = k'` -/
def TX (X : M3) : Matrix (Fin 9) (Fin 9) F2 := fun y z => if lo y = hi z then X (lo z) (hi y) else 0

theorem sum_swap3 {n : ℕ} (G : Fin n → Fin 3 → Fin 3 → F2) (X : M3) :
    (∑ s, ∑ i, ∑ j, X i j * G s i j) = ∑ i, ∑ j, X i j * ∑ s, G s i j := by
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun i _ => ?_)
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun j _ => ?_)
  rw [Finset.mul_sum]

theorem contract {n : ℕ} {a b c : Fin n → M3} (hd : IsDecomp a b c) (X : M3) (y z : Fin 9) :
    TX X y z = ∑ s, pair X (a s) * vecB (b s) y * vecC (c s) z := by
  have key : ∀ s, pair X (a s) * vecB (b s) y * vecC (c s) z =
      ∑ i, ∑ j, X i j * (a s i j * b s (hi y) (lo y) * c s (hi z) (lo z)) := by
    intro s
    simp only [pair, vecB, vecC, Finset.sum_mul]
    refine Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => by ring))
  simp_rw [key]
  rw [sum_swap3 (fun s i j => a s i j * b s (hi y) (lo y) * c s (hi z) (lo z)) X]

  unfold IsDecomp at hd
  simp only [hd]
  unfold TX
  by_cases h : lo y = hi z
  · simp only [h, true_and, if_true]
    rw [Finset.sum_eq_single (lo z)]
    · rw [Finset.sum_eq_single (hi y)]
      · simp
      · intro j _ hj; simp [hj]
      · simp
    · intro i _ hi'
      apply Finset.sum_eq_zero
      intro j _
      simp only [mul_ite, mul_one, mul_zero]
      split_ifs with hh
      · exact absurd hh.2 hi'
      · rfl
    · simp
  · simp [h]

end RootSound
