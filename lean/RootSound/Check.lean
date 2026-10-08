module
public import R22Port.U_d41d8cd98f00
public import RootSound.RootTables
/-! # Root-refutation checker (Lemma R of r22/wtight/ROOT.md, matrix form), kernel-evaluable, core Lean only.

A profile is the list of the 22 first factors (9-bit matrices, entry (i,j) = bit 3i+j).  A hint certifies that one term
`a_t` has no admissible `(b, c)`: it names the tight functionals and the slack-1 functionals of rank 1 or 2 through `a_t`
(each claim is re-checked against the profile), and gives a tree over the slack-1 side choices whose leaves either find the
zero subspace on one side or give an odd set of tight functionals whose `Z`-sum vanishes on `Q x P`.
Encoding (least significant bit first): `t` (5 bits), `nT` (4), `nT` functionals (9 each), `nS` (3), `nS` functionals (9
each), tree: split = `1`, `L` (12 bits, length of the left code), left, right; leaf = `0`, kind (1 bit): `0` = zero
subspace, `1` = odd set `S` (`nT` bits).
Style: direct `Nat.*` calls, `cond`, structural recursion; every loop returns `Bool` (no long data chains). -/
@[expose] public section
namespace RootCheck

@[inline] def bit (n i : Nat) : Bool := Nat.beq (Nat.land (Nat.shiftRight n i) 1) 1
/-- `X(a) = 1` -/
@[inline] def hitsOne (X a : Nat) : Bool := bit PAR (Nat.land X a)
@[inline] def rk (X : Nat) : Nat := Nat.land (Nat.shiftRight RKT (Nat.mul 2 X)) 3
@[inline] def qx (X : Nat) : Nat := Nat.land (Nat.shiftRight QXT (Nat.mul 8 X)) 255
@[inline] def px (X : Nat) : Nat := Nat.land (Nat.shiftRight PXT (Nat.mul 8 X)) 255
@[inline] def fz (X : Nat) : Nat := Nat.land (Nat.shiftRight FZT (Nat.mul 64 X)) 18446744073709551615
/-- bit `8p+q` set iff `p ∈ P` and `q ∈ Q` (8-bit membership masks over the vectors of `F2^3`) -/
@[inline] def outer (P Q : Nat) : Nat :=
  Nat.land (Nat.mul Q 72340172838076673) (Nat.land (Nat.shiftRight SPREAD (Nat.mul 64 P)) 18446744073709551615)

/-- number of points of the profile hit by `X` -/
def hits (X : Nat) : List Nat → Nat
  | [] => 0
  | a :: as => cond (hitsOne X a) (Nat.succ (hits X as)) (hits X as)

/-- the `n` 9-bit fields of `h` -/
def fields : Nat → Nat → List Nat
  | 0, _ => []
  | n+1, h => Nat.land h 511 :: fields n (Nat.shiftRight h 9)

def allTight (prof : List Nat) (a : Nat) : List Nat → Bool
  | [] => true
  | X :: Xs => hitsOne X a && Nat.beq (hits X prof) (Nat.mul 3 (rk X)) && allTight prof a Xs

def allSlack (prof : List Nat) (a : Nat) : List Nat → Bool
  | [] => true
  | X :: Xs => hitsOne X a && Nat.blt (rk X) 3 && Nat.beq (hits X prof) (Nat.succ (Nat.mul 3 (rk X))) && allSlack prof a Xs

/-- `Q` (resp. `P`) after the tight functionals of rank < 3 -/
def q0 : List Nat → Nat
  | [] => 255
  | X :: Xs => cond (Nat.blt (rk X) 3) (Nat.land (qx X) (q0 Xs)) (q0 Xs)
def p0 : List Nat → Nat
  | [] => 255
  | X :: Xs => cond (Nat.blt (rk X) 3) (Nat.land (px X) (p0 Xs)) (p0 Xs)

/-- xor of `fz X` over the `X` of the list selected by the mask `S`; parity of the selection -/
def zsum : List Nat → Nat → Nat
  | [], _ => 0
  | X :: Xs, S => Nat.xor (cond (bit S 0) (fz X) 0) (zsum Xs (Nat.shiftRight S 1))
def oddSel : List Nat → Nat → Bool
  | [], _ => false
  | _ :: Xs, S => Bool.xor (bit S 0) (oddSel Xs (Nat.shiftRight S 1))

def getD : List Nat → Nat → Nat
  | [], _ => 0
  | x :: _, 0 => x
  | _ :: xs, n+1 => getD xs n

/-- the tree walk (a split must name an existing slack-1 functional: `i < slack.length`; without that check a
split on the default `0` would pass both branches with the zero subspace) -/
def walk (nT : Nat) (tight slack : List Nat) : Nat → Nat → Nat → Nat → Nat → Bool
  | 0, _, _, _, _ => false
  | fuel+1, h, Q, P, i =>
    cond (bit h 0)
      (let X := getD slack i
       Nat.blt i slack.length &&
       walk nT tight slack fuel (Nat.shiftRight h 13) (Nat.land Q (qx X)) P (Nat.succ i) &&
       walk nT tight slack fuel (Nat.shiftRight h (Nat.add 13 (Nat.land (Nat.shiftRight h 1) 4095))) Q (Nat.land P (px X)) (Nat.succ i))
      (cond (bit h 1)
        (let S := Nat.land (Nat.shiftRight h 2) (Nat.sub (Nat.shiftLeft 1 nT) 1)
         oddSel tight S && Nat.beq (Nat.land (outer P Q) (zsum tight S)) 0)
        (Nat.beq Q 1 || Nat.beq P 1))

def checkLeaf (prof : List Nat) (h : Nat) : Bool :=
  let a := getD prof (Nat.land h 31)
  let nT := Nat.land (Nat.shiftRight h 5) 15
  let tight := fields nT (Nat.shiftRight h 9)
  let h1 := Nat.shiftRight h (Nat.add 9 (Nat.mul 9 nT))
  let nS := Nat.land h1 7
  let slack := fields nS (Nat.shiftRight h1 3)
  let h2 := Nat.shiftRight h1 (Nat.add 3 (Nat.mul 9 nS))
  allTight prof a tight && allSlack prof a slack && walk nT tight slack 64 h2 (q0 tight) (p0 tight) 0

def checkAll : List (List Nat × Nat) → Bool
  | [] => true
  | (p, h) :: rest => checkLeaf p h && checkAll rest

end RootCheck
