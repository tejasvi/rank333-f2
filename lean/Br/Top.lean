module
public import R22Port.U_d41d8cd98f00
public import Br.Final
public import OC.Main
public import GS.Final
/-! # `KD.TypeFacts` from the Gram checkers' acceptance statements (the type lemmas' last line)

* the bridge: `G.Br.typeFacts` (the six `NoFam_*` and the three `OrbitComplete*` give `KD.TypeFacts`, `--typecut 95`);
* the orbit completeness: `OC.orbitComplete2`, `OC.orbitComplete3_1`, `OC.orbitComplete3_2` (`orbitc/`);
* the checkers' soundness: `GS.noFam_*` (`sound/`), from the acceptance statements `G.Acc.Accept_*` (`G/Accept.lean`),
  which the checker agent proves from the runs (`G/Main.lean`: `KD.TypeFacts := G.Br.typeFacts_of_accept accept_d2 …`). -/
@[expose] public section
namespace G.Br
open G.Acc

/-- **the type facts from the checkers' acceptance** -/
theorem typeFacts_of_accept (h2 : Accept_d2) (h1V : Accept_d1V) (h1S : Accept_d1S) (h0S : Accept_d0S) : KD.TypeFacts :=
  typeFacts (GS.noFam_17_5_0 h0S) (GS.noFam_19_0_3 h1V) (GS.noFam_18_2_2 h1V) (GS.noFam_17_4_1 h1S)
    (GS.noFam_17_3_2 h2) (GS.noFam_18_1_3 h2) OC.orbitComplete2 OC.orbitComplete3_1 OC.orbitComplete3_2

end G.Br

#print axioms G.Br.typeFacts_of_accept
