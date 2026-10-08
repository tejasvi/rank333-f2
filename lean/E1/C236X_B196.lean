module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2017 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2018 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2018 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2019 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2019 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2020 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2020 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2021 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2021 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2022 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2022 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2023 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2023 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2024 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2024 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2025 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2025 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2026 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2026 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2027 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2027 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2028 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2029 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG196 : glueChkR lits W 2017 13 = true := by
  rw [← glueChkRN_eq lits W 8596 2017 lenT]; decide +kernel
theorem okM196 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 13 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 1 = true := okB2017
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 2 = true := blkChk_join _ _ _ _ _ 2017 1 1 h0 okB2018
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 3 = true := blkChk_join _ _ _ _ _ 2017 2 1 h1 okB2019
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 4 = true := blkChk_join _ _ _ _ _ 2017 3 1 h2 okB2020
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 5 = true := blkChk_join _ _ _ _ _ 2017 4 1 h3 okB2021
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 6 = true := blkChk_join _ _ _ _ _ 2017 5 1 h4 okB2022
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 7 = true := blkChk_join _ _ _ _ _ 2017 6 1 h5 okB2023
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 8 = true := blkChk_join _ _ _ _ _ 2017 7 1 h6 okB2024
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 9 = true := blkChk_join _ _ _ _ _ 2017 8 1 h7 okB2025
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 10 = true := blkChk_join _ _ _ _ _ 2017 9 1 h8 okB2026
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 11 = true := blkChk_join _ _ _ _ _ 2017 10 1 h9 okB2027
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 12 = true := blkChk_join _ _ _ _ _ 2017 11 1 h10 okB2028
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2017 13 = true := blkChk_join _ _ _ _ _ 2017 12 1 h11 okB2029
  exact h12
end E1.C236X
