module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB677 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB678 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB679 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB680 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB681 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB682 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB683 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB684 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB685 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB686 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG64 : glueChkR lits W 677 10 = true := by
  rw [← glueChkRN_eq lits W 8596 677 lenT]; decide +kernel
theorem okM64 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 1 = true := okB677
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 2 = true := blkChk_join _ _ _ _ _ 677 1 1 h0 okB678
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 3 = true := blkChk_join _ _ _ _ _ 677 2 1 h1 okB679
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 4 = true := blkChk_join _ _ _ _ _ 677 3 1 h2 okB680
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 5 = true := blkChk_join _ _ _ _ _ 677 4 1 h3 okB681
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 6 = true := blkChk_join _ _ _ _ _ 677 5 1 h4 okB682
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 7 = true := blkChk_join _ _ _ _ _ 677 6 1 h5 okB683
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 8 = true := blkChk_join _ _ _ _ _ 677 7 1 h6 okB684
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 9 = true := blkChk_join _ _ _ _ _ 677 8 1 h7 okB685
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 677 10 = true := blkChk_join _ _ _ _ _ 677 9 1 h8 okB686
  exact h9
end E1.C236X
