module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e205
public import RT.Cls_e205
import E1.E205 -- port:private
/-! # The crown of class 205: `HC.E1Concl Em 17` (E1 for the IP `e205`), given the IP's class table

The statement of `E1.E205.e205_final`, whose conclusion is literally the body of `HC.E1Concl Em 17`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown205

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e205.CL c) (RT.cLB RT.Cls_e205.CL c)) : HC.E1Concl E1.IP_e205.Em 17 :=
  E1.E205.e205_final hcls

end E1.Crown205

#print axioms E1.Crown205.crown
