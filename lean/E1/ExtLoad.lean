module
public import R22Port.U_d41d8cd98f00
public meta import Lean
public import E1.E1Load
/-! # Loading a long external-leaf list from a binary file

`#e1ext Pfx "file" k`: the file holds `u32 count`, then per entry `u32 nbytes` and the little-endian bytes.  Defines
`Pfx.X<j>` (consecutive chunks of at most `k` entries, each a `List Nat` of raw literals) and
`Pfx.EXT := X0 ++ (X1 ++ (… ++ (X<m-1> ++ [])))` (as `List.append`).  A source list literal of `n` entries elaborates in
time about quadratic in `n` (80,000 entries: 300 s, 4 GB); this is linear.  The kernel checks every definition. -/
@[expose] public section
open Lean Elab Command

namespace E1Load

meta def e1ext (pfx : Name) (path : String) (k : Nat) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let cnt := u32 b 0
  let natTy := mkConst ``Nat
  let listTy := mkApp (mkConst ``List [Level.zero]) natTy
  let nil := mkApp (mkConst ``List.nil [Level.zero]) natTy
  let mut off := 4
  let mut vals : Array Nat := #[]
  for _ in [0:cnt] do
    let nb := u32 b off
    off := off + 4
    vals := vals.push (RTLoad.natLE b off (off + nb))
    off := off + nb
  let nch := (cnt + k - 1) / k
  let mut chunks : Array Name := #[]
  for j in [0:nch] do
    let lo := j * k
    let hi := min cnt (lo + k)
    let mut lst := nil
    for t in [0:hi - lo] do
      lst := mkApp3 (mkConst ``List.cons [Level.zero]) natTy (mkRawNatLit vals[hi - 1 - t]!) lst
    let nm := pfx ++ Name.mkSimple s!"X{j}"
    liftCoreM <| RTLoad.defN nm listTy lst
    chunks := chunks.push nm
  let mut e := nil
  for nm in chunks.reverse do
    e := mkApp3 (mkConst ``List.append [Level.zero]) natTy (mkConst nm) e
  liftCoreM <| RTLoad.defN (pfx ++ `EXT) listTy e
  logInfo m!"#e1ext {pfx}: {cnt} entries in {nch} chunks"

elab "#e1ext " pfx:ident p:str k:num : command => e1ext pfx.getId p.getString k.getNat

end E1Load
