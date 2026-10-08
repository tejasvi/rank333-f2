module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB845 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 1 = true := by decide +kernel
theorem okB846 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 846 1 = true := by decide +kernel
theorem okB847 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 847 1 = true := by decide +kernel
theorem okB848 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 848 1 = true := by decide +kernel
theorem okB849 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 849 1 = true := by decide +kernel
theorem okB850 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 850 1 = true := by decide +kernel
theorem okB851 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 851 1 = true := by decide +kernel
theorem okB852 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 852 1 = true := by decide +kernel
theorem okB853 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 853 1 = true := by decide +kernel
theorem okB854 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 854 1 = true := by decide +kernel
theorem okG78 : glueChkR lits W 845 10 = true := by decide +kernel
theorem okM78 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 1 = true := okB845
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 2 = true := blkChk_join _ _ _ _ _ 845 1 1 h0 okB846
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 3 = true := blkChk_join _ _ _ _ _ 845 2 1 h1 okB847
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 4 = true := blkChk_join _ _ _ _ _ 845 3 1 h2 okB848
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 5 = true := blkChk_join _ _ _ _ _ 845 4 1 h3 okB849
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 6 = true := blkChk_join _ _ _ _ _ 845 5 1 h4 okB850
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 7 = true := blkChk_join _ _ _ _ _ 845 6 1 h5 okB851
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 8 = true := blkChk_join _ _ _ _ _ 845 7 1 h6 okB852
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 9 = true := blkChk_join _ _ _ _ _ 845 8 1 h7 okB853
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 845 10 = true := blkChk_join _ _ _ _ _ 845 9 1 h8 okB854
  exact h9
end E1.C387X
