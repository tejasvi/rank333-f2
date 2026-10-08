module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB159 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 1 = true := by decide +kernel
theorem okB160 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 160 1 = true := by decide +kernel
theorem okB161 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 161 1 = true := by decide +kernel
theorem okB162 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 162 1 = true := by decide +kernel
theorem okB163 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 163 1 = true := by decide +kernel
theorem okB164 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 164 1 = true := by decide +kernel
theorem okB165 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 165 1 = true := by decide +kernel
theorem okG14 : glueChkR lits W 159 7 = true := by decide +kernel
theorem okM14 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 7 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 1 = true := okB159
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 2 = true := blkChk_join _ _ _ _ _ 159 1 1 h0 okB160
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 3 = true := blkChk_join _ _ _ _ _ 159 2 1 h1 okB161
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 4 = true := blkChk_join _ _ _ _ _ 159 3 1 h2 okB162
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 5 = true := blkChk_join _ _ _ _ _ 159 4 1 h3 okB163
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 6 = true := blkChk_join _ _ _ _ _ 159 5 1 h4 okB164
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 159 7 = true := blkChk_join _ _ _ _ _ 159 6 1 h5 okB165
  exact h6
end E1.C395X
