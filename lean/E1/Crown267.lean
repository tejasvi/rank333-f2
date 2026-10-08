module
public import R22Port.U_d41d8cd98f00
public import HC.Pad
public import E1.IP_e267
public import RT.Cls_e267
import E1.E267 -- port:private
/-! # The crown of class 267: `HC.E1Concl Em 16` (E1 for the IP `e267`), given the IP's class table

The statement of `E1.E267.e267_final`, whose conclusion is literally the body of `HC.E1Concl Em 16`.  The job modules
(chain, blocks, external leaves) are a private import in the module port, so importers of this file load only its
statement and its three public imports. -/
@[expose] public section
namespace E1.Crown267

theorem crown (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e267.CL c) (RT.cLB RT.Cls_e267.CL c)) : HC.E1Concl E1.IP_e267.Em 16 :=
  E1.E267.e267_final hcls

end E1.Crown267

#print axioms E1.Crown267.crown
