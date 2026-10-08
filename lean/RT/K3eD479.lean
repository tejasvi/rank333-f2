module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD479_OK0
@[expose] public section
set_option maxRecDepth 100000
/-! # Verified row table `K3eD479`: every entry passes, every row is valid (for R distinct nonzero first factors) -/
namespace RT.K3eD479
open RT
theorem allOK_all : allOK 0 N = true := by
  rw [N_eq]
  have h0 : allOK 0 441 = true := okM0
  exact h0
theorem entry_ok (i : Nat) (hi : i < N) : entryOK R K3eD479_Cls.CL (entry i) = true := by
  have := allOK_spec 0 N allOK_all i hi
  rwa [Nat.zero_add] at this
/-- **the kept rows are valid**: given the class facts for the table classes (`c < 496`) and for the closure classes
(`c ≥ 496`), both for decompositions with `R` distinct nonzero first factors (`Fact` gives `FactN` by `fact_factN`) -/
theorem row_factN (hclsN : ∀ c, c < 496 → FactN R (kM K3eD479_Cls.CL c) (cLB K3eD479_Cls.CL c))
    (hclos : ∀ c, 496 ≤ c → FactN R (kM K3eD479_Cls.CL c) (cLB K3eD479_Cls.CL c)) (i : Nat) (hi : i < N) :
    FactN R (dualM (entry i)) (R - eCap (entry i)) := by
  apply entry_soundN R K3eD479_Cls.CL (entry i) _ (entry_ok i hi)
  by_cases h : eCls (entry i) < 496
  · exact hclsN _ h
  · exact hclos _ (by omega)
end RT.K3eD479
