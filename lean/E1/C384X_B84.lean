module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB885 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 1 = true := by decide +kernel
theorem okB886 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 886 1 = true := by decide +kernel
theorem okB887 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 887 1 = true := by decide +kernel
theorem okB888 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 888 1 = true := by decide +kernel
theorem okB889 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 889 1 = true := by decide +kernel
theorem okB890 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 890 1 = true := by decide +kernel
theorem okG84 : glueChkR lits W 885 6 = true := by decide +kernel
theorem okM84 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 6 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 1 = true := okB885
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 2 = true := blkChk_join _ _ _ _ _ 885 1 1 h0 okB886
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 3 = true := blkChk_join _ _ _ _ _ 885 2 1 h1 okB887
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 4 = true := blkChk_join _ _ _ _ _ 885 3 1 h2 okB888
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 5 = true := blkChk_join _ _ _ _ _ 885 4 1 h3 okB889
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 885 6 = true := blkChk_join _ _ _ _ _ 885 5 1 h4 okB890
  exact h5
end E1.C384X
