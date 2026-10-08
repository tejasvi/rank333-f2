module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5709 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5710 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5711 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5712 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5713 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5714 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5715 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG553 : glueChkR lits W 5709 7 = true := by
  rw [← glueChkRN_eq lits W 8596 5709 lenT]; decide +kernel
theorem okM553 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 1 = true := okB5709
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 2 = true := blkChk_join _ _ _ _ _ 5709 1 1 h0 okB5710
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 3 = true := blkChk_join _ _ _ _ _ 5709 2 1 h1 okB5711
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 4 = true := blkChk_join _ _ _ _ _ 5709 3 1 h2 okB5712
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 5 = true := blkChk_join _ _ _ _ _ 5709 4 1 h3 okB5713
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 6 = true := blkChk_join _ _ _ _ _ 5709 5 1 h4 okB5714
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5709 7 = true := blkChk_join _ _ _ _ _ 5709 6 1 h5 okB5715
  exact h6
end E1.C236X
