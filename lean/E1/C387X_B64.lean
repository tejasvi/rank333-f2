module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB706 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 1 = true := by decide +kernel
theorem okB707 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 707 1 = true := by decide +kernel
theorem okB708 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 708 1 = true := by decide +kernel
theorem okB709 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 709 1 = true := by decide +kernel
theorem okB710 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 710 1 = true := by decide +kernel
theorem okB711 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 711 1 = true := by decide +kernel
theorem okB712 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 712 1 = true := by decide +kernel
theorem okG64 : glueChkR lits W 706 7 = true := by decide +kernel
theorem okM64 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 7 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 1 = true := okB706
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 2 = true := blkChk_join _ _ _ _ _ 706 1 1 h0 okB707
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 3 = true := blkChk_join _ _ _ _ _ 706 2 1 h1 okB708
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 4 = true := blkChk_join _ _ _ _ _ 706 3 1 h2 okB709
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 5 = true := blkChk_join _ _ _ _ _ 706 4 1 h3 okB710
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 6 = true := blkChk_join _ _ _ _ _ 706 5 1 h4 okB711
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 706 7 = true := blkChk_join _ _ _ _ _ 706 6 1 h5 okB712
  exact h6
end E1.C387X
