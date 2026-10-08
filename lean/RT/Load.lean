module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import RT.Defs
/-! # Loading a big verified row table from a binary file (no numeral elaboration)

`#rttable Pfx "file" ch`: entries of 16 bytes (little-endian 128-bit) in `file`; defines `Pfx.C<k>` (chunk `k`: `ch` entries
as one raw literal), the dispatcher `Pfx.D<l>_<i>` (one `Bool.rec` per bit of the chunk index), `Pfx.chunk`, `Pfx.entry i`
and `Pfx.N`.  Literals are built in O(n log n) (as `L1.Load`); every definition is checked by the kernel as usual. -/
@[expose] public section
open Lean Elab Command

namespace RTLoad

/-- little-endian bytes `[lo, hi)` of `b` as a Nat, divide and conquer -/
meta partial def natLE (b : ByteArray) (lo hi : Nat) : Nat :=
  if hi ≤ lo then 0
  else if hi - lo ≤ 64 then Id.run do
    let mut acc := 0
    let mut i := hi
    while i > lo do
      i := i - 1
      acc := acc * 256 + (b.get! i).toNat
    return acc
  else
    let mid := lo + (hi - lo) / 2
    natLE b lo mid + (natLE b mid hi <<< (8 * (mid - lo)))

meta def natTy : Expr := mkConst ``Nat

meta def defN (n : Name) (ty v : Expr) : CoreM Unit := do
  let dv : DefinitionVal := { name := n, levelParams := [], type := ty, value := v, hints := ReducibilityHints.abbrev, safety := DefinitionSafety.safe }
  addDecl (Declaration.defnDecl dv) (forceExpose := true)

/-- `Nat.beq (Nat.land (Nat.shiftRight k b) 1) 1` -/
meta def bitE (k : Expr) (b : Nat) : Expr :=
  mkApp2 (mkConst ``Nat.beq) (mkApp2 (mkConst ``Nat.land) (mkApp2 (mkConst ``Nat.shiftRight) k (mkRawNatLit b)) (mkRawNatLit 1))
    (mkRawNatLit 1)

meta def rttable (pfx : Name) (path : String) (ch : Nat) (wb : Nat) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let wB := wb / 8
  let n := b.size / wB
  let nch := (n + ch - 1) / ch
  let pf := pfx
  for k in [0:nch] do
    liftCoreM <| defN (pf ++ Name.mkSimple s!"C{k}") natTy (mkRawNatLit (natLE b (wB * ch * k) (min b.size (wB * ch * (k + 1)))))
  let dep := Nat.max 1 (Nat.log2 (nch - 1) + 1)
  let fnTy := mkForall `k BinderInfo.default natTy natTy
  for lvl in [1:dep + 1] do
    let cnt := (nch + 2 ^ lvl - 1) / 2 ^ lvl
    for idx in [0:cnt] do
      let kv := mkBVar 0
      let child (c : Nat) : Expr :=
        if lvl == 1 then (if c < nch then mkConst (pf ++ Name.mkSimple s!"C{c}") else mkRawNatLit 0)
        else (if c * 2 ^ (lvl - 1) < nch then mkApp (mkConst (pf ++ Name.mkSimple s!"D{lvl-1}_{c}")) kv else mkRawNatLit 0)
      let body := mkApp4 (mkConst ``Bool.rec [Level.one]) (mkLambda `_ BinderInfo.default (mkConst ``Bool) natTy)
        (child (2 * idx)) (child (2 * idx + 1)) (bitE kv (lvl - 1))
      liftCoreM <| defN (pf ++ Name.mkSimple s!"D{lvl}_{idx}") fnTy (mkLambda `k BinderInfo.default natTy body)
  liftCoreM <| defN (pf ++ `chunk) fnTy (mkLambda `k BinderInfo.default natTy (mkApp (mkConst (pf ++ Name.mkSimple s!"D{dep}_0")) (mkBVar 0)))
  -- entry i = (chunk (i / ch) >>> (wb * (i % ch))) &&& (2^wb - 1)
  let iv := mkBVar 0
  let ent := mkApp2 (mkConst ``Nat.land)
    (mkApp2 (mkConst ``Nat.shiftRight) (mkApp (mkConst (pf ++ `chunk)) (mkApp2 (mkConst ``Nat.div) iv (mkRawNatLit ch)))
      (mkApp2 (mkConst ``Nat.mul) (mkRawNatLit wb) (mkApp2 (mkConst ``Nat.mod) iv (mkRawNatLit ch))))
    (mkRawNatLit (2 ^ wb - 1))
  liftCoreM <| defN (pf ++ `entry) fnTy (mkLambda `i BinderInfo.default natTy ent)
  liftCoreM <| defN (pf ++ `N) natTy (mkRawNatLit n)
  logInfo m!"#rttable {pf}: {n} entries of {wb} bits, {nch} chunks, depth {dep}"

elab "#rttable " pfx:ident p:str ch:num : command => rttable pfx.getId p.getString ch.getNat 128
/-- entries of `w` bits (`w / 8` bytes each) -/
elab "#rttablew " pfx:ident p:str ch:num w:num : command => rttable pfx.getId p.getString ch.getNat w.getNat

end RTLoad
