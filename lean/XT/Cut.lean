module
public import XT.W8
public import XT.Lits
public import XT.Rec
public import XT.Check
public import XT.R3
/-! # XT.Cut: node cuts 5 / 6 (R3 `#cutx 1`) through the hybrid X tier (core only)

A node cut 5 / 6 with `ok = 1` carries a bulk-peel certificate in kill2's 27.11 format (R3 RECIPE: "node cuts 5/6 keep the 27.11-format
certificate"): the cut node `u` is its parent's killed child, with a node record at the parent's prefix.  Both blobs are LEB128
varint item lists (`#xpvar 1`):
* node record: `nQ, Q*, nd, (row id, residual)*, nn, nodeIdx*` (dictionary indices are record-local);
* child certificate: `kind, bb, u, t, Fu, ncr, crIdx*, tree`; tree in preorder: leaf `0, ns, (X, d)*, finX, finD`, node
  `1, ns, (X, d)*, v, c2flag, nb, rowIdx*, left, right` (the in-branch adds the cliques of the rows without the pick and, when
  flagged, the pick's cap-2 table).

`parseCut` turns it into a hybrid record (`XRec`, layout 2) with one child: every in-branch becomes its own aggregate
`{x = u + 1 + v, rows}`, the node rows are the record's plus the ex rows (residual-1 rows through `u` that leave the certificate's
`F_u`), steps go into a deficit table as in `parseR3`.  `checkCut` replaces the child's `F_u` by the hybrid checker's
`(above(u) ∖ D') ∖ Anode[u]` and runs `checkT`, so `KD.xpartC_sound` (over every universe `Ω`) applies (`XTP.checkCut_sound`).
A valid 27.11 certificate stays accepted: its own `F_u` contains that set (`K2.childL`'s `fcalc ⊆ F_u`), and the hybrid in-branch
adds the pick's cap-2 table also when the certificate did not flag it, i.e. only valid conflicts (the checks are monotone in
both).  Parser unverified, structural recursion (fuel). -/
@[expose] public section
namespace XT
namespace Cut
open R3

/-- a 27.11 tree; each in-branch appends its aggregate `{x = u + 1 + v, rows}` to `ag` -/
def treeC (b : ByteArray) (pos : Array Nat) (u : Nat) : Nat → Nat → Array Nat → Array XAgg →
    Option (XTN × Array Nat × Array XAgg × Nat)
  | 0, _, _, _ => none
  | fuel + 1, o, st, ag =>
    let o1 := vEnd b o
    if o1 > b.size then none else
    let o2 := vEnd b o1
    if o2 > b.size then none else
    let tag := vVal b o
    let ns := vVal b o1
    if ns > b.size then none else
    match stepsR b ns o2 st (Array.mkEmpty (2 * ns)) with
    | none => none
    | some (sts, st1, o3) =>
      let o4 := vEnd b o3
      if o4 > b.size then none else
      if tag = 0 then
        let o5 := vEnd b o4
        if o5 > b.size then none else
        let (fj, st2) := dtGet st1 (vVal b o3)
        some (.leaf sts fj (vVal b o4), st2, ag, o5)
      else if tag = 1 then
        -- `v` at `o3`, the c2 flag at `o4` (not needed: the hybrid in-branch always adds the pick's table), `nb` at `o5`
        let o5 := vEnd b o4
        if o5 > b.size then none else
        let o6 := vEnd b o5
        if o6 > b.size then none else
        let nb := vVal b o5
        if nb > b.size then none else
        match posList b pos nb o6 (Array.mkEmpty nb) with
        | none => none
        | some (ps, o7) =>
          match treeC b pos u fuel o7 st1 (ag.push { x := u + 1 + vVal b o3, ps, B := #[], ms := #[] }) with
          | none => none
          | some (l, st2, ag2, o8) =>
            match treeC b pos u fuel o8 st2 ag2 with
            | none => none
            | some (r, st3, ag3, o9) => some (.node sts (vVal b o3) ag.size l r, st3, ag3, o9)
      else none

/-- the child certificate -/
def certC (pos : Array Nat) (ce : ByteArray) (st : Array Nat) : Option (XKid × Array Nat × Array XAgg) :=
  let o1 := vEnd ce 0
  let o2 := vEnd ce o1
  let o3 := vEnd ce o2
  let o4 := vEnd ce o3
  if o4 > ce.size then none else
  match varMask ce o4 with
  | none => none
  | some (Fu, o5) =>
    let o6 := vEnd ce o5
    if o6 > ce.size then none else
    let ncr := vVal ce o5
    if ncr > ce.size then none else
    match posList ce pos ncr o6 (Array.mkEmpty ncr) with
    | none => none
    | some (cr, o7) =>
      match treeC ce pos (vVal ce o2) (ce.size + 1) o7 st #[] with
      | none => none
      | some (tr, st', ag, o8) =>
        if o8 = ce.size then
          some ({ kind := vVal ce 0, bb := vVal ce o1, u := vVal ce o2, Fu, cr, t := tr }, st', ag)
        else none

/-- `n` pairs `(row id, residual)` -/
def pairs (b : ByteArray) : Nat → Nat → Array (Nat × Nat) → Option (Array (Nat × Nat) × Nat)
  | 0, o, acc => some (acc, o)
  | n + 1, o, acc =>
    let o1 := vEnd b o
    if o1 > b.size then none else
    let o2 := vEnd b o1
    if o2 > b.size then none else
    pairs b n o2 (acc.push (vVal b o, vVal b o1))

end Cut

/-- the node record's dictionary: `(row id, residual)` in record order (to build `pos`) -/
def cutRows (nd : ByteArray) : Option (Array (Nat × Nat)) :=
  let o1 := R3.vEnd nd 0
  if o1 > nd.size then none else
  let o2 := R3.skipN nd (R3.vVal nd 0) o1
  if o2 > nd.size then none else
  let o3 := R3.vEnd nd o2
  if o3 > nd.size then none else
  let n := R3.vVal nd o2
  if n > nd.size then none else
  match Cut.pairs nd n o3 (Array.mkEmpty n) with
  | some (ps, _) => some ps
  | none => none

/-- **a node cut's certificate as a hybrid record**: `pos[i]` = the dictionary position of the node record's entry `i`, `expos[j]`
= that of ex row `j` (node rows); `U`, `du`: the parent's child frame (deficit table) -/
def parseCut (npW : Array W8) (nd ce : ByteArray) (pos expos : Array Nat) (U : ByteArray) (du : Nat) : Option XRec :=
  let o1 := R3.vEnd nd 0
  if o1 > nd.size then none else
  let o2 := R3.skipN nd (R3.vVal nd 0) o1
  if o2 > nd.size then none else
  let o3 := R3.vEnd nd o2
  if o3 > nd.size then none else
  if R3.vVal nd o2 ≠ pos.size then none else
  let o4 := R3.skipN nd (2 * R3.vVal nd o2) o3
  if o4 > nd.size then none else
  let o5 := R3.vEnd nd o4
  if o5 > nd.size then none else
  let nn := R3.vVal nd o4
  if nn > nd.size then none else
  match R3.posList nd pos nn o5 (Array.mkEmpty nn) with
  | none => none
  | some (nrows, o6) =>
    if o6 ≠ nd.size then none else
    match Cut.certC pos ce (Array.replicate 512 0) with
    | none => none
    | some (k, st, aggs) =>
      let XL := st.extract 512 st.size
      let HP := XL.map fun X => if X = 0 then W8.all511 else if X < 512 then npW[X]! else W8.zero
      let DEF := XL.map fun X => if X = 0 then 22 - du else if X < 512 then 3 * rkTab[X]! - (U.get! X).toNat else 0
      some { lay := 2, nrows := nrows ++ expos, aggs, XL, HP, DEF, kids := #[k] }

/-- the children's `F_u` set to the hybrid checker's `(above(u) ∖ D') ∖ Anode[u]` -/
def fixFu (nc : NodeC) (x : XRec) : XRec :=
  { x with kids := x.kids.map fun k => { k with Fu := ((windowTab[k.u]!).andn nc.D).andn (nc.An[k.u]!) } }

/-- **a node cut 5 / 6, decided** (`XTP.checkCut_sound`): the certificate's record (`parseCut`) with the hybrid `F_u` (`fixFu`),
one child `u`, through `checkT` on the parent's child frame -/
def checkCut (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (u : Nat) (nd ce : ByteArray) (pos expos : Array Nat) : Bool :=
  match parseCut npW nd ce pos expos U du with
  | some x =>
    match prep D N U du last b1 m e1 dict c2W npW x with
    | some nc =>
      (fixFu nc x).lay != 1 && kidLabels (fixFu nc x) == #[u] && checkT S D N U du last b1 m e1 dict c2W npW (fixFu nc x)
    | none => false
  | none => false

end XT
