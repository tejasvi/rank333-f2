module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_139264 : slOKL 139264 512 = true := by decide +kernel
theorem ok_139776 : slOKL 139776 512 = true := by decide +kernel
theorem ok_140288 : slOKL 140288 512 = true := by decide +kernel
theorem ok_140800 : slOKL 140800 512 = true := by decide +kernel
theorem ok_141312 : slOKL 141312 512 = true := by decide +kernel
theorem ok_141824 : slOKL 141824 512 = true := by decide +kernel
theorem ok_142336 : slOKL 142336 512 = true := by decide +kernel
theorem ok_142848 : slOKL 142848 512 = true := by decide +kernel
end E1P.OK_ptc
