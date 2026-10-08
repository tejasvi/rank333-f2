module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4701 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 1 = true := by decide +kernel
theorem okB4702 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4702 1 = true := by decide +kernel
theorem okB4703 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4703 1 = true := by decide +kernel
theorem okB4704 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4704 1 = true := by decide +kernel
theorem okB4705 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4705 1 = true := by decide +kernel
theorem okB4706 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4706 1 = true := by decide +kernel
theorem okB4707 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4707 1 = true := by decide +kernel
theorem okB4708 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4708 1 = true := by decide +kernel
theorem okB4709 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4709 1 = true := by decide +kernel
theorem okB4710 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4710 1 = true := by decide +kernel
theorem okG450 : glueChkR lits W 4701 10 = true := by decide +kernel
theorem okM450 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 1 = true := okB4701
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 2 = true := blkChk_join _ _ _ _ _ 4701 1 1 h0 okB4702
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 3 = true := blkChk_join _ _ _ _ _ 4701 2 1 h1 okB4703
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 4 = true := blkChk_join _ _ _ _ _ 4701 3 1 h2 okB4704
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 5 = true := blkChk_join _ _ _ _ _ 4701 4 1 h3 okB4705
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 6 = true := blkChk_join _ _ _ _ _ 4701 5 1 h4 okB4706
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 7 = true := blkChk_join _ _ _ _ _ 4701 6 1 h5 okB4707
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 8 = true := blkChk_join _ _ _ _ _ 4701 7 1 h6 okB4708
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 9 = true := blkChk_join _ _ _ _ _ 4701 8 1 h7 okB4709
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4701 10 = true := blkChk_join _ _ _ _ _ 4701 9 1 h8 okB4710
  exact h9
end E1.C384X
