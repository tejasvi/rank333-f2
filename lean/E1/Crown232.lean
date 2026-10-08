module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e232
public import RT.Cls_e232
import E1.E232 -- port:private
/-! # The crown of class 232: `HC.E1Concl Em 16` (E1 for the IP `e232`), given the IP's class table

The statement of `E1.E232.e232_final`, whose conclusion is literally the body of `HC.E1Concl Em 16`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown232

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e232.CL c) (RT.cLB RT.Cls_e232.CL c)) : HC.E1Concl E1.IP_e232.Em 16 :=
  E1.E232.e232_final hcls

end E1.Crown232

#print axioms E1.Crown232.crown
