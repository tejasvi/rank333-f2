module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e150
public import RT.Cls_e150
import E1.E150 -- port:private
/-! # The crown of class 150: `HC.E1Concl Em 16` (E1 for the IP `e150`), given the IP's class table

The statement of `E1.E150.e150_final`, whose conclusion is literally the body of `HC.E1Concl Em 16`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown150

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e150.CL c) (RT.cLB RT.Cls_e150.CL c)) : HC.E1Concl E1.IP_e150.Em 16 :=
  E1.E150.e150_final hcls

end E1.Crown150

#print axioms E1.Crown150.crown
