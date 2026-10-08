module
public import R22Port.U_d41d8cd98f00
public import E1.C335X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C335X
open E1S
theorem okB9861 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 1 = true := by decide +kernel
theorem okB9862 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9862 1 = true := by decide +kernel
theorem okB9863 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9863 1 = true := by decide +kernel
theorem okB9864 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9864 1 = true := by decide +kernel
theorem okB9865 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9865 1 = true := by decide +kernel
theorem okB9866 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9866 1 = true := by decide +kernel
theorem okB9867 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9867 1 = true := by decide +kernel
theorem okB9868 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9868 1 = true := by decide +kernel
theorem okB9869 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9869 1 = true := by decide +kernel
theorem okB9870 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9870 1 = true := by decide +kernel
theorem okG880 : glueChkR lits W 9861 10 = true := by decide +kernel
theorem okM880 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 10 = true := by
  have h0 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 1 = true := okB9861
  have h1 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 2 = true := blkChk_join _ _ _ _ _ 9861 1 1 h0 okB9862
  have h2 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 3 = true := blkChk_join _ _ _ _ _ 9861 2 1 h1 okB9863
  have h3 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 4 = true := blkChk_join _ _ _ _ _ 9861 3 1 h2 okB9864
  have h4 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 5 = true := blkChk_join _ _ _ _ _ 9861 4 1 h3 okB9865
  have h5 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 6 = true := blkChk_join _ _ _ _ _ 9861 5 1 h4 okB9866
  have h6 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 7 = true := blkChk_join _ _ _ _ _ 9861 6 1 h5 okB9867
  have h7 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 8 = true := blkChk_join _ _ _ _ _ 9861 7 1 h6 okB9868
  have h8 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 9 = true := blkChk_join _ _ _ _ _ 9861 8 1 h7 okB9869
  have h9 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 9861 10 = true := blkChk_join _ _ _ _ _ 9861 9 1 h8 okB9870
  exact h9
end E1.C335X
