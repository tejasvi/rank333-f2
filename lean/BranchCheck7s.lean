module
public import R22Port.U_d41d8cd98f00
public import BC4Tables
public import BC6Tables
public import BC7Tables
public import BranchCheck5
public import BranchCheck6s
/-! # BranchCheck v7s: the v7 step written on v6s's code (the checker the soundness proof `S7` is about)

Same certificates, stream format and verdicts as `BranchCheck7` (the fast encoding, `R7`).  Only the candidate loop of a
`cdir = false` node changes: at a `sym` node the `c`-mask of a candidate `b` starts from `cb ∧ CORB[b]` (`candsB7`).
Every other function is v6s's (`BC6s.*`) or v5's (`BC5.*`). -/
@[expose] public section
namespace BC7s
open BC4 BC5 BC6 BC6s BC7T

noncomputable section

/-- `BC5.candsB` with the pair filter at `sym` nodes -/
def candsB7 (sym : Bool) (part : List Rec) (ss : List (Bool × Nat × Nat)) (cb : Nat) (bs : List Nat) : List (Nat × Nat) :=
  @List.rec Nat (fun _ => List (Nat × Nat)) []
    (fun b _ ih => pairs true b (cmS b ss (cmT b part (cond sym (Nat.land cb (corbM b)) cb))) ih) bs

def checkS (fuel : Nat) : Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Nat → Asg → List Rec → Nat → Nat → Bool × Nat) (fun _ _ _ _ _ _ _ S => (false, S))
    (fun _ ih TERMS SS ACT need asg recs dom S =>
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         (bit dom X && over6 SS ACT asg X, sk 10 S))
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
          kr.2)))
    fuel

/-- one leaf record (v6 stream format) -/
def leafS (R : Nat) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm
  let RS := rkSum T n
  Nat.ble n 31 &&
    ((lg && Nat.blt RS 27) ||
     (checkS 64 T (mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) (cond lg (needP T n (Nat.sub RS 27)) 0) [] []
       (cond dm ALLNZ (rd 512 (sk 2 R1))) (cond dm (sk 2 R1) (sk 514 R1))).1)

/-- a batch tree of leaf records -/
def batch (fuel D : Nat) : Bool :=
  @Nat.rec (fun _ => Nat → Bool) (fun _ => false)
    (fun _ ih D => cond (Nat.beq (rd 1 D) 1) (leafS (sk 1 D))
      (let L := rd 24 (sk 1 D); ih (rd L (sk 25 D)) && ih (sk (Nat.add 25 L) D))) fuel D

end
end BC7s
