import RootSound.Leaf
import RootSound.LemmaG
import RootSound.Branch
import RootSound.Sem2
import RootSound.TransBits
import RootSound.Walk
import RootSound.Core
import RootSound.Demo
import RootSound.Check
import RootSound.DblBits
open Lean in
/- one line per constant of the RootSound modules: module, name with any `_private.<Mod>.0.` prefix removed, kind, type hash -/
#eval show CoreM Unit from do
  let env ← getEnv
  let mods := env.header.moduleNames
  let mut xs : Array String := #[]
  for (name, ci) in env.constants.map₁.toList do
    let some i := env.getModuleIdxFor? name | continue
    let m := mods[i]!
    unless m.getRoot == `RootSound do continue
    let kind := match ci with | .thmInfo _ => "thm" | .defnInfo _ => "def" | .axiomInfo _ => "ax" | .opaqueInfo _ => "opq" | _ => "oth"
    let nm := (privateToUserName? name).getD name
    xs := xs.push s!"{m} {nm} {kind} {hash ci.type}"
  IO.FS.writeFile (← IO.getEnv "OUTF").get! (String.intercalate "\n" (xs.qsort (· < ·)).toList ++ "\n")
