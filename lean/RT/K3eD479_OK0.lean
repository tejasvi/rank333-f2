module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD479_Data
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace RT.K3eD479
open RT
theorem ok_0 : allOK 0 441 = true := by decide +kernel
theorem okM0 : allOK 0 441 = true := by
  have h0 : allOK 0 441 = true := ok_0
  exact h0
end RT.K3eD479
