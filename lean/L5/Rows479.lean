module
public import R22Port.U_d41d8cd98f00
public import L5.RTClosOmega
public import RT.K3eD479
public import RT.K3eD479_Lab
@[expose] public section
set_option maxRecDepth 100000
/-! # The 441 cap-1 rows of class 479's lines over a universe (batch 10: `kept_C3eD479c4d.txt` rows 3781613..3782053)

`RT.K3eD479`: the rows as an RT table (`rt/k479`, `rtgen_kept.py` under `tab_C3eD479.bin`: class 479 at 21, cap 1 = 22 − 21);
`RT.K3eD479L`: their `--rord 123` label masks (equal to the last 441 entries of R3's `kept3eDII_lab.bin`).
`row_fact479Ω`: every one of them holds at most one first factor of a decomposition of `Ω`, given class 479's fact at 21
over `Ω` (`HC.cLBII`, i.e. `HC.L479II`). -/
namespace RT.Om
open RT

theorem cls479_all : ∀ i < 441, eCls (RT.K3eD479.entry i) = 479 := by decide +kernel
theorem kM479 : kM RT.K3eD479_Cls.CL 479 = kM RT.K3eD_Cls.CL 479 := by decide +kernel
theorem cLB479 : cLB RT.K3eD479_Cls.CL 479 = 21 := by decide +kernel

/-- **the class-479 rows over a universe** -/
theorem row_fact479Ω (Ω : Dec22 → Prop) (hΩ : RankInv Ω) (h479 : ∀ A, Ω A → FactD (kM RT.K3eD_Cls.CL 479) 21 A)
    (i : Nat) (hi : i < 441) : ∀ A, Ω A → FactD (dualM (RT.K3eD479.entry i)) (22 - eCap (RT.K3eD479.entry i)) A := by
  apply entry_soundΩ Ω hΩ RT.K3eD479_Cls.CL (RT.K3eD479.entry i) _ (RT.K3eD479.entry_ok i (by rw [RT.K3eD479.N_eq]; exact hi))
  rw [cls479_all i hi, kM479, cLB479]
  exact h479

end RT.Om
