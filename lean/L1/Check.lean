module
public import R22Port.U_d41d8cd98f00
public import L1.Consts
/-! # L1 main-search node checker, prototype (r22/lean/DESIGN.md section 20)

Labels are 0..510 (`--rord 123`); a mask is a Nat with bit `l` for label `l`.  Per depth the checker keeps
* `S`: the prefix mask;
* `D`: the dead mask, the union of the full rows cited at the node and at its ancestors;
* `N`: the static exclusion table, 511 slots of 512 bits.  Slot `u` holds the labels that cannot join `u`:
  cap-1 rows through `u`, and cap-2 rows through `u` and a prefix point.  It is `CONF1T` or-ed with the table `c2t p`
  of every prefix point `p`.

A node record is one Nat with little-endian fields:
* `[0,8)` pops (stack entries to drop before the node), `[8,17)` last label, `[17,22)` d = |prefix|, `[22,32)` m (rows),
  `[32,42)` nV (full rows cited here), `[42,52)` nK (kills);
* from bit 64, `MB` = m row masks of 512 bits (rows `0..nV-1` are the cited full rows), then `E` = m bytes (claimed
  counts `|S ∩ R|`), `R` = m bytes (residuals `cap - count`), then the kills;
* a kill is `u (9) | nr (5) | nr refs of 11 bits` (row index 10 | cover flag 1).

The checks, all bulk except the per-reference work:
* the claimed counts of all `m` rows, 63 rows per block: one AND with the replicated prefix, a SWAR popcount of the
  63 slots, a gather of the 63 counts into bytes (one multiplication), one comparison;
* the cited rows have residual 0, and the dead mask grows by their or-fold;
* each kill: `X` = free children above `u` minus the static slot `u`; an exclusion reference (residual ≤ 1, `u` in the
  row) removes the row; a cover reference (residual at the child = `r - [u ∈ R]` = 1) adds the row to the cover and
  costs 1; the child is dead when `#cover + |X \ cover| < 21 - d`.  The final counts of all kills of the node are one
  16-bit SWAR popcount and one guard-bit test.

Row masks and caps are trusted data in this prototype (`E + R` is the cap); binding rows to the capacity facts is
separate (section 20).  -/
@[expose] public section
namespace L1

/-- per-byte popcounts (each byte ≤ 8) -/
def swar3 (x : Nat) : Nat :=
  let a := Nat.sub x (Nat.land (Nat.shiftRight x 1) K55)
  let b := Nat.add (Nat.land a K33) (Nat.land (Nat.shiftRight a 2) K33)
  Nat.land (Nat.add b (Nat.shiftRight b 4)) K0F

/-- popcount of each 512-bit slot (slot totals ≤ 22) in the low byte of the slot -/
def pcSlots (x : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul (swar3 x) SUM64) 504) LB

/-- popcount of each 512-bit slot (≤ 511) in bits 496..511 of the slot -/
def pcF31 (x : Nat) : Nat :=
  let c := swar3 x
  Nat.land (Nat.mul (Nat.land (Nat.add c (Nat.shiftRight c 8)) K00FF) SUM32) F31

/-- or of the first `n` 512-bit slots of `x` (`x` has no bits above them), `fuel` halvings -/
def orFold : Nat → Nat → Nat → Nat
  | 0, x, _ => Nat.land x M512
  | fuel+1, x, n => cond (Nat.ble n 1) (Nat.land x M512)
      (orFold fuel (Nat.lor x (Nat.shiftRight x (Nat.mul 512 (Nat.shiftRight (Nat.succ n) 1)))) (Nat.shiftRight (Nat.succ n) 1))

/-- claimed counts, `nb` blocks of 63 rows: `S63` = prefix replicated into 63 slots -/
def blocks (MB E S63 : Nat) : Nat → Bool
  | 0 => true
  | nb+1 =>
    Nat.beq (Nat.land (Nat.shiftRight (Nat.mul (pcSlots (Nat.land MB (Nat.land S63 MBLK))) GATH) 31248) EBLK) (Nat.land E EBLK) &&
      blocks (Nat.shiftRight MB 32256) (Nat.shiftRight E 504) S63 nb

/-- the references of one kill -/
def refs (MB R u : Nat) : Nat → Nat → Nat → Nat → Nat → Nat → (Nat → Nat → Nat → Nat → Nat → Bool) → Bool
  | 0, rr, X, C, nc, A, k => k X C nc A rr
  | n+1, rr, X, C, nc, A, k =>
    let i := Nat.land rr 1023
    let mask := Nat.land (Nat.shiftRight MB (Nat.mul 512 i)) M512
    let r := Nat.land (Nat.shiftRight R (Nat.mul 8 i)) 255
    cond (Nat.beq (Nat.land (Nat.shiftRight rr 10) 1) 0)
      (Nat.ble r 1 && refs MB R u n (Nat.shiftRight rr 11) (Nat.sub X (Nat.land X mask)) C nc (Nat.land A mask) k)
      (Nat.beq r (Nat.succ (Nat.land (Nat.shiftRight mask u) 1)) &&
        refs MB R u n (Nat.shiftRight rr 11) X (Nat.lor C mask) (Nat.succ nc) A k)

/-- the kills of a node; `Nw` = static table from slot `w0` = last + 1 on; collects the final free sets (slot `j`) and
the cover counts (bits 496.. of slot `j`) -/
def kills (MB R Fn Nw w0 : Nat) : Nat → Nat → Nat → Nat → Nat → (Nat → Nat → Bool) → Bool
  | 0, _, _, KS, NC, k => k KS NC
  | n+1, kr, j, KS, NC, k =>
    let u := Nat.land kr 511
    let X0 := Nat.land Fn (Nat.shiftLeft (Nat.shiftRight M511 (Nat.succ u)) (Nat.succ u))
    let Z := Nat.land (Nat.shiftRight Nw (Nat.mul 512 (Nat.sub u w0))) M512
    refs MB R u (Nat.land (Nat.shiftRight kr 9) 31) (Nat.shiftRight kr 14) (Nat.sub X0 (Nat.land X0 Z)) 0 0 M512
      (fun X C nc A rest =>
        Nat.blt u 511 && Nat.ble w0 u && Nat.beq (Nat.land (Nat.shiftRight A u) 1) 1 &&
        kills MB R Fn Nw w0 n rest (Nat.succ j)
          (Nat.lor KS (Nat.shiftLeft (Nat.sub X (Nat.land X C)) (Nat.mul 512 j)))
          (Nat.lor NC (Nat.shiftLeft nc (Nat.add (Nat.mul 512 j) 496))) k)

/-- one node: parent state `S D N` and depth `dP`, the static table `c2` of the last label, record `rec`; continues
with the node's state -/
def node (S D N dP c2 rec : Nat) (k : Nat → Nat → Nat → Bool) : Bool :=
  let last := Nat.land (Nat.shiftRight rec 8) 511
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let m := Nat.land (Nat.shiftRight rec 22) 1023
  let nV := Nat.land (Nat.shiftRight rec 32) 1023
  let nK := Nat.land (Nat.shiftRight rec 42) 1023
  let S' := Nat.lor S (Nat.shiftLeft 1 last)
  let N' := Nat.lor N c2
  let body := Nat.shiftRight rec 64
  let MB := Nat.land body (Nat.sub (Nat.shiftLeft 1 (Nat.mul 512 m)) 1)
  let rest := Nat.shiftRight body (Nat.mul 512 m)
  let mB := Nat.sub (Nat.shiftLeft 1 (Nat.mul 8 m)) 1
  let E := Nat.land rest mB
  let R := Nat.land (Nat.shiftRight rest (Nat.mul 8 m)) mB
  let w0 := Nat.succ last
  let D' := Nat.lor D (orFold 10 (Nat.land MB (Nat.sub (Nat.shiftLeft 1 (Nat.mul 512 nV)) 1)) nV)
  let CH := Nat.shiftLeft (Nat.shiftRight M511 w0) w0
  Nat.blt last 511 && Nat.beq (Nat.shiftRight S last) 0 && Nat.beq d (Nat.succ dP) &&
  Nat.beq (Nat.land R (Nat.sub (Nat.shiftLeft 1 (Nat.mul 8 nV)) 1)) 0 &&
  blocks MB E (Nat.mul S' REP63) (Nat.div (Nat.add m 62) 63) &&
  kills MB R (Nat.sub CH (Nat.land CH D')) (Nat.shiftRight N' (Nat.mul 512 w0)) w0 nK
    (Nat.shiftRight rest (Nat.mul 16 m)) 0 0 0
    (fun KS NC => Nat.beq (Nat.land (Nat.add (Nat.add (pcF31 KS) NC)
        (Nat.mul (Nat.sub 32768 (Nat.sub 21 d)) (Nat.shiftRight REPF31 (Nat.mul 512 (Nat.sub 512 nK))))) GUARD) 0) &&
  k S' D' N'

/-- a batch of nodes in DFS order: stack of `(S, D, N, d)` states (deepest first), nodes `(c2, rec)` -/
def batch : List (Nat × Nat × Nat × Nat) → List (Nat × Nat) → Bool
  | _, [] => true
  | st, (c2, rec) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, dP) :: st' =>
      node S D N dP c2 rec (fun S' D' N' => batch ((S', D', N', Nat.succ dP) :: (S, D, N, dP) :: st') rest)

end L1
