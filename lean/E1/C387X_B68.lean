module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB744 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 1 = true := by decide +kernel
theorem okB745 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 745 1 = true := by decide +kernel
theorem okB746 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 746 1 = true := by decide +kernel
theorem okB747 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 747 1 = true := by decide +kernel
theorem okB748 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 748 1 = true := by decide +kernel
theorem okB749 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 749 1 = true := by decide +kernel
theorem okB750 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 750 1 = true := by decide +kernel
theorem okB751 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 751 1 = true := by decide +kernel
theorem okB752 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 752 1 = true := by decide +kernel
theorem okG68 : glueChkR lits W 744 9 = true := by decide +kernel
theorem okM68 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 1 = true := okB744
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 2 = true := blkChk_join _ _ _ _ _ 744 1 1 h0 okB745
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 3 = true := blkChk_join _ _ _ _ _ 744 2 1 h1 okB746
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 4 = true := blkChk_join _ _ _ _ _ 744 3 1 h2 okB747
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 5 = true := blkChk_join _ _ _ _ _ 744 4 1 h3 okB748
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 6 = true := blkChk_join _ _ _ _ _ 744 5 1 h4 okB749
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 7 = true := blkChk_join _ _ _ _ _ 744 6 1 h5 okB750
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 8 = true := blkChk_join _ _ _ _ _ 744 7 1 h6 okB751
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 744 9 = true := blkChk_join _ _ _ _ _ 744 8 1 h7 okB752
  exact h8
end E1.C387X
