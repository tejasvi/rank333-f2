module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6032 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6033 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6034 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6035 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6036 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6037 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6038 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6039 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6040 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6041 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG580 : glueChkR lits W 6032 10 = true := by
  rw [← glueChkRN_eq lits W 8596 6032 lenT]; decide +kernel
theorem okM580 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 1 = true := okB6032
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 2 = true := blkChk_join _ _ _ _ _ 6032 1 1 h0 okB6033
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 3 = true := blkChk_join _ _ _ _ _ 6032 2 1 h1 okB6034
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 4 = true := blkChk_join _ _ _ _ _ 6032 3 1 h2 okB6035
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 5 = true := blkChk_join _ _ _ _ _ 6032 4 1 h3 okB6036
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 6 = true := blkChk_join _ _ _ _ _ 6032 5 1 h4 okB6037
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 7 = true := blkChk_join _ _ _ _ _ 6032 6 1 h5 okB6038
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 8 = true := blkChk_join _ _ _ _ _ 6032 7 1 h6 okB6039
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 9 = true := blkChk_join _ _ _ _ _ 6032 8 1 h7 okB6040
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6032 10 = true := blkChk_join _ _ _ _ _ 6032 9 1 h8 okB6041
  exact h9
end E1.C236X
