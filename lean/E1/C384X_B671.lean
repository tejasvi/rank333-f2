module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6872 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 1 = true := by decide +kernel
theorem okB6873 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6873 1 = true := by decide +kernel
theorem okB6874 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6874 1 = true := by decide +kernel
theorem okB6875 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6875 1 = true := by decide +kernel
theorem okB6876 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6876 1 = true := by decide +kernel
theorem okB6877 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6877 1 = true := by decide +kernel
theorem okB6878 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6878 1 = true := by decide +kernel
theorem okB6879 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6879 1 = true := by decide +kernel
theorem okB6880 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6880 1 = true := by decide +kernel
theorem okB6881 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6881 1 = true := by decide +kernel
theorem okG671 : glueChkR lits W 6872 10 = true := by decide +kernel
theorem okM671 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 1 = true := okB6872
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 2 = true := blkChk_join _ _ _ _ _ 6872 1 1 h0 okB6873
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 3 = true := blkChk_join _ _ _ _ _ 6872 2 1 h1 okB6874
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 4 = true := blkChk_join _ _ _ _ _ 6872 3 1 h2 okB6875
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 5 = true := blkChk_join _ _ _ _ _ 6872 4 1 h3 okB6876
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 6 = true := blkChk_join _ _ _ _ _ 6872 5 1 h4 okB6877
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 7 = true := blkChk_join _ _ _ _ _ 6872 6 1 h5 okB6878
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 8 = true := blkChk_join _ _ _ _ _ 6872 7 1 h6 okB6879
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 9 = true := blkChk_join _ _ _ _ _ 6872 8 1 h7 okB6880
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6872 10 = true := blkChk_join _ _ _ _ _ 6872 9 1 h8 okB6881
  exact h9
end E1.C384X
