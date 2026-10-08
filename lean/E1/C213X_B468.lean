module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB5065 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 1 = true := by decide +kernel
theorem okB5066 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5066 1 = true := by decide +kernel
theorem okB5067 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5067 1 = true := by decide +kernel
theorem okB5068 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5068 1 = true := by decide +kernel
theorem okB5069 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5069 1 = true := by decide +kernel
theorem okB5070 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5070 1 = true := by decide +kernel
theorem okB5071 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5071 1 = true := by decide +kernel
theorem okB5072 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5072 1 = true := by decide +kernel
theorem okB5073 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5073 1 = true := by decide +kernel
theorem okB5074 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5074 1 = true := by decide +kernel
theorem okB5075 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5075 1 = true := by decide +kernel
theorem okG468 : glueChkR lits W 5065 11 = true := by decide +kernel
theorem okM468 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 1 = true := okB5065
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 2 = true := blkChk_join _ _ _ _ _ 5065 1 1 h0 okB5066
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 3 = true := blkChk_join _ _ _ _ _ 5065 2 1 h1 okB5067
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 4 = true := blkChk_join _ _ _ _ _ 5065 3 1 h2 okB5068
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 5 = true := blkChk_join _ _ _ _ _ 5065 4 1 h3 okB5069
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 6 = true := blkChk_join _ _ _ _ _ 5065 5 1 h4 okB5070
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 7 = true := blkChk_join _ _ _ _ _ 5065 6 1 h5 okB5071
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 8 = true := blkChk_join _ _ _ _ _ 5065 7 1 h6 okB5072
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 9 = true := blkChk_join _ _ _ _ _ 5065 8 1 h7 okB5073
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 10 = true := blkChk_join _ _ _ _ _ 5065 9 1 h8 okB5074
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5065 11 = true := blkChk_join _ _ _ _ _ 5065 10 1 h9 okB5075
  exact h10
end E1.C213X
