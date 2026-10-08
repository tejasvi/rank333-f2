module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1700 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 1 = true := by decide +kernel
theorem okB1701 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1701 1 = true := by decide +kernel
theorem okB1702 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1702 1 = true := by decide +kernel
theorem okB1703 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1703 1 = true := by decide +kernel
theorem okB1704 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1704 1 = true := by decide +kernel
theorem okB1705 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1705 1 = true := by decide +kernel
theorem okB1706 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1706 1 = true := by decide +kernel
theorem okB1707 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1707 1 = true := by decide +kernel
theorem okB1708 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1708 1 = true := by decide +kernel
theorem okG152 : glueChkR lits W 1700 9 = true := by decide +kernel
theorem okM152 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 1 = true := okB1700
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 2 = true := blkChk_join _ _ _ _ _ 1700 1 1 h0 okB1701
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 3 = true := blkChk_join _ _ _ _ _ 1700 2 1 h1 okB1702
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 4 = true := blkChk_join _ _ _ _ _ 1700 3 1 h2 okB1703
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 5 = true := blkChk_join _ _ _ _ _ 1700 4 1 h3 okB1704
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 6 = true := blkChk_join _ _ _ _ _ 1700 5 1 h4 okB1705
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 7 = true := blkChk_join _ _ _ _ _ 1700 6 1 h5 okB1706
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 8 = true := blkChk_join _ _ _ _ _ 1700 7 1 h6 okB1707
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1700 9 = true := blkChk_join _ _ _ _ _ 1700 8 1 h7 okB1708
  exact h8
end E1.C382X
