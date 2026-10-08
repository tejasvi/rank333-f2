module
public import R22Port.U_d41d8cd98f00
public import GS.Main
public import GS.PhA
public import GS.PhV2
public import GS.PhV3
public import GS.PhW
public import GS.PhD3
/-! # The six `NoFam_*` from the acceptance statements (`G/Accept.lean`)

The tracks: `phaseA_thm : PhaseAThm` (track A), `phaseDThm : PhaseDThm` (track D, for the guarded D2 of md5 48bab26f…:
the colour case needs `need ≥ 1` and the classes from `need - 1` on empty), `shapeS_of : ShapeThmS`, `shapeThm1_of :
ShapeThm1` (`shapeC2_of`, track V, with `shapeW_of`), `shapeThm2_of : ShapeThm2` (track V).  (The earlier D2 of md5
f13b6b03… accepted colourings at any `need`, which is unsound below 17.) -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc

theorem shapeThm1_of : ShapeThm1 := fun o PY0 PY1 nB2 nRec nV3 hF hV =>
  ⟨shapeC2_of o PY0 PY1 nB2 nRec nV3 hF hV, shapeW_of hF hV⟩

theorem noFam_17_4_1 (hacc : Accept_d1S) : NoFam_17_4_1 :=
  noFam_17_4_1_of phaseA_thm phaseDThm shapeS_of hacc
theorem noFam_17_5_0 (hacc : Accept_d0S) : NoFam_17_5_0 :=
  noFam_17_5_0_of phaseA_thm phaseDThm shapeS_of hacc
theorem noFam_18_2_2 (hacc : Accept_d1V) : NoFam_18_2_2 :=
  noFam_18_2_2_of phaseA_thm phaseDThm shapeThm1_of hacc
theorem noFam_19_0_3 (hacc : Accept_d1V) : NoFam_19_0_3 :=
  noFam_19_0_3_of phaseA_thm phaseDThm shapeThm1_of hacc
theorem noFam_17_3_2 (hacc : Accept_d2) : NoFam_17_3_2 :=
  noFam_17_3_2_of phaseA_thm phaseDThm shapeThm2_of hacc
theorem noFam_18_1_3 (hacc : Accept_d2) : NoFam_18_1_3 :=
  noFam_18_1_3_of phaseA_thm phaseDThm shapeThm2_of hacc

end GS

#print axioms GS.noFam_17_4_1
#print axioms GS.noFam_17_5_0
#print axioms GS.noFam_18_2_2
#print axioms GS.noFam_19_0_3
#print axioms GS.noFam_17_3_2
#print axioms GS.noFam_18_1_3
