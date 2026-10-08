module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2758 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2759 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2759 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2760 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2760 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2761 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2761 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2762 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2762 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2763 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2763 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2764 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2764 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2765 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2765 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2766 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2766 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2767 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG271 : glueChkR lits W 2758 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2758 lenT]; decide +kernel
theorem okM271 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 1 = true := okB2758
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 2 = true := blkChk_join _ _ _ _ _ 2758 1 1 h0 okB2759
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 3 = true := blkChk_join _ _ _ _ _ 2758 2 1 h1 okB2760
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 4 = true := blkChk_join _ _ _ _ _ 2758 3 1 h2 okB2761
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 5 = true := blkChk_join _ _ _ _ _ 2758 4 1 h3 okB2762
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 6 = true := blkChk_join _ _ _ _ _ 2758 5 1 h4 okB2763
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 7 = true := blkChk_join _ _ _ _ _ 2758 6 1 h5 okB2764
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 8 = true := blkChk_join _ _ _ _ _ 2758 7 1 h6 okB2765
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 9 = true := blkChk_join _ _ _ _ _ 2758 8 1 h7 okB2766
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2758 10 = true := blkChk_join _ _ _ _ _ 2758 9 1 h8 okB2767
  exact h9
end E1.C236X
