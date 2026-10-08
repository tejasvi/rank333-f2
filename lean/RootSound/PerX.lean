module
public import R22Port.U_d41d8cd98f00
public import RootSound.Bits
/-! # Per-functional facts, checked by the kernel for every `X ≠ 0` (modules `PerXc*`)

For `M = T(X)`: rank certificates (`L M R = D_k`, `M = U D_k V`, `k = 3 rk X`), the masks `Q_X`, `P_X` are subspaces
containing the columns of `b` (resp. rows of `c`) of every column (row) of `M`, `Z_X` satisfies
`tr(Z_X b c) = y ⬝ M x` on basis vectors, and the 64-bit mask `FZ_X` is the form `p^T Z_X q`. -/
@[expose] public section
open Matrix

namespace RootSound

def dec3 (p : Nat) : Fin 3 → F2 := fun i => bitF p i.val
/-- `p^T Z q` -/
def bil (Z : M3) (p q : Fin 3 → F2) : F2 := ∑ r, ∑ s, p r * Z r s * q s

def LOf (X : Nat) : Nat := (LT >>> (81 * X)) % 2417851639229258349412352
def ROf (X : Nat) : Nat := (RT >>> (81 * X)) % 2417851639229258349412352
def UOf (X : Nat) : Nat := (UT >>> (81 * X)) % 2417851639229258349412352
def VOf (X : Nat) : Nat := (VT >>> (81 * X)) % 2417851639229258349412352

structure PerXFacts (X : Nat) : Prop where
  rank_lo : toM9 (LOf X) * TX (toM3 X) * toM9 (ROf X) = Dk (3 * rkOf X)
  rank_hi : TX (toM3 X) = toM9 (UOf X) * Dk (3 * rkOf X) * toM9 (VOf X)
  q_zero : (qxOf X).testBit 0 = true
  q_xor : ∀ w1 w2 : Fin 8, (qxOf X).testBit w1.val = true → (qxOf X).testBit w2.val = true →
    (qxOf X).testBit (w1.val ^^^ w2.val) = true
  q_cols : ∀ z : Fin 9, ∀ k : Fin 3, memM (qxOf X) (colB (matOf (fun y => TX (toM3 X) y z)) k)
  p_zero : (pxOf X).testBit 0 = true
  p_xor : ∀ w1 w2 : Fin 8, (pxOf X).testBit w1.val = true → (pxOf X).testBit w2.val = true →
    (pxOf X).testBit (w1.val ^^^ w2.val) = true
  p_rows : ∀ w : Fin 9, ∀ k : Fin 3, memM (pxOf X) (rowC (matOf (fun z => TX (toM3 X) w z)) k)
  z_basis : ∀ z w : Fin 9,
    trZ (toM3 (zxOf X)) (matOf (fun y => TX (toM3 X) y z)) (matOf (fun z' => TX (toM3 X) w z')) = TX (toM3 X) w z
  fz_form : ∀ p q : Fin 8, (fzOf X).testBit (8 * p.val + q.val) = decide (bil (toM3 (zxOf X)) (dec3 p.val) (dec3 q.val) = 1)

instance (X : Nat) : Decidable (PerXFacts X) :=
  decidable_of_iff (_ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _)
    ⟨fun ⟨a, b, c, d, e, f, g, h, i, j⟩ => ⟨a, b, c, d, e, f, g, h, i, j⟩,
     fun ⟨a, b, c, d, e, f, g, h, i, j⟩ => ⟨a, b, c, d, e, f, g, h, i, j⟩⟩

end RootSound
