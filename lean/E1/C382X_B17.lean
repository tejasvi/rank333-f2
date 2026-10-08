module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB181 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 1 = true := by decide +kernel
theorem okB182 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 182 1 = true := by decide +kernel
theorem okB183 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 183 1 = true := by decide +kernel
theorem okB184 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 184 1 = true := by decide +kernel
theorem okB185 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 185 1 = true := by decide +kernel
theorem okB186 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 186 1 = true := by decide +kernel
theorem okB187 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 187 1 = true := by decide +kernel
theorem okB188 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 188 1 = true := by decide +kernel
theorem okG17 : glueChkR lits W 181 8 = true := by decide +kernel
theorem okM17 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 1 = true := okB181
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 2 = true := blkChk_join _ _ _ _ _ 181 1 1 h0 okB182
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 3 = true := blkChk_join _ _ _ _ _ 181 2 1 h1 okB183
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 4 = true := blkChk_join _ _ _ _ _ 181 3 1 h2 okB184
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 5 = true := blkChk_join _ _ _ _ _ 181 4 1 h3 okB185
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 6 = true := blkChk_join _ _ _ _ _ 181 5 1 h4 okB186
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 7 = true := blkChk_join _ _ _ _ _ 181 6 1 h5 okB187
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 181 8 = true := blkChk_join _ _ _ _ _ 181 7 1 h6 okB188
  exact h7
end E1.C382X
