module
public import R22Port.U_6050cb77ad13
public import Lean
/-! # Gram-state checker: common definitions (r22/thm4/gram)

Encodings (all `Nat`, kernel-evaluated; conventions of `cpp/gsx8.cc`):
* a first factor `a < 512` has bit `3i+j` = `a[i][j]`; `B[j][k]` = bit `3j+k`; `C[k][i]` = bit `3k+i`;
* `a = L R^T` with columns `L_q, R_q` (3-bit, bit i = entry i), `q < r = rank a`;
* `Y_q = yvec R_q C` (bit `9j+3k+i` = `R_q[j] C[k][i]`), `X_q = xvec B L_q` (bit `9j+3k+i` = `B[j][k] L_q[i]`);
  `par (Y_t[al] &&& X_s[be])` is entry `(al, be)` of `G_ts = R_t^T B_s C_t L_s`;
* dirt rows `U_q, V_q < 2^d`.

A *packed term* holds, for `q < r`, the 29-bit fields `Y_q ||| U_q <<< 27` at bit `32 q` and `X_q ||| V_q <<< 27` at bit
`96 + 32 q`, then `r` at bit 192 and `a` at bit 196.  Compatibility of packed terms `t, s` (`compatP`) is
`a_t ≠ a_s` and, for all rows/columns, `par (YU_t[al] &&& XV_s[be]) = 0` and `par (YU_s[al] &&& XV_t[be]) = 0`, which is
`G_ts[al][be] = par (U_t[al] &&& V_s[be])` and the same for `G_st`.  Validity of a packed term (`validP`) is
`par (YU[al] &&& XV[be]) = [al = be]`.

*Stride-32 lists*: `k` records `x_k < 2^32` packed as `∑ x_k <<< 32k`.  `swarPar P y` has bit `32k` equal to
`par (x_k &&& y)` and no other bits (`fold32`), so a whole list is tested against one term with a few big-`Nat` operations.
-/
@[expose] public section
noncomputable section
namespace G

def M29 : Nat := 536870911
def bit (y p : Nat) : Nat := Nat.land (Nat.shiftRight y p) 1

/-- parity of `x < 2^32` -/
def par32 (x : Nat) : Nat :=
  let y := Nat.xor x (Nat.shiftRight x 16)
  let y := Nat.xor y (Nat.shiftRight y 8)
  let y := Nat.xor y (Nat.shiftRight y 4)
  let y := Nat.xor y (Nat.shiftRight y 2)
  Nat.land (Nat.xor y (Nat.shiftRight y 1)) 1

/-- in every 32-bit field, bit 0 becomes the parity of the field (other bits: garbage) -/
def fold32 (z : Nat) : Nat :=
  let z := Nat.xor z (Nat.shiftRight z 16)
  let z := Nat.xor z (Nat.shiftRight z 8)
  let z := Nat.xor z (Nat.shiftRight z 4)
  let z := Nat.xor z (Nat.shiftRight z 2)
  Nat.xor z (Nat.shiftRight z 1)

/-- `∑_{k<m} 2^(32k)` -/
def rep32 (m : Nat) : Nat := Nat.div (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 m)) 1) 4294967295

/-- bit `32k` = `par (x_k &&& y)` for the stride-32 list `P` (`R = rep32 m`, `y < 2^32`) -/
def swarPar (P R y : Nat) : Nat := Nat.land (fold32 (Nat.land P (Nat.mul y R))) R

/-- packed-term fields -/
def fYU (t q : Nat) : Nat := Nat.land (Nat.shiftRight t (Nat.mul 32 q)) M29
def fXV (t q : Nat) : Nat := Nat.land (Nat.shiftRight t (Nat.add 96 (Nat.mul 32 q))) M29
def fR (t : Nat) : Nat := Nat.land (Nat.shiftRight t 192) 3
def fA (t : Nat) : Nat := Nat.land (Nat.shiftRight t 196) 511

/-- `∀ al < r, par (YU_t[al] &&& x) = 0` -/
def rowsOK (t x : Nat) : Nat → Bool
  | 0 => true
  | q+1 => Nat.beq (par32 (Nat.land (fYU t q) x)) 0 && rowsOK t x q
/-- `∀ be < r, par (y &&& XV_t[be]) = 0` -/
def colsOK (t y : Nat) : Nat → Bool
  | 0 => true
  | q+1 => Nat.beq (par32 (Nat.land y (fXV t q))) 0 && colsOK t y q

/-- compatibility of packed terms (both directions, distinct first factors) -/
def compatP (t s : Nat) : Bool :=
  !(Nat.beq (fA t) (fA s)) && cross t s (fR s) && cross s t (fR t)
where
  /-- `∀ be < n, ∀ al < r_t, par (YU_t[al] &&& XV_s[be]) = 0` -/
  cross (t s : Nat) : Nat → Bool
    | 0 => true
    | be+1 => rowsOK t (fXV s be) (fR t) && cross t s be

end G
end
