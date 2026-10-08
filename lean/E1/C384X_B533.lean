module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5557 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 1 = true := by decide +kernel
theorem okB5558 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5558 1 = true := by decide +kernel
theorem okB5559 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5559 1 = true := by decide +kernel
theorem okB5560 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5560 1 = true := by decide +kernel
theorem okB5561 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5561 1 = true := by decide +kernel
theorem okB5562 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5562 1 = true := by decide +kernel
theorem okB5563 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5563 1 = true := by decide +kernel
theorem okB5564 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5564 1 = true := by decide +kernel
theorem okB5565 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5565 1 = true := by decide +kernel
theorem okB5566 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5566 1 = true := by decide +kernel
theorem okG533 : glueChkR lits W 5557 10 = true := by decide +kernel
theorem okM533 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 1 = true := okB5557
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 2 = true := blkChk_join _ _ _ _ _ 5557 1 1 h0 okB5558
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 3 = true := blkChk_join _ _ _ _ _ 5557 2 1 h1 okB5559
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 4 = true := blkChk_join _ _ _ _ _ 5557 3 1 h2 okB5560
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 5 = true := blkChk_join _ _ _ _ _ 5557 4 1 h3 okB5561
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 6 = true := blkChk_join _ _ _ _ _ 5557 5 1 h4 okB5562
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 7 = true := blkChk_join _ _ _ _ _ 5557 6 1 h5 okB5563
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 8 = true := blkChk_join _ _ _ _ _ 5557 7 1 h6 okB5564
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 9 = true := blkChk_join _ _ _ _ _ 5557 8 1 h7 okB5565
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5557 10 = true := blkChk_join _ _ _ _ _ 5557 9 1 h8 okB5566
  exact h9
end E1.C384X
