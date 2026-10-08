module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_135168 : slOKL 135168 512 = true := by decide +kernel
theorem ok_135680 : slOKL 135680 512 = true := by decide +kernel
theorem ok_136192 : slOKL 136192 512 = true := by decide +kernel
theorem ok_136704 : slOKL 136704 512 = true := by decide +kernel
theorem ok_137216 : slOKL 137216 512 = true := by decide +kernel
theorem ok_137728 : slOKL 137728 512 = true := by decide +kernel
theorem ok_138240 : slOKL 138240 512 = true := by decide +kernel
theorem ok_138752 : slOKL 138752 512 = true := by decide +kernel
end E1P.OK_ptc
