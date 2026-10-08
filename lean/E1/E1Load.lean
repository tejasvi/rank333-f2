module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import RT.Load
/-! # Loading E1 block literals from a binary file (no numeral elaboration)

`#e1lits Pfx "file"`: the file holds `u32 count`, then per literal `u32 nbytes` and the little-endian bytes.  Defines
`Pfx.L<i>` (raw literals), `Pfx.lits : List Nat` (in file order) and `Pfx.n`.  Literals are built in O(n log n) by
`RTLoad.natLE`; every definition is checked by the kernel as usual. -/
@[expose] public section
open Lean Elab Command

namespace E1Load

meta def u32 (b : ByteArray) (i : Nat) : Nat :=
  (b.get! i).toNat + 256 * (b.get! (i + 1)).toNat + 65536 * (b.get! (i + 2)).toNat + 16777216 * (b.get! (i + 3)).toNat

meta def e1lits (pfx : Name) (path : String) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let cnt := u32 b 0
  let mut off := 4
  let natTy := mkConst ``Nat
  let mut names : Array Name := #[]
  for i in [0:cnt] do
    let nb := u32 b off
    off := off + 4
    let v := RTLoad.natLE b off (off + nb)
    off := off + nb
    let nm := pfx ++ Name.mkSimple s!"L{i}"
    liftCoreM <| RTLoad.defN nm natTy (mkRawNatLit v)
    names := names.push nm
  let listTy := mkApp (mkConst ``List [Level.zero]) natTy
  let mut lst : Expr := mkApp (mkConst ``List.nil [Level.zero]) natTy
  for nm in names.reverse do
    lst := mkApp3 (mkConst ``List.cons [Level.zero]) natTy (mkConst nm) lst
  liftCoreM <| RTLoad.defN (pfx ++ `lits) listTy lst
  liftCoreM <| RTLoad.defN (pfx ++ `n) natTy (mkRawNatLit cnt)
  logInfo m!"#e1lits {pfx}: {cnt} literals"

elab "#e1lits " pfx:ident p:str : command => e1lits pfx.getId p.getString

end E1Load
