module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1935 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1936 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1937 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1938 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1939 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1940 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG188 : glueChkR lits W 1935 6 = true := by
  rw [← glueChkRN_eq lits W 8596 1935 lenT]; decide +kernel
theorem okM188 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 1 = true := okB1935
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 2 = true := blkChk_join _ _ _ _ _ 1935 1 1 h0 okB1936
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 3 = true := blkChk_join _ _ _ _ _ 1935 2 1 h1 okB1937
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 4 = true := blkChk_join _ _ _ _ _ 1935 3 1 h2 okB1938
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 5 = true := blkChk_join _ _ _ _ _ 1935 4 1 h3 okB1939
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1935 6 = true := blkChk_join _ _ _ _ _ 1935 5 1 h4 okB1940
  exact h5
end E1.C236X
