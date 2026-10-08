module
public import R22Port.U_d41d8cd98f00
public import R22B.FinalMain
public import R22B.Corollaries
public import R22B.SegsNN
public import NNP.Ref
public import GA_fin.Top
public import GA_Ifin.Top
public import GA_I13fin.Top
public import NNP.Root462
/-! # R22B.FinalRun: the production run's case II in `final_main` (built in the (B+) port at run end; PROOF_OBJECT §11)

* `rII`: the node agent's refinement `NNP.refII_gen` (discharged with `HC.cLBII` and `Top.dec22_bc HC.rr_all`) through
  `R22B.segRefH_of_nn`, as in the rehearsal's `RH.final`;
* `vII`: `GA_fin.root_0`, the final top glue of the production aggregation (lib/aggr.sh: rounds `GA_r<K>` over the complete job
  subtrees, then `GA_fin` under the case-II root `((1, 0), 0)`), over chunks checked with the pinned library ckr-e07b8136b3c8;
* `rI'`, `vI'`, `rI13'`, `vI13'`: cases I and I13. Their checked predicate is `NN.CheckedI k ∨ k = NNP.K462`: the native items
  (`NNP.refI` / `refI13` with `hnz = Top.dec22_bc HC.rr_all`; the final top glues `GA_Ifin` / `GA_I13fin` over the depth-1 roots
  `((2^l, l), 0)`, l = 0, 168) and, for l = 462, the one-node interface `NNP.K462` (root `(2^462, 462)`, no children) whose segment
  is the kernel's (`NNP.ref462I` / `ref462I13` from `Top.Root321.root462_empty` / `root462_empty13`: every label after 462 has rank 1;
  the native checker's dead-node rule excludes dead roots below the empty depth-0 frame, so that root has no native item and no native
  axiom);
* `rankGe23_of`: `final_main` with case II instantiated (cases I/I13 as hypotheses); `rankGe23_cases`: with all three cases
  instantiated; the remaining hypotheses are the E1 tiers' (point lemma, class certificates, the L479 enumeration with its external
  leaves) until their producers land, and the final file then applies it, with the corollaries `R22B.Cor.*`. -/
@[expose] public section
noncomputable section
set_option exponentiation.threshold 1000   -- vI / vI13 compare 2 ^ 462 with the glue's literal
namespace R22B.FinalRun
open Top R3RT.SpecO

theorem rII : SegRefH (ClassFactsC (CaseK 14 22) HC.cLBII ∧ KD.TypeFacts) LO123 (CaseK 14 22) NN.CheckedII :=
  segRefH_of_nn _ _ _ _ (NNP.refII_gen HC.cLBII (if_pos rfl) (fun _ h => if_neg h) (Top.dec22_bc HC.rr_all))

theorem vII : R22N.Cov NN.CheckedII ((1, 0), 0) := GA_fin.root_0

/-- `Cov` is monotone in the checked predicate (from `R22N.cov_sound`) -/
theorem cov_mono {c c' : ℕ → Prop} (h : ∀ k, c k → c' k) {x : (ℕ × ℕ) × ℕ} (hx : R22N.Cov c x) : R22N.Cov c' x :=
  R22N.cov_sound (P := R22N.Cov c') (fun k hk he hr => R22N.Cov.mk k (h k hk) he hr) hx

/-- the one-node interface `NNP.K462` covers `((2 ^ 462, 462), 0)` for any checked predicate that admits it -/
theorem cov462 {c : ℕ → Prop} (h : c NNP.K462) : R22N.Cov c ((2 ^ 462, 462), 0) := by
  have e1 : (R22N.SegI.ofKey NNP.K462).root = (2 ^ 462, 462) := by decide
  have e2 : (R22N.SegI.ofKey NNP.K462).lo = 0 := by decide
  have he : (R22N.SegI.ofKey NNP.K462).ext = [] := by decide
  have hr : (R22N.SegI.ofKey NNP.K462).rng = [] := by decide
  have := R22N.Cov.mk' NNP.K462 h (by rw [he]; trivial) (by rw [hr]; trivial)
  rwa [e1, e2] at this

def cI' (k : ℕ) : Prop := NN.CheckedI k ∨ k = NNP.K462
def cI13' (k : ℕ) : Prop := NN.CheckedI13 k ∨ k = NNP.K462

theorem rI' : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 0 12) cI' :=
  segRefH_of_nn _ _ _ _ (fun k hk => hk.elim (NNP.refI (Top.dec22_bc HC.rr_all) k) (NNP.ref462I k))

theorem rI13' : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 13 13) cI13' :=
  segRefH_of_nn _ _ _ _ (fun k hk => hk.elim (NNP.refI13 (Top.dec22_bc HC.rr_all) k) (NNP.ref462I13 k))

theorem vI' : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI' ((2 ^ l, l), 0) := by
  intro l hl
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hl
  rcases hl with rfl | rfl | rfl
  · exact cov_mono (fun k hk => Or.inl hk) GA_Ifin.root_0
  · exact cov_mono (fun k hk => Or.inl hk) GA_Ifin.root_1
  · exact cov462 (Or.inr rfl)

theorem vI13' : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI13' ((2 ^ l, l), 0) := by
  intro l hl
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hl
  rcases hl with rfl | rfl | rfl
  · exact cov_mono (fun k hk => Or.inl hk) GA_I13fin.root_0
  · exact cov_mono (fun k hk => Or.inl hk) GA_I13fin.root_1
  · exact cov462 (Or.inr rfl)

theorem rankGe23_of
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (ext : List ℕ)
    (hEnum : L479.EnumOK (E1G.OK_l479cw.Cx ext) E1G.OK_l479cw.sl E1G.IP_l479cw.UB)
    (hExt : L479.ExtOK (E1G.OK_l479cw.Cx ext))
    (cI cI13 : ℕ → Prop)
    (rI : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 0 12) cI)
    (vI : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI ((2 ^ l, l), 0))
    (rI13 : SegRefH R3RT.Spec.ClassFacts Top321.O (CaseK 13 13) cI13)
    (vI13 : ∀ l ∈ ([0, 168, 462] : List ℕ), R22N.Cov cI13 ((2 ^ l, l), 0)) :
    RankGe23 :=
  final_main hPoint hCap ext hEnum hExt NN.CheckedII cI cI13 rII vII rI vI rI13 vI13

/-- all three cases from the production run; the E1 tiers' facts remain -/
theorem rankGe23_cases
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (ext : List ℕ)
    (hEnum : L479.EnumOK (E1G.OK_l479cw.Cx ext) E1G.OK_l479cw.sl E1G.IP_l479cw.UB)
    (hExt : L479.ExtOK (E1G.OK_l479cw.Cx ext)) :
    RankGe23 :=
  rankGe23_of hPoint hCap ext hEnum hExt cI' cI13' rI' vI' rI13' vI13'

end R22B.FinalRun
end
#print axioms R22B.FinalRun.rII
#print axioms R22B.FinalRun.vII
#print axioms R22B.FinalRun.rI'
#print axioms R22B.FinalRun.vI'
#print axioms R22B.FinalRun.rankGe23_cases
