module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_331776 : slOKL 331776 512 = true := by decide +kernel
theorem ok_332288 : slOKL 332288 512 = true := by decide +kernel
theorem ok_332800 : slOKL 332800 512 = true := by decide +kernel
theorem ok_333312 : slOKL 333312 512 = true := by decide +kernel
theorem ok_333824 : slOKL 333824 512 = true := by decide +kernel
theorem ok_334336 : slOKL 334336 512 = true := by decide +kernel
theorem ok_334848 : slOKL 334848 512 = true := by decide +kernel
theorem ok_335360 : slOKL 335360 512 = true := by decide +kernel
end E1P.OK_ptc
