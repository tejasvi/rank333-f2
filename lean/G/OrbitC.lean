module
public import R22Port.U_d41d8cd98f00
public import OC.Main
/-! # Orbit completeness of the anchor representatives

`OrbitComplete2`, `OrbitComplete3 1`, `OrbitComplete3 2` of `G/Interface.lean`, proved in `r22/thm4/gram/orbitc`
(module root `OC`; see its README.md): column-space normalization of `B` by `h`, per-state witnesses for the
remaining states (288 at d = 1, 36,352 at d = 2, 160 rank-2 states at d = 0) checked in the kernel against the
interface's `act3` / `act2`, and the symbolic soundness proof `OC.oc3_of` / `OC.oc2_of`.

Build: LEAN_PATH must contain `r22/thm4/gram/orbitc/out` (built by
`orbitc/mkall.sh`). -/
@[expose] public section
namespace G

theorem orbitComplete2 : OrbitComplete2 := OC.orbitComplete2
theorem orbitComplete3_1 : OrbitComplete3 1 := OC.orbitComplete3_1
theorem orbitComplete3_2 : OrbitComplete3 2 := OC.orbitComplete3_2

end G

#print axioms G.orbitComplete2
#print axioms G.orbitComplete3_1
#print axioms G.orbitComplete3_2
