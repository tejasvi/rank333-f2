module
public import R22Port.U_d41d8cd98f00
public import R3RT.Check4TD
/-! # L1 node checker v5 (R3): each row once per record, static cap-1/cap-2 dead points from the conflict table

Changes against `L1.node4` (r22/lean/l1/lean/L1/Check4.lean), everything else unchanged (`L1.kills4`, `L1.blocks`, the hyperplane
tests):
* **Dead set.** `D' = D ∪ N[last] ∪ (V rows)`. `N[last]` is slot `last` of the frame's conflict table `N = CONF1 ∪ ⋃_{p ∈ S} c2t_p`:
  the labels sharing a cap-1 row with `last`, or a cap-2 row with `last` and a prefix point. Those rows are full at `S ∪ {last}`, so
  their other points are dead. V rows of cap ≤ 2 need no citation; the V rows left are full rows of cap ≥ 3.
* **One residual-1 list.** The record's rows are V (residual 0), R1 (residual 1) and R2 (residual 2), each row once. Exclusions
  index R1 (`ME` = the R1 rows only, so an index past R1 reads 0 and fails the `u ∈ A` test); covers index R1 ∪ R2 (`MC`, side
  test `u ∉ row` below `b1 = |R1|`, `u ∈ row` above). A row that is an exclusion row for one child and a cover row for another is
  cited once.
Header as v4 with `nE = |R1|`, `nC1 = 0`, `nC2 = |R2|`. -/
@[expose] public section
noncomputable section
namespace R3RT

/-- `L1.kills4` with a guard: at most 512 kills (its SWAR popcounts and guard bits are 512 slots wide) -/
def kills5 (XS w0 ME MC b1 nu : Nat) (ks : List Nat) : Bool :=
  List.rec (motive := fun _ => Nat → Nat → Nat → Bool)
    (fun j KS NC => Nat.ble j 512 && Nat.beq (Nat.land (Nat.add (Nat.add (L1.pcF31 KS) NC)
        (Nat.mul (Nat.sub 32768 nu) (Nat.shiftRight L1.REPF31 (Nat.shiftLeft (Nat.sub 512 j) 9)))) L1.GUARD) 0)
    (fun kr _ ih j KS NC => L1.kill4 XS w0 ME MC b1 kr j KS NC (fun KS' NC' => ih (Nat.succ j) KS' NC'))
    ks 0 0 0

def node5 (S D N U dP c2 h suf rec : Nat) (ks : List Nat) (k : Nat → Nat → Nat → Nat → Bool) : Bool :=
  let last := Nat.land (Nat.shiftRight rec 8) 511
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let nV := Nat.land (Nat.shiftRight rec 22) 1023
  let n1 := Nat.land (Nat.shiftRight rec 32) 1023
  let n2 := Nat.land (Nat.shiftRight rec 52) 1023
  let m := Nat.add nV (Nat.add n1 n2)
  let S' := Nat.lor S (Nat.shiftLeft 1 last)
  let N' := Nat.lor N c2
  let U' := Nat.add U h
  let body := Nat.shiftRight rec 64
  let MB := Nat.land body (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 9)) 1)
  let E := Nat.land (Nat.shiftRight body (Nat.shiftLeft m 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 3)) 1)
  let w0 := Nat.succ last
  let W := Nat.sub 511 w0
  let D' := Nat.lor (Nat.lor D (Nat.land (Nat.shiftRight N (Nat.shiftLeft last 9)) L1.M512))
              (L1.orFold 10 (Nat.land MB (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 9)) 1)) nV)
  let CH := Nat.shiftLeft (Nat.shiftRight L1.M511 w0) w0
  let Fn := Nat.sub CH (Nat.land CH D')
  let REPW := Nat.shiftRight L1.REPALL (Nat.shiftLeft (Nat.sub 512 W) 9)
  let SPW := Nat.shiftRight L1.SP513 (Nat.mul 513 (Nat.sub 512 W))
  let UT := Nat.sub (Nat.add (Nat.mul L1.M511 REPW) REPW) (Nat.shiftLeft SPW (Nat.succ w0))
  let XA := Nat.land (Nat.mul Fn REPW) UT
  let XS := Nat.sub XA (Nat.land XA (Nat.shiftRight N' (Nat.shiftLeft w0 9)))
  let MC := Nat.shiftRight MB (Nat.shiftLeft nV 9)
  let ME := Nat.land MC (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft n1 9)) 1)
  Nat.blt last 511 && Nat.beq (Nat.shiftRight S last) 0 && Nat.beq d (Nat.succ dP) &&
  Nat.beq (Nat.land (Nat.shiftRight rec 42) 1023) 0 &&
  Nat.beq (Nat.land (Nat.add (Nat.add U' (Nat.mul (Nat.sub 22 d) L1.ONES7)) L1.OFFN7) L1.G7) L1.G7 &&
  Nat.beq (Nat.land (Nat.add (Nat.add U' suf) L1.OFFN7) L1.G7) L1.G7 &&
  L1.blocks MB E (Nat.mul S' L1.REP63) (Nat.div (Nat.add m 62) 63) &&
  kills5 XS w0 ME MC n1 (Nat.sub 21 d) ks &&
  k S' D' N' U'

/-- a batch of v5 records, rows by literal table index per class (V, R1, R2 lists, each reversed), counts derived as in
`batch4TD` -/
def batch5TD' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, r2, r1, r0, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.land (Nat.shiftRight hdr 32) 1023
      let n2 := Nat.land (Nat.shiftRight hdr 52) 1023
      let m := Nat.add nV (Nat.add n1 n2)
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            Nat.beq bad 0 && Nat.beq c2' n2 && Nat.beq c1' n1 && Nat.beq c0' nV &&
            node5 S D N U dP c2 h suf
              (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
              (fun S' D' N' U' => batch5TD' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))

def batch5TD (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat)) : Bool :=
  batch5TD' tab st nodes

/-- inline v5 batch (masks in the record, no binding), for timing against `L1.batch4` -/
def batch5 : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, rec, ks) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      node5 S D N U dP c2 h suf rec ks
        (fun S' D' N' U' => batch5 ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest)

end R3RT
end

noncomputable section
namespace R3RT
/-- **The frame of a node without a child loop** (cut nodes and leaves; kinds stream REQUESTS.md 6): `node5` without kills and
without the hyperplane tests. The record holds only V rows (`nE = nC1 = nC2 = 0`); the continuation gets the node's frame
`(S', D', N', U')` with `D' = D ∪ N[last] ∪ (V rows)`. -/
def frame5 (S D N U dP c2 h rec : Nat) (k : Nat → Nat → Nat → Nat → Bool) : Bool :=
  let last := Nat.land (Nat.shiftRight rec 8) 511
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let nV := Nat.land (Nat.shiftRight rec 22) 1023
  let S' := Nat.lor S (Nat.shiftLeft 1 last)
  let body := Nat.shiftRight rec 64
  let MB := Nat.land body (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 9)) 1)
  let E := Nat.land (Nat.shiftRight body (Nat.shiftLeft nV 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 3)) 1)
  let D' := Nat.lor (Nat.lor D (Nat.land (Nat.shiftRight N (Nat.shiftLeft last 9)) L1.M512)) (L1.orFold 10 MB nV)
  Nat.blt last 511 && Nat.beq (Nat.shiftRight S last) 0 && Nat.beq d (Nat.succ dP) &&
  Nat.beq (Nat.land (Nat.shiftRight rec 32) 1073741823) 0 &&
  L1.blocks MB E (Nat.mul S' L1.REP63) (Nat.div (Nat.add nV 62) 63) &&
  k S' D' (Nat.lor N c2) (Nat.add U h)
end R3RT
end
