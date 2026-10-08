module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB814 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 1 = true := by decide +kernel
theorem okB815 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 815 1 = true := by decide +kernel
theorem okB816 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 816 1 = true := by decide +kernel
theorem okB817 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 817 1 = true := by decide +kernel
theorem okB818 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 818 1 = true := by decide +kernel
theorem okB819 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 819 1 = true := by decide +kernel
theorem okB820 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 820 1 = true := by decide +kernel
theorem okB821 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 821 1 = true := by decide +kernel
theorem okB822 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 822 1 = true := by decide +kernel
theorem okG77 : glueChkR lits W 814 9 = true := by decide +kernel
theorem okM77 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 1 = true := okB814
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 2 = true := blkChk_join _ _ _ _ _ 814 1 1 h0 okB815
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 3 = true := blkChk_join _ _ _ _ _ 814 2 1 h1 okB816
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 4 = true := blkChk_join _ _ _ _ _ 814 3 1 h2 okB817
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 5 = true := blkChk_join _ _ _ _ _ 814 4 1 h3 okB818
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 6 = true := blkChk_join _ _ _ _ _ 814 5 1 h4 okB819
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 7 = true := blkChk_join _ _ _ _ _ 814 6 1 h5 okB820
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 8 = true := blkChk_join _ _ _ _ _ 814 7 1 h6 okB821
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 814 9 = true := blkChk_join _ _ _ _ _ 814 8 1 h7 okB822
  exact h8
end E1.C384X
