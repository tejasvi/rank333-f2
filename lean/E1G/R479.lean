module
public import R22Port.U_d41d8cd98f00
public import E1G.R479_B0
public import E1G.R479_B1
public import E1G.R479_B2
public import E1G.R479_B3
public import E1G.R479_B4
public import E1G.R479_B5
public import E1G.R479_B6
public import E1G.R479_B7
public import E1G.R479_B8
public import E1G.R479_B9
public import E1G.R479_B10
public import E1G.R479_B11
public import E1G.R479_B12
public import E1G.R479_B13
public import E1G.R479_B14
public import E1G.R479_B15
public import E1G.R479_B16
public import E1G.R479_B17
public import E1G.R479_B18
public import E1G.R479_B19
public import E1G.R479_B20
public import E1G.R479_B21
public import E1G.R479_B22
public import E1G.R479_B23
public import E1G.R479_B24
public import E1G.R479_B25
public import E1G.R479_B26
public import E1G.R479_B27
public import E1G.R479_B28
public import E1G.R479_B29
public import E1G.R479_B30
public import E1G.R479_B31
public import E1G.R479_B32
public import E1G.R479_B33
public import E1G.R479_B34
public import E1G.R479_B35
public import E1G.R479_B36
public import E1G.R479_B37
public import E1G.R479_B38
public import E1G.R479_B39
public import E1G.R479_B40
public import E1G.R479_B41
public import E1G.R479_B42
public import E1G.R479_B43
public import E1G.R479_B44
public import E1G.R479_B45
public import E1G.R479_B46
public import E1G.R479_B47
public import E1G.R479_B48
public import E1G.R479_B49
public import E1G.R479_B50
public import E1G.R479_B51
public import E1G.R479_B52
public import E1G.R479_B53
public import E1G.R479_B54
public import E1G.R479_B55
public import E1G.R479_B56
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The root level of `R479`: the top chain from the root, its frontier records glued to the 30557 jobs of the header table.
`root`: if every job is covered (`JobOK` of its header), no `x` with the global facts exists (the L479 glue's `EnumOK`). -/
namespace E1G.R479
open E1GS E1G.IP_l479cw
theorem okAll : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 227 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 4 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 4 4 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 12 = true := blkChk_join _ _ _ _ _ 0 8 4 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 12 4 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 20 = true := blkChk_join _ _ _ _ _ 0 16 4 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 20 4 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 24 4 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 28 4 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 32 4 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 36 4 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 40 4 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 44 4 h10 okB11
  have h12 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 48 4 h11 okB12
  have h13 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 52 4 h12 okB13
  have h14 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 60 = true := blkChk_join _ _ _ _ _ 0 56 4 h13 okB14
  have h15 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 60 4 h14 okB15
  have h16 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 64 4 h15 okB16
  have h17 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 68 4 h16 okB17
  have h18 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 76 = true := blkChk_join _ _ _ _ _ 0 72 4 h17 okB18
  have h19 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 76 4 h18 okB19
  have h20 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 80 4 h19 okB20
  have h21 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 84 4 h20 okB21
  have h22 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 92 = true := blkChk_join _ _ _ _ _ 0 88 4 h21 okB22
  have h23 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 92 4 h22 okB23
  have h24 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 100 = true := blkChk_join _ _ _ _ _ 0 96 4 h23 okB24
  have h25 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 100 4 h24 okB25
  have h26 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 108 = true := blkChk_join _ _ _ _ _ 0 104 4 h25 okB26
  have h27 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 108 4 h26 okB27
  have h28 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 112 4 h27 okB28
  have h29 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 116 4 h28 okB29
  have h30 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 124 = true := blkChk_join _ _ _ _ _ 0 120 4 h29 okB30
  have h31 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 124 4 h30 okB31
  have h32 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 132 = true := blkChk_join _ _ _ _ _ 0 128 4 h31 okB32
  have h33 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 132 4 h32 okB33
  have h34 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 140 = true := blkChk_join _ _ _ _ _ 0 136 4 h33 okB34
  have h35 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 140 4 h34 okB35
  have h36 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 148 = true := blkChk_join _ _ _ _ _ 0 144 4 h35 okB36
  have h37 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 148 4 h36 okB37
  have h38 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 152 4 h37 okB38
  have h39 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 156 4 h38 okB39
  have h40 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 164 = true := blkChk_join _ _ _ _ _ 0 160 4 h39 okB40
  have h41 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 164 4 h40 okB41
  have h42 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 172 = true := blkChk_join _ _ _ _ _ 0 168 4 h41 okB42
  have h43 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 172 4 h42 okB43
  have h44 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 180 = true := blkChk_join _ _ _ _ _ 0 176 4 h43 okB44
  have h45 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 184 = true := blkChk_join _ _ _ _ _ 0 180 4 h44 okB45
  have h46 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 184 4 h45 okB46
  have h47 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 188 4 h46 okB47
  have h48 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 196 = true := blkChk_join _ _ _ _ _ 0 192 4 h47 okB48
  have h49 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 200 = true := blkChk_join _ _ _ _ _ 0 196 4 h48 okB49
  have h50 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 204 = true := blkChk_join _ _ _ _ _ 0 200 4 h49 okB50
  have h51 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 204 4 h50 okB51
  have h52 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 212 = true := blkChk_join _ _ _ _ _ 0 208 4 h51 okB52
  have h53 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 216 = true := blkChk_join _ _ _ _ _ 0 212 4 h52 okB53
  have h54 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 220 = true := blkChk_join _ _ _ _ _ 0 216 4 h53 okB54
  have h55 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 220 4 h54 okB55
  have h56 : blkChk C (E1G.slc E1G.SL_l479cw.chunk) UB UBR lits 0 227 = true := blkChk_join _ _ _ _ _ 0 224 3 h55 okB56
  exact h56
theorem len : lits.length = 227 := by decide
theorem okGlue : glueChkW lits 30557 E1G.R479_HT.entry E1G.R479_Wf = true := by decide +kernel
theorem okRoot : lits.getD 0 0 % 2 ^ 13 = 0 := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- **the root level**: the jobs' coverage gives the canonical-point statement -/
theorem root (hjobs : ∀ k < 30557, JobOK C (E1G.slc E1G.SL_l479cw.chunk) UB (E1G.R479_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_l479cw.chunk) i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False :=
  enum_of_chain_w C (E1G.slc E1G.SL_l479cw.chunk) UB UBR UB_eq UBR_eq (by decide +kernel) lits 30557 E1G.R479_HT.entry E1G.R479_Wf (by rw [len]; decide) okRoot
    (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) okGlue hjobs
end E1G.R479
