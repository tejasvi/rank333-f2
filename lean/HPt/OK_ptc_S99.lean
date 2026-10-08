module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_405504 : slOKL 405504 512 = true := by decide +kernel
theorem ok_406016 : slOKL 406016 512 = true := by decide +kernel
theorem ok_406528 : slOKL 406528 512 = true := by decide +kernel
theorem ok_407040 : slOKL 407040 512 = true := by decide +kernel
theorem ok_407552 : slOKL 407552 512 = true := by decide +kernel
theorem ok_408064 : slOKL 408064 512 = true := by decide +kernel
theorem ok_408576 : slOKL 408576 512 = true := by decide +kernel
theorem ok_409088 : slOKL 409088 512 = true := by decide +kernel
end E1P.OK_ptc
