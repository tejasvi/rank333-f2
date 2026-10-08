module
public import R22Port.U_d41d8cd98f00
public import L1.Check3
public import L1.Consts4
/-! # L1 node checker v4 (r22/lean/DESIGN.md section 20)

v3 with the per-kill fixed costs moved to node level:
* the free set of every child `u` in the window (labels > last) minus its static slot is built for all children at
  once: `XS` = window slots, slot `j` = `Fn ∩ above(w0 + j) ∖ N'[w0 + j]` (one multiplication, a few window-wide ops);
* a kill reads its slot of `XS`; its final set goes to slot `j` (kill index) of `KS` and its cover count to bits
  `496..` of the same slot of `NC`; one 16-bit SWAR popcount and one guard test per node finish all kills.
Kill record as in v2. -/
@[expose] public section
noncomputable section
namespace L1

/-- one kill: `XS` (window slots), exclusion and cover blocks, `j` its index; continues with `KS`, `NC` -/
def kill4 (XS w0 ME MC b1 kr : Nat) (j KS NC : Nat) (k : Nat → Nat → Bool) : Bool :=
  let u := Nat.land kr 511
  let X1 := Nat.land (Nat.shiftRight XS (Nat.shiftLeft (Nat.sub u w0) 9)) M512
  Nat.ble w0 u && Nat.blt u 511 &&
  excl ME (Nat.land (Nat.shiftRight kr 9) 31) (Nat.shiftRight kr 19) X1 M512
    (fun rr X A => Nat.beq (Nat.land (Nat.shiftRight A u) 1) 1 &&
      cover MC u b1 (Nat.land (Nat.shiftRight kr 14) 31) rr 0 0
        (fun C nc => k (Nat.lor KS (Nat.shiftLeft (Nat.sub X (Nat.land X C)) (Nat.shiftLeft j 9)))
                       (Nat.lor NC (Nat.shiftLeft nc (Nat.add (Nat.shiftLeft j 9) 496)))))

/-- the kills of a node; at the end one popcount and one guard test with `nu` points needed -/
def kills4 (XS w0 ME MC b1 nu : Nat) (ks : List Nat) : Bool :=
  List.rec (motive := fun _ => Nat → Nat → Nat → Bool)
    (fun j KS NC => Nat.beq (Nat.land (Nat.add (Nat.add (pcF31 KS) NC)
        (Nat.mul (Nat.sub 32768 nu) (Nat.shiftRight REPF31 (Nat.shiftLeft (Nat.sub 512 j) 9)))) GUARD) 0)
    (fun kr _ ih j KS NC => kill4 XS w0 ME MC b1 kr j KS NC (fun KS' NC' => ih (Nat.succ j) KS' NC'))
    ks 0 0 0

def node4 (S D N U dP c2 h suf rec : Nat) (ks : List Nat) (k : Nat → Nat → Nat → Nat → Bool) : Bool :=
  let last := Nat.land (Nat.shiftRight rec 8) 511
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let nV := Nat.land (Nat.shiftRight rec 22) 1023
  let nE := Nat.land (Nat.shiftRight rec 32) 1023
  let nC1 := Nat.land (Nat.shiftRight rec 42) 1023
  let nC2 := Nat.land (Nat.shiftRight rec 52) 1023
  let m := Nat.add (Nat.add nV nE) (Nat.add nC1 nC2)
  let S' := Nat.lor S (Nat.shiftLeft 1 last)
  let N' := Nat.lor N c2
  let U' := Nat.add U h
  let body := Nat.shiftRight rec 64
  let MB := Nat.land body (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 9)) 1)
  let E := Nat.land (Nat.shiftRight body (Nat.shiftLeft m 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft m 3)) 1)
  let w0 := Nat.succ last
  let W := Nat.sub 511 w0
  let D' := Nat.lor D (orFold 10 (Nat.land MB (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 9)) 1)) nV)
  let CH := Nat.shiftLeft (Nat.shiftRight M511 w0) w0
  let Fn := Nat.sub CH (Nat.land CH D')
  -- window slots j < W (child w0 + j): REPW = bit 0 of each slot; UT = slot j holds the labels above w0 + j:
  -- 2^511 - 2^(w0+j+1) per slot, i.e. M511 * REPW + REPW - (sum_j 2^(513 j)) * 2^(w0+1), no borrow between slots
  let REPW := Nat.shiftRight REPALL (Nat.shiftLeft (Nat.sub 512 W) 9)
  let SPW := Nat.shiftRight SP513 (Nat.mul 513 (Nat.sub 512 W))
  let UT := Nat.sub (Nat.add (Nat.mul M511 REPW) REPW) (Nat.shiftLeft SPW (Nat.succ w0))
  let XA := Nat.land (Nat.mul Fn REPW) UT
  let XS := Nat.sub XA (Nat.land XA (Nat.shiftRight N' (Nat.shiftLeft w0 9)))
  let ME := Nat.land (Nat.shiftRight MB (Nat.shiftLeft nV 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nE 9)) 1)
  let MC := Nat.shiftRight MB (Nat.shiftLeft (Nat.add nV nE) 9)
  Nat.blt last 511 && Nat.beq (Nat.shiftRight S last) 0 && Nat.beq d (Nat.succ dP) &&
  Nat.beq (Nat.land (Nat.add (Nat.add U' (Nat.mul (Nat.sub 22 d) ONES7)) OFFN7) G7) G7 &&
  Nat.beq (Nat.land (Nat.add (Nat.add U' suf) OFFN7) G7) G7 &&
  blocks MB E (Nat.mul S' REP63) (Nat.div (Nat.add m 62) 63) &&
  kills4 XS w0 ME MC nC1 (Nat.sub 21 d) ks &&
  k S' D' N' U'

def batch4 : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, rec, ks) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      node4 S D N U dP c2 h suf rec ks
        (fun S' D' N' U' => batch4 ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest)

end L1
end
