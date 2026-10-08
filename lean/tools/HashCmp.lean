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
/- per module: constant count, order-independent hashes of (name, kind, type) and of values -/
#eval show CoreM Unit from do
  let env ← getEnv
  let mods := env.header.moduleNames
  for i in [0:mods.size] do
    let m := mods[i]!
    unless m.getRoot == `RootSound do continue
    let mut ht : UInt64 := 0
    let mut hv : UInt64 := 0
    let mut n := 0
    for (name, ci) in env.constants.map₁.toList do
      if env.getModuleIdxFor? name == some i then
        let kind : UInt64 := match ci with
          | .thmInfo _ => 1 | .defnInfo _ => 2 | .axiomInfo _ => 3 | .opaqueInfo _ => 4 | _ => 5
        ht := ht + mixHash (hash name) (mixHash kind (hash ci.type))
        hv := hv + (match ci.value? (allowOpaque := true) with | some v => mixHash (hash name) (hash v) | none => 0)
        n := n + 1
    IO.println s!"{m} {n} {ht} {hv}"
