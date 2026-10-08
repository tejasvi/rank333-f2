module
public import R22Port.U_d41d8cd98f00
public import RootSound.Terms
public import RootSound.RootTables
public import RootSound.PerXData
/-! # Bit encodings shared by the checker and the proof

* a 3x3 matrix is a 9-bit number, entry `(i,j)` = bit `3i+j` (`toM3`);
* a 9x9 matrix is an 81-bit number, entry `(r,c)` = bit `9r+c` (`toM9`);
* a vector of `F2^3` is a 3-bit number `w0 + 2 w1 + 4 w2` (`enc3`), and a subspace of `F2^3` an 8-bit membership mask;
* column `k` of `b` is `(b 0 k, b 1 k, b 2 k)`, row `k` of `c` is `(c k 0, c k 1, c k 2)`. -/
@[expose] public section
open Matrix

namespace RootSound

def bitF (v i : Nat) : F2 := if v.testBit i then 1 else 0

def toM3 (v : Nat) : M3 := fun i j => bitF v (3 * i.val + j.val)
def toM9 (v : Nat) : Matrix (Fin 9) (Fin 9) F2 := fun r c => bitF v (9 * r.val + c.val)

/-- `D_k`: the diagonal matrix with `k` leading ones -/
def Dk (k : Nat) : Matrix (Fin 9) (Fin 9) F2 := Matrix.diagonal (fun i => if i.val < k then 1 else 0)

def f2nat (x : F2) : Nat := if x = 1 then 1 else 0
def enc3 (w : Fin 3 → F2) : Nat := f2nat (w 0) + 2 * f2nat (w 1) + 4 * f2nat (w 2)

def colB (b : M3) (k : Fin 3) : Fin 3 → F2 := fun j => b j k
def rowC (c : M3) (k : Fin 3) : Fin 3 → F2 := fun i => c k i
/-- `w ∈ Q` for an 8-bit membership mask `Q` -/
abbrev memM (Q : Nat) (w : Fin 3 → F2) : Prop := Q.testBit (enc3 w) = true

/-- the 3x3 matrix of a vector in `b`- or `c`-coordinates (`y = 3j+k`, resp. `z = 3k+i`) -/
def matOf (v : Fin 9 → F2) : M3 := fun p q => v ⟨3 * p.val + q.val, by omega⟩

/-- `tr(Z b c)` -/
def trZ (Z b c : M3) : F2 := Matrix.trace (Z * b * c)

/-- the per-functional table entries -/
def rkOf (X : Nat) : Nat := (RootCheck.RKT >>> (2 * X)) % 4
def qxOf (X : Nat) : Nat := (RootCheck.QXT >>> (8 * X)) % 256
def pxOf (X : Nat) : Nat := (RootCheck.PXT >>> (8 * X)) % 256
def zxOf (X : Nat) : Nat := (ZXT >>> (9 * X)) % 512
def fzOf (X : Nat) : Nat := (RootCheck.FZT >>> (64 * X)) % 18446744073709551616

end RootSound
