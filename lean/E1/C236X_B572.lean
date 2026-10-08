module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5935 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5936 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5937 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5938 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5939 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5940 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5941 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5942 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5942 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5943 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5943 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5944 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG572 : glueChkR lits W 5935 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5935 lenT]; decide +kernel
theorem okM572 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 1 = true := okB5935
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 2 = true := blkChk_join _ _ _ _ _ 5935 1 1 h0 okB5936
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 3 = true := blkChk_join _ _ _ _ _ 5935 2 1 h1 okB5937
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 4 = true := blkChk_join _ _ _ _ _ 5935 3 1 h2 okB5938
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 5 = true := blkChk_join _ _ _ _ _ 5935 4 1 h3 okB5939
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 6 = true := blkChk_join _ _ _ _ _ 5935 5 1 h4 okB5940
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 7 = true := blkChk_join _ _ _ _ _ 5935 6 1 h5 okB5941
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 8 = true := blkChk_join _ _ _ _ _ 5935 7 1 h6 okB5942
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 9 = true := blkChk_join _ _ _ _ _ 5935 8 1 h7 okB5943
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5935 10 = true := blkChk_join _ _ _ _ _ 5935 9 1 h8 okB5944
  exact h9
end E1.C236X
