module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5669 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 1 = true := by decide +kernel
theorem okB5670 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5670 1 = true := by decide +kernel
theorem okB5671 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5671 1 = true := by decide +kernel
theorem okB5672 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5672 1 = true := by decide +kernel
theorem okB5673 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5673 1 = true := by decide +kernel
theorem okB5674 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5674 1 = true := by decide +kernel
theorem okB5675 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5675 1 = true := by decide +kernel
theorem okB5676 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5676 1 = true := by decide +kernel
theorem okB5677 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5677 1 = true := by decide +kernel
theorem okB5678 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5678 1 = true := by decide +kernel
theorem okB5679 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5679 1 = true := by decide +kernel
theorem okB5680 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5680 1 = true := by decide +kernel
theorem okB5681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5681 1 = true := by decide +kernel
theorem okG545 : glueChkR lits W 5669 13 = true := by decide +kernel
theorem okM545 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 1 = true := okB5669
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 2 = true := blkChk_join _ _ _ _ _ 5669 1 1 h0 okB5670
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 3 = true := blkChk_join _ _ _ _ _ 5669 2 1 h1 okB5671
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 4 = true := blkChk_join _ _ _ _ _ 5669 3 1 h2 okB5672
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 5 = true := blkChk_join _ _ _ _ _ 5669 4 1 h3 okB5673
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 6 = true := blkChk_join _ _ _ _ _ 5669 5 1 h4 okB5674
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 7 = true := blkChk_join _ _ _ _ _ 5669 6 1 h5 okB5675
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 8 = true := blkChk_join _ _ _ _ _ 5669 7 1 h6 okB5676
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 9 = true := blkChk_join _ _ _ _ _ 5669 8 1 h7 okB5677
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 10 = true := blkChk_join _ _ _ _ _ 5669 9 1 h8 okB5678
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 11 = true := blkChk_join _ _ _ _ _ 5669 10 1 h9 okB5679
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 12 = true := blkChk_join _ _ _ _ _ 5669 11 1 h10 okB5680
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5669 13 = true := blkChk_join _ _ _ _ _ 5669 12 1 h11 okB5681
  exact h12
end E1.C384X
