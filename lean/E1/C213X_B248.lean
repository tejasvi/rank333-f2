module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2674 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 1 = true := by decide +kernel
theorem okB2675 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2675 1 = true := by decide +kernel
theorem okB2676 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2676 1 = true := by decide +kernel
theorem okB2677 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2677 1 = true := by decide +kernel
theorem okB2678 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2678 1 = true := by decide +kernel
theorem okB2679 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2679 1 = true := by decide +kernel
theorem okB2680 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2680 1 = true := by decide +kernel
theorem okB2681 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2681 1 = true := by decide +kernel
theorem okB2682 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2682 1 = true := by decide +kernel
theorem okB2683 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2683 1 = true := by decide +kernel
theorem okG248 : glueChkR lits W 2674 10 = true := by decide +kernel
theorem okM248 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 1 = true := okB2674
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 2 = true := blkChk_join _ _ _ _ _ 2674 1 1 h0 okB2675
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 3 = true := blkChk_join _ _ _ _ _ 2674 2 1 h1 okB2676
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 4 = true := blkChk_join _ _ _ _ _ 2674 3 1 h2 okB2677
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 5 = true := blkChk_join _ _ _ _ _ 2674 4 1 h3 okB2678
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 6 = true := blkChk_join _ _ _ _ _ 2674 5 1 h4 okB2679
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 7 = true := blkChk_join _ _ _ _ _ 2674 6 1 h5 okB2680
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 8 = true := blkChk_join _ _ _ _ _ 2674 7 1 h6 okB2681
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 9 = true := blkChk_join _ _ _ _ _ 2674 8 1 h7 okB2682
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2674 10 = true := blkChk_join _ _ _ _ _ 2674 9 1 h8 okB2683
  exact h9
end E1.C213X
