module
public import R22Port.U_d41d8cd98f00
public import BranchCheck7s
/-! # BranchCheck v7L: v7s with SAT leaves (the L479 lift test)

The v7s node walk (`BC7s.checkS`) with one more leaf kind.  A `br` node whose term field is `t = 31` (never a term,
since `n ≤ 31`) is a **SAT leaf**: all terms are assigned (`ACT = 0`), the next 24 bits give a length `len` and the
following `len` bits a certificate `w` for the test.  The leaf passes when `lt asg w = true`, where `asg` is the
assignment `(a, b, c)` of the path (most recent first).  The test `lt` is a parameter; `S7L.LiftTest lt` is its
soundness (at most one of the three lift classes lifts for the decomposition `asg`).  Every other node is v7s's. -/
@[expose] public section
namespace BC7L
open BC4 BC5 BC6 BC6s BC7T BC7s

noncomputable section

/-- the node walk with SAT leaves (`lt`: the leaf test) -/
def checkSL (lt : Asg → Nat → Bool) (fuel : Nat) : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (fun _ _ _ _ _ _ _ S => (false, S))
    (fun _ ih TERMS SS ACT need asg recs dom S =>
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         (bit dom X && over6 SS ACT asg X, sk 10 S))
        (cond (Nat.beq (rd 6 S) 63)
          (let len := rd 24 (sk 6 S)
           (Nat.beq ACT 0 && lt asg (rd len (sk 30 S)), sk len (sk 30 S)))
          (let S1 := sk 1 S
           let t := rd 5 S1
           let sym := Nat.beq (rd 1 (sk 5 S1)) 1
           let cdir := Nat.beq (rd 1 (sk 6 S1)) 1
           let ntr := rdList (rd 4 (sk 7 S1)) (sk 11 S1)
           let slr := rdList (rd 3 ntr.2) (sk 3 ntr.2)
           let nt := ntr.1
           let sl := slr.1
           let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
           let nr := mkRecs6 SS ACT asg nt []
           let part := thru a recs (thru a nr.2 [])
           let allr := app recs nr.2
           let ss := mkSls6 SS ACT asg sl
           let lgm := lgMask need t
           let B := andLm part (Nat.land (Nat.land ALLNZ lgm) (cond sym ORBM M512))
           let Cb := andRm part (Nat.land ALLNZ lgm)
           let cs : List (Nat × Nat) := cond cdir
             (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
             (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B)))
           let ACT' := Nat.xor ACT (Nat.shiftLeft 1 t)
           let kr := @List.rec (Nat × Nat) (fun _ => Nat → Bool × Nat) (fun S => (true, S))
             (fun p _ ihc S => let r := ih TERMS SS ACT' need ((a, p.1, p.2) :: asg) (updRecs a p.1 p.2 allr) dom S
                cond r.1 (ihc r.2) (false, r.2)) cs slr.2
           (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
            kr.2))))
    fuel

/-- one leaf record (v6 stream format, as `BC7s.leafS`), checked with SAT leaves -/
def leafSL (lt : Asg → Nat → Bool) (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm
  let RS := rkSum T n
  Nat.ble n 31 &&
    ((lg && Nat.blt RS 27) ||
     (checkSL lt 64 T (mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) (cond lg (needP T n (Nat.sub RS 27)) 0) [] []
       (cond dm ALLNZ (rd 512 (sk 2 R1))) (cond dm (sk 2 R1) (sk 514 R1))).1)

end
end BC7L
