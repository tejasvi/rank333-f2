module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_192512 : slOKL 192512 512 = true := by decide +kernel
theorem ok_193024 : slOKL 193024 512 = true := by decide +kernel
theorem ok_193536 : slOKL 193536 512 = true := by decide +kernel
theorem ok_194048 : slOKL 194048 512 = true := by decide +kernel
theorem ok_194560 : slOKL 194560 512 = true := by decide +kernel
theorem ok_195072 : slOKL 195072 512 = true := by decide +kernel
theorem ok_195584 : slOKL 195584 512 = true := by decide +kernel
theorem ok_196096 : slOKL 196096 512 = true := by decide +kernel
end E1P.OK_ptc
