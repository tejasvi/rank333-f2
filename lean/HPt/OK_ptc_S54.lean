module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_221184 : slOKL 221184 512 = true := by decide +kernel
theorem ok_221696 : slOKL 221696 512 = true := by decide +kernel
theorem ok_222208 : slOKL 222208 512 = true := by decide +kernel
theorem ok_222720 : slOKL 222720 512 = true := by decide +kernel
theorem ok_223232 : slOKL 223232 512 = true := by decide +kernel
theorem ok_223744 : slOKL 223744 512 = true := by decide +kernel
theorem ok_224256 : slOKL 224256 512 = true := by decide +kernel
theorem ok_224768 : slOKL 224768 512 = true := by decide +kernel
end E1P.OK_ptc
