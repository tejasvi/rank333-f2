module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2857 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2858 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2859 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2860 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2861 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG281 : glueChkR lits W 2857 5 = true := by
  rw [← glueChkRN_eq lits W 8596 2857 lenT]; decide +kernel
theorem okM281 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 1 = true := okB2857
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 2 = true := blkChk_join _ _ _ _ _ 2857 1 1 h0 okB2858
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 3 = true := blkChk_join _ _ _ _ _ 2857 2 1 h1 okB2859
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 4 = true := blkChk_join _ _ _ _ _ 2857 3 1 h2 okB2860
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2857 5 = true := blkChk_join _ _ _ _ _ 2857 4 1 h3 okB2861
  exact h4
end E1.C236X
