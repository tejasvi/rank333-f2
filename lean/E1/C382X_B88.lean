module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB982 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 1 = true := by decide +kernel
theorem okB983 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 983 1 = true := by decide +kernel
theorem okB984 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 984 1 = true := by decide +kernel
theorem okB985 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 985 1 = true := by decide +kernel
theorem okB986 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 986 1 = true := by decide +kernel
theorem okB987 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 987 1 = true := by decide +kernel
theorem okB988 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 988 1 = true := by decide +kernel
theorem okB989 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 989 1 = true := by decide +kernel
theorem okB990 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 990 1 = true := by decide +kernel
theorem okB991 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 991 1 = true := by decide +kernel
theorem okG88 : glueChkR lits W 982 10 = true := by decide +kernel
theorem okM88 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 1 = true := okB982
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 2 = true := blkChk_join _ _ _ _ _ 982 1 1 h0 okB983
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 3 = true := blkChk_join _ _ _ _ _ 982 2 1 h1 okB984
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 4 = true := blkChk_join _ _ _ _ _ 982 3 1 h2 okB985
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 5 = true := blkChk_join _ _ _ _ _ 982 4 1 h3 okB986
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 6 = true := blkChk_join _ _ _ _ _ 982 5 1 h4 okB987
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 7 = true := blkChk_join _ _ _ _ _ 982 6 1 h5 okB988
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 8 = true := blkChk_join _ _ _ _ _ 982 7 1 h6 okB989
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 9 = true := blkChk_join _ _ _ _ _ 982 8 1 h7 okB990
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 982 10 = true := blkChk_join _ _ _ _ _ 982 9 1 h8 okB991
  exact h9
end E1.C382X
