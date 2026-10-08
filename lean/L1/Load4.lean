module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import L1.Load3
public import L1.Check4
@[expose] public section
open Lean Elab Command
namespace L1Load
elab "#l1batch4 " id:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let it := items b 0 #[]
  let s := it[0]!
  let t2 := prodTy natTy natTy
  let t3 := prodTy natTy t2
  let t4 := prodTy natTy t3
  let t5 := prodTy natTy t4
  let st := (List.range s).map fun i =>
    mkPair natTy t4 (mkRawNatLit it[1+5*i]!) (mkPair natTy t3 (mkRawNatLit it[2+5*i]!)
      (mkPair natTy t2 (mkRawNatLit it[3+5*i]!) (mkPair natTy natTy (mkRawNatLit it[4+5*i]!) (mkRawNatLit it[5+5*i]!))))
  let o := 1 + 5 * s
  let n := it[o]!
  -- nodes: label, record, number of kills, kills
  let lnat := mkApp (mkConst ``List [Level.zero]) natTy
  let mut nd : Array Expr := #[]
  let mut q := o + 1
  for _ in [0:n] do
    let l := it[q]!; let r := it[q+1]!; let nk := it[q+2]!
    let ks := (List.range nk).map fun j => mkRawNatLit it[q+3+j]!
    let tl := prodTy natTy lnat
    nd := nd.push (mkPair natTy (prodTy natTy (prodTy natTy tl)) (mkConst (tabName l))
      (mkPair natTy (prodTy natTy tl) (mkConst (hName "h" l)) (mkPair natTy tl (mkConst (hName "suf" l)) (mkPair natTy lnat (mkRawNatLit r) (mkList natTy ks)))))
    q := q + 3 + nk
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkApp2 (mkConst ``L1.batch4) (mkList t5 st)
      (mkList (prodTy natTy (prodTy natTy (prodTy natTy (prodTy natTy lnat)))) nd.toList)) (mkConst ``Bool.true)
  let pf := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
  let tv : TheoremVal := { name := id.getId, levelParams := [], type := ty, value := pf }
  let decl := Declaration.thmDecl tv
  -- synchronous kernel check, timed (the regular addDecl below checks again, possibly in a background task)
  let kenv := (← getEnv).toKernelEnv
  let opts ← getOptions
  let t0 ← IO.monoNanosNow
  let c0 ← cpuMs
  match Lean.Kernel.Environment.addDecl kenv opts decl with
  | .ok _ => pure ()
  | .error e => throwError m!"{id.getId}: kernel rejects the batch: {e.toMessageData opts}"
  let t1 ← IO.monoNanosNow
  let c1 ← cpuMs
  logInfo m!"{id.getId}: {n} nodes, kernel {(t1 - t0) / 1000000} ms wall, {c1 - c0} ms cpu"
  liftCoreM <| addDecl decl

end L1Load
