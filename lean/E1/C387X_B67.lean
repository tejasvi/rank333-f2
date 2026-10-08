module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB737 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 1 = true := by decide +kernel
theorem okB738 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 738 1 = true := by decide +kernel
theorem okB739 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 739 1 = true := by decide +kernel
theorem okB740 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 740 1 = true := by decide +kernel
theorem okB741 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 741 1 = true := by decide +kernel
theorem okB742 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 742 1 = true := by decide +kernel
theorem okB743 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 743 1 = true := by decide +kernel
theorem okG67 : glueChkR lits W 737 7 = true := by decide +kernel
theorem okM67 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 7 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 1 = true := okB737
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 2 = true := blkChk_join _ _ _ _ _ 737 1 1 h0 okB738
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 3 = true := blkChk_join _ _ _ _ _ 737 2 1 h1 okB739
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 4 = true := blkChk_join _ _ _ _ _ 737 3 1 h2 okB740
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 5 = true := blkChk_join _ _ _ _ _ 737 4 1 h3 okB741
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 6 = true := blkChk_join _ _ _ _ _ 737 5 1 h4 okB742
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 737 7 = true := blkChk_join _ _ _ _ _ 737 6 1 h5 okB743
  exact h6
end E1.C387X
