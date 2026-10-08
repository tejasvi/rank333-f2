module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3677 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 1 = true := by decide +kernel
theorem okB3678 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3678 1 = true := by decide +kernel
theorem okB3679 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3679 1 = true := by decide +kernel
theorem okB3680 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3680 1 = true := by decide +kernel
theorem okB3681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3681 1 = true := by decide +kernel
theorem okB3682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3682 1 = true := by decide +kernel
theorem okB3683 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3683 1 = true := by decide +kernel
theorem okB3684 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3684 1 = true := by decide +kernel
theorem okB3685 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3685 1 = true := by decide +kernel
theorem okB3686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3686 1 = true := by decide +kernel
theorem okG354 : glueChkR lits W 3677 10 = true := by decide +kernel
theorem okM354 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 1 = true := okB3677
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 2 = true := blkChk_join _ _ _ _ _ 3677 1 1 h0 okB3678
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 3 = true := blkChk_join _ _ _ _ _ 3677 2 1 h1 okB3679
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 4 = true := blkChk_join _ _ _ _ _ 3677 3 1 h2 okB3680
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 5 = true := blkChk_join _ _ _ _ _ 3677 4 1 h3 okB3681
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 6 = true := blkChk_join _ _ _ _ _ 3677 5 1 h4 okB3682
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 7 = true := blkChk_join _ _ _ _ _ 3677 6 1 h5 okB3683
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 8 = true := blkChk_join _ _ _ _ _ 3677 7 1 h6 okB3684
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 9 = true := blkChk_join _ _ _ _ _ 3677 8 1 h7 okB3685
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3677 10 = true := blkChk_join _ _ _ _ _ 3677 9 1 h8 okB3686
  exact h9
end E1.C384X
