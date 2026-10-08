module
public import R22Port.U_d41d8cd98f00
public import E1.C239X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C239X
open E1S
theorem okB79 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 79 1 = true := by decide +kernel
theorem okB80 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 80 1 = true := by decide +kernel
theorem okB81 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 81 1 = true := by decide +kernel
theorem okG5 : glueChkR lits W 79 3 = true := by decide +kernel
theorem okM5 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 79 3 = true := by
  have h0 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 79 1 = true := okB79
  have h1 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 79 2 = true := blkChk_join _ _ _ _ _ 79 1 1 h0 okB80
  have h2 : blkChk E1.IP_e239.C E1.SL_e239.entry E1.IP_e239.UB E1.IP_e239.UBR lits 79 3 = true := blkChk_join _ _ _ _ _ 79 2 1 h1 okB81
  exact h2
end E1.C239X
