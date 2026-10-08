module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import NLP.E1Ext
/-! # R1.NDB: the two elaborators of native/leaf's T/E1XDemo321.lean (md5 ad6f5f3d…), copied for the E1 crowns' `hext` files.

* `bytesfile% "PATH"`: the term `NL.ofHex "<hex of the file's bytes>"` (the bytes become part of the statement that uses it);
* `#ndbool NAME t`: evaluates the `Bool` term `t` natively (`Lean.Meta.nativeEqTrue`, i.e. `native_decide`'s mechanism: one
  auxiliary axiom per evaluation, named under NAME) and adds `theorem NAME : t = true`.  (The `#ndbool` of the demo is changed only
  in that naming.) -/
@[expose] public section
open Lean Elab Command Meta

meta def R1.NDB.hexOf (b : ByteArray) : String := Id.run do
  let hd := "0123456789abcdef".toList.toArray
  let mut s := ""
  for x in b.toList do
    s := s.push hd[(x.toNat / 16)]! |>.push hd[(x.toNat % 16)]!
  return s

elab "bytesfile% " p:str : term => do
  let b ← IO.FS.readBinFile p.getString
  return mkApp (mkConst ``NL.ofHex) (.lit (.strVal (R1.NDB.hexOf b)))

elab "#ndbool " id:ident t:term : command => liftTermElabM do
  let e ← instantiateMVars (← Term.elabTerm t (some (mkConst ``Bool)))
  let t1 ← IO.monoNanosNow
  -- the auxiliary axiom is named under NAME (`NAME._native.native_decide.ax_1`): unique across files (without this, two files'
  -- axioms are both `_native.native_decide.ax_<n>` and cannot be imported together)
  match ← withDeclNameForAuxNaming id.getId (Lean.Meta.nativeEqTrue `native_decide e) with
  | .notTrue => throwError m!"{id.getId}: native evaluation gave false"
  | .success prf =>
    let t2 ← IO.monoNanosNow
    let ty ← mkEq e (mkConst ``Bool.true)
    addDecl (Declaration.thmDecl { name := id.getId, levelParams := [], type := ty, value := prf })
    logInfo m!"{id.getId}: native {(t2 - t1) / 1000000} ms"
