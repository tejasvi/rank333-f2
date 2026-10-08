module
public import R22Port.U_d41d8cd98f00
public import BranchCheck7s
/-! # BranchCheck v7x: v7s with external subtrees (subtree batches for big leaves)

A big leaf certificate is split into a **main** record and **sub-records**.  In the main record a subtree may be replaced by an
external marker (a dead node with `X = 0`, which `BC7s.checkS` never accepts).  The checker `checkSX` carries the path from the
leaf root (the branch data `(t, sym, cdir, nt, sl)` of every node passed and the index `i` of the candidate taken) and the list of
sub-record paths in DFS order; an external marker takes the next path of the list, which must be its own.  A sub-record for path `P` is checked on its own (`subOK`): `walk`
replays `P` from the root state, and `BC7s.checkS` checks the subtree certificate from there.  `S7/Split.lean` proves that an
accepted main record and accepted sub-records for all of `paths` refute the leaf (`leafSplit_sound`). -/
@[expose] public section
namespace BC7x
open BC4 BC5 BC6 BC6s BC7T BC7s

noncomputable section

/-- one step of a path: branch data and the candidate index -/
abbrev Step := Nat × Bool × Bool × List Nat × List Nat × Nat

/-- the candidates of a branch node (as `BC7s.checkS` computes them) -/
def cands (TERMS SS ACT need : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    List (Nat × Nat) :=
  let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
  let nr := mkRecs6 SS ACT asg nt []
  let part := thru a recs (thru a nr.2 [])
  let ss := mkSls6 SS ACT asg sl
  let lgm := lgMask need t
  let B := andLm part (Nat.land (Nat.land ALLNZ lgm) (cond sym ORBM M512))
  let Cb := andRm part (Nat.land ALLNZ lgm)
  cond cdir (cond (Nat.beq Cb 0) [] (cond (Nat.beq B 0) [] (candsC part ss.2 B (bitsOf Cb))))
    (cond (Nat.beq B 0) [] (candsB7 sym part ss.2 Cb (bitsOf B)))

/-- the child state of candidate `p` -/
def childSt (TERMS SS ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (nt : List Nat) (p : Nat × Nat) :
    Nat × Asg × List Rec :=
  let a := Nat.land (Nat.shiftRight TERMS (Nat.mul 9 t)) 511
  (Nat.xor ACT (Nat.shiftLeft 1 t), (a, p.1, p.2) :: asg, updRecs a p.1 p.2 (app recs (mkRecs6 SS ACT asg nt []).2))

/-- replay a path from a state -/
def walk (TERMS SS need : Nat) : Nat × Asg × List Rec → List Step → Nat × Asg × List Rec
  | st, [] => st
  | st, (t, sym, cdir, nt, sl, i) :: P =>
    walk TERMS SS need (childSt TERMS SS st.1 st.2.1 st.2.2 t nt
      ((cands TERMS SS st.1 need st.2.1 st.2.2 t sym cdir nt sl).getD i (0, 0))) P

/-- `BC7s.checkS` with external subtrees: `pth` is the reversed path to the node; `ps` the sub-record paths not yet used (in
DFS order): an external marker takes the next one, which must be its path -/
def checkSX (fuel : Nat) :
    Nat → Nat → Nat → Nat → Asg → List Rec → Nat → List Step → List (List Step) → Nat → Bool × List (List Step) × Nat :=
  @Nat.rec (fun _ => Nat → Nat → Nat → Nat → Asg → List Rec → Nat → List Step → List (List Step) → Nat →
      Bool × List (List Step) × Nat)
    (fun _ _ _ _ _ _ _ _ ps S => (false, ps, S))
    (fun _ ih TERMS SS ACT need asg recs dom pth ps S =>
      cond (Nat.beq (rd 1 S) 0)
        (let X := rd 9 (sk 1 S)
         cond (Nat.beq X 0)
           (@List.rec (List Step) (fun _ => Bool × List (List Step) × Nat) (false, [], sk 10 S)
              (fun P ps' _ => (P == pth.reverse, ps', sk 10 S)) ps)
           (bit dom X && over6 SS ACT asg X, ps, sk 10 S))
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
         let cs := cands TERMS SS ACT need asg recs t sym cdir nt sl
         let ss := mkSls6 SS ACT asg sl
         let kr := @List.rec (Nat × Nat) (fun _ => Nat → List (List Step) → Nat → Bool × List (List Step) × Nat)
           (fun _ ps S => (true, ps, S))
           (fun p _ ihc i ps S =>
              let st := childSt TERMS SS ACT asg recs t nt p
              let r := ih TERMS SS st.1 need st.2.1 st.2.2 dom ((t, sym, cdir, nt, sl, i) :: pth) ps S
              cond r.1 (ihc (Nat.succ i) r.2.1 r.2.2) (false, r.2.1, r.2.2)) cs 0 ps slr.2
         (bit ACT t && ((!sym) || asg.isEmpty) && allDom dom nt && nr.1 && allDom dom sl && allThru a sl && ss.1 && kr.1,
          kr.2.1, kr.2.2)))
    fuel

/-- the header of a leaf record: `(n, T, dom, need, cert)` as `BC7s.leafS` reads them -/
def hdr (R : Nat) : Nat × Nat × Nat × Nat × Nat :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm
  let RS := rkSum T n
  (n, T, cond dm ALLNZ (rd 512 (sk 2 R1)), cond lg (needP T n (Nat.sub RS 27)) 0, cond dm (sk 2 R1) (sk 514 R1))

/-- the main record of a split leaf (as `BC7s.leafS`, with external subtrees at `paths`) -/
def leafSX (R : Nat) (paths : List (List Step)) : Bool :=
  let n := rd 6 R
  let T := rd (Nat.mul 9 n) (sk 6 R)
  let R1 := sk (Nat.add 6 (Nat.mul 9 n)) R
  let dm := Nat.beq (rd 1 R1) 0
  let lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm
  let RS := rkSum T n
  Nat.ble n 31 &&
    ((lg && Nat.blt RS 27) ||
     (checkSX 64 T (mkSSP T n) (Nat.pred (Nat.shiftLeft 1 n)) (cond lg (needP T n (Nat.sub RS 27)) 0) [] []
       (cond dm ALLNZ (rd 512 (sk 2 R1))) [] paths (cond dm (sk 2 R1) (sk 514 R1))).1)

/-- a sub-record: the subtree at path `P` of the leaf with header `R`, certificate `cert` -/
def subOK (R : Nat) (P : List Step) (cert : Nat) : Bool :=
  let h := hdr R
  let st := walk h.2.1 (mkSSP h.2.1 h.1) h.2.2.2.1 (Nat.pred (Nat.shiftLeft 1 h.1), [], []) P
  Nat.ble h.1 31 && (BC7s.checkS 64 h.2.1 (mkSSP h.2.1 h.1) st.1 h.2.2.2.1 st.2.1 st.2.2 h.2.2.1 cert).1

end
end BC7x
