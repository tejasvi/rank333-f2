module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB852 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 1 = true := by decide +kernel
theorem okB853 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 853 1 = true := by decide +kernel
theorem okB854 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 854 1 = true := by decide +kernel
theorem okB855 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 855 1 = true := by decide +kernel
theorem okB856 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 856 1 = true := by decide +kernel
theorem okB857 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 857 1 = true := by decide +kernel
theorem okB858 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 858 1 = true := by decide +kernel
theorem okB859 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 859 1 = true := by decide +kernel
theorem okB860 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 860 1 = true := by decide +kernel
theorem okB861 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 861 1 = true := by decide +kernel
theorem okB862 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 862 1 = true := by decide +kernel
theorem okB863 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 863 1 = true := by decide +kernel
theorem okB864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 864 1 = true := by decide +kernel
theorem okG81 : glueChkR lits W 852 13 = true := by decide +kernel
theorem okM81 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 1 = true := okB852
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 2 = true := blkChk_join _ _ _ _ _ 852 1 1 h0 okB853
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 3 = true := blkChk_join _ _ _ _ _ 852 2 1 h1 okB854
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 4 = true := blkChk_join _ _ _ _ _ 852 3 1 h2 okB855
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 5 = true := blkChk_join _ _ _ _ _ 852 4 1 h3 okB856
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 6 = true := blkChk_join _ _ _ _ _ 852 5 1 h4 okB857
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 7 = true := blkChk_join _ _ _ _ _ 852 6 1 h5 okB858
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 8 = true := blkChk_join _ _ _ _ _ 852 7 1 h6 okB859
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 9 = true := blkChk_join _ _ _ _ _ 852 8 1 h7 okB860
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 10 = true := blkChk_join _ _ _ _ _ 852 9 1 h8 okB861
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 11 = true := blkChk_join _ _ _ _ _ 852 10 1 h9 okB862
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 12 = true := blkChk_join _ _ _ _ _ 852 11 1 h10 okB863
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 852 13 = true := blkChk_join _ _ _ _ _ 852 12 1 h11 okB864
  exact h12
end E1.C384X
