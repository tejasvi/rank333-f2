module
public import R22Port.U_d41d8cd98f00
public import L1.Check4
public import R3RT.LabT
/-! # L1 node checker v4 with rows from a per-job verified row table (R3RT, production row path)

A job's row table `tab k` (`k < n`) holds 552-bit entries: bits 0..510 the row's label mask, bits 511..519 its cap, bits 520.. its
kept-row id.  `tabOKT rowE tab n` checks every entry against the row interface `rowE i` = the 520-bit (label mask, cap) of kept row
`i` (for `RT.K3eDL.entry`: `labMask_spec`, `capL_spec`), once per job.  A node record then carries no masks: its header (L1 v4's
first 64 bits), the claimed counts `E` (8-bit fields) and the table indices `RI` (16-bit fields) of its rows in record order
(V, ex, c1, c2).  `node4T` fetches each row from the table (a log-depth dispatcher, built by `#r3table`), checks claimed count +
residual = cap (residual 0 for V rows, 1 for ex and c1, 2 for c2), rebuilds L1's record and runs `L1.node4` unchanged. -/
@[expose] public section
noncomputable section
namespace R3RT

def M520 : Nat := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

/-- every table entry agrees with the row interface on its 520-bit (mask, cap) -/
def tabOKT (rowE tab : Nat → Nat) (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun k b => b && (let t := tab k; Nat.beq (rowE (Nat.shiftRight t 520)) (Nat.land t M520))) n

/-- the masks of a record's `m` rows (fetched by index) packed as L1's `MB`, and whether every cap matches count + residual -/
def fetchRows (tab : Nat → Nat) (E RI nV n1 m : Nat) : Nat × Bool :=
  Nat.rec (motive := fun _ => Nat × Bool) (0, true)
    (fun i acc =>
      let t := tab (Nat.land (Nat.shiftRight RI (Nat.mul 16 i)) 65535)
      let r := Nat.add (Nat.sub 1 (Nat.sub nV i)) (Nat.sub 1 (Nat.sub n1 i))
      (Nat.lor acc.1 (Nat.shiftLeft (Nat.land t M511) (Nat.mul 512 i)),
       acc.2 && Nat.beq (Nat.land (Nat.shiftRight t 511) 511) (Nat.add (Nat.land (Nat.shiftRight E (Nat.mul 8 i)) 255) r))) m

def batch4T' (tab : Nat → Nat) : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, hdr, E, RI, ks) :: rest =>
    match List.drop (Nat.land hdr 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      let nV := Nat.land (Nat.shiftRight hdr 22) 1023
      let n1 := Nat.add nV (Nat.add (Nat.land (Nat.shiftRight hdr 32) 1023) (Nat.land (Nat.shiftRight hdr 42) 1023))
      let m := Nat.add n1 (Nat.land (Nat.shiftRight hdr 52) 1023)
      let fr := fetchRows tab E RI nV n1 m
      fr.2 &&
      L1.node4 S D N U dP c2 h suf
        (Nat.lor (Nat.land hdr 18446744073709551615) (Nat.shiftLeft (Nat.lor fr.1 (Nat.shiftLeft E (Nat.mul 512 m))) 64)) ks
        (fun S' D' N' U' => batch4T' tab ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest)

/-- **A batch of a job whose row table `tab` has passed `tabOKT`.** -/
def batch4T (tab : Nat → Nat) (st : List (Nat × Nat × Nat × Nat × Nat)) (nodes : List (Nat × Nat × Nat × Nat × Nat × Nat × List Nat)) : Bool :=
  batch4T' tab st nodes

theorem m520_eq : M520 = 2 ^ 520 - 1 := by decide +kernel

end R3RT
end
