module
public import NL.Check
/-! # NL.Split: native split and nested-split v7 leaves (core only)

Mirrors `BC7x` (r22/lean/leaf2/BranchCheck7x.lean, S7/Nest.lean, S7/NestT.lean): a big leaf is a main record whose certificate
has external markers (`over 0`) and sub-records, each the subtree at a path from the leaf root.
* `checkSX`: `checkS` with external markers; an external marker takes the next path of `ps`, which must be its own path.
* `walk`: replays a path from the root state (each step must name a term `< n` and 9-bit claims, else the record is rejected).
* `mainRec d p Q`: the main record at bit `p` of `d` with external paths `Q` (the kernel's `leafSX`).
* `subRec d p P Q B q e`: the sub-record at path `P` with external paths `Q`, certificate window `[q, e)` of `B`, of the leaf
  whose header is the record at bit `p` of `d` (the kernel's `subOKN`).
* `nestRecs`: a list of records with threaded sub-record slices (the kernel's `nestChkT`).
Refinement: `NLP/Split.lean`. -/
@[expose] public section
namespace NL

/-- one step of a path: branch data and the candidate index -/
abbrev Step := Nat × Bool × Bool × List Nat × List Nat × Nat

/-- the candidates of a branch node (as `checkS` computes them) -/
def cands (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (sym cdir : Bool) (nt sl : List Nat) :
    List (Nat × Nat) :=
  let a := L.terms.getD t 0
  let nr := mkRecs6 L.S ACT asg nt []
  let ss := mkSls6 L.S ACT asg sl
  let part := thru a recs (thru a nr.2 [])
  let lgm := lgMask L.need t
  let B := andLm part ((ALLNZ8.and lgm).and (cond sym ORBM8 M5128))
  let Cb := andRm part (ALLNZ8.and lgm)
  cond cdir (cond Cb.isZero [] (cond B.isZero [] (candsC part ss.2 B (M8.bLoop 512 Cb))))
    (cond B.isZero [] (candsB7 sym part ss.2 Cb (M8.bLoop 512 B)))

/-- the child state of candidate `p` -/
def childSt (L : LCtx) (ACT : Nat) (asg : Asg) (recs : List Rec) (t : Nat) (nt : List Nat) (p : Nat × Nat) :
    Nat × Asg × List Rec :=
  let a := L.terms.getD t 0
  (Nat.xor ACT (pw t), (a, p.1, p.2) :: asg, updRecs a p.1 p.2 (app recs (mkRecs6 L.S ACT asg nt []).2))

/-- a path step names a term `< n` and 9-bit claims -/
def stepOK (n : Nat) (s : Step) : Bool :=
  Nat.blt s.1 n && s.2.2.2.1.all (fun X => Nat.blt X 512) && s.2.2.2.2.1.all (fun X => Nat.blt X 512)

/-- replay a path from a state -/
def walk (L : LCtx) : Nat × Asg × List Rec → List Step → Nat × Asg × List Rec
  | st, [] => st
  | st, (t, sym, cdir, nt, sl, i) :: P =>
    walk L (childSt L st.1 st.2.1 st.2.2 t nt ((cands L st.1 st.2.1 st.2.2 t sym cdir nt sl).getD i (0, 0))) P

/-- the kids loop with the candidate index and the unused sub-record paths -/
def kloopX (f : Nat × Nat → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat) :
    List (Nat × Nat) → Nat → List (List Step) → Nat → Bool × List (List Step) × Nat
  | [], _, ps, p => (true, ps, p)
  | q :: qs, i, ps, p => let r := f q i ps p; cond r.1 (kloopX f qs (Nat.succ i) r.2.1 r.2.2) (false, r.2.1, r.2.2)

/-- `checkS` with external subtrees: `pth` the reversed path to the node, `ps` the unused sub-record paths (DFS order) -/
def checkSX (L : LCtx) : Nat → Nat → Asg → List Rec → List Step → List (List Step) → Nat → Bool × List (List Step) × Nat
  | 0, _, _, _, _, ps, p => (false, ps, p)
  | fuel + 1, ACT, asg, recs, pth, ps, p =>
    cond (Nat.beq (rdw L.d L.e p 1) 0)
      (let X := rdw L.d L.e (p + 1) 9
       cond (Nat.beq X 0)
         (match ps with
          | [] => (false, [], p + 10)
          | P :: ps' => (P == pth.reverse, ps', p + 10))
         (L.dom.bit X && over6 L.S ACT asg X, ps, p + 10))
      (let p1 := p + 1
       let t := rdw L.d L.e p1 5
       let sym := Nat.beq (rdw L.d L.e (p1 + 5) 1) 1
       let cdir := Nat.beq (rdw L.d L.e (p1 + 6) 1) 1
       let ntr := rdList L.d L.e (rdw L.d L.e (p1 + 7) 4) (p1 + 11)
       let slr := rdList L.d L.e (rdw L.d L.e ntr.2 3) (ntr.2 + 3)
       let nt := ntr.1
       let sl := slr.1
       let a := L.terms.getD t 0
       let nr := mkRecs6 L.S ACT asg nt []
       let ss := mkSls6 L.S ACT asg sl
       cond (nbit ACT t && ((!sym) || asg.isEmpty) && allDom L.dom nt && nr.1 && allDom L.dom sl && allThru a sl && ss.1)
         (kloopX (fun q i ps' p' => checkSX L fuel (Nat.xor ACT (pw t)) ((a, q.1, q.2) :: asg)
             (updRecs a q.1 q.2 (app recs nr.2)) ((t, sym, cdir, nt, sl, i) :: pth) ps' p')
           (cands L ACT asg recs t sym cdir nt sl) 0 ps slr.2)
         (false, ps, slr.2))

/-! ## Records -/

/-- the leaf header at bit `p` of `d`: its context (certificate window `[.., 8·|d|)` of `d`), term count, Lemma G flag,
rank sum, and the position of its certificate -/
def leafHdr (d : ByteArray) (p : Nat) : LCtx × Nat × Bool × Nat × Nat :=
  let e := 8 * d.size
  let n := rdw d e p 6
  let tl := (rdList d e n (p + 6)).1
  let ta := tl.toArray
  let p1 := p + 6 + 9 * n
  let dm := Nat.beq (rdw d e p1 1) 0
  let lg := Nat.beq (rdw d e (p1 + 1) 1) 1 && dm
  let RS := rkSum ta n
  (⟨d, e, ta, mkS tl, cond lg (needP ta (Nat.sub RS 27) n) 0, cond dm ALLNZ8 (rdM8 d (p1 + 2))⟩, n, lg, RS,
    cond dm (p1 + 2) (p1 + 514))

/-- the main record at bit `p` of `d`, external subtrees at the paths `Q` (the kernel's `leafSX`) -/
def mainRec (d : ByteArray) (p : Nat) (Q : List (List Step)) : Bool :=
  let h := leafHdr d p
  Nat.ble h.2.1 31 && ((h.2.2.1 && Nat.blt h.2.2.2.1 27) ||
    (checkSX h.1 64 (Nat.sub (pw h.2.1) 1) [] [] [] Q h.2.2.2.2).1)

/-- the sub-record at path `P` (external subtrees at `Q`) of the leaf whose header is the record at bit `p` of `d`;
its certificate is the window `[q, e)` of `B` (the kernel's `subOKN`) -/
def subRec (d : ByteArray) (p : Nat) (P : List Step) (Q : List (List Step)) (B : ByteArray) (q e : Nat) : Bool :=
  let h := leafHdr d p
  let L : LCtx := { h.1 with d := B, e := e }
  let st := walk L (Nat.sub (pw h.2.1) 1, [], []) P
  Nat.ble h.2.1 31 && P.all (stepOK h.2.1) && (checkSX L 64 st.1 st.2.1 st.2.2 P.reverse Q q).1

/-- nested records `(P, m, (B, q, e))` from index `k`, their sub-record slices threaded through `rest` (the kernel's
`nestChkT`): record `k` covers the paths `rest.take m`, which start at index `a > k` -/
def nestRecs (d : ByteArray) (p : Nat) : List (List Step × Nat × ByteArray × Nat × Nat) → List (List Step) → Nat → Nat → Bool
  | [], _, _, _ => true
  | r :: rs, rest, a, k =>
    (Nat.blt k a && subRec d p r.1 (rest.take r.2.1) r.2.2.1 r.2.2.2.1 r.2.2.2.2) &&
      nestRecs d p rs (rest.drop r.2.1) (a + r.2.1) (Nat.succ k)

/-- a nested split leaf: main record at bit `p` of `d` with external records `0 .. m0-1`, records numbered from 0 in BFS
order with consecutive sub-record ranges starting at `m0` -/
def nestLeaf (d : ByteArray) (p : Nat) (recs : List (List Step × Nat × ByteArray × Nat × Nat)) (m0 : Nat) : Bool :=
  mainRec d p ((recs.map Prod.fst).take m0) && nestRecs d p recs ((recs.map Prod.fst).drop m0) m0 0

end NL
