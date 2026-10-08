module
public import R22Port.U_d41d8cd98f00
public import E1.C234X_B0
public import E1.C234X_B1
public import E1.C234X_B2
public import E1.C234X_B3
public import E1.C234X_B4
public import E1.C234X_B5
public import E1.C234X_B6
public import E1.C234X_B7
public import E1.C234X_B8
public import E1.C234X_B9
public import E1.C234X_B10
public import E1.C234X_B11
public import E1.C234X_B12
public import E1.C234X_B13
public import E1.C234X_B14
public import E1.C234X_B15
public import E1.C234X_B16
public import E1.C234X_B17
public import E1.C234X_B18
public import E1.C234X_B19
public import E1.C234X_B20
public import E1.C234X_B21
public import E1.OK_e234
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C234X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C234X
open E1S E1.IP_e234
theorem okAll : blkChk C E1.SL_e234.entry UB UBR lits 0 221 = true := by
  have h0 : blkChk C E1.SL_e234.entry UB UBR lits 0 11 = true := okM0
  have h1 : blkChk C E1.SL_e234.entry UB UBR lits 0 19 = true := blkChk_join _ _ _ _ _ 0 11 8 h0 okM1
  have h2 : blkChk C E1.SL_e234.entry UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 19 9 h1 okM2
  have h3 : blkChk C E1.SL_e234.entry UB UBR lits 0 37 = true := blkChk_join _ _ _ _ _ 0 28 9 h2 okM3
  have h4 : blkChk C E1.SL_e234.entry UB UBR lits 0 47 = true := blkChk_join _ _ _ _ _ 0 37 10 h3 okM4
  have h5 : blkChk C E1.SL_e234.entry UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 47 9 h4 okM5
  have h6 : blkChk C E1.SL_e234.entry UB UBR lits 0 67 = true := blkChk_join _ _ _ _ _ 0 56 11 h5 okM6
  have h7 : blkChk C E1.SL_e234.entry UB UBR lits 0 75 = true := blkChk_join _ _ _ _ _ 0 67 8 h6 okM7
  have h8 : blkChk C E1.SL_e234.entry UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 75 9 h7 okM8
  have h9 : blkChk C E1.SL_e234.entry UB UBR lits 0 95 = true := blkChk_join _ _ _ _ _ 0 84 11 h8 okM9
  have h10 : blkChk C E1.SL_e234.entry UB UBR lits 0 105 = true := blkChk_join _ _ _ _ _ 0 95 10 h9 okM10
  have h11 : blkChk C E1.SL_e234.entry UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 105 11 h10 okM11
  have h12 : blkChk C E1.SL_e234.entry UB UBR lits 0 125 = true := blkChk_join _ _ _ _ _ 0 116 9 h11 okM12
  have h13 : blkChk C E1.SL_e234.entry UB UBR lits 0 137 = true := blkChk_join _ _ _ _ _ 0 125 12 h12 okM13
  have h14 : blkChk C E1.SL_e234.entry UB UBR lits 0 148 = true := blkChk_join _ _ _ _ _ 0 137 11 h13 okM14
  have h15 : blkChk C E1.SL_e234.entry UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 148 12 h14 okM15
  have h16 : blkChk C E1.SL_e234.entry UB UBR lits 0 171 = true := blkChk_join _ _ _ _ _ 0 160 11 h15 okM16
  have h17 : blkChk C E1.SL_e234.entry UB UBR lits 0 181 = true := blkChk_join _ _ _ _ _ 0 171 10 h16 okM17
  have h18 : blkChk C E1.SL_e234.entry UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 181 11 h17 okM18
  have h19 : blkChk C E1.SL_e234.entry UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 192 16 h18 okM19
  have h20 : blkChk C E1.SL_e234.entry UB UBR lits 0 220 = true := blkChk_join _ _ _ _ _ 0 208 12 h19 okM20
  have h21 : blkChk C E1.SL_e234.entry UB UBR lits 0 221 = true := blkChk_join _ _ _ _ _ 0 220 1 h20 okM21
  exact h21
theorem len : lits.length = 221 := by decide
theorem okGAll : glueChkR lits W 0 221 = true := by
  have g0 : glueChkR lits W 0 11 = true := okG0
  have g1 : glueChkR lits W 0 19 = true := glueChkR_join _ _ 0 11 8 g0 okG1
  have g2 : glueChkR lits W 0 28 = true := glueChkR_join _ _ 0 19 9 g1 okG2
  have g3 : glueChkR lits W 0 37 = true := glueChkR_join _ _ 0 28 9 g2 okG3
  have g4 : glueChkR lits W 0 47 = true := glueChkR_join _ _ 0 37 10 g3 okG4
  have g5 : glueChkR lits W 0 56 = true := glueChkR_join _ _ 0 47 9 g4 okG5
  have g6 : glueChkR lits W 0 67 = true := glueChkR_join _ _ 0 56 11 g5 okG6
  have g7 : glueChkR lits W 0 75 = true := glueChkR_join _ _ 0 67 8 g6 okG7
  have g8 : glueChkR lits W 0 84 = true := glueChkR_join _ _ 0 75 9 g7 okG8
  have g9 : glueChkR lits W 0 95 = true := glueChkR_join _ _ 0 84 11 g8 okG9
  have g10 : glueChkR lits W 0 105 = true := glueChkR_join _ _ 0 95 10 g9 okG10
  have g11 : glueChkR lits W 0 116 = true := glueChkR_join _ _ 0 105 11 g10 okG11
  have g12 : glueChkR lits W 0 125 = true := glueChkR_join _ _ 0 116 9 g11 okG12
  have g13 : glueChkR lits W 0 137 = true := glueChkR_join _ _ 0 125 12 g12 okG13
  have g14 : glueChkR lits W 0 148 = true := glueChkR_join _ _ 0 137 11 g13 okG14
  have g15 : glueChkR lits W 0 160 = true := glueChkR_join _ _ 0 148 12 g14 okG15
  have g16 : glueChkR lits W 0 171 = true := glueChkR_join _ _ 0 160 11 g15 okG16
  have g17 : glueChkR lits W 0 181 = true := glueChkR_join _ _ 0 171 10 g16 okG17
  have g18 : glueChkR lits W 0 192 = true := glueChkR_join _ _ 0 181 11 g17 okG18
  have g19 : glueChkR lits W 0 208 = true := glueChkR_join _ _ 0 192 16 g18 okG19
  have g20 : glueChkR lits W 0 220 = true := glueChkR_join _ _ 0 208 12 g19 okG20
  have g21 : glueChkR lits W 0 221 = true := glueChkR_join _ _ 0 220 1 g20 okG21
  exact g21
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e234.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e234.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e234.UB_eq E1.OK_e234.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C234X
