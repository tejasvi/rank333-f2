module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB1509 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 1 = true := by decide +kernel
theorem okB1510 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1510 1 = true := by decide +kernel
theorem okB1511 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1511 1 = true := by decide +kernel
theorem okB1512 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1512 1 = true := by decide +kernel
theorem okB1513 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1513 1 = true := by decide +kernel
theorem okB1514 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1514 1 = true := by decide +kernel
theorem okB1515 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1515 1 = true := by decide +kernel
theorem okB1516 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1516 1 = true := by decide +kernel
theorem okG140 : glueChkR lits W 1509 8 = true := by decide +kernel
theorem okM140 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 8 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 1 = true := okB1509
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 2 = true := blkChk_join _ _ _ _ _ 1509 1 1 h0 okB1510
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 3 = true := blkChk_join _ _ _ _ _ 1509 2 1 h1 okB1511
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 4 = true := blkChk_join _ _ _ _ _ 1509 3 1 h2 okB1512
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 5 = true := blkChk_join _ _ _ _ _ 1509 4 1 h3 okB1513
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 6 = true := blkChk_join _ _ _ _ _ 1509 5 1 h4 okB1514
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 7 = true := blkChk_join _ _ _ _ _ 1509 6 1 h5 okB1515
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1509 8 = true := blkChk_join _ _ _ _ _ 1509 7 1 h6 okB1516
  exact h7
end E1.C213X
