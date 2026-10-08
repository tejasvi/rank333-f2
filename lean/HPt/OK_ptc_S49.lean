module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_200704 : slOKL 200704 512 = true := by decide +kernel
theorem ok_201216 : slOKL 201216 512 = true := by decide +kernel
theorem ok_201728 : slOKL 201728 512 = true := by decide +kernel
theorem ok_202240 : slOKL 202240 512 = true := by decide +kernel
theorem ok_202752 : slOKL 202752 512 = true := by decide +kernel
theorem ok_203264 : slOKL 203264 512 = true := by decide +kernel
theorem ok_203776 : slOKL 203776 512 = true := by decide +kernel
theorem ok_204288 : slOKL 204288 512 = true := by decide +kernel
end E1P.OK_ptc
