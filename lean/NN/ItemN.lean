module
public import NN.Item
public import R22N.Glue
/-! # NN.ItemN: the whole per-item check with its key (core only)

`itemR3 S rowE c dead key b` decodes the item bytes `b` (the segment header as in R3's pcert first chunk: varint job, u8 kind,
u8 `d0`, `d0` u16 prefix labels including the root's, 64-byte inherited dead mask, varint `n`, `n` varint deltas of witness row
ids; then the record bytes), builds the item table from the row interface `rowE` (entry per cited row id), the frame of the root's
parent (`rootFrameN`), and checks
* the tree (`chkT` with `nodeFn` and the dead-child check `dead`), root lower bound `lo` = the key's `lo`;
* the root label is the header prefix's last label, the root is an OPEN or dead node;
* **the key**: `R22N.SegI.ofKey key` = the tree's interface: root `(P ||| 2^l, l)`, `lo`, the external children and the ranges
  in record order (`extL`: DFS; `rngL`: a node's range after its children's), as `r3qglue --itemkey` writes them;
* the kinds statics' inverse map (`invOK`). -/
@[expose] public section

namespace NN

/-! ## The interface of a tree -/

mutual
/-- the external children's keys in DFS order -/
def extL {NR DR : Type} (P : Nat) : STree NR DR → List (Nat × Nat)
  | .node lab _ kids _ => extK (P ||| 2 ^ lab) kids
  | .dead _ _ => []
  | .ext lab => [(P ||| 2 ^ lab, lab)]
def extK {NR DR : Type} (P : Nat) : SKids NR DR → List (Nat × Nat)
  | .nil => []
  | .cons t ts => extL P t ++ extK P ts
end

mutual
/-- the ranges in record order: a node's own range (its `RG` record ends its child records) after its children's (post-order),
as `r3qglue --itemkey` lists them -/
def rngL {NR DR : Type} (P : Nat) : STree NR DR → List ((Nat × Nat) × Nat)
  | .node lab _ kids rng =>
    rngK (P ||| 2 ^ lab) kids ++ (match rng with | some l => [((P ||| 2 ^ lab, lab), l)] | none => [])
  | .dead _ _ => []
  | .ext _ => []
def rngK {NR DR : Type} (P : Nat) : SKids NR DR → List ((Nat × Nat) × Nat)
  | .nil => []
  | .cons t ts => rngL P t ++ rngK P ts
end

/-- the key states the tree's interface -/
def keyOK {NR DR : Type} (key P lo : Nat) (t : STree NR DR) : Bool :=
  let I := R22N.SegI.ofKey key
  I.root == (P ||| 2 ^ t.lab, t.lab) && I.lo == lo && I.ext == extL P t && I.rng == rngL P t

/-! ## The item bytes -/

/-- the item block as the queue stores it and `r3qglue --itembin` writes it (QUEUE.md §3, `#pcwit`):
`[u32 'R3XI'][u32 hlen][header][u64 n][n record bytes][32-byte sha256 of the records]`; the header is varint item id, varint job,
u8 kind (0 job root, 1 piece, 2 replay cut, 3 range, 4 top), u8 `d0`, `d0` × u16 prefix labels, 64-byte inherited dead mask,
[witness rows of the mask, present iff `hlen` exceeds the fixed part plus 4: varint `n`, `n` varint deltas], u16 `l`, u16 `p`.
The header must be consumed exactly and the block length must be `8 + hlen + 8 + n + 32`. The sha256 is the transport's
(checked by `r3qglue`); the check needs none of it. -/
def segParse (b : ByteArray) : Option R3.Seg := do
  if b.size < 8 || natB b 0 4 != 0x49583352 then none else
  let he := 8 + natB b 4 4
  if he + 8 > b.size then none else
  let n := natB b he 8
  if he + 8 + n + 32 != b.size then none else
  let (_, q) ← R3.var b 8
  let (job, q) ← R3.var b q
  let (kind, q) ← R3.u8 b q
  let (d0, q) ← R3.u8 b q
  let (pre, q) ← (List.range d0).foldlM (fun (acc : Array Nat × Nat) _ => do
      let (x, q') ← R3.u16 b acc.2
      pure (acc.1.push x, q')) (#[], q)
  if q + 64 > he then none else
  let D := limbsBW b q 64 8
  let (wit, q) ← (if q + 64 + 4 < he then (do
      let (nw, q') ← R3.var b (q + 64)
      R3.deltas b nw 0 q' #[]) else some (#[], q + 64))
  let (lo, q) ← R3.u16 b q
  let (p, q) ← R3.u16 b q
  if q != he then none else
  return { job, kind, pre, D, wit, bytes := b.extract (he + 8) (he + 8 + n), lo, p }

/-- the dead-child check: `dead ids lm tab fr lab r` on the parent frame `fr` -/
abbrev DeadChk := Array Nat → Array Nat → Tab → Frame → Nat → R3.RDead → Bool

/-- the root of an item is a dead node -/
def STree.isDead {NR DR : Type} : STree NR DR → Bool
  | .dead _ _ => true
  | _ => false

/-- **the per-item check**.  `scan S0` proposes the rows full at the prefix `S0` (untrusted: `rootFrameN` re-checks each); it is
asked only for a dead job root (kind 0, depth ≥ 2), whose header carries no dead mask: the root's parent frame then gets the dead
labels of those rows as implicit witnesses (as the kernel converter's `fullunion`), which node cuts 5 / 6 at the root need. -/
def itemR3 (S : IStat) (rowE : Nat → Nat) (scan : Array UInt64 → Array Nat) (c : Cfg) (dead : DeadChk) (key : Nat)
    (b : ByteArray) : Bool :=
  match segParse b with
  | none => false
  | some s =>
    match (if s.kind == 3 then R3.decodeRange {} s.bytes s.pre.size s.pre.back! s.p else R3.decode {} s.bytes) with
    | none => false
    | some t =>
      let S0 := setBits #[0, 0, 0, 0, 0, 0, 0, 0] s.pre.pop.toList
      let extra := if s.kind == 0 && decide (s.pre.size ≥ 2) && t.isDead then scan S0 else #[]
      let ids := sortDedup (citedT t #[] ++ s.wit ++ extra)
      let tab := tabOfEntries ids (ids.map rowE)
      let lm := locMap ids
      let loc := fun (g : Nat) => let k := lm.getD g 0; if k == 0 then ids.size else k - 1
      let wit := (s.wit ++ extra).map loc
      let Dh := (Array.range 8).map fun k =>
        s.D.getD k 0 ||| (orN (fun j => tW tab (loc (extra.getD j 0)) k) extra.size &&& ~~~(S0.getD k 0))
      let lb := (R22N.SegI.ofKey key).lo
      invOK S.ks.vec S.ks.inv && decide (s.pre.size ≥ 1) && t.isRoot && decide (t.lab = s.pre.back!) &&
      ids.all (fun i => decide (i < 2 ^ 32)) && tab.caps.all (fun c => decide (c < 256)) &&
      match (if s.pre.size == 1 then rootFrame0 S.st s.D else rootFrameN S.st tab s.pre.pop Dh wit) with
      | none => false
      | some fr => keyOK key (natL fr.S 0 8) lb t && chkT (nodeFn S c ids lm tab) (dead ids lm tab) fr lb t

end NN
