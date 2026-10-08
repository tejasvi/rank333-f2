module
public import R22Port.U_d41d8cd98f00
public import R22B.Segs
/-! # R22B.Final: `final` in generic form: the exact composition of form (B) with the glue agent's `Top.rank_ge_23_L479cw`

The run-dependent hypotheses are the module-land closures (`R22N.Cov … root`, proved by the top aggregator) and, per checker, the
refinement contract `SegRefH` (proved once by the node agent for the real checker: `checked k := ∃ s, nII k s = true`).  The
static hypotheses (point lemma, class certificates, Gram props, the l479cw enumeration) are passed through unchanged; the E1-family
closures (`R22N.CovG`) will discharge `hPoint` / `hCap` / `hEnum` the same way. -/
@[expose] public section
noncomputable section
namespace R22B
open Top R3RT.SpecO

theorem final_generic
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (g175 : G.NoFam_17_5_0) (g1903 : G.NoFam_19_0_3) (g1822 : G.NoFam_18_2_2) (g1741 : G.NoFam_17_4_1)
    (g1732 : G.NoFam_17_3_2) (g1813 : G.NoFam_18_1_3)
    (oc0 : G.OrbitComplete2) (oc1 : G.OrbitComplete3 1) (oc2 : G.OrbitComplete3 2)
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
    RankGe23 := by
  obtain ⟨ιII, sII, hsII, hgII, hrII⟩ :=
    segs_of_covH_roots _ _ _ cII rII (fun x => x = ((1, 0), 0)) (fun x hx => hx ▸ vII)
  obtain ⟨ιI, sI, hsI, hgI, hrI⟩ :=
    segs_of_covH_roots _ _ _ cI rI (fun x => ∃ l ∈ ([0, 168, 462] : List ℕ), x = ((2 ^ l, l), 0))
      (fun x ⟨l, hl, hx⟩ => hx ▸ vI l hl)
  obtain ⟨ιI13, sI13, hsI13, hgI13, hrI13⟩ :=
    segs_of_covH_roots _ _ _ cI13 rI13 (fun x => ∃ l ∈ ([0, 168, 462] : List ℕ), x = ((2 ^ l, l), 0))
      (fun x ⟨l, hl, hx⟩ => hx ▸ vI13 l hl)
  exact rank_ge_23_L479cw hPoint hCap g175 g1903 g1822 g1741 g1732 g1813 oc0 oc1 oc2 ext hEnum hExt
    ιII sII (fun hcf htf => hsII ⟨hcf, htf⟩) hgII (hrII _ rfl)
    ιI sI hsI hgI (fun l hl => hrI _ ⟨l, hl, rfl⟩)
    ιI13 sI13 hsI13 hgI13 (fun l hl => hrI13 _ ⟨l, hl, rfl⟩)

end R22B
end
#print axioms R22B.final_generic
