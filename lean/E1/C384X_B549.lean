module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5708 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 1 = true := by decide +kernel
theorem okB5709 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5709 1 = true := by decide +kernel
theorem okB5710 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5710 1 = true := by decide +kernel
theorem okB5711 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5711 1 = true := by decide +kernel
theorem okB5712 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5712 1 = true := by decide +kernel
theorem okB5713 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5713 1 = true := by decide +kernel
theorem okB5714 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5714 1 = true := by decide +kernel
theorem okB5715 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5715 1 = true := by decide +kernel
theorem okB5716 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5716 1 = true := by decide +kernel
theorem okB5717 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5717 1 = true := by decide +kernel
theorem okG549 : glueChkR lits W 5708 10 = true := by decide +kernel
theorem okM549 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 1 = true := okB5708
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 2 = true := blkChk_join _ _ _ _ _ 5708 1 1 h0 okB5709
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 3 = true := blkChk_join _ _ _ _ _ 5708 2 1 h1 okB5710
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 4 = true := blkChk_join _ _ _ _ _ 5708 3 1 h2 okB5711
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 5 = true := blkChk_join _ _ _ _ _ 5708 4 1 h3 okB5712
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 6 = true := blkChk_join _ _ _ _ _ 5708 5 1 h4 okB5713
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 7 = true := blkChk_join _ _ _ _ _ 5708 6 1 h5 okB5714
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 8 = true := blkChk_join _ _ _ _ _ 5708 7 1 h6 okB5715
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 9 = true := blkChk_join _ _ _ _ _ 5708 8 1 h7 okB5716
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5708 10 = true := blkChk_join _ _ _ _ _ 5708 9 1 h8 okB5717
  exact h9
end E1.C384X
