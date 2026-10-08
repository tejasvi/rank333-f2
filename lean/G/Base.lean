module
public import R22Port.U_d41d8cd98f00
public import G.Gram
/-! # Basic helpers of the checkers (version 2): field access, list = mask tests, compaction, colour classes

All functions are structural recursions on lists or on a `Nat` fuel argument, and use only kernel-accelerated `Nat`
operations (`Nat.land/lor/xor/shiftLeft/shiftRight/add/sub/mul/div/beq/ble/blt`), so they evaluate in the kernel.
-/
@[expose] public section
noncomputable section
namespace G

def M32 : Nat := 4294967295
/-- field `k` of a stride-32 list -/
def get32 (P k : Nat) : Nat := Nat.land (Nat.shiftRight P (Nat.mul 32 k)) M32

/-- `L` lists each set bit of the stride-32 0/1 mask `M` exactly once (any order) -/
def listChk32 : List Nat → Nat → Bool
  | [], M => Nat.beq M 0
  | k :: L, M => Nat.beq (bit M (Nat.mul 32 k)) 1 && listChk32 L (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 k)))
/-- `L` lists each set bit of `M` exactly once (any order) -/
def listChk1 : List Nat → Nat → Bool
  | [], M => Nat.beq M 0
  | k :: L, M => Nat.beq (bit M k) 1 && listChk1 L (Nat.xor M (Nat.shiftLeft 1 k))

/-- packed rank-1 term from its fields -/
def mkTerm1 (yu xv a : Nat) : Nat :=
  Nat.lor yu (Nat.lor (Nat.shiftLeft xv 96) (Nat.lor (Nat.shiftLeft 1 192) (Nat.shiftLeft a 196)))

/-- bit `32k` set iff field `k` of `z` is nonzero (fields `< 2^31`) -/
def nz32 (z R : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.add z (Nat.mul 2147483647 R)) 31) R

/-! ### compaction (stride 32 to stride 1) -/
/-- groups of `2^t` bits at stride `32 * 2^t`, enough groups for `n` fields -/
def cmask (n t : Nat) : Nat :=
  let S := Nat.mul 32 (Nat.shiftLeft 1 t)
  let ng := Nat.add (Nat.shiftRight n t) 1
  Nat.mul (Nat.div (Nat.sub (Nat.shiftLeft 1 (Nat.mul S ng)) 1) (Nat.sub (Nat.shiftLeft 1 S) 1))
    (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft 1 t)) 1)
/-- one doubling step per mask: bit `k` of the result = bit `32k` of `x` when `x` has bits only at multiples of 32 below
`32 n` and the masks are `[cmask n 1, ..., cmask n T]` with `2^T ≥ n` -/
def compactL : List Nat → Nat → Nat → Nat
  | [], _, x => x
  | M :: Ms, t, x => compactL Ms (Nat.succ t) (Nat.land (Nat.lor x (Nat.shiftRight x (Nat.mul 31 (Nat.shiftLeft 1 t)))) M)
def cmasks (n : Nat) : Nat → Nat → List Nat
  | 0, _ => []
  | T+1, t => cmask n (Nat.succ t) :: cmasks n T (Nat.succ t)
/-- the least `T ≤ 24` with `2^T ≥ n` (24 if none; callers check `n ≤ 2^steps n`) -/
def stepsAux (n : Nat) : Nat → Nat → Nat
  | 0, T => T
  | f+1, T => cond (Nat.ble n (Nat.shiftLeft 1 T)) T (stepsAux n f (Nat.succ T))
def steps (n : Nat) : Nat := stepsAux n 24 0

/-! ### colour classes of rank-1 terms -/
/-- push `x` onto class `k` -/
def upd : Nat → Nat → List (List Nat) → List (List Nat)
  | _, _, [] => []
  | 0, x, l :: ls => (x :: l) :: ls
  | k+1, x, l :: ls => l :: upd k x ls
/-- stride-32 pack of a field of the list members -/
def pack (f : Nat → Nat) : List Nat → Nat → Nat → Nat
  | [], _, acc => acc
  | x :: xs, k, acc => pack f xs (Nat.succ k) (Nat.lor acc (Nat.shiftLeft (f x) (Nat.mul 32 k)))
/-- no member of the class (packs `PY PX PA`, `R = rep32 size`) with another first factor is compatible with `x` -/
def indep (PY PX PA R : Nat) : List Nat → Bool
  | [] => true
  | x :: xs =>
    Nat.beq (Nat.land (nz32 (Nat.xor PA (Nat.mul (fA x) R)) R)
      (Nat.xor R (Nat.lor (swarPar PX R (fYU x 0)) (swarPar PY R (fXV x 0))))) 0 && indep PY PX PA R xs
def classOK (cl : List Nat) : Bool :=
  let R := rep32 cl.length
  indep (pack (fun x => fYU x 0) cl 0 0) (pack (fun x => fXV x 0) cl 0 0) (pack fA cl 0 0) R cl
def classesOK : List (List Nat) → Bool
  | [] => true
  | c :: cs => classOK c && classesOK cs
def empty16 : List (List Nat) := [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]

end G
end
