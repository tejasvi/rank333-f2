module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5577 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 1 = true := by decide +kernel
theorem okB5578 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5578 1 = true := by decide +kernel
theorem okB5579 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5579 1 = true := by decide +kernel
theorem okB5580 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5580 1 = true := by decide +kernel
theorem okB5581 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5581 1 = true := by decide +kernel
theorem okB5582 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5582 1 = true := by decide +kernel
theorem okB5583 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5583 1 = true := by decide +kernel
theorem okB5584 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5584 1 = true := by decide +kernel
theorem okB5585 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5585 1 = true := by decide +kernel
theorem okG535 : glueChkR lits W 5577 9 = true := by decide +kernel
theorem okM535 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 1 = true := okB5577
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 2 = true := blkChk_join _ _ _ _ _ 5577 1 1 h0 okB5578
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 3 = true := blkChk_join _ _ _ _ _ 5577 2 1 h1 okB5579
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 4 = true := blkChk_join _ _ _ _ _ 5577 3 1 h2 okB5580
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 5 = true := blkChk_join _ _ _ _ _ 5577 4 1 h3 okB5581
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 6 = true := blkChk_join _ _ _ _ _ 5577 5 1 h4 okB5582
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 7 = true := blkChk_join _ _ _ _ _ 5577 6 1 h5 okB5583
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 8 = true := blkChk_join _ _ _ _ _ 5577 7 1 h6 okB5584
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5577 9 = true := blkChk_join _ _ _ _ _ 5577 8 1 h7 okB5585
  exact h8
end E1.C384X
