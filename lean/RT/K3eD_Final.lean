module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD
public import RT.K3eD_ClosF
/-! # The main search's verified row table (kept_C3eDc4d.txt, table C3eD, r = 22)

**`RT.K3eD.row_valid`**: for every kept row `i < N` (= line `i` of the kept-row file, the row ids of prof7R3's VROWS/XROWS),
every decomposition with 22 distinct nonzero first factors has at most `cap` terms in the row's subspace, i.e. at least
`22 - cap` outside it.  The only hypothesis is the capacity table in the distinct-factor form: the class facts `hclsN` for
the table classes `c < 496` (`FactN 22 (kM CL c) (cLB CL c)`: every decomposition with 22 distinct nonzero first factors
has at least `lb c` terms outside the class subspace; `Fact` gives it by `fact_factN`, see `row_valid_fact`).  The 41k
closure rows are discharged by `K3eD_ClosF.hclos`.  Citing a row: `entry i`, its point mask `dualM (entry i)`, its cap
`eCap (entry i)`. -/
@[expose] public section
namespace RT.K3eD
open RT

theorem row_valid (hclsN : ∀ c, c < 496 → FactN 22 (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c)) (i : Nat) (hi : i < N) :
    FactN 22 (dualM (entry i)) (22 - eCap (entry i)) :=
  row_factN hclsN (K3eD_ClosF.hclos hclsN) i hi

/-- `row_valid` from the capacity table in the `Fact` form (any number of terms) -/
theorem row_valid_fact (hcls : ∀ c, c < 496 → Fact (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c)) (i : Nat) (hi : i < N) :
    FactN 22 (dualM (entry i)) (22 - eCap (entry i)) :=
  row_valid (fun c h => fact_factN 22 (hcls c h)) i hi

end RT.K3eD

#print axioms RT.K3eD.row_valid
#print axioms RT.K3eD.row_valid_fact
#print axioms RT.K3eD_ClosF.hclos
