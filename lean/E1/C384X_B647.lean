module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6674 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 1 = true := by decide +kernel
theorem okB6675 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6675 1 = true := by decide +kernel
theorem okB6676 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6676 1 = true := by decide +kernel
theorem okB6677 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6677 1 = true := by decide +kernel
theorem okB6678 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6678 1 = true := by decide +kernel
theorem okB6679 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6679 1 = true := by decide +kernel
theorem okB6680 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6680 1 = true := by decide +kernel
theorem okB6681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6681 1 = true := by decide +kernel
theorem okB6682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6682 1 = true := by decide +kernel
theorem okB6683 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6683 1 = true := by decide +kernel
theorem okB6684 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6684 1 = true := by decide +kernel
theorem okB6685 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6685 1 = true := by decide +kernel
theorem okG647 : glueChkR lits W 6674 12 = true := by decide +kernel
theorem okM647 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 1 = true := okB6674
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 2 = true := blkChk_join _ _ _ _ _ 6674 1 1 h0 okB6675
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 3 = true := blkChk_join _ _ _ _ _ 6674 2 1 h1 okB6676
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 4 = true := blkChk_join _ _ _ _ _ 6674 3 1 h2 okB6677
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 5 = true := blkChk_join _ _ _ _ _ 6674 4 1 h3 okB6678
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 6 = true := blkChk_join _ _ _ _ _ 6674 5 1 h4 okB6679
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 7 = true := blkChk_join _ _ _ _ _ 6674 6 1 h5 okB6680
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 8 = true := blkChk_join _ _ _ _ _ 6674 7 1 h6 okB6681
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 9 = true := blkChk_join _ _ _ _ _ 6674 8 1 h7 okB6682
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 10 = true := blkChk_join _ _ _ _ _ 6674 9 1 h8 okB6683
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 11 = true := blkChk_join _ _ _ _ _ 6674 10 1 h9 okB6684
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6674 12 = true := blkChk_join _ _ _ _ _ 6674 11 1 h10 okB6685
  exact h11
end E1.C384X
