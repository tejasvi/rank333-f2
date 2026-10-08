module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB708 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 1 = true := by decide +kernel
theorem okB709 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 709 1 = true := by decide +kernel
theorem okB710 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 710 1 = true := by decide +kernel
theorem okB711 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 711 1 = true := by decide +kernel
theorem okB712 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 712 1 = true := by decide +kernel
theorem okB713 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 713 1 = true := by decide +kernel
theorem okB714 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 714 1 = true := by decide +kernel
theorem okB715 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 715 1 = true := by decide +kernel
theorem okB716 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 716 1 = true := by decide +kernel
theorem okG64 : glueChkR lits W 708 9 = true := by decide +kernel
theorem okM64 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 1 = true := okB708
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 2 = true := blkChk_join _ _ _ _ _ 708 1 1 h0 okB709
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 3 = true := blkChk_join _ _ _ _ _ 708 2 1 h1 okB710
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 4 = true := blkChk_join _ _ _ _ _ 708 3 1 h2 okB711
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 5 = true := blkChk_join _ _ _ _ _ 708 4 1 h3 okB712
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 6 = true := blkChk_join _ _ _ _ _ 708 5 1 h4 okB713
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 7 = true := blkChk_join _ _ _ _ _ 708 6 1 h5 okB714
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 8 = true := blkChk_join _ _ _ _ _ 708 7 1 h6 okB715
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 708 9 = true := blkChk_join _ _ _ _ _ 708 8 1 h7 okB716
  exact h8
end E1.C382X
