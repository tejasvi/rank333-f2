module
public import R22Port.U_d41d8cd98f00
public import R3RT.Check4TK
/-! `batch4TD`: the literal-index row path with the counts derived instead of checked.
A record gives its rows as three literal index lists (c2 rows, ex + c1 rows, V rows), each in reverse record order.  One loop per
class (residual r = 2, 1, 0) folds, per row with entry `t`: `MB := MB <<< 512 ||| (t &&& M511)`, `E := E <<< 8 ||| (cap - r)`,
`bad := bad ||| (r - cap)`, `c := c + 1`.  Then `bad = 0` (so cap ≥ r and E + r = cap for every row), each list has the length
the header claims, and `L1.node4` runs on the rebuilt record; its `blocks` test checks every E against the prefix, so every row has
residual exactly r.  No per-row comparison and no per-row `&&`. -/
@[expose] public section
noncomputable section
namespace R3RT
/-- fold one class (residual `r`); the continuation receives (MB, E, bad, count) -/
def foldR (tab : Nat → Nat) (r : Nat) : List Nat → Nat → Nat → Nat → Nat → (Nat → Nat → Nat → Nat → Bool) → Bool :=
  List.rec (motive := fun _ => Nat → Nat → Nat → Nat → (Nat → Nat → Nat → Nat → Bool) → Bool)
    (fun MB E bad c k => k MB E bad c)
    (fun ri _ ih MB E bad c k =>
      let t := tab ri
      let cap := Nat.land (Nat.shiftRight t 511) 511
      ih (Nat.lor (Nat.shiftLeft MB 512) (Nat.land t M511)) (Nat.lor (Nat.shiftLeft E 8) (Nat.sub cap r))
        (Nat.lor bad (Nat.sub r cap)) (Nat.succ c) k)
def batch4TD' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, r2, r1, r0, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 42) 1023)
      let n2 := Nat.land (Nat.shiftRight hdr 52) 1023
      let m := Nat.add nV (Nat.add n1 n2)
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            Nat.beq bad 0 && Nat.beq c2' n2 && Nat.beq c1' n1 && Nat.beq c0' nV &&
            L1.node4 S D N U dP c2 h suf
              (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
              (fun S' D' N' U' => batch4TD' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))
def batch4TD (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat)) : Bool :=
  batch4TD' tab st nodes
end R3RT
end

noncomputable section
namespace R3RT
/-- `batch4TDU`: as `batch4TD`, but the record is a literal (L1 v4's `rec`, masks and counts included) bound to the table by one
equality of its body with the folded `MB ||| E <<< 512 m`; `node4` then reads the literal. -/
def batch4TDU' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, rec, r2, r1, r0, ks) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight rec 22) 1023
      let n1 := Nat.add (Nat.land (Nat.shiftRight rec 32) 1023) (Nat.land (Nat.shiftRight rec 42) 1023)
      let n2 := Nat.land (Nat.shiftRight rec 52) 1023
      let m := Nat.add nV (Nat.add n1 n2)
      foldR tab 2 r2 0 0 0 0 (fun MB2 E2 b2 c2' =>
        foldR tab 1 r1 MB2 E2 b2 0 (fun MB1 E1 b1 c1' =>
          foldR tab 0 r0 MB1 E1 b1 0 (fun MB E bad c0' =>
            Nat.beq bad 0 && Nat.beq c2' n2 && Nat.beq c1' n1 && Nat.beq c0' nV &&
            Nat.beq (Nat.shiftRight rec 64) (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) &&
            L1.node4 S D N U dP c2 h suf rec ks
              (fun S' D' N' U' => batch4TDU' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))))
def batch4TDU (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × List Nat × List Nat × List Nat × List Nat)) : Bool :=
  batch4TDU' tab st nodes
end R3RT
end

noncomputable section
namespace R3RT
/-- timing probe: the three folds of `batch4TD` per node and a use of MB and E, without `node4` -/
def batchFD (tab : Nat → Nat) : List (List Nat × List Nat × List Nat) → Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ ih =>
      foldR tab 2 x.1 0 0 0 0 (fun MB2 E2 b2 _ =>
        foldR tab 1 x.2.1 MB2 E2 b2 0 (fun MB1 E1 b1 _ =>
          foldR tab 0 x.2.2 MB1 E1 b1 0 (fun MB E _ _ =>
            Nat.beq (Nat.land MB E) (Nat.land MB E) && ih))))
end R3RT
end

noncomputable section
namespace R3RT
/-- 2^552 - 1 in kernel-friendly form -/
def M552Q : Nat := Nat.sub (Nat.shiftLeft 1 552) 1
/-- the table check by chunks: chunk `q` (a literal in every inner step, so its dispatch is shared by the chunk's `CH` entries),
entries `CH * q + j < N`; the entry is `Pfx.entry (CH * q + j)` by the definition of `entry` (`RTLoad.rttable`, chunk size `CH`) -/
def tabOKQ (rowE chunk : Nat → Nat) (CH N nch : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun q b => b && Nat.rec (motive := fun _ => Bool) true
      (fun j b2 => b2 && (Nat.ble N (Nat.add (Nat.mul CH q) j) ||
        (let t := Nat.land (Nat.shiftRight (chunk q) (Nat.mul 552 j)) M552Q
         Nat.beq (rowE (Nat.shiftRight t 520)) (Nat.land t M520)))) CH) nch
end R3RT
end
