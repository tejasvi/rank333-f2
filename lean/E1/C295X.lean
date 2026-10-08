module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_B0
public import E1.C295X_B1
public import E1.C295X_B2
public import E1.C295X_B3
public import E1.C295X_B4
public import E1.C295X_B5
public import E1.C295X_B6
public import E1.C295X_B7
public import E1.C295X_B8
public import E1.C295X_B9
public import E1.C295X_B10
public import E1.C295X_B11
public import E1.C295X_B12
public import E1.C295X_B13
public import E1.C295X_B14
public import E1.C295X_B15
public import E1.C295X_B16
public import E1.OK_e295
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C295X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C295X
open E1S E1.IP_e295
theorem okAll : blkChk C E1.SL_e295.entry UB UBR lits 0 168 = true := by
  have h0 : blkChk C E1.SL_e295.entry UB UBR lits 0 12 = true := okM0
  have h1 : blkChk C E1.SL_e295.entry UB UBR lits 0 26 = true := blkChk_join _ _ _ _ _ 0 12 14 h0 okM1
  have h2 : blkChk C E1.SL_e295.entry UB UBR lits 0 37 = true := blkChk_join _ _ _ _ _ 0 26 11 h1 okM2
  have h3 : blkChk C E1.SL_e295.entry UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 37 11 h2 okM3
  have h4 : blkChk C E1.SL_e295.entry UB UBR lits 0 59 = true := blkChk_join _ _ _ _ _ 0 48 11 h3 okM4
  have h5 : blkChk C E1.SL_e295.entry UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 59 9 h4 okM5
  have h6 : blkChk C E1.SL_e295.entry UB UBR lits 0 79 = true := blkChk_join _ _ _ _ _ 0 68 11 h5 okM6
  have h7 : blkChk C E1.SL_e295.entry UB UBR lits 0 87 = true := blkChk_join _ _ _ _ _ 0 79 8 h6 okM7
  have h8 : blkChk C E1.SL_e295.entry UB UBR lits 0 97 = true := blkChk_join _ _ _ _ _ 0 87 10 h7 okM8
  have h9 : blkChk C E1.SL_e295.entry UB UBR lits 0 109 = true := blkChk_join _ _ _ _ _ 0 97 12 h8 okM9
  have h10 : blkChk C E1.SL_e295.entry UB UBR lits 0 119 = true := blkChk_join _ _ _ _ _ 0 109 10 h9 okM10
  have h11 : blkChk C E1.SL_e295.entry UB UBR lits 0 130 = true := blkChk_join _ _ _ _ _ 0 119 11 h10 okM11
  have h12 : blkChk C E1.SL_e295.entry UB UBR lits 0 138 = true := blkChk_join _ _ _ _ _ 0 130 8 h11 okM12
  have h13 : blkChk C E1.SL_e295.entry UB UBR lits 0 147 = true := blkChk_join _ _ _ _ _ 0 138 9 h12 okM13
  have h14 : blkChk C E1.SL_e295.entry UB UBR lits 0 155 = true := blkChk_join _ _ _ _ _ 0 147 8 h13 okM14
  have h15 : blkChk C E1.SL_e295.entry UB UBR lits 0 163 = true := blkChk_join _ _ _ _ _ 0 155 8 h14 okM15
  have h16 : blkChk C E1.SL_e295.entry UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 163 5 h15 okM16
  exact h16
theorem len : lits.length = 168 := by decide
theorem okGAll : glueChkR lits W 0 168 = true := by
  have g0 : glueChkR lits W 0 12 = true := okG0
  have g1 : glueChkR lits W 0 26 = true := glueChkR_join _ _ 0 12 14 g0 okG1
  have g2 : glueChkR lits W 0 37 = true := glueChkR_join _ _ 0 26 11 g1 okG2
  have g3 : glueChkR lits W 0 48 = true := glueChkR_join _ _ 0 37 11 g2 okG3
  have g4 : glueChkR lits W 0 59 = true := glueChkR_join _ _ 0 48 11 g3 okG4
  have g5 : glueChkR lits W 0 68 = true := glueChkR_join _ _ 0 59 9 g4 okG5
  have g6 : glueChkR lits W 0 79 = true := glueChkR_join _ _ 0 68 11 g5 okG6
  have g7 : glueChkR lits W 0 87 = true := glueChkR_join _ _ 0 79 8 g6 okG7
  have g8 : glueChkR lits W 0 97 = true := glueChkR_join _ _ 0 87 10 g7 okG8
  have g9 : glueChkR lits W 0 109 = true := glueChkR_join _ _ 0 97 12 g8 okG9
  have g10 : glueChkR lits W 0 119 = true := glueChkR_join _ _ 0 109 10 g9 okG10
  have g11 : glueChkR lits W 0 130 = true := glueChkR_join _ _ 0 119 11 g10 okG11
  have g12 : glueChkR lits W 0 138 = true := glueChkR_join _ _ 0 130 8 g11 okG12
  have g13 : glueChkR lits W 0 147 = true := glueChkR_join _ _ 0 138 9 g12 okG13
  have g14 : glueChkR lits W 0 155 = true := glueChkR_join _ _ 0 147 8 g13 okG14
  have g15 : glueChkR lits W 0 163 = true := glueChkR_join _ _ 0 155 8 g14 okG15
  have g16 : glueChkR lits W 0 168 = true := glueChkR_join _ _ 0 163 5 g15 okG16
  exact g16
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e295.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e295.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e295.UB_eq E1.OK_e295.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C295X
