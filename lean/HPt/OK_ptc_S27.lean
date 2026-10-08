module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_110592 : slOKL 110592 512 = true := by decide +kernel
theorem ok_111104 : slOKL 111104 512 = true := by decide +kernel
theorem ok_111616 : slOKL 111616 512 = true := by decide +kernel
theorem ok_112128 : slOKL 112128 512 = true := by decide +kernel
theorem ok_112640 : slOKL 112640 512 = true := by decide +kernel
theorem ok_113152 : slOKL 113152 512 = true := by decide +kernel
theorem ok_113664 : slOKL 113664 512 = true := by decide +kernel
theorem ok_114176 : slOKL 114176 512 = true := by decide +kernel
end E1P.OK_ptc
