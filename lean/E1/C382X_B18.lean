module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB189 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 1 = true := by decide +kernel
theorem okB190 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 190 1 = true := by decide +kernel
theorem okB191 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 191 1 = true := by decide +kernel
theorem okB192 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 192 1 = true := by decide +kernel
theorem okB193 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 193 1 = true := by decide +kernel
theorem okB194 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 194 1 = true := by decide +kernel
theorem okB195 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 195 1 = true := by decide +kernel
theorem okB196 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 196 1 = true := by decide +kernel
theorem okB197 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 197 1 = true := by decide +kernel
theorem okB198 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 198 1 = true := by decide +kernel
theorem okB199 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 199 1 = true := by decide +kernel
theorem okB200 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 200 1 = true := by decide +kernel
theorem okG18 : glueChkR lits W 189 12 = true := by decide +kernel
theorem okM18 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 1 = true := okB189
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 2 = true := blkChk_join _ _ _ _ _ 189 1 1 h0 okB190
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 3 = true := blkChk_join _ _ _ _ _ 189 2 1 h1 okB191
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 4 = true := blkChk_join _ _ _ _ _ 189 3 1 h2 okB192
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 5 = true := blkChk_join _ _ _ _ _ 189 4 1 h3 okB193
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 6 = true := blkChk_join _ _ _ _ _ 189 5 1 h4 okB194
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 7 = true := blkChk_join _ _ _ _ _ 189 6 1 h5 okB195
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 8 = true := blkChk_join _ _ _ _ _ 189 7 1 h6 okB196
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 9 = true := blkChk_join _ _ _ _ _ 189 8 1 h7 okB197
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 10 = true := blkChk_join _ _ _ _ _ 189 9 1 h8 okB198
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 11 = true := blkChk_join _ _ _ _ _ 189 10 1 h9 okB199
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 189 12 = true := blkChk_join _ _ _ _ _ 189 11 1 h10 okB200
  exact h11
end E1.C382X
