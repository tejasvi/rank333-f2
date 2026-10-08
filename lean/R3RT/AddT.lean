module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import L1.Load
/-! `addTimed decl`: one synchronous kernel check of `decl` (`Environment.addDeclCore`), the checked environment installed with
`setEnv`, the check timed (wall ms, process CPU ms).

Why not L1's pattern (a timed `Kernel.Environment.addDecl` on `toKernelEnv`, then `addDecl` again): that checks every declaration
twice, and the second check may run in a background task.  The timed region then also waits for the previous declaration's background
check (the pure `toKernelEnv` blocks on it, and the compiler may evaluate it inside the timed region), so each logged time is about
the declaration's own check plus its predecessor's, and the first declaration after a big one absorbs that one. -/
@[expose] public section
open Lean Elab Command
namespace R3RTAdd
meta def addTimed (decl : Declaration) (what : String) : CommandElabM (Nat × Nat) := do
  let opts ← getOptions
  let t0 ← IO.monoNanosNow
  let c0 ← L1Load.cpuMs
  let env ← getEnv
  match env.addDeclCore (Core.getMaxHeartbeats opts).toUSize decl none with
  | .ok env' => setEnv env'
  | .error e => throwError m!"{what}: kernel rejects: {e.toMessageData opts}"
  let t1 ← IO.monoNanosNow
  let c1 ← L1Load.cpuMs
  return ((t1 - t0) / 1000000, c1 - c0)
end R3RTAdd
