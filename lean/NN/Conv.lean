module
public import NN.R3
public import NN.Node2
public import XT.Cut
/-! # NN.Conv: from decoded r3 records to the native node records (core only, no proof needed)

* the item-local table: every row id the item cites (VROWS, XROWS, the bulk-peel dictionaries, cut nodes' VROWS, node cuts 5 / 6's
  exclusion rows and node-record rows), sorted and
  deduplicated; entry `i` is `rowE ids[i]` (fetched by chunk: `entryOf`), split into the label mask and the cap;
* `conv`: an OPEN node's raw records → `NodeRec2` (V5 = VROWS of cap ≥ 3; R1 = ex, then the c1 rows not in ex; R2 = c2; the T/C
  kills re-indexed; X1 / X2 = the bulk-peel dictionary rows of residual 1 / 2) and the X tier's position map. -/
@[expose] public section

namespace NN

/-! ## Sorted id arrays -/

/-- sort and deduplicate -/
def sortDedup (a : Array Nat) : Array Nat :=
  let s := a.qsort (· < ·)
  s.foldl (fun acc x => if acc.size > 0 && acc.back! == x then acc else acc.push x) #[]

/-- the index of `x` in the sorted array `a` (binary search); `a.size` if absent -/
def findIdx (a : Array Nat) (x : Nat) : Nat := go 0 a.size (a.size + 1)
where
  go (lo hi : Nat) : Nat → Nat
    | 0 => a.size
    | fuel + 1 =>
      if lo < hi then
        let mid := (lo + hi) / 2
        let v := a.getD mid 0
        if v == x then mid else if v < x then go (mid + 1) hi fuel else go lo mid fuel
      else a.size

/-! ## The table -/

/-- the row interface by chunks: ids `< nA` from `chunkA` (64 entries of 520 bits per chunk), ids in `[nA, nA + nB)` from
`chunkB`, 0 beyond (`L5II.rowEII`'s shape) -/
def entryOf (chunkA chunkB : Nat → Nat) (nA nB i : Nat) : Nat :=
  if i < nA then (chunkA (i / 64) >>> (520 * (i % 64))) % 2 ^ 520
  else if i < nA + nB then (chunkB ((i - nA) / 64) >>> (520 * ((i - nA) % 64))) % 2 ^ 520
  else 0

/-- the table of the sorted ids, from the entries `ent i` (one 520-bit Nat per id) -/
def tabOfEntries (ids : Array Nat) (ents : Array Nat) : Tab where
  rows := (Array.range (8 * ids.size)).map fun j =>
    let e := ents.getD (j / 8) 0
    ((e >>> (64 * (j % 8))) % (if j % 8 = 7 then 2 ^ 63 else 2 ^ 64)).toUInt64
  caps := ents.map fun e => (e >>> 511) % 512
  ids := ids

/-- the entries of sorted ids, fetching each chunk once (ids are sorted, so ids of one chunk are consecutive) -/
def entriesByChunk (chunkA chunkB : Nat → Nat) (nA nB : Nat) (ids : Array Nat) : Array Nat := Id.run do
  let mut out : Array Nat := Array.mkEmpty ids.size
  let mut ck := 0
  let mut ckv := 0
  let mut got := false
  for i in ids do
    if i < nA then
      let k := i / 64
      if !(got && ck == k) then
        ckv := chunkA k; ck := k; got := true
      out := out.push ((ckv >>> (520 * (i % 64))) % 2 ^ 520)
    else
      out := out.push (entryOf chunkA chunkB nA nB i)
  return out

/-! ## Row ids cited by an item -/

/-- the bulk-peel node record's dictionary: `(row id, residual)` pairs (XPN varints: nQ, Q*, nd, (rid, res)*, …) -/
def xpnDict (xpn : ByteArray) : Option (Array (Nat × Nat)) := do
  let (nQ, i) ← R3.var xpn 0
  let (_, i) ← R3.vars xpn nQ i #[]
  let (nd, i) ← R3.var xpn i
  let (xs, _) ← R3.vars xpn (2 * nd) i #[]
  return (Array.range nd).map fun j => (xs.getD (2 * j) 0, xs.getD (2 * j + 1) 0)

mutual
def citedT : STree R3.RNode R3.RDead → Array Nat → Array Nat
  | .node _ r kids _, acc =>
    let acc := acc ++ r.vrows ++ r.ex ++ r.c1 ++ r.c2
    let acc := match r.xpn with
      | some x => match xpnDict x with | some ds => acc ++ ds.map (·.1) | none => acc
      | none => acc
    citedK kids acc
  | .dead _ (.cut k args nd _ vr), acc =>
    acc ++ vr ++ (if k == 5 || k == 6 then args.extract 2 args.size ++ ((XT.cutRows nd).getD #[]).map (·.1)
      else if k == 2 then args.extract 0 1 else #[])
  | .dead _ _, acc => acc
  | .ext _, acc => acc
def citedK : SKids R3.RNode R3.RDead → Array Nat → Array Nat
  | .nil, acc => acc
  | .cons t ts, acc => citedK ts (citedT t acc)
end

/-! ## One OPEN node -/

/-- the converted node: the L1 record, the X tier's inputs (XPN blob, choice-5 kills, position map) -/
structure ConvNode where
  nrec : NodeRec2
  xpn : ByteArray
  xk : Array (Nat × Nat × Nat × ByteArray)
  pos : Array Nat
  deriving Inhabited

/-- the item's global → local id map: `map[g] = local index + 1` (0: not cited) -/
def locMap (ids : Array Nat) : Array Nat := Id.run do
  let mx := ids.foldl max 0
  let mut a : Array Nat := Array.replicate (mx + 1) 0
  for j in [0:ids.size] do
    a := a.set! (ids.getD j 0) (j + 1)
  return a

/-- convert an OPEN node's raw records; `ids` = the item's sorted table ids, `lm` = `locMap ids`, `tab` its table -/
def conv (ids : Array Nat) (lm : Array Nat) (tab : Tab) (r : R3.RNode) : Option ConvNode := do
  let loc := fun (g : Nat) => let k := lm.getD g 0; if k == 0 then ids.size else k - 1
  let v5 := (r.vrows.filter fun g => capOf tab (loc g) ≥ 3).map loc
  let exL := r.ex.map loc
  let c1only := (r.c1.filter fun g => !(r.ex.contains g))
  let r1 := exL ++ c1only.map loc
  let r2 := r.c2.map loc
  -- R1 position of c1 row c (precomputed)
  let c1posA : Array Nat := Id.run do
    let mut out : Array Nat := Array.mkEmpty r.c1.size
    let mut k := 0
    for g in r.c1 do
      match r.ex.findIdx? (· == g) with
      | some j => out := out.push j
      | none => out := out.push (r.ex.size + k); k := k + 1
    return out
  let c1pos := fun (c : Nat) => c1posA.getD c (r1.size)
  let ks1 := r.tk.map fun (u, xs) => ({ u := u, ex := xs, cv := #[] } : Kill)
  let ks2 := r.ck.map fun (u, xs, cs) =>
    ({ u := u, ex := xs, cv := cs.map fun c => if c % 2 == 0 then c1pos (c / 2) else r1.size + c / 2 } : Kill)
  let ds ← match r.xpn with
    | some x => xpnDict x
    | none => some #[]
  let x1g := (ds.filter fun p => p.2 == 1).map (·.1)
  let x2g := (ds.filter fun p => p.2 == 2).map (·.1)
  if !(ds.all fun p => p.2 == 1 || p.2 == 2) then none else
  let m := v5.size + r1.size + r2.size
  -- dictionary positions of the bulk-peel rows: X1 in order, then X2
  let (pos, _, _) := ds.foldl (fun (acc : Array Nat × Nat × Nat) p =>
      let (a, k1, k2) := acc
      if p.2 == 1 then (a.push (m + k1), k1 + 1, k2) else (a.push (m + x1g.size + k2), k1, k2 + 1)) (#[], 0, 0)
  let x1l := x1g.map loc
  let x2l := x2g.map loc
  let nr : NodeRec2 := ⟨r.lab, r.depth, v5, r1, r2, x1l, x2l, ks1 ++ ks2⟩
  return ⟨nr, r.xpn.getD ByteArray.empty, r.xk, pos⟩

end NN

namespace NN

/-! ## The frame of an item root's parent -/

/-- labels strictly increasing and below 511 -/
def incrOK (pre : Array Nat) : Bool :=
  allN (fun i => pre.getD i 0 < 511 && (i == 0 || pre.getD (i - 1) 0 < pre.getD i 0)) pre.size

/-- `N ||| c` on 4096 limbs -/
def orArr (N c : Array UInt64) : Array UInt64 := (Array.range 4096).map fun k => N.getD k 0 ||| c.getD k 0

/-- the prefix bits of a label list -/
def setBits (S : Array UInt64) : List Nat → Array UInt64
  | [] => S
  | p :: ps => setBits (setBit8 S p) ps

/-- the conflict table of a label list: `N` with the cap-2 tables of the labels ORed in -/
def orTabs (st : Statics) (N : Array UInt64) : List Nat → Array UInt64
  | [] => N
  | p :: ps => orTabs st (orArr N (st.c2t.getD p #[])) ps

/-- the counters of a label list (`none` if a field reaches 128) -/
def sumU (st : Statics) (U : ByteArray) : List Nat → Option ByteArray
  | [] => some U
  | p :: ps => let h := st.h.getD p ByteArray.empty; if addUOK U h then sumU st (addU U h) ps else none

/-- the cap-2 tables' self slots are empty (`c2t[l]`, slot `l`) -/
def c2selfOK (st : Statics) : Bool :=
  allN (fun l => allN (fun k => (st.c2t.getD l #[]).getD (8 * l + k) 0 == 0) 8) 511

/-- 512 zero counters -/
def zeroU : ByteArray := ByteArray.mk (Array.replicate 512 0)

/-- the empty parent frame (the root of a top segment at depth 1): prefix 0, dead mask 0 (the header's must be 0), conflict table
= the cap-1 table, counters 0, depth 0 -/
def rootFrame0 (st : Statics) (Dh : Array UInt64) : Option Frame :=
  if allN (fun k => Dh.getD k 0 == 0) 8 && st.conf1.size == 4096 then
    some { S := #[0, 0, 0, 0, 0, 0, 0, 0], D := #[0, 0, 0, 0, 0, 0, 0, 0], N := st.conf1, U := zeroU, d := 0 }
  else none

/-- the frame of the prefix `pre` (labels of the item root's parent), with the inherited dead mask `Dh` validated by the witness
rows `wit` (item-local table indices: rows full at the prefix whose union, outside the prefix, contains `Dh`); `none` if a check
fails. `D` = `Dh` ∪ the conflicts of the prefix labels in `N` (`KD.rootFrame_okU`'s dead labels). -/
def rootFrameN (st : Statics) (tab : Tab) (pre : Array Nat) (Dh : Array UInt64) (wit : Array Nat) : Option Frame :=
  if !(decide (pre.size > 0) && incrOK pre && st.conf1.size == 4096 && c2selfOK st) then none else
  let S := setBits #[0, 0, 0, 0, 0, 0, 0, 0] pre.toList
  let N := orTabs st st.conf1 pre.toList
  match sumU st zeroU pre.toList with
  | none => none
  | some U =>
    let D := (Array.range 8).map fun k => Dh.getD k 0 ||| orN (fun i => N.getD (8 * pre.getD i 0 + k) 0) pre.size
    let witFull := allN (fun j => let w := wit.getD j 0; popRowS tab S w == capOf tab w) wit.size
    let witCover := allN (fun k =>
      (Dh.getD k 0 &&& ~~~(S.getD k 0) &&& ~~~(orN (fun j => tW tab (wit.getD j 0) k) wit.size)) == 0) 8
    if witFull && witCover then some { S := S, D := D, N := N, U := U, d := pre.size } else none

end NN
