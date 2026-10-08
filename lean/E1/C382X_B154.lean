module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1717 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 1 = true := by decide +kernel
theorem okB1718 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1718 1 = true := by decide +kernel
theorem okB1719 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1719 1 = true := by decide +kernel
theorem okB1720 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1720 1 = true := by decide +kernel
theorem okB1721 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1721 1 = true := by decide +kernel
theorem okB1722 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1722 1 = true := by decide +kernel
theorem okB1723 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1723 1 = true := by decide +kernel
theorem okB1724 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1724 1 = true := by decide +kernel
theorem okB1725 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1725 1 = true := by decide +kernel
theorem okG154 : glueChkR lits W 1717 9 = true := by decide +kernel
theorem okM154 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 1 = true := okB1717
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 2 = true := blkChk_join _ _ _ _ _ 1717 1 1 h0 okB1718
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 3 = true := blkChk_join _ _ _ _ _ 1717 2 1 h1 okB1719
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 4 = true := blkChk_join _ _ _ _ _ 1717 3 1 h2 okB1720
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 5 = true := blkChk_join _ _ _ _ _ 1717 4 1 h3 okB1721
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 6 = true := blkChk_join _ _ _ _ _ 1717 5 1 h4 okB1722
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 7 = true := blkChk_join _ _ _ _ _ 1717 6 1 h5 okB1723
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 8 = true := blkChk_join _ _ _ _ _ 1717 7 1 h6 okB1724
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1717 9 = true := blkChk_join _ _ _ _ _ 1717 8 1 h7 okB1725
  exact h8
end E1.C382X
