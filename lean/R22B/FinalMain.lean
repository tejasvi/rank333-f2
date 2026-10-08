module
public import R22Port.U_d41d8cd98f00
public import R22B.Final
public import R22B.GramCrown
/-! # R22B.FinalMain: `final_generic` with the Gram premises proved (R22B.GramCrown over G.Main). What remains: the point lemma, the class
certificates (`R22B.CapLeaf.hCap` applied to the native classes' facts), the l479cw enumeration with its external leaves, and the three
cases' refinement contracts and closures (PROOF_OBJECT §11). -/
@[expose] public section
noncomputable section
namespace R22B
open Top R3RT.SpecO

theorem final_main
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
  final_generic hPoint hCap GramCrown.g175 GramCrown.g1903 GramCrown.g1822 GramCrown.g1741 GramCrown.g1732 GramCrown.g1813
    GramCrown.oc0 GramCrown.oc1 GramCrown.oc2 ext hEnum hExt cII cI cI13 rII vII rI vI rI13 vI13

end R22B
end
#print axioms R22B.final_main
