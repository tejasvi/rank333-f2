module
public import R22Port.U_d41d8cd98f00
public meta import Lean
public import L1.Load
/-! # Namespaced loaders for L1's static tables (G5, `--rord 321`)

`L1Load`'s `#l1tables` / `#l1hyp` define fixed names `L1.T.*`.  The `--rord 321` tables need their own namespace so that they
can sit next to the 123 ones:
* `#l1tablesNS Pfx "file"`: `Pfx.c2t_<l>` (l < 511) and `Pfx.CONF1T`, same layout as `#l1tables` (511 × 64 bytes per table);
* `#l1hypNS Pfx "file"`: `Pfx.h_<l>` and `Pfx.suf_<l>`, same layout as `#l1hyp` (2 × 511 × 448 bytes).
Only terms are built (raw literals); every definition is checked by the kernel as usual. -/
@[expose] public section
open Lean Elab Command

namespace L1Load

elab "#l1tablesNS " pfx:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let tab := 511 * 64
  for l in [0:511] do
    liftCoreM <| defNat (pfx.getId ++ Name.mkSimple s!"c2t_{l}") (natLE b (l * tab) ((l + 1) * tab))
  liftCoreM <| defNat (pfx.getId ++ `CONF1T) (natLE b (511 * tab) (512 * tab))

elab "#l1hypNS " pfx:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let tb := 448
  for l in [0:511] do
    liftCoreM <| defNat (pfx.getId ++ Name.mkSimple s!"h_{l}") (natLE b (l * tb) ((l + 1) * tb))
  for l in [0:511] do
    liftCoreM <| defNat (pfx.getId ++ Name.mkSimple s!"suf_{l}") (natLE b ((511 + l) * tb) ((512 + l) * tb))

end L1Load
