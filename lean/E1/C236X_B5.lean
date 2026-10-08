module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB57 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB58 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 58 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB59 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 59 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB60 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 60 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB61 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 61 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB62 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 62 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB63 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 63 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB64 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 64 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB65 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 65 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB66 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 66 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB67 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 67 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB68 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 68 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB69 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 69 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB70 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 70 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB71 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 71 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB72 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 72 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG5 : glueChkR lits W 57 16 = true := by
  rw [← glueChkRN_eq lits W 8596 57 lenT]; decide +kernel
theorem okM5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 16 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 1 = true := okB57
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 2 = true := blkChk_join _ _ _ _ _ 57 1 1 h0 okB58
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 3 = true := blkChk_join _ _ _ _ _ 57 2 1 h1 okB59
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 4 = true := blkChk_join _ _ _ _ _ 57 3 1 h2 okB60
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 5 = true := blkChk_join _ _ _ _ _ 57 4 1 h3 okB61
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 6 = true := blkChk_join _ _ _ _ _ 57 5 1 h4 okB62
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 7 = true := blkChk_join _ _ _ _ _ 57 6 1 h5 okB63
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 8 = true := blkChk_join _ _ _ _ _ 57 7 1 h6 okB64
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 9 = true := blkChk_join _ _ _ _ _ 57 8 1 h7 okB65
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 10 = true := blkChk_join _ _ _ _ _ 57 9 1 h8 okB66
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 11 = true := blkChk_join _ _ _ _ _ 57 10 1 h9 okB67
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 12 = true := blkChk_join _ _ _ _ _ 57 11 1 h10 okB68
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 13 = true := blkChk_join _ _ _ _ _ 57 12 1 h11 okB69
  have h13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 14 = true := blkChk_join _ _ _ _ _ 57 13 1 h12 okB70
  have h14 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 15 = true := blkChk_join _ _ _ _ _ 57 14 1 h13 okB71
  have h15 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 57 16 = true := blkChk_join _ _ _ _ _ 57 15 1 h14 okB72
  exact h15
end E1.C236X
