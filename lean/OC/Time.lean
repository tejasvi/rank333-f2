module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
/-! `#okthm name : b`: the theorem `name : b = true` with proof `Eq.refl true`, added by ONE synchronous kernel check
(`Environment.addDeclCore`), timed (wall ms, process CPU ms from /proc/self/stat).  Nothing is trusted: the kernel
evaluates `b` while checking `Eq.refl true : b = true`. -/
@[expose] public section
open Lean Elab Command Term Meta
namespace OC

/-- user + system CPU time of this process in ms -/
meta def cpuMs : IO Nat := do
  let s ← IO.FS.readFile "/proc/self/stat"
  let rest := (s.splitOn ") ").getLast!
  let f := rest.splitOn " "
  return ((f[11]!).toNat! + (f[12]!).toNat!) * 10

elab "#okthm " id:ident " : " t:term : command => do
  let e ← liftTermElabM do
    let e ← Term.elabTerm t (some (mkConst ``Bool))
    Term.synthesizeSyntheticMVarsNoPostponing
    instantiateMVars e
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool) e (mkConst ``Bool.true)
  let pf := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
  let n := (← getCurrNamespace) ++ id.getId
  let decl := Declaration.thmDecl { name := n, levelParams := [], type := ty, value := pf }
  let opts ← getOptions
  let t0 ← IO.monoNanosNow
  let c0 ← cpuMs
  match (← getEnv).addDeclCore (Core.getMaxHeartbeats opts).toUSize decl none with
  | .ok env' => setEnv env'
  | .error ex => throwError m!"{n}: kernel rejects: {ex.toMessageData opts}"
  let t1 ← IO.monoNanosNow
  let c1 ← cpuMs
  logInfo m!"{n}: kernel {(t1 - t0) / 1000000} ms wall, {c1 - c0} ms cpu"

end OC
