module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB8080 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 1 = true := by decide +kernel
theorem okB8081 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8081 1 = true := by decide +kernel
theorem okB8082 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8082 1 = true := by decide +kernel
theorem okB8083 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8083 1 = true := by decide +kernel
theorem okB8084 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8084 1 = true := by decide +kernel
theorem okB8085 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8085 1 = true := by decide +kernel
theorem okB8086 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8086 1 = true := by decide +kernel
theorem okB8087 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8087 1 = true := by decide +kernel
theorem okG770 : glueChkR lits W 8080 8 = true := by decide +kernel
theorem okM770 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 1 = true := okB8080
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 2 = true := blkChk_join _ _ _ _ _ 8080 1 1 h0 okB8081
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 3 = true := blkChk_join _ _ _ _ _ 8080 2 1 h1 okB8082
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 4 = true := blkChk_join _ _ _ _ _ 8080 3 1 h2 okB8083
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 5 = true := blkChk_join _ _ _ _ _ 8080 4 1 h3 okB8084
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 6 = true := blkChk_join _ _ _ _ _ 8080 5 1 h4 okB8085
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 7 = true := blkChk_join _ _ _ _ _ 8080 6 1 h5 okB8086
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 8080 8 = true := blkChk_join _ _ _ _ _ 8080 7 1 h6 okB8087
  exact h7
end E1.C394X
