module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2613 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 1 = true := by decide +kernel
theorem okB2614 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2614 1 = true := by decide +kernel
theorem okB2615 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2615 1 = true := by decide +kernel
theorem okB2616 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2616 1 = true := by decide +kernel
theorem okB2617 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2617 1 = true := by decide +kernel
theorem okB2618 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2618 1 = true := by decide +kernel
theorem okB2619 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2619 1 = true := by decide +kernel
theorem okB2620 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2620 1 = true := by decide +kernel
theorem okB2621 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2621 1 = true := by decide +kernel
theorem okB2622 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2622 1 = true := by decide +kernel
theorem okB2623 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2623 1 = true := by decide +kernel
theorem okG245 : glueChkR lits W 2613 11 = true := by decide +kernel
theorem okM245 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 1 = true := okB2613
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 2 = true := blkChk_join _ _ _ _ _ 2613 1 1 h0 okB2614
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 3 = true := blkChk_join _ _ _ _ _ 2613 2 1 h1 okB2615
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 4 = true := blkChk_join _ _ _ _ _ 2613 3 1 h2 okB2616
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 5 = true := blkChk_join _ _ _ _ _ 2613 4 1 h3 okB2617
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 6 = true := blkChk_join _ _ _ _ _ 2613 5 1 h4 okB2618
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 7 = true := blkChk_join _ _ _ _ _ 2613 6 1 h5 okB2619
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 8 = true := blkChk_join _ _ _ _ _ 2613 7 1 h6 okB2620
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 9 = true := blkChk_join _ _ _ _ _ 2613 8 1 h7 okB2621
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 10 = true := blkChk_join _ _ _ _ _ 2613 9 1 h8 okB2622
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2613 11 = true := blkChk_join _ _ _ _ _ 2613 10 1 h9 okB2623
  exact h10
end E1.C384X
