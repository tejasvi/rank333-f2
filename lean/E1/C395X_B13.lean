module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB149 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 1 = true := by decide +kernel
theorem okB150 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 150 1 = true := by decide +kernel
theorem okB151 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 151 1 = true := by decide +kernel
theorem okB152 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 152 1 = true := by decide +kernel
theorem okB153 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 153 1 = true := by decide +kernel
theorem okB154 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 154 1 = true := by decide +kernel
theorem okB155 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 155 1 = true := by decide +kernel
theorem okB156 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 156 1 = true := by decide +kernel
theorem okB157 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 157 1 = true := by decide +kernel
theorem okB158 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 158 1 = true := by decide +kernel
theorem okG13 : glueChkR lits W 149 10 = true := by decide +kernel
theorem okM13 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 10 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 1 = true := okB149
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 2 = true := blkChk_join _ _ _ _ _ 149 1 1 h0 okB150
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 3 = true := blkChk_join _ _ _ _ _ 149 2 1 h1 okB151
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 4 = true := blkChk_join _ _ _ _ _ 149 3 1 h2 okB152
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 5 = true := blkChk_join _ _ _ _ _ 149 4 1 h3 okB153
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 6 = true := blkChk_join _ _ _ _ _ 149 5 1 h4 okB154
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 7 = true := blkChk_join _ _ _ _ _ 149 6 1 h5 okB155
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 8 = true := blkChk_join _ _ _ _ _ 149 7 1 h6 okB156
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 9 = true := blkChk_join _ _ _ _ _ 149 8 1 h7 okB157
  have h9 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 149 10 = true := blkChk_join _ _ _ _ _ 149 9 1 h8 okB158
  exact h9
end E1.C395X
