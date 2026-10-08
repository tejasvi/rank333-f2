module
public import R22Port.U_d41d8cd98f00
public import HC.RRTable
public import HC.RowN
/-! # The capacity-table glue with RR's table plugged in

RR's claims (`HC.rr_all`, from `FullTable_03_Theorems`) discharge `RRAll`.  What remains open in each statement is exactly
the per-class E1 statements of the raised classes, which the fleet's E1 runs produce (`E1S.e1_sound_ext` instances on IPs
built on the class representatives). -/
@[expose] public section
namespace HC
open RT

/-- **`rr_fact`**: RR's bound for every class of the main search's table -/
theorem rr_fact : ∀ c < 496, Fact (kM K3eD_Cls.CL c) (rrLB c) := rr_fact_K3eD rr_all

/-- **`hcls` for `K3eD`** from the E1 statements of the 111 raised classes -/
theorem hcls_K3eD_final (hraise : ∀ c ∈ RAISED_K3eD, E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1)) :
    ∀ c < 496, Fact (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) := hcls_K3eD rr_all hraise

/-- **`hclsN` for `K3eD`** (distinct factors; 492 free) from the E1 statements of 110 raised classes -/
theorem hclsN_K3eD_final (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1)) :
    ∀ c < 496, FactN 22 (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) := hclsN_K3eD rr_all hraise

/-- **the main search's rows are valid**, from the E1 statements of 110 raised classes -/
theorem row_valid_final (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1))
    (i : Nat) (hi : i < RT.K3eD.N) : FactN 22 (dualM (RT.K3eD.entry i)) (22 - eCap (RT.K3eD.entry i)) :=
  RowN.row_validK3eD rr_all hraise i hi

/-- **`hcls` for the line-490 IP table**, from the E1 statements of its 91 raised classes -/
theorem hcls_e490x_final (hraise : ∀ c ∈ RAISED_e490x, E1Concl (kM Cls_e490x.CL c) (cLB Cls_e490x.CL c - 1)) :
    ∀ c, Fact (kM Cls_e490x.CL c) (cLB Cls_e490x.CL c) := hcls_e490x rr_all hraise

end HC

#print axioms HC.rr_all
#print axioms HC.rr_fact
#print axioms HC.hcls_K3eD_final
#print axioms HC.hclsN_K3eD_final
#print axioms HC.row_valid_final
#print axioms HC.hcls_e490x_final
