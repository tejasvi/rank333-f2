module
public import R22Port.U_d41d8cd98f00
public import RT.Clos
public import RT.K3eD_Cls
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # Closure-class facts of the verified row table `K3eD` (rt/rtclosln.py)

Slots (closure class: (table class, cap)): 500: (452, 1), 496: (363, 3), 497: (375, 4), 498: (400, 2), 499: (409, 3) -/
namespace RT.K3eD_ClosF
open RT
local notation "CL" => RT.K3eD_Cls.CL

def ws500 : List Nat := [0x14b0a7942030405042404040028232, 0x3150a7942040584042404040014232, 0x25f0a7942070584c4240404003c232, 0xa90a7942010505040404040014142, 0x1e30a7942020485042404040028292, 0x3bd0a7942050584442404040014372, 0x2f70a794206058484240404003c292]
theorem ok500 : closOK 2631715 3 1 ws500 = true := by decide +kernel
theorem ent500 : ws500.all (fun w => entryOK 22 CL w) = true := by decide +kernel
theorem span500 : kM CL 500 = spanK 2631715 3 := by decide +kernel
theorem lb500 : cLB CL 500 = 22 - 1 := by decide +kernel
theorem cls500 : (ws500.map eCls) = [485, 485, 485, 485, 485, 485, 485] := by decide +kernel

def ws496 : List Nat := [0xba56fd02010405880a08105141063, 0x162b16dc6060404080a08100541063, 0x1625ff184070404480a08105541063, 0x142a56e46080b08080808100429063, 0x3145cf204080b08480818105143063, 0x162b36e46080b09880868100569063, 0x27457f204080b09c80878105543063, 0x223116dc6020405080a08000428a03, 0x2226bf184030405480a08085141073, 0x343a16dc6040404880a08100541123, 0x3427df184050404c80a08105541073, 0x323376e46080b08880828100429a63, 0x3e46ef204080b08c80838105143073, 0x222a36fc6080b09080848100569123, 0x2ce5ff284080b09480858105543073]
theorem ok496 : closOK 139542790 4 3 ws496 = true := by decide +kernel
theorem ent496 : ws496.all (fun w => entryOK 22 CL w) = true := by decide +kernel
theorem span496 : kM CL 496 = spanK 139542790 4 := by decide +kernel
theorem lb496 : cLB CL 496 = 22 - 3 := by decide +kernel
theorem cls496 : (ws496.map eCls) = [500, 439, 454, 441, 456, 441, 456, 439, 454, 439, 454, 441, 456, 447, 458] := by decide +kernel

def ws497 : List Nat := [0xa85474c6010505088a281151412a3, 0x2e2b56f46040504080a281005412a3, 0x11e637604050504482a281155412a3, 0x233316f460a0a088888081004a92a3, 0x1fd5176440a0a08c888181151432a3, 0x173a56f060a0a098888481005e92a3, 0x338cc74c60a0a09c888581155432a3, 0x223116f06020405088a080004a8a03, 0xae5d7544030485088a180951412b3, 0x332a57006060504884a281005417e3, 0x13c737644070504c86a281155412b3, 0x342a36f460a0a080888281004a98a3, 0x33ee276440a0a084888381151432b3, 0x3c2b36f060a0a090888681005e97e3, 0x14f4b74c60a0a094888781155432b3]
theorem ok497 : closOK 156320042 4 4 ws497 = true := by decide +kernel
theorem ent497 : ws497.all (fun w => entryOK 22 CL w) = true := by decide +kernel
theorem span497 : kM CL 497 = spanK 156320042 4 := by decide +kernel
theorem lb497 : cLB CL 497 = 22 - 4 := by decide +kernel
theorem cls497 : (ws497.map eCls) = [467, 445, 472, 445, 473, 444, 467, 444, 469, 448, 473, 445, 473, 444, 467] := by decide +kernel

def ws498 : List Nat := [0x22263f7040304050c08080850c1033, 0x342acf1840405840c08080828c1033, 0x1fab97404070584cc08080878c1033, 0xbb2b71840b0a08080808082829033, 0x355ec74040b0a08c868080850d5033, 0x2ad5374040b0a090888080828e9033, 0x17c9c77040b0a09c8e8080878d5033, 0x2231171840105050c0808002828603, 0x11ab1f1840204850c08080850c1093, 0x1c47577040505844c08080828c1173, 0x1d89ff1840605848c08080878c1093, 0x2e93e71840b0a08482808082829633, 0x162cf77040b0a088848080850d5093, 0x3d2bcf7040b0a0948a8080828e9173, 0x1ca8ff7040b0a0988c8080878d5093]
theorem ok498 : closOK 1347469571 4 2 ws498 = true := by decide +kernel
theorem ent498 : ws498.all (fun w => entryOK 22 CL w) = true := by decide +kernel
theorem span498 : kM CL 498 = spanK 1347469571 4 := by decide +kernel
theorem lb498 : cLB CL 498 = 22 - 2 := by decide +kernel
theorem cls498 : (ws498.map eCls) = [476, 454, 464, 454, 464, 464, 476, 454, 454, 476, 454, 454, 476, 476, 476] := by decide +kernel

def ws499 : List Nat := [0xc45576c40204054c281829814b143, 0x257a576c40a0a8848081828294b143, 0x16ae677040a0a88c8481829a94b143, 0xc45577040105050c08082028c1143, 0x2adcb76c40304854c281829815f143, 0x1195476c40a0a8808281828298b143, 0x34e9f77040a0a8888681829a95f143, 0x3170f76c40505040c28180028c0a53, 0x1767277040705048c281811814b1e3, 0x1cacc77040a0a8908a81828294b743, 0xae5f77460a0a8988e81829a94b1e3, 0x1cacc76c40405044c28180828c1b13, 0x1e26e7704060504cc281819815f1e3, 0x3e8be77040a0a8948881828298b743, 0x34e9f76c40a0a89c8c81829a95f1e3]
theorem ok499 : closOK 1367427860 4 3 ws499 = true := by decide +kernel
theorem ent499 : ws499.all (fun w => entryOK 22 CL w) = true := by decide +kernel
theorem span499 : kM CL 499 = spanK 1367427860 4 := by decide +kernel
theorem lb499 : cLB CL 499 = 22 - 3 := by decide +kernel
theorem cls499 : (ws499.map eCls) = [475, 475, 476, 476, 475, 475, 476, 475, 476, 476, 477, 475, 476, 476, 475] := by decide +kernel

section
variable (hclsN : ∀ c, c < 496 → FactN 22 (kM CL c) (cLB CL c))

include hclsN in
theorem fact500 : FactN 22 (kM CL 500) (cLB CL 500) := by
  rw [lb500]
  refine clos_sound 22 (kM CL 500) 2631715 3 1 ws500 (fun v hv => spanK_mem 2631715 3 v (by rw [← span500]; exact hv)) ok500 ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent500 w hw
  apply entry_soundN 22 CL w _ he
  have hc : eCls w ∈ (ws500.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls500] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
  · rw [hc]; exact hclsN 485 (by norm_num)
include hclsN in
theorem fact496 : FactN 22 (kM CL 496) (cLB CL 496) := by
  rw [lb496]
  refine clos_sound 22 (kM CL 496) 139542790 4 3 ws496 (fun v hv => spanK_mem 139542790 4 v (by rw [← span496]; exact hv)) ok496 ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent496 w hw
  apply entry_soundN 22 CL w _ he
  have hc : eCls w ∈ (ws496.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls496] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact fact500 hclsN
  · rw [hc]; exact hclsN 439 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 441 (by norm_num)
  · rw [hc]; exact hclsN 456 (by norm_num)
  · rw [hc]; exact hclsN 441 (by norm_num)
  · rw [hc]; exact hclsN 456 (by norm_num)
  · rw [hc]; exact hclsN 439 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 439 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 441 (by norm_num)
  · rw [hc]; exact hclsN 456 (by norm_num)
  · rw [hc]; exact hclsN 447 (by norm_num)
  · rw [hc]; exact hclsN 458 (by norm_num)
include hclsN in
theorem fact497 : FactN 22 (kM CL 497) (cLB CL 497) := by
  rw [lb497]
  refine clos_sound 22 (kM CL 497) 156320042 4 4 ws497 (fun v hv => spanK_mem 156320042 4 v (by rw [← span497]; exact hv)) ok497 ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent497 w hw
  apply entry_soundN 22 CL w _ he
  have hc : eCls w ∈ (ws497.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls497] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hclsN 467 (by norm_num)
  · rw [hc]; exact hclsN 445 (by norm_num)
  · rw [hc]; exact hclsN 472 (by norm_num)
  · rw [hc]; exact hclsN 445 (by norm_num)
  · rw [hc]; exact hclsN 473 (by norm_num)
  · rw [hc]; exact hclsN 444 (by norm_num)
  · rw [hc]; exact hclsN 467 (by norm_num)
  · rw [hc]; exact hclsN 444 (by norm_num)
  · rw [hc]; exact hclsN 469 (by norm_num)
  · rw [hc]; exact hclsN 448 (by norm_num)
  · rw [hc]; exact hclsN 473 (by norm_num)
  · rw [hc]; exact hclsN 445 (by norm_num)
  · rw [hc]; exact hclsN 473 (by norm_num)
  · rw [hc]; exact hclsN 444 (by norm_num)
  · rw [hc]; exact hclsN 467 (by norm_num)
include hclsN in
theorem fact498 : FactN 22 (kM CL 498) (cLB CL 498) := by
  rw [lb498]
  refine clos_sound 22 (kM CL 498) 1347469571 4 2 ws498 (fun v hv => spanK_mem 1347469571 4 v (by rw [← span498]; exact hv)) ok498 ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent498 w hw
  apply entry_soundN 22 CL w _ he
  have hc : eCls w ∈ (ws498.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls498] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 464 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 464 (by norm_num)
  · rw [hc]; exact hclsN 464 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 454 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
include hclsN in
theorem fact499 : FactN 22 (kM CL 499) (cLB CL 499) := by
  rw [lb499]
  refine clos_sound 22 (kM CL 499) 1367427860 4 3 ws499 (fun v hv => spanK_mem 1367427860 4 v (by rw [← span499]; exact hv)) ok499 ?_
  intro w hw
  have he : entryOK 22 CL w = true := List.all_eq_true.mp ent499 w hw
  apply entry_soundN 22 CL w _ he
  have hc : eCls w ∈ (ws499.map eCls) := List.mem_map.mpr ⟨w, hw, rfl⟩
  rw [cls499] at hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc | hc
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 477 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 476 (by norm_num)
  · rw [hc]; exact hclsN 475 (by norm_num)

include hclsN in
/-- every slot `≥ 496` (closure classes; empty slots have bound 0) -/
theorem hclos (c : Nat) (hc : 496 ≤ c) : FactN 22 (kM CL c) (cLB CL c) := by
  by_cases h : c ≤ 500
  · interval_cases c
    · exact fact496 hclsN
    · exact fact497 hclsN
    · exact fact498 hclsN
    · exact fact499 hclsN
    · exact fact500 hclsN
  · have h0 : cLB CL c = 0 := by
      unfold cLB
      have hlt : CL < 2 ^ (96 * c + 4) := lt_of_lt_of_le (show CL < 2 ^ (96 * 501) by unfold RT.K3eD_Cls.CL; decide +kernel) (Nat.pow_le_pow_right (by norm_num) (by omega))
      rw [Nat.shiftRight_eq_div_pow, Nat.div_eq_of_lt hlt]
    rw [h0]; intro av b c hav _ _ _; exact Nat.zero_le _
end

end RT.K3eD_ClosF
