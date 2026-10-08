module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB825 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB826 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB827 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB828 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB829 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB830 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB831 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG77 : glueChkR lits W 825 7 = true := by
  rw [← glueChkRN_eq lits W 8596 825 lenT]; decide +kernel
theorem okM77 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 1 = true := okB825
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 2 = true := blkChk_join _ _ _ _ _ 825 1 1 h0 okB826
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 3 = true := blkChk_join _ _ _ _ _ 825 2 1 h1 okB827
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 4 = true := blkChk_join _ _ _ _ _ 825 3 1 h2 okB828
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 5 = true := blkChk_join _ _ _ _ _ 825 4 1 h3 okB829
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 6 = true := blkChk_join _ _ _ _ _ 825 5 1 h4 okB830
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 825 7 = true := blkChk_join _ _ _ _ _ 825 6 1 h5 okB831
  exact h6
end E1.C236X
