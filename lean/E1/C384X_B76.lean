module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB807 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 1 = true := by decide +kernel
theorem okB808 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 808 1 = true := by decide +kernel
theorem okB809 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 809 1 = true := by decide +kernel
theorem okB810 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 810 1 = true := by decide +kernel
theorem okB811 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 811 1 = true := by decide +kernel
theorem okB812 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 812 1 = true := by decide +kernel
theorem okB813 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 813 1 = true := by decide +kernel
theorem okG76 : glueChkR lits W 807 7 = true := by decide +kernel
theorem okM76 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 1 = true := okB807
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 2 = true := blkChk_join _ _ _ _ _ 807 1 1 h0 okB808
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 3 = true := blkChk_join _ _ _ _ _ 807 2 1 h1 okB809
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 4 = true := blkChk_join _ _ _ _ _ 807 3 1 h2 okB810
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 5 = true := blkChk_join _ _ _ _ _ 807 4 1 h3 okB811
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 6 = true := blkChk_join _ _ _ _ _ 807 5 1 h4 okB812
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 807 7 = true := blkChk_join _ _ _ _ _ 807 6 1 h5 okB813
  exact h6
end E1.C384X
