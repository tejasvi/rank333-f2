module
public import R22Port.U_5e93676a9d76
public import R22B.Cmd
public import R22D.E1G_h451
public import HCap.IP_h451
public import HCap.SL_h451
/-! # R22B.E1G_h451: the module-land copies of the IP `h451` equal the kernel modules `HCap.IP_h451` / `HCap.SL_h451` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h451.chunk E1G.GP_h451.chunk
#r22b_const R22D.E1G.GP_h451.entry E1G.GP_h451.entry
#r22b_const R22D.E1G.GP_h451.N E1G.GP_h451.N
#r22b_const R22D.E1G.SL_h451.chunk E1G.SL_h451.chunk
#r22b_const R22D.E1G.SL_h451.entry E1G.SL_h451.entry
#r22b_const R22D.E1G.SL_h451.N E1G.SL_h451.N
#r22b_const R22D.E1G.IP_h451.R E1G.IP_h451.R
#r22b_const R22D.E1G.IP_h451.N E1G.IP_h451.N
#r22b_const R22D.E1G.IP_h451.VT E1G.IP_h451.VT
#r22b_const R22D.E1G.IP_h451.DOM E1G.IP_h451.DOM
#r22b_const R22D.E1G.IP_h451.LB E1G.IP_h451.LB
#r22b_const R22D.E1G.IP_h451.LBR E1G.IP_h451.LBR
#r22b_const R22D.E1G.IP_h451.UB E1G.IP_h451.UB
#r22b_const R22D.E1G.IP_h451.UBR E1G.IP_h451.UBR
#r22b_const R22D.E1G.IP_h451.EXT E1G.IP_h451.EXT
#r22b_const R22D.E1G.IP_h451.Em E1G.IP_h451.Em
#r22b_const R22D.E1G.IP_h451.GE E1G.IP_h451.GE
#print axioms R22B.R22D_E1G_SL_h451_chunk_eq
#print axioms R22B.R22D_E1G_IP_h451_GE_eq
