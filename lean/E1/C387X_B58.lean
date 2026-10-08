module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB640 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 1 = true := by decide +kernel
theorem okB641 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 641 1 = true := by decide +kernel
theorem okB642 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 642 1 = true := by decide +kernel
theorem okB643 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 643 1 = true := by decide +kernel
theorem okB644 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 644 1 = true := by decide +kernel
theorem okB645 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 645 1 = true := by decide +kernel
theorem okB646 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 646 1 = true := by decide +kernel
theorem okB647 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 647 1 = true := by decide +kernel
theorem okG58 : glueChkR lits W 640 8 = true := by decide +kernel
theorem okM58 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 8 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 1 = true := okB640
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 2 = true := blkChk_join _ _ _ _ _ 640 1 1 h0 okB641
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 3 = true := blkChk_join _ _ _ _ _ 640 2 1 h1 okB642
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 4 = true := blkChk_join _ _ _ _ _ 640 3 1 h2 okB643
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 5 = true := blkChk_join _ _ _ _ _ 640 4 1 h3 okB644
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 6 = true := blkChk_join _ _ _ _ _ 640 5 1 h4 okB645
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 7 = true := blkChk_join _ _ _ _ _ 640 6 1 h5 okB646
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 640 8 = true := blkChk_join _ _ _ _ _ 640 7 1 h6 okB647
  exact h7
end E1.C387X
