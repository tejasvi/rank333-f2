module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2551 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 1 = true := by decide +kernel
theorem okB2552 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2552 1 = true := by decide +kernel
theorem okB2553 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2553 1 = true := by decide +kernel
theorem okB2554 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2554 1 = true := by decide +kernel
theorem okB2555 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2555 1 = true := by decide +kernel
theorem okB2556 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2556 1 = true := by decide +kernel
theorem okB2557 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2557 1 = true := by decide +kernel
theorem okB2558 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2558 1 = true := by decide +kernel
theorem okG239 : glueChkR lits W 2551 8 = true := by decide +kernel
theorem okM239 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 1 = true := okB2551
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 2 = true := blkChk_join _ _ _ _ _ 2551 1 1 h0 okB2552
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 3 = true := blkChk_join _ _ _ _ _ 2551 2 1 h1 okB2553
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 4 = true := blkChk_join _ _ _ _ _ 2551 3 1 h2 okB2554
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 5 = true := blkChk_join _ _ _ _ _ 2551 4 1 h3 okB2555
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 6 = true := blkChk_join _ _ _ _ _ 2551 5 1 h4 okB2556
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 7 = true := blkChk_join _ _ _ _ _ 2551 6 1 h5 okB2557
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2551 8 = true := blkChk_join _ _ _ _ _ 2551 7 1 h6 okB2558
  exact h7
end E1.C384X
