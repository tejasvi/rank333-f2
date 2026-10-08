module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_176128 : slOKL 176128 512 = true := by decide +kernel
theorem ok_176640 : slOKL 176640 512 = true := by decide +kernel
theorem ok_177152 : slOKL 177152 512 = true := by decide +kernel
theorem ok_177664 : slOKL 177664 512 = true := by decide +kernel
theorem ok_178176 : slOKL 178176 512 = true := by decide +kernel
theorem ok_178688 : slOKL 178688 512 = true := by decide +kernel
theorem ok_179200 : slOKL 179200 512 = true := by decide +kernel
theorem ok_179712 : slOKL 179712 512 = true := by decide +kernel
end E1P.OK_ptc
