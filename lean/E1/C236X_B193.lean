module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1977 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1978 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1979 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1980 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1981 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1982 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1983 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1984 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1985 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1986 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1987 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1988 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1989 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1990 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG193 : glueChkR lits W 1977 14 = true := by
  rw [← glueChkRN_eq lits W 8596 1977 lenT]; decide +kernel
theorem okM193 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 14 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 1 = true := okB1977
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 2 = true := blkChk_join _ _ _ _ _ 1977 1 1 h0 okB1978
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 3 = true := blkChk_join _ _ _ _ _ 1977 2 1 h1 okB1979
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 4 = true := blkChk_join _ _ _ _ _ 1977 3 1 h2 okB1980
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 5 = true := blkChk_join _ _ _ _ _ 1977 4 1 h3 okB1981
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 6 = true := blkChk_join _ _ _ _ _ 1977 5 1 h4 okB1982
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 7 = true := blkChk_join _ _ _ _ _ 1977 6 1 h5 okB1983
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 8 = true := blkChk_join _ _ _ _ _ 1977 7 1 h6 okB1984
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 9 = true := blkChk_join _ _ _ _ _ 1977 8 1 h7 okB1985
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 10 = true := blkChk_join _ _ _ _ _ 1977 9 1 h8 okB1986
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 11 = true := blkChk_join _ _ _ _ _ 1977 10 1 h9 okB1987
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 12 = true := blkChk_join _ _ _ _ _ 1977 11 1 h10 okB1988
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 13 = true := blkChk_join _ _ _ _ _ 1977 12 1 h11 okB1989
  have h13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1977 14 = true := blkChk_join _ _ _ _ _ 1977 13 1 h12 okB1990
  exact h13
end E1.C236X
