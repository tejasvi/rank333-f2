module
public import E1N.Item
public import E1N.Load
public import E1N.Leaf
public import R22D.E1P_ptc
/-! # E1N.IP_ptc: the native checker of the certified point IP ptc (hcls ipns_P1_C3eD, 416,943 rows; hpt/README.md): its items (core only; not linked into the library: it reads the
module-land tables `R22D.E1P.*_ptc` (infra lib/src/R22D/E1P_ptc.lean), which stay IR-interpreted)

`D` is unpacked once per process (`mkIPD`: the slot table's 8,192 chunks, the group table and the caps), with the leaf hook
`leafHook VT DOM`.  A chunk (`#nchunk`, infra lib/R22N/Drv.lean) evaluates `batch ks ss` once and states
`R22N.KeysOK (Checked D) ks` through `batch_sound`. -/
@[expose] public section
namespace E1N.IP_ptc

/-- the point IP's native data -/
def D : IPD :=
  mkIPD 8 19 6 11 R22D.E1P.IP_ptc.R R22D.E1P.IP_ptc.N R22D.E1P.IP_ptc.UB R22D.E1P.SL_ptc.chunk R22D.E1P.GP_ptc.entry
    (leafHook R22D.E1P.IP_ptc.VT R22D.E1P.IP_ptc.DOM)

/-- the items of a chunk -/
def batch (ks : List Nat) (ss : List String) : Bool := batchL D ks ss

theorem batch_sound (ks : List Nat) (ss : List String) (h : batch ks ss = true) : R22N.KeysOK (Checked D) ks :=
  batchL_sound D ks ss h

end E1N.IP_ptc
