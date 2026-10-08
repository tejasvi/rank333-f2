module
public import NN.Conv
public import NN.Kinds
public import XT.R3
public import XT.Check
/-! # NN.Item: the per-item check of the r3 path (core only)

An item (queue segment) is checked from the frame of its root's parent (`rootFrameN`, header prefix and dead mask with witness
rows) by the tree walk `chkT` with
* `nodeFn`: an OPEN node's records converted (`conv`), the L1 node step (`nodeStep2`), the X part on the child frame (R3's
  batch-11 blobs through the X tier's `XT.checkR3`), the kinds records (`kindsOK`), and the mask of the children
  the node accounts for (`accAll`: dead labels `D'`, T/C kills, X children, PREFF / DOOM / TYPE / CANON children, the suffix break);
* `deadFn`: the dead children (cut nodes, leaves), a parameter here (`NN.Dead`).
The tree walk checks child order and coverage (`coverOK`). -/
@[expose] public section

namespace NN

/-- the static data of an item check: L1's tables, the kinds tables, the X tier's cap-2 rows (`XT.prepC2 st.c2t`) and the label
order's hyperplane masks (`npW[X]`: labels with odd pairing against `X`; `XT.nperpTab` for `--rord 123`) -/
structure IStat where
  st : Statics
  ks : KStatics
  c2W : Array (Array XT.W8)
  npW : Array XT.W8

/-- the X part of a converted node on its child frame (the X tier's `XT.checkR3` on R3's blobs): the X children, or `none` if
rejected -/
def xKids (S : IStat) (tab : Tab) (cn : ConvNode) (lab : Nat) (out : StepOut) : Option (Array Nat) :=
  if cn.xk.size == 0 then some #[] else
  if XT.checkR3 out.fr.S out.fr.D out.fr.N out.fr.U out.fr.d lab out.b1 out.m out.e1 (mkDict tab out.ids) S.c2W S.npW cn.xpn
      cn.xk cn.pos
  then some (cn.xk.map (·.1)) else none

/-- the kinds records of an OPEN node on its child frame `fr` (top label `lab`, case configuration `c`) -/
def kindsOK (ks : KStatics) (fr : Frame) (lab : Nat) (c : Cfg) (r : R3.RNode) : Bool :=
  r.preff.all (fun p => decide (lab < p.1) && decide (p.1 < 511) && preffN ks fr.U fr.d p.1 p.2) &&
  r.doom.all (fun u => decide (lab < u) && decide (u < 511) && doomN fr.S fr.D fr.d u c) &&
  r.typ.all (fun u => c.ty && decide (lab < u) && decide (u < 511) && tyN fr.S fr.d u) &&
  r.canon.all (fun c => decide (lab < c.1) && decide (c.1 < 511) && canonN ks fr.S c.1 c.2.2)

/-- the children an OPEN node accounts for (8 limbs) -/
def accAll (fr : Frame) (lab : Nat) (kills : Array Kill) (xk : Array Nat) (r : R3.RNode) : Array UInt64 :=
  let a := accL1 fr.D kills
  let a := xk.foldl setBit8 a
  let a := r.preff.foldl (fun a p => setBit8 a p.1) a
  let a := r.doom.foldl setBit8 a
  let a := r.typ.foldl setBit8 a
  let a := r.canon.foldl (fun a c => setBit8 a c.1) a
  let sm := sufMask fr.D lab (21 - fr.d)
  (Array.range 8).map fun k => a.getD k 0 ||| sm.getD k 0

/-- the counters fit 7 bits -/
def uOK (U : ByteArray) : Bool := allN (fun X => decide ((U.get! X).toNat < 128)) 512

/-- **one OPEN node** of an item: its child frame and the children it accounts for -/
def nodeFn (S : IStat) (c : Cfg) (ids lm : Array Nat) (tab : Tab) (fr : Frame) (lab : Nat) (r : R3.RNode) :
    Option (Frame × Array UInt64) :=
  match conv ids lm tab r with
  | none => none
  | some cn =>
    if cn.nrec.lab != lab then none else
    match nodeStep2 S.st tab fr cn.nrec with
    | none => none
    | some out =>
      match xKids S tab cn lab out with
      | none => none
      | some xk =>
        if uOK out.fr.U && kindsOK S.ks out.fr lab c r then some (out.fr, accAll out.fr lab cn.nrec.kills xk r)
        else none

end NN
