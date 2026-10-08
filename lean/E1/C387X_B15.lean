module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB168 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 1 = true := by decide +kernel
theorem okB169 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 169 1 = true := by decide +kernel
theorem okB170 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 170 1 = true := by decide +kernel
theorem okB171 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 171 1 = true := by decide +kernel
theorem okB172 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 172 1 = true := by decide +kernel
theorem okB173 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 173 1 = true := by decide +kernel
theorem okB174 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 174 1 = true := by decide +kernel
theorem okB175 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 175 1 = true := by decide +kernel
theorem okB176 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 176 1 = true := by decide +kernel
theorem okB177 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 177 1 = true := by decide +kernel
theorem okG15 : glueChkR lits W 168 10 = true := by decide +kernel
theorem okM15 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 1 = true := okB168
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 2 = true := blkChk_join _ _ _ _ _ 168 1 1 h0 okB169
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 3 = true := blkChk_join _ _ _ _ _ 168 2 1 h1 okB170
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 4 = true := blkChk_join _ _ _ _ _ 168 3 1 h2 okB171
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 5 = true := blkChk_join _ _ _ _ _ 168 4 1 h3 okB172
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 6 = true := blkChk_join _ _ _ _ _ 168 5 1 h4 okB173
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 7 = true := blkChk_join _ _ _ _ _ 168 6 1 h5 okB174
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 8 = true := blkChk_join _ _ _ _ _ 168 7 1 h6 okB175
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 9 = true := blkChk_join _ _ _ _ _ 168 8 1 h7 okB176
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 168 10 = true := blkChk_join _ _ _ _ _ 168 9 1 h8 okB177
  exact h9
end E1.C387X
