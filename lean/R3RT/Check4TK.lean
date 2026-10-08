module
public import R22Port.U_d41d8cd98f00
public import R3RT.Check4T
/-! Variants of `batch4T` (same records, same table, same checks) for the per-reference cost:
* `batch4TK`: rows fetched in continuation-passing style (an explicit `Nat.rec` with the mask block as an argument and the final
  block passed to a continuation), no `Prod` accumulator and no projections;
* `batch4TL`: the same, with the table indices given as a list of literals (`refs`), so that a row cited twice in one declaration
  is the same kernel term `tab k` and its fetch is shared through the kernel's cache.
Both check claimed count + residual = cap per row (residual 0 for V rows, 1 for ex / c1, 2 for c2) and, for `TL`, that `refs`
has exactly the record's `m` entries. -/
@[expose] public section
noncomputable section
namespace R3RT

/-- CPS fetch of rows `i, i+1, …, m-1` (`n` = m - i of them) from the packed indices `RI` -/
def fetchK (tab : Nat → Nat) (E RI nV n1 : Nat) : Nat → Nat → Nat → (Nat → Bool) → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → (Nat → Bool) → Bool)
    (fun _ MB k => k MB)
    (fun _ ih i MB k =>
      let t := tab (Nat.land (Nat.shiftRight RI (Nat.mul 16 i)) 65535)
      Nat.beq (Nat.land (Nat.shiftRight t 511) 511)
        (Nat.add (Nat.land (Nat.shiftRight E (Nat.mul 8 i)) 255) (Nat.add (Nat.sub 1 (Nat.sub nV i)) (Nat.sub 1 (Nat.sub n1 i)))) &&
      ih (Nat.succ i) (Nat.lor MB (Nat.shiftLeft (Nat.land t M511) (Nat.mul 512 i))) k)

def batch4TK' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, E, RI, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.add nV (Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 42) 1023))
      let m := Nat.add n1 (Nat.land (Nat.shiftRight hdr 52) 1023)
      fetchK tab E RI nV n1 m 0 0 (fun MB =>
        L1.node4 S D N U dP c2 h suf
          (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
          (fun S' D' N' U' => batch4TK' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))

def batch4TK (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × Nat × Nat × List Nat)) : Bool :=
  batch4TK' tab st nodes

/-- CPS fetch over a list of literal table indices; the continuation receives the mask block and the number of rows -/
def fetchL (tab : Nat → Nat) (E nV n1 : Nat) : List Nat → Nat → Nat → (Nat → Nat → Bool) → Bool :=
  List.rec (motive := fun _ => Nat → Nat → (Nat → Nat → Bool) → Bool)
    (fun i MB k => k MB i)
    (fun ri _ ih i MB k =>
      let t := tab ri
      Nat.beq (Nat.land (Nat.shiftRight t 511) 511)
        (Nat.add (Nat.land (Nat.shiftRight E (Nat.mul 8 i)) 255) (Nat.add (Nat.sub 1 (Nat.sub nV i)) (Nat.sub 1 (Nat.sub n1 i)))) &&
      ih (Nat.succ i) (Nat.lor MB (Nat.shiftLeft (Nat.land t M511) (Nat.mul 512 i))) k)

def batch4TL' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × Nat × List Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, E, refs, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.add nV (Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 42) 1023))
      let m := Nat.add n1 (Nat.land (Nat.shiftRight hdr 52) 1023)
      fetchL tab E nV n1 refs 0 0 (fun MB cnt =>
        Nat.beq cnt m &&
        L1.node4 S D N U dP c2 h suf
          (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor MB (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
          (fun S' D' N' U' => batch4TL' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest))

def batch4TL (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × Nat × List Nat × List Nat)) : Bool :=
  batch4TL' tab st nodes

end R3RT
end
