module
public import XT.Lits
public import XT.W8
public import XT.Rec
/-! # XT.Check: the native X tier of a node (core only)

Decides `KD.xpartC S' D' N' U' du last b1 m e1 (rowV dict) nrows aggs XL HP DEFP J kids` (kinds/lean/KD/XComp.lean) on the views of
the decoded record (`XT.Rec`; views in `XTP`), on machine words:
* masks are `W8` (eight unboxed words, label layout); a child's matrix is one `W8` row per label of `F_u`, in a row array indexed
  by label;
* an X-step `(H, d)` keeps a candidate `l` iff `d + |Y ∧ row l| ≤ |Y|` (`Y = c ∧ H`; `row l` has bit `l` clear): kill2's `xstep`
  on the window (`K2.xstep`), without packed matrices;
* an in-branch on the pick `p` filters the candidates by the current row of `p`, then ORs the aggregate's rows `B_p[l]` into the
  rows of the candidates left (other rows are not read below it; a pick outside the candidates takes its row from the sources);
* a cut leaf compares the number of distinct picks on its path with `T = 21 - du`.
Exactness: the result equals `xpartC`'s on the views, with two strictnesses on inputs that do not occur: a node row with bit 511
set is rejected (dictionary rows are 511-bit masks), and in layout 1 a record mask with bit 511 set is rejected. -/
@[expose] public section

namespace XT

/-! ## Static tables -/

/-- `nperpL X` for `X < 512` -/
def nperpTab : Array W8 := (Array.range 512).map fun X => W8.ofNat (nperpL X)
/-- `rkOf X` for `X < 512` -/
def rkTab : Array Nat := (Array.range 512).map rkOf

/-- L1's cap-2 tables as rows (once per process): `prepC2 c2t` has row `l` of table `x` at `[x][l]` (512 rows per table) -/
def prepC2 (c2t : Array (Array UInt64)) : Array (Array W8) :=
  c2t.map fun t => (Array.range 512).map fun l => W8.ofLimbs t (8 * l)

/-! ## Set bits of a word -/

/-- OR `m` into `rs[l]` for every set bit `l = base + i` of the word `x`, then clear bit `l` of `rs[l]` when `clr` -/
def scatL (m : W8) (clr : Bool) (base : Nat) (x : UInt64) (rs : Array W8) : Array W8 :=
  if h : x = 0 then rs else
    scatL m clr base (x &&& (x - 1))
      (rs.modify (base + (lowIdx x).toNat) (fun w => if clr then w.orClr m (base + (lowIdx x).toNat) else w.or m))
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- `scatL` on the words `i ..< 8` of the mask `sel` -/
def scatWs (m : W8) (clr : Bool) (sel : W8) (i : Nat) (rs : Array W8) : Array W8 :=
  if i < 8 then scatWs m clr sel (i + 1) (scatL m clr (64 * i) (sel.limb i) rs) else rs
termination_by 8 - i

/-- `rs[l] ∪= m` (bit `l` cleared when `clr`) for `l ∈ sel` -/
@[inline] def scat (m : W8) (clr : Bool) (sel : W8) (rs : Array W8) : Array W8 := scatWs m clr sel 0 rs

/-- every row of `ms` scattered over its own bits within `sel`: `rs[l] ∪= m \ {l}` for `m ∈ ms`, `l ∈ m ∩ sel` -/
def scatRows (ms : Array W8) (sel : W8) (rs : Array W8) : Array W8 := ms.foldl (fun rs m => scat m true (m.and sel) rs) rs

/-! ## The X-step -/

/-- the candidates of word `x` (labels `base + i`) that `d + |Y ∧ rows[l]| ≤ ny` keeps, ORed into `acc` -/
def stepL (rows : Array W8) (Y : W8) (ny d base : Nat) (x acc : UInt64) : UInt64 :=
  if h : x = 0 then acc else
    stepL rows Y ny d base (x &&& (x - 1))
      (if d + Y.andPop rows[base + (lowIdx x).toNat]! ≤ ny then acc ||| (x ^^^ (x &&& (x - 1))) else acc)
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- one X-step `(H, d)` on the candidates `c` -/
@[inline] def xstepN (rows : Array W8) (c H : W8) (d : Nat) : W8 :=
  let Y := c.and H
  let ny := Y.pop
  ⟨stepL rows Y ny d 0 c.a0 0, stepL rows Y ny d 64 c.a1 0, stepL rows Y ny d 128 c.a2 0, stepL rows Y ny d 192 c.a3 0,
   stepL rows Y ny d 256 c.a4 0, stepL rows Y ny d 320 c.a5 0, stepL rows Y ny d 384 c.a6 0, stepL rows Y ny d 448 c.a7 0⟩

/-! ## Contexts -/

/-- an aggregate prepared for the tree: label and its rows without the label -/
structure AggC where
  x : Nat
  cl : Array W8
  deriving Inhabited

/-- the node: dictionary rows, residual classes, deficit table, node matrix, aggregates, statics -/
structure NodeC where
  dictW : Array W8
  b1 : Nat
  m : Nat
  e1 : Nat
  D : W8
  Hm : Array W8
  DEF : Array Nat
  J : Nat
  An : Array W8
  aggs : Array AggC
  c2W : Array (Array W8)
  last : Nat
  T : Nat
  deriving Inhabited

/-- dictionary position `p` (zero past the end) -/
@[inline] def NodeC.row (nc : NodeC) (p : Nat) : W8 := if p < nc.dictW.size then nc.dictW[p]! else W8.zero


/-- residual ≤ 1 at position `p` (`KD.r1pos`) -/
@[inline] def r1pos (b1 m e1 p : Nat) : Bool := p < b1 || (m ≤ p && p < e1)

/-- row `l` of the static cap-2 table of `x` (zero past the tables) -/
@[inline] def c2row (c2W : Array (Array W8)) (x l : Nat) : W8 := (c2W[x]!)[l]!

/-- the rows `cl[i..]` that hold `l`, ORed into the accumulator `a0 .. a7` -/
def orHolding (cl : Array W8) (l : Nat) (i : Nat) (a0 a1 a2 a3 a4 a5 a6 a7 : UInt64) : W8 :=
  if h : i < cl.size then
    if cl[i].testBit l then
      orHolding cl l (i + 1) (a0 ||| cl[i].a0) (a1 ||| cl[i].a1) (a2 ||| cl[i].a2) (a3 ||| cl[i].a3) (a4 ||| cl[i].a4)
        (a5 ||| cl[i].a5) (a6 ||| cl[i].a6) (a7 ||| cl[i].a7)
    else orHolding cl l (i + 1) a0 a1 a2 a3 a4 a5 a6 a7
  else ⟨a0, a1, a2, a3, a4, a5, a6, a7⟩
termination_by cl.size - i

/-- `w` with the rows of `cl` that hold `l` ORed in -/
@[inline] def orHoldingW (cl : Array W8) (l : Nat) (w : W8) : W8 := orHolding cl l 0 w.a0 w.a1 w.a2 w.a3 w.a4 w.a5 w.a6 w.a7

/-- row `l` of the aggregate `B_x` as `K2.bxOK` defines it:
`clrD (addClV 0 REPm REP x rows ||| clrV c2t_x REP 512 x) DIAG` (slots `0 .. 511`) -/
def brow (c2W : Array (Array W8)) (ag : AggC) (l : Nat) : W8 :=
  if ag.x ≥ 511 then W8.zero
  else if l ≥ 512 then W8.zero
  else if l = 511 then c2row c2W ag.x 511
  else if l = ag.x then W8.zero
  else (orHoldingW ag.cl l ((c2row c2W ag.x l).clrBit ag.x)).clrBit l

/-! ## The child -/

structure KidC where
  u : Nat
  rowsC : Array W8      -- child rows (dictionary masks)
  c2 : Array W8         -- the static table of `u` (rows)
  deriving Inhabited

/-- the child's source row of label `l` before any in-branch: the window matrix's slot `l - u - 1` in label layout -/
def srcBase (nc : NodeC) (kc : KidC) (l : Nat) : W8 :=
  if l ≥ 512 then W8.zero
  else if l = 511 then (nc.An[l]!).or kc.c2[l]!
  else (orHoldingW kc.rowsC l ((nc.An[l]!).or kc.c2[l]!)).clrBit l

/-- the source row of label `l` with the aggregates `path` ORed in -/
def srcRow (nc : NodeC) (kc : KidC) (path : List Nat) (l : Nat) : W8 :=
  path.foldl (fun acc k => acc.or (brow nc.c2W nc.aggs[k]! l)) (srcBase nc kc l)

/-- set `rs[l] := (Anode[l] ∪ c2t_u[l]) \ {l}` for the labels `l = base + i` of word `x` -/
def setBaseL (nc : NodeC) (kc : KidC) (base : Nat) (x : UInt64) (rs : Array W8) : Array W8 :=
  if h : x = 0 then rs else
    setBaseL nc kc base (x &&& (x - 1))
      (rs.set! (base + (lowIdx x).toNat)
        ((nc.An[base + (lowIdx x).toNat]!).orClr kc.c2[base + (lowIdx x).toNat]! (base + (lowIdx x).toNat)))
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- `setBaseL` on the words `i ..< 8` of `F_u` -/
def setBaseWs (nc : NodeC) (kc : KidC) (Fu : W8) (i : Nat) (rs : Array W8) : Array W8 :=
  if i < 8 then setBaseWs nc kc Fu (i + 1) (setBaseL nc kc (64 * i) (Fu.limb i) rs) else rs
termination_by 8 - i

/-- OR the static part of the aggregate's row into `rs[l]` (for `l ≠ x`) for the labels `l = base + i` of word `x` -/
def addC2L (c2W : Array (Array W8)) (ag : AggC) (base : Nat) (x : UInt64) (rs : Array W8) : Array W8 :=
  if h : x = 0 then rs else
    addC2L c2W ag base (x &&& (x - 1))
      (if base + (lowIdx x).toNat = ag.x then rs else
        rs.modify (base + (lowIdx x).toNat)
          (fun w => w.orClr2 (c2row c2W ag.x (base + (lowIdx x).toNat)) ag.x (base + (lowIdx x).toNat)))
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- `addC2L` on the words `i ..< 8` of `cin` -/
def addC2Ws (c2W : Array (Array W8)) (ag : AggC) (cin : W8) (i : Nat) (rs : Array W8) : Array W8 :=
  if i < 8 then addC2Ws c2W ag cin (i + 1) (addC2L c2W ag (64 * i) (cin.limb i) rs) else rs
termination_by 8 - i

/-- the in-branch rows: `rs[l] ∪= B_x[l]` for `l ∈ cin` (`cin` inside the window, so `l < 511`); requires `x < 511` -/
@[inline] def addAgg (c2W : Array (Array W8)) (ag : AggC) (cin : W8) (rs : Array W8) : Array W8 :=
  scatRows ag.cl cin (addC2Ws c2W ag cin 0 rs)

/-- a valid step `(j, d)` of child `u` (`KD.stepC`) -/
@[inline] def stepOK (nc : NodeC) (u j d : Nat) : Bool :=
  0 < d && j < nc.J && d + (if (nc.Hm[j]!).testBit u then 1 else 0) ≤ nc.DEF[j]!

/-- the steps from index `i` on (flattened pairs) -/
def runSteps (nc : NodeC) (u : Nat) (rows : Array W8) (sts : Array Nat) (i : Nat) (c : W8) : Option W8 :=
  if h : i + 1 < sts.size then
    if stepOK nc u sts[i]! sts[i + 1]! then runSteps nc u rows sts (i + 2) (xstepN rows c (nc.Hm[sts[i]!]!) sts[i + 1]!)
    else none
  else some c
termination_by sts.size - i

/-- the number of distinct values -/
def distinct : List Nat → Nat
  | [] => 0
  | a :: as => (if as.contains a then 0 else 1) + distinct as

/-- the tree of child `u`: rows exact on the candidates `c`; `path` = aggregates of the in-branches; `picks` = their window indices -/
def treeN (nc : NodeC) (kc : KidC) : XTN → Array W8 → List Nat → List Nat → W8 → Bool
  | .cut, _, _, picks, _ => nc.T < distinct picks
  | .leaf sts fj fd, rows, _, _, c =>
    match runSteps nc kc.u rows sts 0 c with
    | none => false
    | some c' => stepOK nc kc.u fj fd && (c'.and (nc.Hm[fj]!)).pop < fd
  | .node sts v k l r, rows, path, picks, c =>
    match runSteps nc kc.u rows sts 0 c with
    | none => false
    | some c' =>
      k < nc.aggs.size && (nc.aggs[k]!).x == kc.u + 1 + v && kc.u + 1 + v < 511 &&
      (let p := kc.u + 1 + v
       let cin := c'.andn (if c'.testBit p then rows[p]! else srcRow nc kc path p)
       -- p is the aggregate's label: a pick at or above 511 has B = 0 (bxOK with C2x = 0, no rows)
       let rows' := if p < 511 then addAgg nc.c2W (nc.aggs[k]!) cin rows else rows
       treeN nc kc l rows' (k :: path) (v :: picks) cin) &&
      treeN nc kc r rows path picks (c'.clrBit (kc.u + 1 + v))

/-- the child's checks before its tree (`KD.kidX`: `last < u < 511`, `fuX`, `crX`, `allLt`), its context, and its rows written into the
scratch array `rows` (entries of other labels are not read) -/
def kidSetup (nc : NodeC) (k : XKid) (rows : Array W8) : Option (KidC × Array W8) :=
  let u := k.u
  -- F_u = (above(u) \ D') \ Anode[u]; child rows: residual ≤ 1 or through u, below 2^511
  if nc.last < u && u < 511 && k.Fu.beq (((windowTab[u]!).andn nc.D).andn (nc.An[u]!)) &&
     k.cr.all (fun p => let w := nc.row p; !(w.testBit 511) && (r1pos nc.b1 nc.m nc.e1 p || w.testBit u)) then
    let kc : KidC := { u, rowsC := k.cr.map nc.row, c2 := nc.c2W[u]! }
    some (kc, scatRows kc.rowsC k.Fu (setBaseWs nc kc k.Fu 0 rows))
  else none

/-- the children from index `i` on (`KD.kidsX`), one scratch row array threaded through them -/
def kidsLoop (nc : NodeC) (x : XRec) (i : Nat) (rows : Array W8) : Bool :=
  if h : i < x.kids.size then
    match kidSetup nc x.kids[i] rows with
    | some (kc, rows1) => treeN nc kc x.kids[i].t rows1 [] [] x.kids[i].Fu && kidsLoop nc x (i + 1) rows1
    | none => false
  else true
termination_by x.kids.size - i

/-! ## The threaded tree (production): one scratch array, updated in place and restored after each in-branch -/

/-- the rows at the labels `base + i` of word `x`, pushed in increasing label order -/
def gatherL (rs : Array W8) (base : Nat) (x : UInt64) (acc : Array W8) : Array W8 :=
  if h : x = 0 then acc else gatherL rs base (x &&& (x - 1)) (acc.push rs[base + (lowIdx x).toNat]!)
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- `gatherL` on the words `i ..< 8` of `sel` -/
def gatherWs (rs : Array W8) (sel : W8) (i : Nat) (acc : Array W8) : Array W8 :=
  if i < 8 then gatherWs rs sel (i + 1) (gatherL rs (64 * i) (sel.limb i) acc) else acc
termination_by 8 - i

/-- write `sv[k], sv[k+1], ..` back at the labels `base + i` of word `x` -/
def restoreL (sv : Array W8) (base : Nat) (x : UInt64) (k : Nat) (rs : Array W8) : Array W8 :=
  if h : x = 0 then rs else restoreL sv base (x &&& (x - 1)) (k + 1) (rs.set! (base + (lowIdx x).toNat) sv[k]!)
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- `restoreL` on the words `i ..< 8` of `sel`, `k` = the labels of `sel` below word `i` -/
def restoreWs (sv : Array W8) (sel : W8) (i k : Nat) (rs : Array W8) : Array W8 :=
  if i < 8 then restoreWs sv sel (i + 1) (k + (pc64 (sel.limb i)).toNat) (restoreL sv (64 * i) (sel.limb i) k rs) else rs
termination_by 8 - i

/-- `treeN` with the scratch array threaded: returns its verdict and the array it was given (`XTP.treeT_eq`) -/
def treeT (nc : NodeC) (kc : KidC) : XTN → Array W8 → List Nat → List Nat → W8 → Bool × Array W8
  | .cut, rows, _, picks, _ => (nc.T < distinct picks, rows)
  | .leaf sts fj fd, rows, _, _, c =>
    (match runSteps nc kc.u rows sts 0 c with
     | none => false
     | some c' => stepOK nc kc.u fj fd && (c'.and (nc.Hm[fj]!)).pop < fd, rows)
  | .node sts v k l r, rows, path, picks, c =>
    match runSteps nc kc.u rows sts 0 c with
    | none => (false, rows)
    | some c' =>
      if k < nc.aggs.size && (nc.aggs[k]!).x == kc.u + 1 + v then
        if kc.u + 1 + v < 511 then
          let cin := c'.andn (if c'.testBit (kc.u + 1 + v) then rows[kc.u + 1 + v]! else srcRow nc kc path (kc.u + 1 + v))
          let sv := gatherWs rows cin 0 (Array.mkEmpty 64)
          match treeT nc kc l (addAgg nc.c2W (nc.aggs[k]!) cin rows) (k :: path) (v :: picks) cin with
          | (okL, rows2) =>
            let rows3 := restoreWs sv cin 0 0 rows2
            if okL then treeT nc kc r rows3 path picks (c'.clrBit (kc.u + 1 + v)) else (false, rows3)
        else (false, rows)
      else (false, rows)

/-- `kidsLoop` with the scratch array threaded through the trees -/
def kidsLoopT (nc : NodeC) (x : XRec) (i : Nat) (rows : Array W8) : Bool :=
  if h : i < x.kids.size then
    match kidSetup nc x.kids[i] rows with
    | some (kc, rows1) =>
      match treeT nc kc x.kids[i].t rows1 [] [] x.kids[i].Fu with
      | (ok, rows2) => ok && kidsLoopT nc x (i + 1) rows2
    | none => false
  else true
termination_by x.kids.size - i

/-! ## The node -/

/-- the B check of an aggregate (layouts 0 and 1; layout 2 has none) -/
def aggBOK (x : XRec) (c2W : Array (Array W8)) (ag : AggC) (a : XAgg) : Bool :=
  if x.lay = 0 then (List.range 512).all fun i => (brow c2W ag i).beq a.B[i]!
  else if x.lay = 1 then
    a.ms.all (fun w => !(w.testBit 511)) &&
    (let agm : AggC := { x := ag.x, cl := a.ms.map fun w => w.clrBit ag.x }
     (List.range 512).all fun i => (brow c2W ag i).beq (brow c2W agm i))
  else true

/-- the dictionary rows as masks -/
def dictWOf (dict : Array UInt64) : Array W8 := (Array.range (dict.size / 8)).map fun p => W8.ofLimbs dict (8 * p)

/-- dictionary position `p` (zero past the end) -/
@[inline] def rowOf (dictW : Array W8) (p : Nat) : W8 := if p < dictW.size then dictW[p]! else W8.zero

/-- an aggregate's context: label and its rows without the label -/
def aggCOf (dictW : Array W8) (a : XAgg) : AggC := { x := a.x, cl := a.ps.map fun p => (rowOf dictW p).clrBit a.x }

/-- every counter field below 128 -/
def countersOK (U : ByteArray) : Bool := (List.range 512).all fun X => U.get! X < 128

/-- node rows: residual ≤ 1, and 511-bit -/
def nrowsOK (b1 m e1 : Nat) (dictW : Array W8) (nrows : Array Nat) : Bool :=
  nrows.all fun p => r1pos b1 m e1 p && !((rowOf dictW p).testBit 511)

/-- aggregates: rows below 2^511 through x, and B -/
def aggsOK (x : XRec) (c2W : Array (Array W8)) (dictW : Array W8) : Bool :=
  (List.range x.aggs.size).all fun i =>
    x.aggs[i]!.ps.all (fun p => !((rowOf dictW p).testBit 511) && (rowOf dictW p).testBit x.aggs[i]!.x) &&
    aggBOK x c2W (aggCOf dictW x.aggs[i]!) x.aggs[i]!

/-- the deficit table (`J = |XL|`); `npW[X]` = the label order's hyperplane mask of `X` (`nperpTab` for `--rord 123`); every
mask without bit 511 -/
def dtN (npW : Array W8) (U : ByteArray) (du : Nat) (x : XRec) : Bool :=
  x.HP.size = x.XL.size && x.DEF.size = x.XL.size && x.DEF.all (· < 256) && x.HP.all (fun w => !(w.testBit 511)) &&
  (List.range x.XL.size).all fun j =>
    x.XL[j]! < 512 &&
    (if x.XL[j]! = 0 then (x.HP[j]!).beq W8.all511 && x.DEF[j]! + du ≤ 22
     else (x.HP[j]!).beq npW[x.XL[j]!]! && x.DEF[j]! + (U.get! x.XL[j]!).toNat ≤ 3 * rkTab[x.XL[j]!]!)

/-- the node matrix rows (labels above `last`): N' with the node rows' cliques, diagonal cleared -/
def anOf (N : Array UInt64) (last : Nat) (nrW : Array W8) : Array W8 :=
  let acc := scatRows nrW windowTab[last]! (Array.replicate 512 W8.zero)
  (Array.range 512).map fun l =>
    if l ≤ last then W8.zero
    else if l = 511 then W8.ofLimbs N (8 * l)
    else (W8.ofLimbs N (8 * l)).or acc[l]! |>.clrBit l

/-- the node's checks before its children (`KD.xpartC`: counters, `nrOK`, `aggsX`, `dtOK`) and its context -/
def prep (D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (x : XRec) : Option NodeC :=
  let dictW := dictWOf dict
  -- statics: at most 511 cap-2 tables (so `c2tV x = 0` for `x ≥ 511`)
  if c2W.size ≤ 511 && countersOK U && nrowsOK b1 m e1 dictW x.nrows && aggsOK x c2W dictW && dtN npW U du x then
    some { dictW, b1, m, e1, D := W8.ofLimbs D 0, Hm := x.HP, DEF := x.DEF, J := x.XL.size,
           An := anOf N last (x.nrows.map (rowOf dictW)), aggs := x.aggs.map (aggCOf dictW), c2W, last, T := 21 - du }
  else none

/-- **the native X tier**: `KD.xpartC` on the views (`c2W = prepC2 c2t`, prepared once per process) -/
def check (_S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (x : XRec) : Bool :=
  match prep D N U du last b1 m e1 dict c2W npW x with
  | some nc => kidsLoop nc x 0 (Array.replicate 512 W8.zero)
  | none => false

/-- **the native X tier, production**: `check` with the threaded trees (`XTP.checkT_eq`) -/
def checkT (_S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (x : XRec) : Bool :=
  match prep D N U du last b1 m e1 dict c2W npW x with
  | some nc => kidsLoopT nc x 0 (Array.replicate 512 W8.zero)
  | none => false

end XT
