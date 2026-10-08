module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_262144 : slOKL 262144 512 = true := by decide +kernel
theorem ok_262656 : slOKL 262656 512 = true := by decide +kernel
theorem ok_263168 : slOKL 263168 512 = true := by decide +kernel
theorem ok_263680 : slOKL 263680 512 = true := by decide +kernel
theorem ok_264192 : slOKL 264192 512 = true := by decide +kernel
theorem ok_264704 : slOKL 264704 512 = true := by decide +kernel
theorem ok_265216 : slOKL 265216 512 = true := by decide +kernel
theorem ok_265728 : slOKL 265728 512 = true := by decide +kernel
end E1P.OK_ptc
