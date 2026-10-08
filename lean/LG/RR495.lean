module
public import R22Port.U_d41d8cd98f00
public import HC.Final
public import LG.W
/-! RR's bound for the zero space `K_495 = {0}`: every decomposition has at least 22 nonzero first factors. -/
@[expose] public section
namespace L479
theorem rrLB495 : HC.rrLB 495 = 22 := by decide +kernel
/-- the hypothesis `h495` of `L479.l479II_of` -/
theorem h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22 := by
  have := HC.rr_fact 495 (by norm_num)
  rwa [rrLB495] at this
end L479
#print axioms L479.h495

namespace L479
open RootSound Finset
theorem rrLB_W : HC.rrLB 248 = 14 ∧ HC.rrLB 249 = 14 ∧ HC.rrLB 410 = 15 := by decide +kernel

/-- the class facts of Lemma W(a), from RR's table -/
theorem hclsW : ∀ c, (c = 248 ∨ c = 249 ∨ c = 410) → RT.Fact (RT.kM RT.K3eD_Cls.CL c) 14 := by
  intro c hc
  obtain ⟨h1, h2, h3⟩ := rrLB_W
  have hle : 14 ≤ HC.rrLB c := by rcases hc with rfl | rfl | rfl <;> omega
  have hc' : c < 496 := by rcases hc with rfl | rfl | rfl <;> norm_num
  exact RT.fact_mono hle (fun w _ hw => hw) (HC.rr_fact c hc')

/-- **Lemma W(a)**, unconditional: a decomposition with at most 22 terms has at least 11 first factors outside
`{row 2 = 0}` and at least 11 outside `{column 2 = 0}` -/
theorem lemmaWa {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hn : n ≤ 22) :
    11 ≤ (univ.filter (fun s => ¬ av s < 64)).card ∧ 11 ≤ (univ.filter (fun s => ¬ (av s &&& 292 = 0))).card :=
  ⟨lemmaW0 hclsW av b c hav hd hn, lemmaW0' hclsW av b c hav hd hn⟩
end L479
#print axioms L479.lemmaWa
