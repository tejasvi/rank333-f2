module
public import R22Port.U_d41d8cd98f00
public import E1.C218X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C218X
open E1S
theorem okB675 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 1 = true := by decide +kernel
theorem okB676 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 676 1 = true := by decide +kernel
theorem okB677 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 677 1 = true := by decide +kernel
theorem okB678 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 678 1 = true := by decide +kernel
theorem okB679 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 679 1 = true := by decide +kernel
theorem okG60 : glueChkR lits W 675 5 = true := by decide +kernel
theorem okM60 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 5 = true := by
  have h0 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 1 = true := okB675
  have h1 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 2 = true := blkChk_join _ _ _ _ _ 675 1 1 h0 okB676
  have h2 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 3 = true := blkChk_join _ _ _ _ _ 675 2 1 h1 okB677
  have h3 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 4 = true := blkChk_join _ _ _ _ _ 675 3 1 h2 okB678
  have h4 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 675 5 = true := blkChk_join _ _ _ _ _ 675 4 1 h3 okB679
  exact h4
end E1.C218X
