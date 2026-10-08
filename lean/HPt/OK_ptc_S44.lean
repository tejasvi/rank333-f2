module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_180224 : slOKL 180224 512 = true := by decide +kernel
theorem ok_180736 : slOKL 180736 512 = true := by decide +kernel
theorem ok_181248 : slOKL 181248 512 = true := by decide +kernel
theorem ok_181760 : slOKL 181760 512 = true := by decide +kernel
theorem ok_182272 : slOKL 182272 512 = true := by decide +kernel
theorem ok_182784 : slOKL 182784 512 = true := by decide +kernel
theorem ok_183296 : slOKL 183296 512 = true := by decide +kernel
theorem ok_183808 : slOKL 183808 512 = true := by decide +kernel
end E1P.OK_ptc
