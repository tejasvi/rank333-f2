module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5835 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 1 = true := by decide +kernel
theorem okB5836 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5836 1 = true := by decide +kernel
theorem okB5837 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5837 1 = true := by decide +kernel
theorem okB5838 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5838 1 = true := by decide +kernel
theorem okB5839 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5839 1 = true := by decide +kernel
theorem okB5840 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5840 1 = true := by decide +kernel
theorem okB5841 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5841 1 = true := by decide +kernel
theorem okB5842 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5842 1 = true := by decide +kernel
theorem okB5843 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5843 1 = true := by decide +kernel
theorem okB5844 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5844 1 = true := by decide +kernel
theorem okG562 : glueChkR lits W 5835 10 = true := by decide +kernel
theorem okM562 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 1 = true := okB5835
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 2 = true := blkChk_join _ _ _ _ _ 5835 1 1 h0 okB5836
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 3 = true := blkChk_join _ _ _ _ _ 5835 2 1 h1 okB5837
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 4 = true := blkChk_join _ _ _ _ _ 5835 3 1 h2 okB5838
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 5 = true := blkChk_join _ _ _ _ _ 5835 4 1 h3 okB5839
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 6 = true := blkChk_join _ _ _ _ _ 5835 5 1 h4 okB5840
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 7 = true := blkChk_join _ _ _ _ _ 5835 6 1 h5 okB5841
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 8 = true := blkChk_join _ _ _ _ _ 5835 7 1 h6 okB5842
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 9 = true := blkChk_join _ _ _ _ _ 5835 8 1 h7 okB5843
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5835 10 = true := blkChk_join _ _ _ _ _ 5835 9 1 h8 okB5844
  exact h9
end E1.C384X
