module
public import R22Port.U_d41d8cd98f00
public import L1.Check
/-! # L1 node checker v2 (r22/lean/DESIGN.md section 20)

Same certificate content as v1 (`L1/Check.lean`), cheaper layout and loops:
* recursion through `Nat.rec`/`List.rec` directly, not through the equation compiler;
* the kills are a `List Nat` (one record each), so no long chain of shifts over one big record;
* rows are grouped by role, so a row's residual is implied by its block: full rows cited here (residual 0), exclusion
  rows (residual 1), cover rows with residual 1, cover rows with residual 2.  `E` (claimed counts) is checked in bulk;
  the row's cap is `E + residual`;
* references are bit offsets into their block (no multiplications), the final count test of a kill is a popcount.

Node record: `[0,8)` pops, `[8,17)` last, `[17,22)` d, `[22,32)` nV, `[32,42)` nE, `[42,52)` nC1, `[52,62)` nC2;
from bit 64: the masks (`nV + nE + nC1 + nC2` slots of 512 bits), then `E` (one byte per row).
Kill record: `u (9) | nX (5) | nC (5) | nX exclusion indices (10 bits, into the exclusion block) | nC cover indices
(10 bits, into the cover block: below `nC1` residual 1, else residual 2)`; offsets are `index * 512`. -/
@[expose] public section
noncomputable section
namespace L1

/-- popcount of one mask (`< 2^512`), 16-bit sums -/
def pc1 (x : Nat) : Nat :=
  let c := swar3 x
  Nat.land (Nat.shiftRight (Nat.mul (Nat.land (Nat.add c (Nat.shiftRight c 8)) K00FF) SUM32) 496) 65535

/-- exclusion references: `X` minus each row, `A` and each row -/
def excl (ME : Nat) (n : Nat) : Nat → Nat → Nat → (Nat → Nat → Nat → Bool) → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → (Nat → Nat → Nat → Bool) → Bool)
    (fun rr X A k => k rr X A)
    (fun _ ih rr X A k =>
      let mask := Nat.land (Nat.shiftRight ME (Nat.shiftLeft (Nat.land rr 1023) 9)) M512
      ih (Nat.shiftRight rr 10) (Nat.sub X (Nat.land X mask)) (Nat.land A mask) k) n

/-- cover references: residual 1 at the child (block offset `< b1`: residual 1 at the node and `u` not in the row;
otherwise residual 2 and `u` in the row) -/
def cover (MC u b1 : Nat) (n : Nat) : Nat → Nat → Nat → (Nat → Nat → Bool) → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → (Nat → Nat → Bool) → Bool)
    (fun _ C nc k => k C nc)
    (fun _ ih rr C nc k =>
      let i := Nat.land rr 1023
      let mask := Nat.land (Nat.shiftRight MC (Nat.shiftLeft i 9)) M512
      Nat.beq (Nat.land (Nat.shiftRight mask u) 1) (cond (Nat.blt i b1) 0 1) &&
        ih (Nat.shiftRight rr 10) (Nat.lor C mask) (Nat.succ nc) k) n

/-- one kill: free children `Fn`, static window `Nw` from slot `w0`, exclusion and cover blocks, `nu` points needed -/
def kill2 (Fn Nw w0 ME MC b1 nu kr : Nat) : Bool :=
  let u := Nat.land kr 511
  let X0 := Nat.land Fn (Nat.shiftLeft (Nat.shiftRight M511 (Nat.succ u)) (Nat.succ u))
  let Z := Nat.land (Nat.shiftRight Nw (Nat.shiftLeft (Nat.sub u w0) 9)) M512
  Nat.ble w0 u && Nat.blt u 511 &&
  excl ME (Nat.land (Nat.shiftRight kr 9) 31) (Nat.shiftRight kr 19) (Nat.sub X0 (Nat.land X0 Z)) M512
    (fun rr X A => Nat.beq (Nat.land (Nat.shiftRight A u) 1) 1 &&
      cover MC u b1 (Nat.land (Nat.shiftRight kr 14) 31) rr 0 0
        (fun C nc => Nat.blt (Nat.add nc (pc1 (Nat.sub X (Nat.land X C)))) nu))

def kills2 (Fn Nw w0 ME MC b1 nu : Nat) (ks : List Nat) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun kr _ ih => kill2 Fn Nw w0 ME MC b1 nu kr && ih) ks

/-- one node (parent state `S D N dP`), static table `c2` of the last label, record `rec`, kills `ks` -/
def node2 (S D N dP c2 rec : Nat) (ks : List Nat) (k : Nat → Nat → Nat → Bool) : Bool :=
  let last := Nat.land (Nat.shiftRight rec 8) 511
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let nV := Nat.land (Nat.shiftRight rec 22) 1023
  let nE := Nat.land (Nat.shiftRight rec 32) 1023
  let nC1 := Nat.land (Nat.shiftRight rec 42) 1023
  let nC2 := Nat.land (Nat.shiftRight rec 52) 1023
  let m := Nat.add (Nat.add nV nE) (Nat.add nC1 nC2)
  let S' := Nat.lor S (Nat.shiftLeft 1 last)
  let N' := Nat.lor N c2
  let body := Nat.shiftRight rec 64
  let MB := Nat.land body (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 9)) 1)
  let E := Nat.land (Nat.shiftRight body (Nat.shiftLeft m 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 3)) 1)
  let w0 := Nat.succ last
  let D' := Nat.lor D (orFold 10 (Nat.land MB (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 9)) 1)) nV)
  let CH := Nat.shiftLeft (Nat.shiftRight M511 w0) w0
  let ME := Nat.land (Nat.shiftRight MB (Nat.shiftLeft nV 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nE 9)) 1)
  let MC := Nat.shiftRight MB (Nat.shiftLeft (Nat.add nV nE) 9)
  -- expected counts = caps minus the block residuals 0 / 1 / 1 / 2 are the claimed bytes E; caps = E + residual
  Nat.blt last 511 && Nat.beq (Nat.shiftRight S last) 0 && Nat.beq d (Nat.succ dP) &&
  blocks MB E (Nat.mul S' REP63) (Nat.div (Nat.add m 62) 63) &&
  kills2 (Nat.sub CH (Nat.land CH D')) (Nat.shiftRight N' (Nat.shiftLeft w0 9)) w0 ME MC nC1
    (Nat.sub 21 d) ks &&
  k S' D' N'

/-- a batch: stack of `(S, D, N, d)` (deepest first), nodes `(c2, rec, kills)` -/
def batch2 : List (Nat × Nat × Nat × Nat) → List (Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, rec, ks) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, dP) :: st' =>
      node2 S D N dP c2 rec ks (fun S' D' N' => batch2 ((S', D', N', Nat.succ dP) :: (S, D, N, dP) :: st') rest)

end L1
end
