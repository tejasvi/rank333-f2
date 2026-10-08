module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 1 = true := by decide +kernel
theorem okB4682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4682 1 = true := by decide +kernel
theorem okB4683 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4683 1 = true := by decide +kernel
theorem okB4684 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4684 1 = true := by decide +kernel
theorem okB4685 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4685 1 = true := by decide +kernel
theorem okB4686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4686 1 = true := by decide +kernel
theorem okB4687 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4687 1 = true := by decide +kernel
theorem okB4688 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4688 1 = true := by decide +kernel
theorem okB4689 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4689 1 = true := by decide +kernel
theorem okB4690 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4690 1 = true := by decide +kernel
theorem okB4691 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4691 1 = true := by decide +kernel
theorem okG448 : glueChkR lits W 4681 11 = true := by decide +kernel
theorem okM448 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 1 = true := okB4681
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 2 = true := blkChk_join _ _ _ _ _ 4681 1 1 h0 okB4682
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 3 = true := blkChk_join _ _ _ _ _ 4681 2 1 h1 okB4683
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 4 = true := blkChk_join _ _ _ _ _ 4681 3 1 h2 okB4684
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 5 = true := blkChk_join _ _ _ _ _ 4681 4 1 h3 okB4685
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 6 = true := blkChk_join _ _ _ _ _ 4681 5 1 h4 okB4686
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 7 = true := blkChk_join _ _ _ _ _ 4681 6 1 h5 okB4687
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 8 = true := blkChk_join _ _ _ _ _ 4681 7 1 h6 okB4688
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 9 = true := blkChk_join _ _ _ _ _ 4681 8 1 h7 okB4689
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 10 = true := blkChk_join _ _ _ _ _ 4681 9 1 h8 okB4690
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4681 11 = true := blkChk_join _ _ _ _ _ 4681 10 1 h9 okB4691
  exact h10
end E1.C384X
