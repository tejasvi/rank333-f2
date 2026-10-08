module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB910 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 1 = true := by decide +kernel
theorem okB911 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 911 1 = true := by decide +kernel
theorem okB912 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 912 1 = true := by decide +kernel
theorem okB913 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 913 1 = true := by decide +kernel
theorem okB914 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 914 1 = true := by decide +kernel
theorem okB915 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 915 1 = true := by decide +kernel
theorem okB916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 916 1 = true := by decide +kernel
theorem okB917 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 917 1 = true := by decide +kernel
theorem okB918 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 918 1 = true := by decide +kernel
theorem okB919 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 919 1 = true := by decide +kernel
theorem okG87 : glueChkR lits W 910 10 = true := by decide +kernel
theorem okM87 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 1 = true := okB910
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 2 = true := blkChk_join _ _ _ _ _ 910 1 1 h0 okB911
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 3 = true := blkChk_join _ _ _ _ _ 910 2 1 h1 okB912
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 4 = true := blkChk_join _ _ _ _ _ 910 3 1 h2 okB913
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 5 = true := blkChk_join _ _ _ _ _ 910 4 1 h3 okB914
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 6 = true := blkChk_join _ _ _ _ _ 910 5 1 h4 okB915
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 7 = true := blkChk_join _ _ _ _ _ 910 6 1 h5 okB916
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 8 = true := blkChk_join _ _ _ _ _ 910 7 1 h6 okB917
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 9 = true := blkChk_join _ _ _ _ _ 910 8 1 h7 okB918
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 910 10 = true := blkChk_join _ _ _ _ _ 910 9 1 h8 okB919
  exact h9
end E1.C384X
