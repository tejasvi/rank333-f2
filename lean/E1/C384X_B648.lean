module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 1 = true := by decide +kernel
theorem okB6687 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6687 1 = true := by decide +kernel
theorem okB6688 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6688 1 = true := by decide +kernel
theorem okB6689 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6689 1 = true := by decide +kernel
theorem okB6690 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6690 1 = true := by decide +kernel
theorem okB6691 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6691 1 = true := by decide +kernel
theorem okB6692 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6692 1 = true := by decide +kernel
theorem okB6693 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6693 1 = true := by decide +kernel
theorem okG648 : glueChkR lits W 6686 8 = true := by decide +kernel
theorem okM648 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 1 = true := okB6686
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 2 = true := blkChk_join _ _ _ _ _ 6686 1 1 h0 okB6687
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 3 = true := blkChk_join _ _ _ _ _ 6686 2 1 h1 okB6688
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 4 = true := blkChk_join _ _ _ _ _ 6686 3 1 h2 okB6689
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 5 = true := blkChk_join _ _ _ _ _ 6686 4 1 h3 okB6690
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 6 = true := blkChk_join _ _ _ _ _ 6686 5 1 h4 okB6691
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 7 = true := blkChk_join _ _ _ _ _ 6686 6 1 h5 okB6692
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6686 8 = true := blkChk_join _ _ _ _ _ 6686 7 1 h6 okB6693
  exact h7
end E1.C384X
