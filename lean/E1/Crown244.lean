module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e244
public import RT.Cls_e244
import E1.E244 -- port:private
/-! # The crown of class 244: `HC.E1Concl Em 17` (E1 for the IP `e244`), given the IP's class table

The statement of `E1.E244.e244_final`, whose conclusion is literally the body of `HC.E1Concl Em 17`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown244

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e244.CL c) (RT.cLB RT.Cls_e244.CL c)) : HC.E1Concl E1.IP_e244.Em 17 :=
  E1.E244.e244_final hcls

end E1.Crown244

#print axioms E1.Crown244.crown
