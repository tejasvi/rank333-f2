module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3618 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 1 = true := by decide +kernel
theorem okB3619 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3619 1 = true := by decide +kernel
theorem okB3620 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3620 1 = true := by decide +kernel
theorem okB3621 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3621 1 = true := by decide +kernel
theorem okB3622 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3622 1 = true := by decide +kernel
theorem okB3623 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3623 1 = true := by decide +kernel
theorem okB3624 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3624 1 = true := by decide +kernel
theorem okB3625 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3625 1 = true := by decide +kernel
theorem okB3626 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3626 1 = true := by decide +kernel
theorem okB3627 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3627 1 = true := by decide +kernel
theorem okG349 : glueChkR lits W 3618 10 = true := by decide +kernel
theorem okM349 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 1 = true := okB3618
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 2 = true := blkChk_join _ _ _ _ _ 3618 1 1 h0 okB3619
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 3 = true := blkChk_join _ _ _ _ _ 3618 2 1 h1 okB3620
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 4 = true := blkChk_join _ _ _ _ _ 3618 3 1 h2 okB3621
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 5 = true := blkChk_join _ _ _ _ _ 3618 4 1 h3 okB3622
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 6 = true := blkChk_join _ _ _ _ _ 3618 5 1 h4 okB3623
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 7 = true := blkChk_join _ _ _ _ _ 3618 6 1 h5 okB3624
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 8 = true := blkChk_join _ _ _ _ _ 3618 7 1 h6 okB3625
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 9 = true := blkChk_join _ _ _ _ _ 3618 8 1 h7 okB3626
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3618 10 = true := blkChk_join _ _ _ _ _ 3618 9 1 h8 okB3627
  exact h9
end E1.C384X
