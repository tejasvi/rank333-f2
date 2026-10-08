module
public import NN.Flook
public import NN.ItemN
public import NL.Check
public import XT.Cut
/-! # NN.Dead: the dead children of an item (core only)

A dead child (a node without child loop) at label `lab` of a node with child frame `fr` is checked on its own frame (`frameStep`,
L1 v5's `frame5`: prefix `S ∪ {lab}`, dead mask `D ∪ N[lab] ∪` the node's VROWS rows (full at the new prefix), conflict table
`N ∪ c2t[lab]`, counters `U + h[lab]`, no depth bound), then by its kind:
* node cut 3 (look-ahead, dead term at prefix position `t`): `flookAt`;
* node cut 7 (the node's own rank-1 window): `winN`;
* leaf code 4 (`--rootcut` at a full leaf): `flookAny` (some term is refuted);
* leaf code 0 (`#leafv7 1`): the inline v7 record `R` refutes the leaf (`leaf0OK`: native/leaf's `NL.leafAt`, plus the bind of
  `R`'s 22 terms to the labels of `S ∪ {lab}`, as `KD.leafBind`);
* node cuts 5 / 6 with a bulk-peel certificate (`ok = 1`): the X tier's `XT.checkCut` (`cutXOK`);
* node cut 2 (the prefix breaks a kept row: `|row ∩ S'| > cap`, the row cited by id);
* every other kind is rejected here. -/
@[expose] public section

namespace NN

/-- the frame of a node without child loop at label `lab` with VROWS rows `vs` (item-local indices), on the parent's child frame -/
def frameStep (st : Statics) (tab : Tab) (fr : Frame) (lab : Nat) (vs : Array Nat) : Option Frame :=
  if !(decide (lab < 511) && noBitsFrom fr.S lab) then none else
  let S' := setBit8 fr.S lab
  if !(rowsOK tab S' 0 vs) then none else
  let D' := (Array.range 8).map fun k =>
    (fr.D.getD k 0) ||| (fr.N.getD (8 * lab + k) 0) ||| orN (fun p => dW tab vs vs.size p k) vs.size
  let h := st.h.getD lab ByteArray.empty
  if !(addUOK fr.U h) then none else
  some { S := S', D := D', N := orArr fr.N (st.c2t.getD lab #[]), U := addU fr.U h, d := fr.d + 1 }

/-- the top label of an 8-limb prefix (0 if empty) -/
def topL (S : Array UInt64) : Nat := (List.range 511).foldl (fun acc l => if bit8 S l then l else acc) 0

/-- **node cuts 5 / 6** (`#cutx 1`, bulk-peel certificate): the X tier's `XT.checkCut` on the parent's child frame `fr` (top label
`last`) and a dictionary of the cut's own rows (V empty; R1 = the node record's residual-1 rows, then the exclusion rows; R2 = its
residual-2 rows), each checked against the prefix -/
def cutXOK (S : IStat) (tab : Tab) (loc : Nat → Nat) (fr : Frame) (u : Nat) (exs : Array Nat) (nd ce : ByteArray) : Bool :=
  match XT.cutRows nd with
  | none => false
  | some ents =>
    let last := topL fr.S
    let r1e := (ents.filter (·.2 == 1)).map (·.1)
    let r2e := (ents.filter (·.2 == 2)).map (·.1)
    let r1 := (r1e ++ exs).map loc
    let r2 := r2e.map loc
    let ids := r1 ++ r2
    let b1 := r1.size
    let m := r1.size + r2.size
    -- the dictionary position of record entry i: its index within its residual class (class 2 after R1)
    let (pos, _, _) := ents.foldl (fun (acc : Array Nat × Nat × Nat) e =>
        let (a, k1, k2) := acc
        if e.2 == 1 then (a.push k1, k1 + 1, k2) else (a.push (b1 + k2), k1, k2 + 1)) (#[], 0, 0)
    let expos := (Array.range exs.size).map (· + r1e.size)
    ents.all (fun e => e.2 == 1 || e.2 == 2) && decide (last < u) && decide (u < 511) && bit8 fr.S last &&
      noBitsFrom fr.S (last + 1) && rowsOK tab fr.S 1 r1 && rowsOK tab fr.S 2 r2 &&
      XT.checkCut fr.S fr.D fr.N fr.U fr.d last b1 m m (mkDict tab ids) S.c2W S.npW u nd ce pos expos

/-- 8 limbs equal -/
def eq8 (a b : Array UInt64) : Bool := allN (fun k => a.getD k 0 == b.getD k 0) 8

/-- the labels of the 22 terms of a v7 record (8 limbs) -/
def leafLabels (ks : KStatics) (blob : ByteArray) : Array UInt64 :=
  let e := 8 * blob.size
  (List.range 22).foldl (fun M t => setBit8 M (ks.inv.getD (NL.rdw blob e (6 + 9 * t) 9) 511)) #[0, 0, 0, 0, 0, 0, 0, 0]

/-- **leaf code 0**: the leaf `S ∪ {lab}` (22 labels) and its v7 record `blob` -/
def leaf0OK (ks : KStatics) (S : Array UInt64) (d lab : Nat) (blob : ByteArray) : Bool :=
  let e := 8 * blob.size
  invOK ks.vec ks.inv && decide (lab < 511) && noBitsFrom S lab && decide (d + 1 = 22) && NL.rdw blob e 0 6 == 22 &&
    NL.rdw blob e (6 + 9 * 22) 1 == 0 && eq8 (leafLabels ks blob) (setBit8 S lab) && NL.leafAt blob 0

/-- **the dead-child check** of the r3 path -/
def deadR3 (S : IStat) (c : Cfg) : DeadChk := fun ids lm tab fr lab r =>
  let loc := fun (g : Nat) => let k := lm.getD g 0; if k == 0 then ids.size else k - 1
  decide (0 < fr.d) &&
  match r with
  | .cut k args nd ce vrows =>
    if k == 3 then
      match frameStep S.st tab fr lab (vrows.map loc) with
      | none => false
      | some f => flookAt S.ks f.S f.D f.U f.d lab (args.getD 0 0)
    else if k == 7 then
      match frameStep S.st tab fr lab (vrows.map loc) with
      | none => false
      | some f => winN f.S f.D f.d lab c
    else if (k == 5 || k == 6) && args.getD 1 0 == 1 then cutXOK S tab loc fr lab (args.extract 2 args.size) nd ce
    else if k == 2 then
      match frameStep S.st tab fr lab #[] with
      | none => false
      | some f => let w := loc (args.getD 0 0); decide (capOf tab w < popRowS tab f.S w)
    else false
  | .leaf code _ blob =>
    if code == 0 then leaf0OK S.ks fr.S fr.d lab blob
    else if code == 4 then
      match frameStep S.st tab fr lab #[] with
      | none => false
      | some f => flookAny S.ks f.S f.D f.U f.d lab
    else false

end NN
