module
public import R22Port.U_bdf38941ab3f
public import R22B.Cmd
public import R22D.E1_e321
public import E1.IP_e321
public import E1.SL_e321
/-! # R22B.E1_e321: the module-land copies of the IP `e321` equal the kernel modules `E1.IP_e321` / `E1.SL_e321` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1.SL_e321.chunk E1.SL_e321.chunk
#r22b_const R22D.E1.SL_e321.entry E1.SL_e321.entry
#r22b_const R22D.E1.SL_e321.N E1.SL_e321.N
#r22b_const R22D.E1.IP_e321.R E1.IP_e321.R
#r22b_const R22D.E1.IP_e321.N E1.IP_e321.N
#r22b_const R22D.E1.IP_e321.VT E1.IP_e321.VT
#r22b_const R22D.E1.IP_e321.DOM E1.IP_e321.DOM
#r22b_const R22D.E1.IP_e321.LB E1.IP_e321.LB
#r22b_const R22D.E1.IP_e321.LBR E1.IP_e321.LBR
#r22b_const R22D.E1.IP_e321.GP E1.IP_e321.GP
#r22b_const R22D.E1.IP_e321.UB E1.IP_e321.UB
#r22b_const R22D.E1.IP_e321.UBR E1.IP_e321.UBR
#r22b_const R22D.E1.IP_e321.Em E1.IP_e321.Em
#r22b_const R22D.E1.IP_e321.GE E1.IP_e321.GE
#r22b_const R22D.E1.IP_e321.EXT E1.IP_e321.EXT
#print axioms R22B.R22D_E1_SL_e321_chunk_eq
#print axioms R22B.R22D_E1_IP_e321_GE_eq
