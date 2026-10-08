module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5702 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG602 : glueChkR lits W 5702 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5702 lenT]; decide +kernel
theorem okM602 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 1 = true := okB5702
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 2 = true := blkChk_join _ _ _ _ _ 5702 1 1 h0 okB5703
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 3 = true := blkChk_join _ _ _ _ _ 5702 2 1 h1 okB5704
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 4 = true := blkChk_join _ _ _ _ _ 5702 3 1 h2 okB5705
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 5 = true := blkChk_join _ _ _ _ _ 5702 4 1 h3 okB5706
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 6 = true := blkChk_join _ _ _ _ _ 5702 5 1 h4 okB5707
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 7 = true := blkChk_join _ _ _ _ _ 5702 6 1 h5 okB5708
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 8 = true := blkChk_join _ _ _ _ _ 5702 7 1 h6 okB5709
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 9 = true := blkChk_join _ _ _ _ _ 5702 8 1 h7 okB5710
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 10 = true := blkChk_join _ _ _ _ _ 5702 9 1 h8 okB5711
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 11 = true := blkChk_join _ _ _ _ _ 5702 10 1 h9 okB5712
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5702 12 = true := blkChk_join _ _ _ _ _ 5702 11 1 h10 okB5713
  exact h11
end E1.C284X
