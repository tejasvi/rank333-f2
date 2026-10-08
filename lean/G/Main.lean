module
public import R22Port.U_d41d8cd98f00
public import G.AccProof
public import GS.Final
public import G.OrbitC
public import Br.Top
/-! # The nine Gram-state props of `G/Interface.lean` (deliverable for `KD.typeFacts95_of` via the bridge)

* the six `NoFam_*`: the soundness theorems `GS.noFam_*` (r22/thm4/gram/sound, `Accept_* → NoFam_*`) applied to the
  acceptance theorems `G.accept_*` (`G/AccProof.lean`: per anchor, phase A + per-vertex batches, kernel-checked runs);
* the three orbit-completeness props: `G.orbitComplete*` (`G/OrbitC.lean`, r22/thm4/gram/orbitc).
Kernel only; axioms `propext`, `Classical.choice`, `Quot.sound`. -/
@[expose] public section
namespace G.Main
open G

theorem noFam_17_5_0 : NoFam_17_5_0 := GS.noFam_17_5_0 accept_d0S
theorem noFam_19_0_3 : NoFam_19_0_3 := GS.noFam_19_0_3 accept_d1V
theorem noFam_18_2_2 : NoFam_18_2_2 := GS.noFam_18_2_2 accept_d1V
theorem noFam_17_4_1 : NoFam_17_4_1 := GS.noFam_17_4_1 accept_d1S
theorem noFam_17_3_2 : NoFam_17_3_2 := GS.noFam_17_3_2 accept_d2
theorem noFam_18_1_3 : NoFam_18_1_3 := GS.noFam_18_1_3 accept_d2
theorem orbitComplete2 : OrbitComplete2 := G.orbitComplete2
theorem orbitComplete3_1 : OrbitComplete3 1 := G.orbitComplete3_1
theorem orbitComplete3_2 : OrbitComplete3 2 := G.orbitComplete3_2

/-- the type facts of `--typecut 95` (bridge `G.Br.typeFacts_of_accept`, r22/thm4/gram/bridge/Br/Top.lean) -/
theorem typeFacts : KD.TypeFacts := G.Br.typeFacts_of_accept accept_d2 accept_d1V accept_d1S accept_d0S

end G.Main

#print axioms G.Main.noFam_17_5_0
#print axioms G.Main.noFam_19_0_3
#print axioms G.Main.noFam_18_2_2
#print axioms G.Main.noFam_17_4_1
#print axioms G.Main.noFam_17_3_2
#print axioms G.Main.noFam_18_1_3
#print axioms G.Main.orbitComplete2
#print axioms G.Main.orbitComplete3_1
#print axioms G.Main.orbitComplete3_2
#print axioms G.Main.typeFacts
