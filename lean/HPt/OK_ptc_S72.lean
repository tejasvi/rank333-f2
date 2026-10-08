module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_294912 : slOKL 294912 512 = true := by decide +kernel
theorem ok_295424 : slOKL 295424 512 = true := by decide +kernel
theorem ok_295936 : slOKL 295936 512 = true := by decide +kernel
theorem ok_296448 : slOKL 296448 512 = true := by decide +kernel
theorem ok_296960 : slOKL 296960 512 = true := by decide +kernel
theorem ok_297472 : slOKL 297472 512 = true := by decide +kernel
theorem ok_297984 : slOKL 297984 512 = true := by decide +kernel
theorem ok_298496 : slOKL 298496 512 = true := by decide +kernel
end E1P.OK_ptc
