module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2572 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2573 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2574 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2574 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2575 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2575 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2576 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2576 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2577 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2577 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2578 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2578 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2579 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2579 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG251 : glueChkR lits W 2572 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2572 lenT]; decide +kernel
theorem okM251 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 1 = true := okB2572
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 2 = true := blkChk_join _ _ _ _ _ 2572 1 1 h0 okB2573
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 3 = true := blkChk_join _ _ _ _ _ 2572 2 1 h1 okB2574
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 4 = true := blkChk_join _ _ _ _ _ 2572 3 1 h2 okB2575
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 5 = true := blkChk_join _ _ _ _ _ 2572 4 1 h3 okB2576
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 6 = true := blkChk_join _ _ _ _ _ 2572 5 1 h4 okB2577
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 7 = true := blkChk_join _ _ _ _ _ 2572 6 1 h5 okB2578
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2572 8 = true := blkChk_join _ _ _ _ _ 2572 7 1 h6 okB2579
  exact h7
end E1.C236X
