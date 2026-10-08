module
public import R22Port.U_d41d8cd98f00
public import L5.RTOmega
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The closure classes of `K3eD` over a universe (from `RT.K3eD_ClosF`'s data: `ok*`, `ent*`, `span*`, `lb*`, `cls*`) -/
namespace RT.Om
open RT RT.K3eD_ClosF
local notation "CL" => RT.K3eD_Cls.CL

section
variable (Ω : Dec22 → Prop) (hΩ : RankInv Ω) (hcls : ∀ c, c < 496 → ∀ A, Ω A → FactD (kM CL c) (cLB CL c) A)

include hΩ hcls in
theorem fact500Ω : ∀ A, Ω A → FactD (kM CL 500) (cLB CL 500) A := by
  intro A hA
  rw [lb500]
  refine clos_soundΩ (kM CL 500) 2631715 3 1 ws500 (fun v hv => spanK_mem 2631715 3 v (by rw [← span500]; exact hv)) ok500 A ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent500 w hw
  refine entry_soundΩ Ω hΩ CL w ?_ he A hA
  have hc : eCls w ∈ (ws500.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls500] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
  · rw [hc]; exact hcls 485 (by norm_num)
include hΩ hcls in
theorem fact496Ω : ∀ A, Ω A → FactD (kM CL 496) (cLB CL 496) A := by
  intro A hA
  rw [lb496]
  refine clos_soundΩ (kM CL 496) 139542790 4 3 ws496 (fun v hv => spanK_mem 139542790 4 v (by rw [← span496]; exact hv)) ok496 A ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent496 w hw
  refine entry_soundΩ Ω hΩ CL w ?_ he A hA
  have hc : eCls w ∈ (ws496.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls496] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact fact500Ω Ω hΩ hcls
  · rw [hc]; exact hcls 439 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 441 (by norm_num)
  · rw [hc]; exact hcls 456 (by norm_num)
  · rw [hc]; exact hcls 441 (by norm_num)
  · rw [hc]; exact hcls 456 (by norm_num)
  · rw [hc]; exact hcls 439 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 439 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 441 (by norm_num)
  · rw [hc]; exact hcls 456 (by norm_num)
  · rw [hc]; exact hcls 447 (by norm_num)
  · rw [hc]; exact hcls 458 (by norm_num)
include hΩ hcls in
theorem fact497Ω : ∀ A, Ω A → FactD (kM CL 497) (cLB CL 497) A := by
  intro A hA
  rw [lb497]
  refine clos_soundΩ (kM CL 497) 156320042 4 4 ws497 (fun v hv => spanK_mem 156320042 4 v (by rw [← span497]; exact hv)) ok497 A ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent497 w hw
  refine entry_soundΩ Ω hΩ CL w ?_ he A hA
  have hc : eCls w ∈ (ws497.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls497] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hcls 467 (by norm_num)
  · rw [hc]; exact hcls 445 (by norm_num)
  · rw [hc]; exact hcls 472 (by norm_num)
  · rw [hc]; exact hcls 445 (by norm_num)
  · rw [hc]; exact hcls 473 (by norm_num)
  · rw [hc]; exact hcls 444 (by norm_num)
  · rw [hc]; exact hcls 467 (by norm_num)
  · rw [hc]; exact hcls 444 (by norm_num)
  · rw [hc]; exact hcls 469 (by norm_num)
  · rw [hc]; exact hcls 448 (by norm_num)
  · rw [hc]; exact hcls 473 (by norm_num)
  · rw [hc]; exact hcls 445 (by norm_num)
  · rw [hc]; exact hcls 473 (by norm_num)
  · rw [hc]; exact hcls 444 (by norm_num)
  · rw [hc]; exact hcls 467 (by norm_num)
include hΩ hcls in
theorem fact498Ω : ∀ A, Ω A → FactD (kM CL 498) (cLB CL 498) A := by
  intro A hA
  rw [lb498]
  refine clos_soundΩ (kM CL 498) 1347469571 4 2 ws498 (fun v hv => spanK_mem 1347469571 4 v (by rw [← span498]; exact hv)) ok498 A ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent498 w hw
  refine entry_soundΩ Ω hΩ CL w ?_ he A hA
  have hc : eCls w ∈ (ws498.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls498] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 464 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 464 (by norm_num)
  · rw [hc]; exact hcls 464 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 454 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
include hΩ hcls in
theorem fact499Ω : ∀ A, Ω A → FactD (kM CL 499) (cLB CL 499) A := by
  intro A hA
  rw [lb499]
  refine clos_soundΩ (kM CL 499) 1367427860 4 3 ws499 (fun v hv => spanK_mem 1367427860 4 v (by rw [← span499]; exact hv)) ok499 A ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent499 w hw
  refine entry_soundΩ Ω hΩ CL w ?_ he A hA
  have hc : eCls w ∈ (ws499.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls499] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 477 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 476 (by norm_num)
  · rw [hc]; exact hcls 475 (by norm_num)

include hΩ hcls in
/-- every slot `≥ 496` (closure classes; empty slots have bound 0) -/
theorem hclosΩ (c : Nat) (hc : 496 ≤ c) : ∀ A, Ω A → FactD (kM CL c) (cLB CL c) A := by
  by_cases h : c ≤ 500
  · interval_cases c
    · exact fact496Ω Ω hΩ hcls
    · exact fact497Ω Ω hΩ hcls
    · exact fact498Ω Ω hΩ hcls
    · exact fact499Ω Ω hΩ hcls
    · exact fact500Ω Ω hΩ hcls
  · have h0 : cLB CL c = 0 := by
      unfold cLB
      have hlt : CL < 2 ^ (96 * c + 4) := lt_of_lt_of_le (show CL < 2 ^ (96 * 501) by unfold RT.K3eD_Cls.CL; decide +kernel) (Nat.pow_le_pow_right (by norm_num) (by omega))
      rw [Nat.shiftRight_eq_div_pow, Nat.div_eq_of_lt hlt]
    rw [h0]; intro A _; exact Nat.zero_le _
end


end RT.Om

namespace RT.Om
open RT
local notation "CL" => RT.K3eD_Cls.CL

/-- **every kept row of `K3eD` over a universe** -/
theorem row_factΩ (Ω : Dec22 → Prop) (hΩ : RankInv Ω) (hcls : ∀ c, c < 496 → ∀ A, Ω A → FactD (kM CL c) (cLB CL c) A)
    (i : Nat) (hi : i < RT.K3eD.N) : ∀ A, Ω A → FactD (dualM (RT.K3eD.entry i)) (22 - eCap (RT.K3eD.entry i)) A := by
  apply entry_soundΩ Ω hΩ CL (RT.K3eD.entry i) _ (RT.K3eD.entry_ok i hi)
  by_cases h : eCls (RT.K3eD.entry i) < 496
  · exact hcls _ h
  · exact hclosΩ Ω hΩ hcls _ (by omega)

/-- the class facts over a universe, at bounds `lb ≥ cLB` (e.g. `HC.cLBII`: class 479 at 21), give the table classes' facts -/
theorem hcls_of_classFactsC (Ω : Dec22 → Prop) (lb : ℕ → ℕ) (hlb : ∀ c, c < 496 → cLB CL c ≤ lb c)
    (h : R3RT.SpecO.ClassFactsC Ω lb) : ∀ c, c < 496 → ∀ A, Ω A → FactD (kM CL c) (cLB CL c) A :=
  fun c hc A hA => le_trans (hlb c hc) (h A hA c hc)

end RT.Om
