module
public import R22Port.U_d41d8cd98f00
public import R22B.Final
public import GS.Final
public import OC.Main
/-! # R22B.FinalAcc: `final_generic` with its Gram premises discharged from the type-lemma checkers' acceptance statements

The six `G.NoFam_*` come from `GS.noFam_*` (thm4/gram/sound, `GS.Final`) and the three `G.OrbitComplete*` from `OC.Main`
(thm4/gram/orbitc), exactly as in `G.Br.typeFacts_of_accept`; `Top.rank_ge_23_L479cw` then derives `KD.TypeFacts` from them
(`G.Br.typeFacts`).  What remains: the four acceptance statements `G.Acc.Accept_*` (the type-kill runs, `G/Main.lean`), the class
certificates, the l479cw enumeration and the three cases' refinement contracts and closures. -/
@[expose] public section
noncomputable section
namespace R22B
open Top R3RT.SpecO G.Acc

theorem final_acc (h2 : Accept_d2) (h1V : Accept_d1V) (h1S : Accept_d1S) (h0S : Accept_d0S)
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (ext : List ℕ)
    (hEnum : L479.EnumOK (E1G.OK_l479cw.Cx ext) E1G.OK_l479cw.sl E1G.IP_l479cw.UB)
    (hExt : L479.ExtOK (E1G.OK_l479cw.Cx ext))
    (cII cI cI13 : ℕ → Prop)
    (rII : SegRefH (ClassFactsC (CaseK 14 22) HC.cLBII ∧ KD.TypeFacts) LO123 (CaseK 14 22) cII)
    (vII : R22N.Cov cII ((1, 0), 0))
    (rI : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 0 12) cI)
    (vI : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI ((2 ^ l, l), 0))
    (rI13 : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 13 13) cI13)
    (vI13 : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI13 ((2 ^ l, l), 0)) :
    RankGe23 :=
  final_generic hPoint hCap (GS.noFam_17_5_0 h0S) (GS.noFam_19_0_3 h1V) (GS.noFam_18_2_2 h1V) (GS.noFam_17_4_1 h1S)
    (GS.noFam_17_3_2 h2) (GS.noFam_18_1_3 h2) OC.orbitComplete2 OC.orbitComplete3_1 OC.orbitComplete3_2
    ext hEnum hExt cII cI cI13 rII vII rI vI rI13 vI13

end R22B
end
#print axioms R22B.final_acc
