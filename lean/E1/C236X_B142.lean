module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1532 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1533 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1534 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1535 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1536 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1537 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1538 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1539 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG142 : glueChkR lits W 1532 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1532 lenT]; decide +kernel
theorem okM142 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 1 = true := okB1532
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 2 = true := blkChk_join _ _ _ _ _ 1532 1 1 h0 okB1533
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 3 = true := blkChk_join _ _ _ _ _ 1532 2 1 h1 okB1534
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 4 = true := blkChk_join _ _ _ _ _ 1532 3 1 h2 okB1535
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 5 = true := blkChk_join _ _ _ _ _ 1532 4 1 h3 okB1536
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 6 = true := blkChk_join _ _ _ _ _ 1532 5 1 h4 okB1537
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 7 = true := blkChk_join _ _ _ _ _ 1532 6 1 h5 okB1538
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1532 8 = true := blkChk_join _ _ _ _ _ 1532 7 1 h6 okB1539
  exact h7
end E1.C236X
