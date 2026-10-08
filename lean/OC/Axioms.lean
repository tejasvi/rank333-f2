module
public import R22Port.U_d41d8cd98f00
public import OC.Main
/-! `#print axioms` of the three orbit-completeness theorems (and the checker soundness lemmas). -/
@[expose] public section
#print axioms OC.orbitComplete2
#print axioms OC.orbitComplete3_1
#print axioms OC.orbitComplete3_2
#check (OC.orbitComplete2 : G.OrbitComplete2)
#check (OC.orbitComplete3_1 : G.OrbitComplete3 1)
#check (OC.orbitComplete3_2 : G.OrbitComplete3 2)
