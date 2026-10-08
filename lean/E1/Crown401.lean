module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e401
public import RT.Cls_e401
import E1.E401 -- port:private
/-! # The crown of class 401: `HC.E1Concl Em 18` (E1 for the IP `e401`), given the IP's class table

The statement of `E1.E401.e401_final`, whose conclusion is literally the body of `HC.E1Concl Em 18`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown401

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e401.CL c) (RT.cLB RT.Cls_e401.CL c)) : HC.E1Concl E1.IP_e401.Em 18 :=
  E1.E401.e401_final hcls

end E1.Crown401

#print axioms E1.Crown401.crown
