module
public import R22Port.U_d41d8cd98f00
public import L5.Bind5W
/-! # Case (II) with class 479 raised: `TableSpec` / `BindQSpec` at `Ω = CaseK 14 22`, `--rord 123` (`LO123`, `rowE3eD`)

For any class bounds `lb` with `lb ≥ cLB` on the table classes, e.g. `HC.cLBII` (class 479 at 21, the others at `cLB`):
the rows of `K3eD` are valid for every case-(II) decomposition given `ClassFactsC (CaseK 14 22) lb`
(`RT.Om.row_factΩ`, universe-relativized entry and closure theorems, `L5/RTOmega.lean`, `L5/RTClosOmega.lean`). -/
@[expose] public section
namespace L5W
open R3RT.SpecO

theorem is123_LO123 : Is123 LO123 := by
  intro l _
  have h : RT.VECL = R3RT.VECL := by decide +kernel
  show R3RT.vecL l = RT.vecL l
  unfold RT.vecL R3RT.vecL; rw [h]; rfl

theorem table_specII (lb : ℕ → ℕ) (hlb : ∀ c, c < 496 → RT.cLB RT.K3eD_Cls.CL c ≤ lb c) :
    TableSpec LO123 (CaseK 14 22) R3RT.rowE3eD lb :=
  table_spec is123_LO123 (RT.Om.caseK_rankInv 14 22) lb hlb

theorem bindQ_specII (lb : ℕ → ℕ) (hlb : ∀ c, c < 496 → RT.cLB RT.K3eD_Cls.CL c ≤ lb c) :
    BindQSpec LO123 (CaseK 14 22) R3RT.rowE3eD lb :=
  bindQ_spec is123_LO123 (RT.Om.caseK_rankInv 14 22) lb hlb

/-- `HC.cLBII`'s shape: class 479 at 21, every other class at `cLB` -/
theorem hlb_479 (lb : ℕ → ℕ) (h479 : lb 479 = 21) (hother : ∀ c, c ≠ 479 → lb c = RT.cLB RT.K3eD_Cls.CL c) :
    ∀ c, c < 496 → RT.cLB RT.K3eD_Cls.CL c ≤ lb c := by
  intro c _
  by_cases h : c = 479
  · subst h; rw [h479]; decide +kernel
  · rw [hother c h]

end L5W
#print axioms L5W.table_specII
#print axioms L5W.bindQ_specII
#print axioms L5W.hlb_479
