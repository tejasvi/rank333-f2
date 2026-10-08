module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2023 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 1 = true := by decide +kernel
theorem okB2024 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2024 1 = true := by decide +kernel
theorem okB2025 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2025 1 = true := by decide +kernel
theorem okB2026 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2026 1 = true := by decide +kernel
theorem okB2027 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2027 1 = true := by decide +kernel
theorem okB2028 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2028 1 = true := by decide +kernel
theorem okB2029 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2029 1 = true := by decide +kernel
theorem okB2030 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2030 1 = true := by decide +kernel
theorem okB2031 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2031 1 = true := by decide +kernel
theorem okB2032 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2032 1 = true := by decide +kernel
theorem okG179 : glueChkR lits W 2023 10 = true := by decide +kernel
theorem okM179 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 1 = true := okB2023
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 2 = true := blkChk_join _ _ _ _ _ 2023 1 1 h0 okB2024
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 3 = true := blkChk_join _ _ _ _ _ 2023 2 1 h1 okB2025
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 4 = true := blkChk_join _ _ _ _ _ 2023 3 1 h2 okB2026
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 5 = true := blkChk_join _ _ _ _ _ 2023 4 1 h3 okB2027
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 6 = true := blkChk_join _ _ _ _ _ 2023 5 1 h4 okB2028
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 7 = true := blkChk_join _ _ _ _ _ 2023 6 1 h5 okB2029
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 8 = true := blkChk_join _ _ _ _ _ 2023 7 1 h6 okB2030
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 9 = true := blkChk_join _ _ _ _ _ 2023 8 1 h7 okB2031
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2023 10 = true := blkChk_join _ _ _ _ _ 2023 9 1 h8 okB2032
  exact h9
end E1.C382X
