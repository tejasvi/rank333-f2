module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB2803 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 1 = true := by decide +kernel
theorem okB2804 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2804 1 = true := by decide +kernel
theorem okB2805 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2805 1 = true := by decide +kernel
theorem okB2806 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2806 1 = true := by decide +kernel
theorem okB2807 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2807 1 = true := by decide +kernel
theorem okB2808 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2808 1 = true := by decide +kernel
theorem okB2809 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2809 1 = true := by decide +kernel
theorem okB2810 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2810 1 = true := by decide +kernel
theorem okG240 : glueChkR lits W 2803 8 = true := by decide +kernel
theorem okM240 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 8 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 1 = true := okB2803
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 2 = true := blkChk_join _ _ _ _ _ 2803 1 1 h0 okB2804
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 3 = true := blkChk_join _ _ _ _ _ 2803 2 1 h1 okB2805
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 4 = true := blkChk_join _ _ _ _ _ 2803 3 1 h2 okB2806
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 5 = true := blkChk_join _ _ _ _ _ 2803 4 1 h3 okB2807
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 6 = true := blkChk_join _ _ _ _ _ 2803 5 1 h4 okB2808
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 7 = true := blkChk_join _ _ _ _ _ 2803 6 1 h5 okB2809
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 2803 8 = true := blkChk_join _ _ _ _ _ 2803 7 1 h6 okB2810
  exact h7
end E1.C267X
