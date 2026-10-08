module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB775 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 1 = true := by decide +kernel
theorem okB776 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 776 1 = true := by decide +kernel
theorem okB777 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 777 1 = true := by decide +kernel
theorem okB778 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 778 1 = true := by decide +kernel
theorem okB779 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 779 1 = true := by decide +kernel
theorem okB780 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 780 1 = true := by decide +kernel
theorem okB781 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 781 1 = true := by decide +kernel
theorem okB782 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 782 1 = true := by decide +kernel
theorem okB783 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 783 1 = true := by decide +kernel
theorem okB784 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 784 1 = true := by decide +kernel
theorem okG73 : glueChkR lits W 775 10 = true := by decide +kernel
theorem okM73 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 1 = true := okB775
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 2 = true := blkChk_join _ _ _ _ _ 775 1 1 h0 okB776
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 3 = true := blkChk_join _ _ _ _ _ 775 2 1 h1 okB777
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 4 = true := blkChk_join _ _ _ _ _ 775 3 1 h2 okB778
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 5 = true := blkChk_join _ _ _ _ _ 775 4 1 h3 okB779
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 6 = true := blkChk_join _ _ _ _ _ 775 5 1 h4 okB780
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 7 = true := blkChk_join _ _ _ _ _ 775 6 1 h5 okB781
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 8 = true := blkChk_join _ _ _ _ _ 775 7 1 h6 okB782
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 9 = true := blkChk_join _ _ _ _ _ 775 8 1 h7 okB783
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 775 10 = true := blkChk_join _ _ _ _ _ 775 9 1 h8 okB784
  exact h9
end E1.C384X
