module
public import E1N.Item
public import E1N.Load
public import E1N.Leaf
public import R22D.E1G_l479cw
/-! # E1N.IP_l479cw: the native checker of the items of L479's line IP `l479cw` (E1G widths; core only; not linked into
the library: it reads the module-land tables `R22D.E1G.*_l479cw`, which stay IR-interpreted)

`D` is unpacked once per process (`mkIPD 7 15 6 11`: the slot table's 512 chunks, the group table and the caps), with the
E1G leaf hook `leafHookG VT DOM EXT`.  A chunk (`#nchunk`) evaluates `batch ks ss` once and states
`R22N.KeysOK (Checked D) ks` through `batch_sound`. -/
@[expose] public section
namespace E1N.IP_l479cw

/-- the IP's native data -/
def D : IPD :=
  mkIPD 7 15 6 11 R22D.E1G.IP_l479cw.R R22D.E1G.IP_l479cw.N R22D.E1G.IP_l479cw.UB R22D.E1G.SL_l479cw.chunk
    R22D.E1G.GP_l479cw.entry (leafHookG R22D.E1G.IP_l479cw.VT R22D.E1G.IP_l479cw.DOM R22D.E1G.IP_l479cw.EXT)

/-- the items of a chunk -/
def batch (ks : List Nat) (ss : List String) : Bool := batchL D ks ss

theorem batch_sound (ks : List Nat) (ss : List String) (h : batch ks ss = true) : R22N.KeysOK (Checked D) ks :=
  batchL_sound D ks ss h

end E1N.IP_l479cw
