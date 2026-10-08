module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB842 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 1 = true := by decide +kernel
theorem okB843 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 843 1 = true := by decide +kernel
theorem okB844 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 844 1 = true := by decide +kernel
theorem okB845 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 845 1 = true := by decide +kernel
theorem okB846 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 846 1 = true := by decide +kernel
theorem okB847 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 847 1 = true := by decide +kernel
theorem okB848 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 848 1 = true := by decide +kernel
theorem okB849 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 849 1 = true := by decide +kernel
theorem okB850 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 850 1 = true := by decide +kernel
theorem okB851 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 851 1 = true := by decide +kernel
theorem okG80 : glueChkR lits W 842 10 = true := by decide +kernel
theorem okM80 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 1 = true := okB842
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 2 = true := blkChk_join _ _ _ _ _ 842 1 1 h0 okB843
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 3 = true := blkChk_join _ _ _ _ _ 842 2 1 h1 okB844
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 4 = true := blkChk_join _ _ _ _ _ 842 3 1 h2 okB845
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 5 = true := blkChk_join _ _ _ _ _ 842 4 1 h3 okB846
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 6 = true := blkChk_join _ _ _ _ _ 842 5 1 h4 okB847
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 7 = true := blkChk_join _ _ _ _ _ 842 6 1 h5 okB848
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 8 = true := blkChk_join _ _ _ _ _ 842 7 1 h6 okB849
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 9 = true := blkChk_join _ _ _ _ _ 842 8 1 h7 okB850
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 842 10 = true := blkChk_join _ _ _ _ _ 842 9 1 h8 okB851
  exact h9
end E1.C384X
