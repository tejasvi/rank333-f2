module
public import R22Port.U_d41d8cd98f00
public import E1.C207X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C207X
open E1S
theorem okB2025 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 1 = true := by decide +kernel
theorem okB2026 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2026 1 = true := by decide +kernel
theorem okB2027 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2027 1 = true := by decide +kernel
theorem okB2028 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2028 1 = true := by decide +kernel
theorem okB2029 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2029 1 = true := by decide +kernel
theorem okB2030 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2030 1 = true := by decide +kernel
theorem okB2031 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2031 1 = true := by decide +kernel
theorem okB2032 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2032 1 = true := by decide +kernel
theorem okB2033 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2033 1 = true := by decide +kernel
theorem okB2034 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2034 1 = true := by decide +kernel
theorem okG167 : glueChkR lits W 2025 10 = true := by decide +kernel
theorem okM167 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 10 = true := by
  have h0 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 1 = true := okB2025
  have h1 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 2 = true := blkChk_join _ _ _ _ _ 2025 1 1 h0 okB2026
  have h2 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 3 = true := blkChk_join _ _ _ _ _ 2025 2 1 h1 okB2027
  have h3 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 4 = true := blkChk_join _ _ _ _ _ 2025 3 1 h2 okB2028
  have h4 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 5 = true := blkChk_join _ _ _ _ _ 2025 4 1 h3 okB2029
  have h5 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 6 = true := blkChk_join _ _ _ _ _ 2025 5 1 h4 okB2030
  have h6 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 7 = true := blkChk_join _ _ _ _ _ 2025 6 1 h5 okB2031
  have h7 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 8 = true := blkChk_join _ _ _ _ _ 2025 7 1 h6 okB2032
  have h8 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 9 = true := blkChk_join _ _ _ _ _ 2025 8 1 h7 okB2033
  have h9 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 2025 10 = true := blkChk_join _ _ _ _ _ 2025 9 1 h8 okB2034
  exact h9
end E1.C207X
