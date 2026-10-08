module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5890 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 1 = true := by decide +kernel
theorem okB5891 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5891 1 = true := by decide +kernel
theorem okB5892 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5892 1 = true := by decide +kernel
theorem okB5893 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5893 1 = true := by decide +kernel
theorem okB5894 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5894 1 = true := by decide +kernel
theorem okB5895 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5895 1 = true := by decide +kernel
theorem okB5896 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5896 1 = true := by decide +kernel
theorem okB5897 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5897 1 = true := by decide +kernel
theorem okB5898 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5898 1 = true := by decide +kernel
theorem okB5899 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5899 1 = true := by decide +kernel
theorem okB5900 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5900 1 = true := by decide +kernel
theorem okB5901 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5901 1 = true := by decide +kernel
theorem okG568 : glueChkR lits W 5890 12 = true := by decide +kernel
theorem okM568 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 1 = true := okB5890
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 2 = true := blkChk_join _ _ _ _ _ 5890 1 1 h0 okB5891
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 3 = true := blkChk_join _ _ _ _ _ 5890 2 1 h1 okB5892
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 4 = true := blkChk_join _ _ _ _ _ 5890 3 1 h2 okB5893
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 5 = true := blkChk_join _ _ _ _ _ 5890 4 1 h3 okB5894
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 6 = true := blkChk_join _ _ _ _ _ 5890 5 1 h4 okB5895
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 7 = true := blkChk_join _ _ _ _ _ 5890 6 1 h5 okB5896
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 8 = true := blkChk_join _ _ _ _ _ 5890 7 1 h6 okB5897
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 9 = true := blkChk_join _ _ _ _ _ 5890 8 1 h7 okB5898
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 10 = true := blkChk_join _ _ _ _ _ 5890 9 1 h8 okB5899
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 11 = true := blkChk_join _ _ _ _ _ 5890 10 1 h9 okB5900
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5890 12 = true := blkChk_join _ _ _ _ _ 5890 11 1 h10 okB5901
  exact h11
end E1.C384X
