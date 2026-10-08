module
public import R22Port.U_d41d8cd98f00
public import E1P.J433_B0
public import E1P.J433_B1
public import E1P.J433_B2
public import E1P.J433_B3
public import E1P.J433_B4
public import E1P.J433_B5
public import E1P.J433_B6
public import E1P.J433_B7
public import E1P.J433_B8
public import E1P.J433_B9
public import E1P.J433_B10
public import E1P.J433_B11
public import E1P.J433_B12
public import E1P.J433_B13
public import E1P.J433_B14
public import E1P.J433_B15
public import E1P.J433_B16
public import E1P.J433_B17
public import E1P.J433_B18
public import E1P.J433_B19
public import E1P.J433_B20
public import E1P.J433_B21
public import E1P.J433_B22
public import E1P.J433_B23
public import E1P.J433_B24
public import E1P.J433_B25
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1P chain `J433`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1P.J433
open E1PS E1P.IP_pt
def W : List (List Nat) := [[1, 16, 20, 23, 24, 25], [2, 12, 15], [3, 5, 8, 10, 11], [4], [], [6, 7], [], [], [9], [], [], [], [13, 14], [], [], [], [17, 19], [18], [], [], [21, 22], [], [], [], [], []]
theorem okAll : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 26 = true := by
  have h0 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 1 = true := okB0
  have h1 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 2 = true := blkChk_join _ _ _ _ _ 0 1 1 h0 okB1
  have h2 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 3 = true := blkChk_join _ _ _ _ _ 0 2 1 h1 okB2
  have h3 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 4 = true := blkChk_join _ _ _ _ _ 0 3 1 h2 okB3
  have h4 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 5 = true := blkChk_join _ _ _ _ _ 0 4 1 h3 okB4
  have h5 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 6 = true := blkChk_join _ _ _ _ _ 0 5 1 h4 okB5
  have h6 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 7 = true := blkChk_join _ _ _ _ _ 0 6 1 h5 okB6
  have h7 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 7 1 h6 okB7
  have h8 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 9 = true := blkChk_join _ _ _ _ _ 0 8 1 h7 okB8
  have h9 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 10 = true := blkChk_join _ _ _ _ _ 0 9 1 h8 okB9
  have h10 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 11 = true := blkChk_join _ _ _ _ _ 0 10 1 h9 okB10
  have h11 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 12 = true := blkChk_join _ _ _ _ _ 0 11 1 h10 okB11
  have h12 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 13 = true := blkChk_join _ _ _ _ _ 0 12 1 h11 okB12
  have h13 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 14 = true := blkChk_join _ _ _ _ _ 0 13 1 h12 okB13
  have h14 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 15 = true := blkChk_join _ _ _ _ _ 0 14 1 h13 okB14
  have h15 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 15 1 h14 okB15
  have h16 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 17 = true := blkChk_join _ _ _ _ _ 0 16 1 h15 okB16
  have h17 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 18 = true := blkChk_join _ _ _ _ _ 0 17 1 h16 okB17
  have h18 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 19 = true := blkChk_join _ _ _ _ _ 0 18 1 h17 okB18
  have h19 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 20 = true := blkChk_join _ _ _ _ _ 0 19 1 h18 okB19
  have h20 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 21 = true := blkChk_join _ _ _ _ _ 0 20 1 h19 okB20
  have h21 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 22 = true := blkChk_join _ _ _ _ _ 0 21 1 h20 okB21
  have h22 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 23 = true := blkChk_join _ _ _ _ _ 0 22 1 h21 okB22
  have h23 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 23 1 h22 okB23
  have h24 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 25 = true := blkChk_join _ _ _ _ _ 0 24 1 h23 okB24
  have h25 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 26 = true := blkChk_join _ _ _ _ _ 0 25 1 h24 okB25
  exact h25
theorem len : lits.length = 26 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1P.fld UB l) := by
  rw [show V (fun l => E1P.fld UB l) = pkL 256 (fun l => E1P.fld UB l) 255 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1P.fld UB l) := by
  rw [show VR (fun l => E1P.fld UB l) = pkL 256 (fun j => E1P.fld UB (254 - j)) 255 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 19, SlotV x ((E1P.slc E1P.SL_pt.chunk) i))
    (hxub : ∀ l < 255, x l ≤ E1P.fld UB l) (hx : ∃ l < 255, 0 < x l) :
    ¬ StartOK x (fun l => E1P.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1P.slc E1P.SL_pt.chunk) UB UBR (fun l => E1P.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1P.J433
