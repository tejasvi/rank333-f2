module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_286720 : slOKL 286720 512 = true := by decide +kernel
theorem ok_287232 : slOKL 287232 512 = true := by decide +kernel
theorem ok_287744 : slOKL 287744 512 = true := by decide +kernel
theorem ok_288256 : slOKL 288256 512 = true := by decide +kernel
theorem ok_288768 : slOKL 288768 512 = true := by decide +kernel
theorem ok_289280 : slOKL 289280 512 = true := by decide +kernel
theorem ok_289792 : slOKL 289792 512 = true := by decide +kernel
theorem ok_290304 : slOKL 290304 512 = true := by decide +kernel
end E1P.OK_ptc
