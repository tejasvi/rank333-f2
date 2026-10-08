module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2019 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 1 = true := by decide +kernel
theorem okB2020 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2020 1 = true := by decide +kernel
theorem okB2021 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2021 1 = true := by decide +kernel
theorem okB2022 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2022 1 = true := by decide +kernel
theorem okB2023 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2023 1 = true := by decide +kernel
theorem okB2024 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2024 1 = true := by decide +kernel
theorem okB2025 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2025 1 = true := by decide +kernel
theorem okB2026 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2026 1 = true := by decide +kernel
theorem okG189 : glueChkR lits W 2019 8 = true := by decide +kernel
theorem okM189 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 1 = true := okB2019
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 2 = true := blkChk_join _ _ _ _ _ 2019 1 1 h0 okB2020
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 3 = true := blkChk_join _ _ _ _ _ 2019 2 1 h1 okB2021
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 4 = true := blkChk_join _ _ _ _ _ 2019 3 1 h2 okB2022
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 5 = true := blkChk_join _ _ _ _ _ 2019 4 1 h3 okB2023
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 6 = true := blkChk_join _ _ _ _ _ 2019 5 1 h4 okB2024
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 7 = true := blkChk_join _ _ _ _ _ 2019 6 1 h5 okB2025
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2019 8 = true := blkChk_join _ _ _ _ _ 2019 7 1 h6 okB2026
  exact h7
end E1.C384X
