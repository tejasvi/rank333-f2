module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB762 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 1 = true := by decide +kernel
theorem okB763 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 763 1 = true := by decide +kernel
theorem okB764 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 764 1 = true := by decide +kernel
theorem okB765 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 765 1 = true := by decide +kernel
theorem okB766 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 766 1 = true := by decide +kernel
theorem okB767 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 767 1 = true := by decide +kernel
theorem okB768 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 768 1 = true := by decide +kernel
theorem okB769 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 769 1 = true := by decide +kernel
theorem okB770 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 770 1 = true := by decide +kernel
theorem okB771 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 771 1 = true := by decide +kernel
theorem okG70 : glueChkR lits W 762 10 = true := by decide +kernel
theorem okM70 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 1 = true := okB762
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 2 = true := blkChk_join _ _ _ _ _ 762 1 1 h0 okB763
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 3 = true := blkChk_join _ _ _ _ _ 762 2 1 h1 okB764
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 4 = true := blkChk_join _ _ _ _ _ 762 3 1 h2 okB765
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 5 = true := blkChk_join _ _ _ _ _ 762 4 1 h3 okB766
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 6 = true := blkChk_join _ _ _ _ _ 762 5 1 h4 okB767
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 7 = true := blkChk_join _ _ _ _ _ 762 6 1 h5 okB768
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 8 = true := blkChk_join _ _ _ _ _ 762 7 1 h6 okB769
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 9 = true := blkChk_join _ _ _ _ _ 762 8 1 h7 okB770
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 762 10 = true := blkChk_join _ _ _ _ _ 762 9 1 h8 okB771
  exact h9
end E1.C382X
