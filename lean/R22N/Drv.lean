module
public meta import Lean.Elab.Command
public meta import Lean.Meta.Native
public meta import Lean.Compiler.Options
/-! # R22N.Drv: the chunk driver of form (B) (native/infra, PROOF_OBJECT.md §3)

`#nchunk thm batchFn soundLemma "LIST"` with LIST lines `KEY PATH` (decimal key; PATH holds the item data, ASCII/UTF-8, e.g. the
`R22N.Bin7` encoding):
* ONE native evaluation of `batchFn [k…] [s…]` (keys as a `List Nat`, data as `List String`, one literal per item), whose
  `_native.native_decide.ax_N` is created under a PRIVATE aux-name prefix, so it (and the data) stays in `.olean.private`;
* `theorem thm : T := soundLemma [k…] [s…] ax` (public), where `T` is the type of that application: certificate-free, e.g.
  `R22N.KeysOK Checked [k…]`.
Logs `#nchunk thm: n items, B bytes, read/utf8/native/thm µs` and the axiom name.  The chunk wrapper (`nchk.sh`) accepts only
chunk sources of the fixed template (PROOF_OBJECT.md §3.4). -/
public meta section
open Lean Elab Command Meta
namespace R22N.Drv

def listE (ty : Expr) (xs : List Expr) : Expr :=
  xs.foldr (fun x acc => mkApp3 (mkConst ``List.cons [.zero]) ty x acc) (mkApp (mkConst ``List.nil [.zero]) ty)

def us (t0 t1 : Nat) : Nat := (t1 - t0) / 1000

elab "#nchunk " id:ident f:ident snd:ident p:str : command => do
  let t0 ← IO.monoNanosNow
  let lines := (← IO.FS.lines p.getString).toList.filter (· ≠ "")
  let mut ks : Array Nat := #[]
  let mut bs : Array ByteArray := #[]
  for l in lines do
    match l.splitOn " " with
    | [k, f] => ks := ks.push k.toNat!; bs := bs.push (← IO.FS.readBinFile f)
    | _ => throwError m!"#nchunk: bad line {l}"
  let t1 ← IO.monoNanosNow
  let ss ← bs.mapM fun b => match String.fromUTF8? b with
    | some s => pure s
    | none => throwError "#nchunk: item data is not valid UTF-8 (use R22N.Bin7)"
  let t2 ← IO.monoNanosNow
  let kE := listE (mkConst ``Nat) (ks.toList.map mkRawNatLit)
  let sE := listE (mkConst ``String) (ss.toList.map fun s => .lit (.strVal s))
  let fn ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo f
  let sn ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo snd
  let e := mkApp2 (mkConst fn) kE sE
  let pn := mkPrivateName (← getEnv) (id.getId ++ `nd)
  let r ← liftTermElabM <| withDeclNameForAuxNaming pn <| Lean.Meta.nativeEqTrue `native_decide e
  let t3 ← IO.monoNanosNow
  match r with
  | .notTrue => throwError m!"#nchunk {id.getId}: native evaluation gave false"
  | .success prf =>
    let v := mkApp3 (mkConst sn) kE sE prf
    let ty ← liftTermElabM <| Meta.inferType v
    let ty ← liftTermElabM <| instantiateMVars ty
    liftCoreM <| addDecl (.thmDecl { name := id.getId, levelParams := [], type := ty, value := v })
    let t4 ← IO.monoNanosNow
    let tot := bs.foldl (fun a b => a + b.size) 0
    logInfo m!"#nchunk {id.getId}: {ks.size} items, {tot} bytes; us read {us t0 t1} utf8 {us t1 t2} native {us t2 t3} thm {us t3 t4}; axiom {prf}"

end R22N.Drv
