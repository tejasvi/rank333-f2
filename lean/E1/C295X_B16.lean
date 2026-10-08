module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C295X
open E1S
theorem okB163 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 1 = true := by decide +kernel
theorem okB164 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 164 1 = true := by decide +kernel
theorem okB165 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 165 1 = true := by decide +kernel
theorem okB166 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 166 1 = true := by decide +kernel
theorem okB167 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 167 1 = true := by decide +kernel
theorem okG16 : glueChkR lits W 163 5 = true := by decide +kernel
theorem okM16 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 5 = true := by
  have h0 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 1 = true := okB163
  have h1 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 2 = true := blkChk_join _ _ _ _ _ 163 1 1 h0 okB164
  have h2 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 3 = true := blkChk_join _ _ _ _ _ 163 2 1 h1 okB165
  have h3 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 4 = true := blkChk_join _ _ _ _ _ 163 3 1 h2 okB166
  have h4 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 163 5 = true := blkChk_join _ _ _ _ _ 163 4 1 h3 okB167
  exact h4
end E1.C295X
