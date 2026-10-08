module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C295X
open E1S
theorem okB147 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 1 = true := by decide +kernel
theorem okB148 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 148 1 = true := by decide +kernel
theorem okB149 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 149 1 = true := by decide +kernel
theorem okB150 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 150 1 = true := by decide +kernel
theorem okB151 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 151 1 = true := by decide +kernel
theorem okB152 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 152 1 = true := by decide +kernel
theorem okB153 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 153 1 = true := by decide +kernel
theorem okB154 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 154 1 = true := by decide +kernel
theorem okG14 : glueChkR lits W 147 8 = true := by decide +kernel
theorem okM14 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 8 = true := by
  have h0 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 1 = true := okB147
  have h1 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 2 = true := blkChk_join _ _ _ _ _ 147 1 1 h0 okB148
  have h2 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 3 = true := blkChk_join _ _ _ _ _ 147 2 1 h1 okB149
  have h3 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 4 = true := blkChk_join _ _ _ _ _ 147 3 1 h2 okB150
  have h4 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 5 = true := blkChk_join _ _ _ _ _ 147 4 1 h3 okB151
  have h5 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 6 = true := blkChk_join _ _ _ _ _ 147 5 1 h4 okB152
  have h6 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 7 = true := blkChk_join _ _ _ _ _ 147 6 1 h5 okB153
  have h7 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 147 8 = true := blkChk_join _ _ _ _ _ 147 7 1 h6 okB154
  exact h7
end E1.C295X
