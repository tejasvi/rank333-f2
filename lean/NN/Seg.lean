module
public import NN.Node
/-! # NN.Seg: the per-item tree layer (core only)

An item (queue segment) is decoded into a tree: OPEN nodes with their records and their children in label order, dead children
(cut nodes, leaves) with theirs, external children (DON / JOB), and at most one range reference per OPEN node (RNG `l`: the node's
children `≥ l` are another item; the node has no END here). `chkT nodeFn deadFn fr lb t` checks the tree from the frame `fr` of
the root's parent:
* every OPEN node by `nodeFn` (node record, X part, kind records), which returns the child frame and the mask of the children it
  accounts for (killed, dead, …);
* every dead child by `deadFn`;
* every child label above its parent's and below 511, in increasing order;
* **coverage**: every label in `(last, 511)` of an OPEN node is accounted for, a child of the tree, below the root's `lb`
  (a range item's `lo`), or at or above the node's range start.
`NNP.Seg` turns an accepted tree into `Top.SegOKO`'s per-node clause, given the soundness of `nodeFn` and `deadFn`. -/
@[expose] public section

namespace NN

mutual
/-- a decoded item tree -/
inductive STree (NR DR : Type) where
  /-- an OPEN node: label, records, children, range start (`none`: closed by END) -/
  | node (lab : Nat) (r : NR) (kids : SKids NR DR) (rng : Option Nat)
  /-- a dead child (cut node, leaf) with its records -/
  | dead (lab : Nat) (r : DR)
  /-- an external child (DON / JOB reference) -/
  | ext (lab : Nat)
/-- the children of an OPEN node, in increasing label order -/
inductive SKids (NR DR : Type) where
  | nil
  | cons (t : STree NR DR) (ts : SKids NR DR)
end

/-- the label of a tree's root -/
def STree.lab {NR DR : Type} : STree NR DR → Nat
  | .node l _ _ _ => l
  | .dead l _ => l
  | .ext l => l

/-- the labels of a child list (8 limbs) -/
def kidsMask {NR DR : Type} : SKids NR DR → Array UInt64
  | .nil => #[0, 0, 0, 0, 0, 0, 0, 0]
  | .cons t ts => setBit8 (kidsMask ts) t.lab

/-- the labels of a child list are above `last`, below 511, strictly increasing -/
def kidsOrd {NR DR : Type} (last : Nat) : SKids NR DR → Bool
  | .nil => true
  | .cons t ts => last < t.lab && t.lab < 511 && kidsOrd t.lab ts

/-- the mask of the labels `< lb` inside limb `k` -/
def belowW (lb k : Nat) : UInt64 := ~~~(fromW lb k)

/-- **coverage of an OPEN node**: every label in `(last, 511)` is accounted for (`acc`), a child (`kids`), below `lb`, or at or
above the range start `rng` -/
def coverOK (last lb : Nat) (rng : Option Nat) (acc kids : Array UInt64) : Bool :=
  let r := match rng with | some l => l | none => 511
  allN (fun k => let w := aboveW (last + 1) k
    (acc.getD k 0 ||| kids.getD k 0 ||| belowW lb k ||| (fromW r k)) &&& w == w) 8

/-- the range start is above the node's lower bound -/
def rngOK (lb : Nat) : Option Nat → Bool
  | some l => lb < l
  | none => true

mutual
/-- **check an item tree** from the frame `fr` of its root's parent; `lb` = the lower bound on the root's children -/
def chkT {NR DR : Type} (nodeFn : Frame → Nat → NR → Option (Frame × Array UInt64)) (deadFn : Frame → Nat → DR → Bool)
    (fr : Frame) (lb : Nat) : STree NR DR → Bool
  | .node lab r kids rng =>
    match nodeFn fr lab r with
    | none => false
    | some (fr', acc) =>
      kidsOrd lab kids && rngOK lb rng && coverOK lab lb rng acc (kidsMask kids) && chkK nodeFn deadFn fr' kids
  | .dead lab r => deadFn fr lab r
  | .ext _ => true
def chkK {NR DR : Type} (nodeFn : Frame → Nat → NR → Option (Frame × Array UInt64)) (deadFn : Frame → Nat → DR → Bool)
    (fr : Frame) : SKids NR DR → Bool
  | .nil => true
  | .cons t ts => chkT nodeFn deadFn fr 0 t && chkK nodeFn deadFn fr ts
end

end NN

namespace NN
/-- the root of an item is an OPEN node or a dead node -/
def STree.isRoot {NR DR : Type} : STree NR DR → Bool
  | .node _ _ _ _ => true
  | .dead _ _ => true
  | .ext _ => false
end NN
