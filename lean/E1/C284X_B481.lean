module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4541 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4541 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4542 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4542 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4543 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4543 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4544 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4544 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4545 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4545 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4546 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4546 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4547 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4547 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4548 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4548 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG481 : glueChkR lits W 4539 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4539 lenT]; decide +kernel
theorem okM481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 1 = true := okB4539
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 2 = true := blkChk_join _ _ _ _ _ 4539 1 1 h0 okB4540
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 3 = true := blkChk_join _ _ _ _ _ 4539 2 1 h1 okB4541
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 4 = true := blkChk_join _ _ _ _ _ 4539 3 1 h2 okB4542
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 5 = true := blkChk_join _ _ _ _ _ 4539 4 1 h3 okB4543
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 6 = true := blkChk_join _ _ _ _ _ 4539 5 1 h4 okB4544
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 7 = true := blkChk_join _ _ _ _ _ 4539 6 1 h5 okB4545
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 8 = true := blkChk_join _ _ _ _ _ 4539 7 1 h6 okB4546
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 9 = true := blkChk_join _ _ _ _ _ 4539 8 1 h7 okB4547
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4539 10 = true := blkChk_join _ _ _ _ _ 4539 9 1 h8 okB4548
  exact h9
end E1.C284X
