module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG694 : glueChkR lits W 6703 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6703 lenT]; decide +kernel
theorem okM694 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 1 = true := okB6703
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 2 = true := blkChk_join _ _ _ _ _ 6703 1 1 h0 okB6704
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 3 = true := blkChk_join _ _ _ _ _ 6703 2 1 h1 okB6705
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 4 = true := blkChk_join _ _ _ _ _ 6703 3 1 h2 okB6706
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 5 = true := blkChk_join _ _ _ _ _ 6703 4 1 h3 okB6707
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 6 = true := blkChk_join _ _ _ _ _ 6703 5 1 h4 okB6708
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 7 = true := blkChk_join _ _ _ _ _ 6703 6 1 h5 okB6709
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 8 = true := blkChk_join _ _ _ _ _ 6703 7 1 h6 okB6710
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6703 9 = true := blkChk_join _ _ _ _ _ 6703 8 1 h7 okB6711
  exact h8
end E1.C284X
