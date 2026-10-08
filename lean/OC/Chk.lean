module
public import R22Port.U_d41d8cd98f00
public import G.Interface
/-! # Orbit completeness: the Boolean checkers (kernel side)

Only `G.Interface` is imported.  The checkers evaluate the interface's own `mul3`, `xformRows`, `tr3`, `trD`, `mulD`,
`ID`, `dirt`-style parities and the representative lists `reps d`, `reps0`; inverses are supplied by the certificate and
checked by one multiplication (`inv3ok`), so `inv3`/`invD` (linear `find?` searches) are never evaluated per state.

Reduction used by the certificates (proved in `OC.Sound`): every `B < 512` is `mul3 B0 h0` with `B0 ∈ BREPS` (one
representative per column space) and `h0 ∈ GL3`; `act3`/`act2` compose in `h`, so only states with `B ∈ BREPS` need
per-state witnesses.

Certificate data layout:
* `hnChk 512 es`: `es` lists, for `b = 511, 510, ..., 0`, the packed triple `B0 | h0 <<< 9 | h0⁻¹ <<< 18` with
  `mul3 B0 h0 = b`;
* `chkCs d B0 L lo hi wss` (`d ∈ {1, 2}`): `wss` lists, for `C = hi - 1, ..., lo`, the witnesses of the states
  `⟨273, B0, C, U, V⟩`, `(U, V)` running over `L (mul3 B0 C ^^^ 273)` in order; a witness packs
  `g | g⁻¹ <<< 9 | h <<< 18 | h⁻¹ <<< 27 | γ <<< 36 | γ⁻¹ <<< 45`;
* `uvlU d L (2 ^ (d * 3))`: every `(U, V)` lies in `L (dirtM d U V)`;
* `chkCs0 B0 lo hi ws`: `ws` lists, for `C = hi - 1, ..., lo`, a witness `P | P⁻¹ <<< 9 | Q <<< 18 | Q⁻¹ <<< 27 | h <<< 36 |
  h⁻¹ <<< 45` when `cond17 (mul3 B0 C)` (the rank-2 Gram condition), else anything. -/
@[expose] public section
namespace OC
open G

/-- the 16 column-space representatives: the least element of each class of `B ~ mul3 B h` (`h ∈ GL3`) -/
def BREPS : List Nat := [0, 1, 8, 9, 10, 64, 65, 66, 72, 73, 74, 80, 81, 82, 83, 84]

/-- membership in a list of numbers -/
def memN (x : Nat) : List Nat → Bool
  | [] => false
  | y :: ys => Nat.beq x y || memN x ys

/-- field `k` (9 bits) of a packed record -/
def f9 (w k : Nat) : Nat := Nat.land (Nat.shiftRight w (Nat.mul 9 k)) 511

/-- `gi` is an inverse of `g` (both 3x3 codes) -/
def inv3ok (g gi : Nat) : Bool := Nat.blt g 512 && Nat.blt gi 512 && Nat.beq (mul3 g gi) 273

/-- equality of states, field by field -/
def stEqB (s r : State) : Bool :=
  Nat.beq s.B r.B && Nat.beq s.C r.C && Nat.beq s.U r.U && Nat.beq s.V r.V && Nat.beq s.a r.a

/-- membership in a list of states -/
def memSt (s : State) : List State → Bool
  | [] => false
  | r :: rs => stEqB s r || memSt s rs

/-! ### invertible anchors, `d ∈ {1, 2}` -/

/-- the 9-bit code of `U Vᵀ` (bit `3 al + be` = `U[al] · V[be]`, as in `dirt`) -/
def dirtM (d U V : Nat) : Nat :=
  (List.range 9).foldl (fun acc p => if parN d (row d U (p / 3) &&& row d V (p % 3)) then acc ||| (1 <<< p) else acc) 0

/-- `act3` with the inverses `gi = g⁻¹`, `hi = h⁻¹`, `γi = γ⁻¹` supplied -/
def act3' (d g gi h hi γ γi B C U V : Nat) : State :=
  ⟨I3, mul3 (mul3 g B) hi, mul3 (mul3 h C) gi, xformRows d g γ U, xformRows d (tr3 gi) (trD d γi) V⟩

/-- the witness `w` maps `⟨273, B, C, U, V⟩` into `reps d` -/
def chkW3 (d B C U V w : Nat) : Bool :=
  inv3ok (f9 w 0) (f9 w 1) && inv3ok (f9 w 2) (f9 w 3) &&
  Nat.blt (f9 w 4) (2 ^ (d * d)) && Nat.blt (f9 w 5) (2 ^ (d * d)) && Nat.beq (mulD d (f9 w 4) (f9 w 5)) (ID d) &&
  memSt (act3' d (f9 w 0) (f9 w 1) (f9 w 2) (f9 w 3) (f9 w 4) (f9 w 5) B C U V) (reps d)

/-- one witness per listed `(U, V)` -/
def chkUV (d B C : Nat) : List (Nat × Nat) → List Nat → Bool
  | [], [] => true
  | p :: ps, w :: ws => chkW3 d B C p.1 p.2 w && chkUV d B C ps ws
  | _, _ => false

/-- all `C ∈ [lo, c)` (list head: `C = c - 1`; the list has exactly `c - lo` entries) -/
def chkCs (d B : Nat) (L : Nat → List (Nat × Nat)) (lo : Nat) : Nat → List (List Nat) → Bool
  | c, [] => Nat.beq c lo
  | c+1, ws :: wss => chkUV d B c (L (Nat.xor (mul3 B c) 273)) ws && chkCs d B L lo c wss
  | 0, _ :: _ => false

/-- membership of `(U, V)` in a list of pairs -/
def memP (U V : Nat) : List (Nat × Nat) → Bool
  | [] => false
  | p :: ps => (Nat.beq p.1 U && Nat.beq p.2 V) || memP U V ps

/-- `(U, V) ∈ L (dirtM d U V)` for all `V < n` -/
def uvlV (d U : Nat) (L : Nat → List (Nat × Nat)) : Nat → Bool
  | 0 => true
  | V+1 => memP U V (L (dirtM d U V)) && uvlV d U L V

/-- `(U, V) ∈ L (dirtM d U V)` for all `U < n`, `V < 2 ^ (d * 3)` -/
def uvlU (d : Nat) (L : Nat → List (Nat × Nat)) : Nat → Bool
  | 0 => true
  | U+1 => uvlV d U L (2 ^ (d * 3)) && uvlU d L U

/-- `invD d` is determined by any inverse (all `γ, x < 2 ^ (d * d)`) -/
def invDchk (d : Nat) : Bool :=
  (List.range (2 ^ (d * d))).all fun γ => (List.range (2 ^ (d * d))).all fun x =>
    !(Nat.beq (mulD d γ x) (ID d)) || Nat.beq (invD d γ) x

/-! ### the column-space normalization of `B` -/

/-- all `b < n` (list head: `b = n - 1`): `b = mul3 B0 h0`, `h0` invertible, `B0 ∈ BREPS` -/
def hnChk : Nat → List Nat → Bool
  | 0, [] => true
  | b+1, e :: es =>
    (Nat.beq (mul3 (f9 e 0) (f9 e 1)) b && inv3ok (f9 e 1) (f9 e 2) && memN (f9 e 0) BREPS) && hnChk b es
  | _, _ => false

/-! ### rank-2 anchors at `d = 0` -/

/-- the Gram condition of `⟨17, B, C, 0, 0⟩` on `M = mul3 B C`: top-left 2x2 block of `M` is the identity -/
def cond17 (M : Nat) : Bool := M.testBit 0 && !M.testBit 1 && !M.testBit 3 && M.testBit 4

/-- `act2` with `Pi = P⁻¹`, `hi = h⁻¹` supplied -/
def act2' (Pi Q h hi B C : Nat) : State := ⟨17, mul3 (mul3 Q B) hi, mul3 (mul3 h C) Pi, 0, 0⟩

/-- the witness `w` maps `⟨17, B, C, _, _⟩` into `reps0` -/
def chkW2 (B C w : Nat) : Bool :=
  inv3ok (f9 w 0) (f9 w 1) && inv3ok (f9 w 2) (f9 w 3) && inv3ok (f9 w 4) (f9 w 5) &&
  Nat.beq (mul3 (mul3 (f9 w 0) 17) (f9 w 3)) 17 &&
  memSt (act2' (f9 w 1) (f9 w 2) (f9 w 4) (f9 w 5) B C) reps0

/-- all `C ∈ [lo, c)` (list head: `C = c - 1`; the list has exactly `c - lo` entries) -/
def chkCs0 (B lo : Nat) : Nat → List Nat → Bool
  | c, [] => Nat.beq c lo
  | c+1, w :: ws => (!cond17 (mul3 B c) || chkW2 B c w) && chkCs0 B lo c ws
  | 0, _ :: _ => false

end OC
