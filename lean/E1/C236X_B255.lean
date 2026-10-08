module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2614 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2615 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2616 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2616 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2617 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2617 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2618 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2618 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2619 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2619 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2620 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2620 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2621 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2621 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG255 : glueChkR lits W 2614 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2614 lenT]; decide +kernel
theorem okM255 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 1 = true := okB2614
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 2 = true := blkChk_join _ _ _ _ _ 2614 1 1 h0 okB2615
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 3 = true := blkChk_join _ _ _ _ _ 2614 2 1 h1 okB2616
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 4 = true := blkChk_join _ _ _ _ _ 2614 3 1 h2 okB2617
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 5 = true := blkChk_join _ _ _ _ _ 2614 4 1 h3 okB2618
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 6 = true := blkChk_join _ _ _ _ _ 2614 5 1 h4 okB2619
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 7 = true := blkChk_join _ _ _ _ _ 2614 6 1 h5 okB2620
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2614 8 = true := blkChk_join _ _ _ _ _ 2614 7 1 h6 okB2621
  exact h7
end E1.C236X
