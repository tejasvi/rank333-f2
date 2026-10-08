module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_Final
public import HC.AsmN
/-! # The main search's rows from RR's table and the raised classes

`RT.K3eD.row_valid` now takes the capacity table in the distinct-factor form `hclsN` (interface change of
`hcls/REQUESTS.md`, applied by the `RT/K3eD` owner); `HC.hclsN_K3eD` supplies it.  (Class 492 is trivial in that form;
the point lemma enters before, at the step to distinct first factors.) -/
@[expose] public section
namespace HC.RowN
open RT

/-- **the kept rows are valid, from RR's table and the E1 statements of the 110 raised classes other than 492** -/
theorem row_validK3eD (hrr : HC.RRAll)
    (hraise : ∀ c ∈ HC.RAISED_K3eD_N, HC.E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1)) (i : Nat) (hi : i < RT.K3eD.N) :
    FactN 22 (dualM (RT.K3eD.entry i)) (22 - eCap (RT.K3eD.entry i)) :=
  RT.K3eD.row_valid (fun c hc => HC.hclsN_K3eD hrr hraise c hc) i hi

end HC.RowN
