module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB5801 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 1 = true := by decide +kernel
theorem okB5802 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5802 1 = true := by decide +kernel
theorem okB5803 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5803 1 = true := by decide +kernel
theorem okB5804 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5804 1 = true := by decide +kernel
theorem okB5805 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5805 1 = true := by decide +kernel
theorem okB5806 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5806 1 = true := by decide +kernel
theorem okB5807 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5807 1 = true := by decide +kernel
theorem okB5808 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5808 1 = true := by decide +kernel
theorem okB5809 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5809 1 = true := by decide +kernel
theorem okB5810 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5810 1 = true := by decide +kernel
theorem okG528 : glueChkR lits W 5801 10 = true := by decide +kernel
theorem okM528 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 1 = true := okB5801
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 2 = true := blkChk_join _ _ _ _ _ 5801 1 1 h0 okB5802
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 3 = true := blkChk_join _ _ _ _ _ 5801 2 1 h1 okB5803
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 4 = true := blkChk_join _ _ _ _ _ 5801 3 1 h2 okB5804
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 5 = true := blkChk_join _ _ _ _ _ 5801 4 1 h3 okB5805
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 6 = true := blkChk_join _ _ _ _ _ 5801 5 1 h4 okB5806
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 7 = true := blkChk_join _ _ _ _ _ 5801 6 1 h5 okB5807
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 8 = true := blkChk_join _ _ _ _ _ 5801 7 1 h6 okB5808
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 9 = true := blkChk_join _ _ _ _ _ 5801 8 1 h7 okB5809
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5801 10 = true := blkChk_join _ _ _ _ _ 5801 9 1 h8 okB5810
  exact h9
end E1.C213X
