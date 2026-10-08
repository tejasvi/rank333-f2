module
public import R22Port.U_6050cb77ad13
public import Lean
public import BC4Tables
public import BC6Tables
public import BC7Tables
public import BranchCheck6
public import BranchCheck7
@[expose] public section
open Lean Meta
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def mkDecl (nm : Name) (ns : Name) (L : Nat) : MetaM Declaration := do
  let lhs := mkApp2 (mkConst (ns ++ `batch)) (mkRawNatLit 32) (mkRawNatLit L)
  let stmt ← mkEq lhs (mkConst ``Bool.true)
  let inst ← synthInstance (mkApp (mkConst ``Decidable) stmt)
  let pf := mkApp3 (mkConst ``of_decide_eq_true) stmt inst (← mkEqRefl (mkConst ``Bool.true))
  return .thmDecl { name := nm, levelParams := [], type := stmt, value := pf }
def timeIt (ns : Name) (L : Nat) (i : Nat) : MetaM Nat := do
  let d ← mkDecl (Name.mkSimple s!"tq{i}") ns L
  let env ← getEnv
  let t0 ← IO.monoNanosNow
  match env.addDeclCore 0 d none with
  | .ok _ => pure ()
  | .error _ => throwError s!"kernel rejected {ns} literal {i}"
  let t1 ← IO.monoNanosNow
  return t1 - t0
#eval show MetaM Unit from do
  let specs : Array (Name × String) := #[(`BC6, "data/lean/8590c25368c24a5ae95397ef7c3ad72a/c150.k4.v6"), (`BC7, "data/lean/f64726debbf67585070a09da305e7a9c/c150.v7.lit")]
  let mut lits : Array (Array Nat) := #[]
  for (_, f) in specs do
    let ls ← IO.FS.lines f
    lits := lits.push (ls.filterMap String.toNat?)
  let n := specs.size
  let mut tot : Array Nat := Array.replicate n 0
  let mut i := 0
  for rep in [0:1] do
    for j0 in [0:n] do
      let k := (j0 + rep) % n
      for li in [0:lits[k]!.size] do
        let t ← timeIt specs[k]!.1 lits[k]![li]! i
        tot := tot.modify k (· + t)
        i := i + 1
  IO.println s!"AB {specs.toList.map (fun p => s!"{p.1}:{p.2}")} {tot.toList.map (fun t => t / 1000000)} ms"
