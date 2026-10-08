module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5698 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 1 = true := by decide +kernel
theorem okB5699 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5699 1 = true := by decide +kernel
theorem okB5700 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5700 1 = true := by decide +kernel
theorem okB5701 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5701 1 = true := by decide +kernel
theorem okB5702 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5702 1 = true := by decide +kernel
theorem okB5703 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5703 1 = true := by decide +kernel
theorem okB5704 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5704 1 = true := by decide +kernel
theorem okB5705 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5705 1 = true := by decide +kernel
theorem okB5706 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5706 1 = true := by decide +kernel
theorem okB5707 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5707 1 = true := by decide +kernel
theorem okG548 : glueChkR lits W 5698 10 = true := by decide +kernel
theorem okM548 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 1 = true := okB5698
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 2 = true := blkChk_join _ _ _ _ _ 5698 1 1 h0 okB5699
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 3 = true := blkChk_join _ _ _ _ _ 5698 2 1 h1 okB5700
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 4 = true := blkChk_join _ _ _ _ _ 5698 3 1 h2 okB5701
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 5 = true := blkChk_join _ _ _ _ _ 5698 4 1 h3 okB5702
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 6 = true := blkChk_join _ _ _ _ _ 5698 5 1 h4 okB5703
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 7 = true := blkChk_join _ _ _ _ _ 5698 6 1 h5 okB5704
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 8 = true := blkChk_join _ _ _ _ _ 5698 7 1 h6 okB5705
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 9 = true := blkChk_join _ _ _ _ _ 5698 8 1 h7 okB5706
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5698 10 = true := blkChk_join _ _ _ _ _ 5698 9 1 h8 okB5707
  exact h9
end E1.C384X
