module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG77 : glueChkR lits W 703 9 = true := by
  rw [← glueChkRN_eq lits W 7747 703 lenT]; decide +kernel
theorem okM77 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 1 = true := okB703
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 2 = true := blkChk_join _ _ _ _ _ 703 1 1 h0 okB704
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 3 = true := blkChk_join _ _ _ _ _ 703 2 1 h1 okB705
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 4 = true := blkChk_join _ _ _ _ _ 703 3 1 h2 okB706
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 5 = true := blkChk_join _ _ _ _ _ 703 4 1 h3 okB707
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 6 = true := blkChk_join _ _ _ _ _ 703 5 1 h4 okB708
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 7 = true := blkChk_join _ _ _ _ _ 703 6 1 h5 okB709
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 8 = true := blkChk_join _ _ _ _ _ 703 7 1 h6 okB710
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 703 9 = true := blkChk_join _ _ _ _ _ 703 8 1 h7 okB711
  exact h8
end E1.C284X
