module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB167 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 1 = true := by decide +kernel
theorem okB168 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 168 1 = true := by decide +kernel
theorem okB169 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 169 1 = true := by decide +kernel
theorem okB170 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 170 1 = true := by decide +kernel
theorem okB171 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 171 1 = true := by decide +kernel
theorem okB172 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 172 1 = true := by decide +kernel
theorem okB173 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 173 1 = true := by decide +kernel
theorem okB174 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 174 1 = true := by decide +kernel
theorem okB175 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 175 1 = true := by decide +kernel
theorem okB176 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 176 1 = true := by decide +kernel
theorem okB177 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 177 1 = true := by decide +kernel
theorem okB178 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 178 1 = true := by decide +kernel
theorem okB179 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 179 1 = true := by decide +kernel
theorem okB180 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 180 1 = true := by decide +kernel
theorem okG16 : glueChkR lits W 167 14 = true := by decide +kernel
theorem okM16 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 14 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 1 = true := okB167
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 2 = true := blkChk_join _ _ _ _ _ 167 1 1 h0 okB168
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 3 = true := blkChk_join _ _ _ _ _ 167 2 1 h1 okB169
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 4 = true := blkChk_join _ _ _ _ _ 167 3 1 h2 okB170
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 5 = true := blkChk_join _ _ _ _ _ 167 4 1 h3 okB171
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 6 = true := blkChk_join _ _ _ _ _ 167 5 1 h4 okB172
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 7 = true := blkChk_join _ _ _ _ _ 167 6 1 h5 okB173
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 8 = true := blkChk_join _ _ _ _ _ 167 7 1 h6 okB174
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 9 = true := blkChk_join _ _ _ _ _ 167 8 1 h7 okB175
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 10 = true := blkChk_join _ _ _ _ _ 167 9 1 h8 okB176
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 11 = true := blkChk_join _ _ _ _ _ 167 10 1 h9 okB177
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 12 = true := blkChk_join _ _ _ _ _ 167 11 1 h10 okB178
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 13 = true := blkChk_join _ _ _ _ _ 167 12 1 h11 okB179
  have h13 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 167 14 = true := blkChk_join _ _ _ _ _ 167 13 1 h12 okB180
  exact h13
end E1.C382X
