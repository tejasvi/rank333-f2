import RootSound.Bits
open Lean in
#eval show CoreM Unit from do
  let env ← getEnv
  let some idx := env.getModuleIdx? `RootSound.Bits | throwError "no module"
  let mut xs : Array String := #[]
  for (name, ci) in env.constants.map₁.toList do
    if env.getModuleIdxFor? name == some idx then
      let kind := match ci with | .thmInfo _ => "thm" | .defnInfo _ => "def" | .axiomInfo _ => "ax" | .opaqueInfo _ => "opq" | _ => "oth"
      xs := xs.push s!"{name} {kind} {hash ci.type} {(ci.value? (allowOpaque := true)).map hash}"
  for x in xs.qsort (· < ·) do IO.println x
