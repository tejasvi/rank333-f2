module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4686 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4687 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4687 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4688 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4689 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4690 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4691 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4692 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4692 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4693 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4693 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG460 : glueChkR lits W 4686 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4686 lenT]; decide +kernel
theorem okM460 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 1 = true := okB4686
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 2 = true := blkChk_join _ _ _ _ _ 4686 1 1 h0 okB4687
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 3 = true := blkChk_join _ _ _ _ _ 4686 2 1 h1 okB4688
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 4 = true := blkChk_join _ _ _ _ _ 4686 3 1 h2 okB4689
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 5 = true := blkChk_join _ _ _ _ _ 4686 4 1 h3 okB4690
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 6 = true := blkChk_join _ _ _ _ _ 4686 5 1 h4 okB4691
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 7 = true := blkChk_join _ _ _ _ _ 4686 6 1 h5 okB4692
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4686 8 = true := blkChk_join _ _ _ _ _ 4686 7 1 h6 okB4693
  exact h7
end E1.C236X
