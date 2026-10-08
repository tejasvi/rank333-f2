module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 1 = true := by decide +kernel
theorem okB5683 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5683 1 = true := by decide +kernel
theorem okB5684 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5684 1 = true := by decide +kernel
theorem okB5685 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5685 1 = true := by decide +kernel
theorem okB5686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5686 1 = true := by decide +kernel
theorem okB5687 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5687 1 = true := by decide +kernel
theorem okB5688 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5688 1 = true := by decide +kernel
theorem okB5689 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5689 1 = true := by decide +kernel
theorem okG546 : glueChkR lits W 5682 8 = true := by decide +kernel
theorem okM546 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 1 = true := okB5682
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 2 = true := blkChk_join _ _ _ _ _ 5682 1 1 h0 okB5683
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 3 = true := blkChk_join _ _ _ _ _ 5682 2 1 h1 okB5684
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 4 = true := blkChk_join _ _ _ _ _ 5682 3 1 h2 okB5685
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 5 = true := blkChk_join _ _ _ _ _ 5682 4 1 h3 okB5686
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 6 = true := blkChk_join _ _ _ _ _ 5682 5 1 h4 okB5687
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 7 = true := blkChk_join _ _ _ _ _ 5682 6 1 h5 okB5688
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5682 8 = true := blkChk_join _ _ _ _ _ 5682 7 1 h6 okB5689
  exact h7
end E1.C384X
