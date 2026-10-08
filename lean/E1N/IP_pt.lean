module
public import E1N.Item
public import E1N.Load
public import E1N.Leaf
public import R22D.E1P_pt
/-! # E1N.IP_pt: the native checker of the point IP's items (core only; not linked into the library: it reads the
module-land tables `R22D.E1P.*_pt`, which stay IR-interpreted)

`D` is unpacked once per process (`mkIPD`: the slot table's 8,192 chunks, the group table and the caps), with the leaf hook
`leafHook VT DOM`.  A chunk (`#nchunk`, infra lib/R22N/Drv.lean) evaluates `batch ks ss` once and states
`R22N.KeysOK (Checked D) ks` through `batch_sound`. -/
@[expose] public section
namespace E1N.IP_pt

/-- the point IP's native data -/
def D : IPD :=
  mkIPD 8 19 6 11 R22D.E1P.IP_pt.R R22D.E1P.IP_pt.N R22D.E1P.IP_pt.UB R22D.E1P.SL_pt.chunk R22D.E1P.GP_pt.entry
    (leafHook R22D.E1P.IP_pt.VT R22D.E1P.IP_pt.DOM)

/-- the items of a chunk -/
def batch (ks : List Nat) (ss : List String) : Bool := batchL D ks ss

theorem batch_sound (ks : List Nat) (ss : List String) (h : batch ks ss = true) : R22N.KeysOK (Checked D) ks :=
  batchL_sound D ks ss h

end E1N.IP_pt
