module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_81920 : slOKL 81920 512 = true := by decide +kernel
theorem ok_82432 : slOKL 82432 512 = true := by decide +kernel
theorem ok_82944 : slOKL 82944 512 = true := by decide +kernel
theorem ok_83456 : slOKL 83456 512 = true := by decide +kernel
theorem ok_83968 : slOKL 83968 512 = true := by decide +kernel
theorem ok_84480 : slOKL 84480 512 = true := by decide +kernel
theorem ok_84992 : slOKL 84992 512 = true := by decide +kernel
theorem ok_85504 : slOKL 85504 512 = true := by decide +kernel
end E1P.OK_ptc
