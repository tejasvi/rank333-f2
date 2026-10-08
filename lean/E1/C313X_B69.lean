module
public import R22Port.U_d41d8cd98f00
public import E1.C313X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C313X
open E1S
theorem okB815 : blkChk E1.IP_e313.C E1.SL_e313.entry E1.IP_e313.UB E1.IP_e313.UBR lits 815 1 = true := by decide +kernel
theorem okB816 : blkChk E1.IP_e313.C E1.SL_e313.entry E1.IP_e313.UB E1.IP_e313.UBR lits 816 1 = true := by decide +kernel
theorem okG69 : glueChkR lits W 815 2 = true := by decide +kernel
theorem okM69 : blkChk E1.IP_e313.C E1.SL_e313.entry E1.IP_e313.UB E1.IP_e313.UBR lits 815 2 = true := by
  have h0 : blkChk E1.IP_e313.C E1.SL_e313.entry E1.IP_e313.UB E1.IP_e313.UBR lits 815 1 = true := okB815
  have h1 : blkChk E1.IP_e313.C E1.SL_e313.entry E1.IP_e313.UB E1.IP_e313.UBR lits 815 2 = true := blkChk_join _ _ _ _ _ 815 1 1 h0 okB816
  exact h1
end E1.C313X
