module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_319488 : slOKL 319488 512 = true := by decide +kernel
theorem ok_320000 : slOKL 320000 512 = true := by decide +kernel
theorem ok_320512 : slOKL 320512 512 = true := by decide +kernel
theorem ok_321024 : slOKL 321024 512 = true := by decide +kernel
theorem ok_321536 : slOKL 321536 512 = true := by decide +kernel
theorem ok_322048 : slOKL 322048 512 = true := by decide +kernel
theorem ok_322560 : slOKL 322560 512 = true := by decide +kernel
theorem ok_323072 : slOKL 323072 512 = true := by decide +kernel
end E1P.OK_ptc
