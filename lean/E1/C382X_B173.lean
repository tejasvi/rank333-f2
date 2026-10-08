module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1940 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 1 = true := by decide +kernel
theorem okB1941 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1941 1 = true := by decide +kernel
theorem okB1942 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1942 1 = true := by decide +kernel
theorem okB1943 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1943 1 = true := by decide +kernel
theorem okB1944 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1944 1 = true := by decide +kernel
theorem okB1945 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1945 1 = true := by decide +kernel
theorem okB1946 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1946 1 = true := by decide +kernel
theorem okB1947 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1947 1 = true := by decide +kernel
theorem okB1948 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1948 1 = true := by decide +kernel
theorem okB1949 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1949 1 = true := by decide +kernel
theorem okB1950 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1950 1 = true := by decide +kernel
theorem okB1951 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1951 1 = true := by decide +kernel
theorem okG173 : glueChkR lits W 1940 12 = true := by decide +kernel
theorem okM173 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 1 = true := okB1940
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 2 = true := blkChk_join _ _ _ _ _ 1940 1 1 h0 okB1941
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 3 = true := blkChk_join _ _ _ _ _ 1940 2 1 h1 okB1942
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 4 = true := blkChk_join _ _ _ _ _ 1940 3 1 h2 okB1943
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 5 = true := blkChk_join _ _ _ _ _ 1940 4 1 h3 okB1944
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 6 = true := blkChk_join _ _ _ _ _ 1940 5 1 h4 okB1945
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 7 = true := blkChk_join _ _ _ _ _ 1940 6 1 h5 okB1946
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 8 = true := blkChk_join _ _ _ _ _ 1940 7 1 h6 okB1947
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 9 = true := blkChk_join _ _ _ _ _ 1940 8 1 h7 okB1948
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 10 = true := blkChk_join _ _ _ _ _ 1940 9 1 h8 okB1949
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 11 = true := blkChk_join _ _ _ _ _ 1940 10 1 h9 okB1950
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1940 12 = true := blkChk_join _ _ _ _ _ 1940 11 1 h10 okB1951
  exact h11
end E1.C382X
