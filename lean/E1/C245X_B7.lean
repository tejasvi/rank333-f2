module
public import R22Port.U_d41d8cd98f00
public import E1.C245X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C245X
open E1S
theorem okB99 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 1 = true := by decide +kernel
theorem okB100 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 100 1 = true := by decide +kernel
theorem okB101 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 101 1 = true := by decide +kernel
theorem okB102 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 102 1 = true := by decide +kernel
theorem okB103 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 103 1 = true := by decide +kernel
theorem okG7 : glueChkR lits W 99 5 = true := by decide +kernel
theorem okM7 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 5 = true := by
  have h0 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 1 = true := okB99
  have h1 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 2 = true := blkChk_join _ _ _ _ _ 99 1 1 h0 okB100
  have h2 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 3 = true := blkChk_join _ _ _ _ _ 99 2 1 h1 okB101
  have h3 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 4 = true := blkChk_join _ _ _ _ _ 99 3 1 h2 okB102
  have h4 : blkChk E1.IP_e245.C E1.SL_e245.entry E1.IP_e245.UB E1.IP_e245.UBR lits 99 5 = true := blkChk_join _ _ _ _ _ 99 4 1 h3 okB103
  exact h4
end E1.C245X
