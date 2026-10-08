module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB61 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 1 = true := by decide +kernel
theorem okB62 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 62 1 = true := by decide +kernel
theorem okB63 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 63 1 = true := by decide +kernel
theorem okB64 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 64 1 = true := by decide +kernel
theorem okB65 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 65 1 = true := by decide +kernel
theorem okB66 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 66 1 = true := by decide +kernel
theorem okB67 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 67 1 = true := by decide +kernel
theorem okB68 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 68 1 = true := by decide +kernel
theorem okG6 : glueChkR lits W 61 8 = true := by decide +kernel
theorem okM6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 1 = true := okB61
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 2 = true := blkChk_join _ _ _ _ _ 61 1 1 h0 okB62
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 3 = true := blkChk_join _ _ _ _ _ 61 2 1 h1 okB63
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 4 = true := blkChk_join _ _ _ _ _ 61 3 1 h2 okB64
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 5 = true := blkChk_join _ _ _ _ _ 61 4 1 h3 okB65
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 6 = true := blkChk_join _ _ _ _ _ 61 5 1 h4 okB66
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 7 = true := blkChk_join _ _ _ _ _ 61 6 1 h5 okB67
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 61 8 = true := blkChk_join _ _ _ _ _ 61 7 1 h6 okB68
  exact h7
end E1.C382X
