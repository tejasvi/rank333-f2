module
public import R22Port.U_164aa92d13db
public import R22B.Cmd
public import R22D.E1G_h463
public import HCap.IP_h463
public import HCap.SL_h463
/-! # R22B.E1G_h463: the module-land copies of the IP `h463` equal the kernel modules `HCap.IP_h463` / `HCap.SL_h463` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h463.chunk E1G.GP_h463.chunk
#r22b_const R22D.E1G.GP_h463.entry E1G.GP_h463.entry
#r22b_const R22D.E1G.GP_h463.N E1G.GP_h463.N
#r22b_const R22D.E1G.SL_h463.chunk E1G.SL_h463.chunk
#r22b_const R22D.E1G.SL_h463.entry E1G.SL_h463.entry
#r22b_const R22D.E1G.SL_h463.N E1G.SL_h463.N
#r22b_const R22D.E1G.IP_h463.R E1G.IP_h463.R
#r22b_const R22D.E1G.IP_h463.N E1G.IP_h463.N
#r22b_const R22D.E1G.IP_h463.VT E1G.IP_h463.VT
#r22b_const R22D.E1G.IP_h463.DOM E1G.IP_h463.DOM
#r22b_const R22D.E1G.IP_h463.LB E1G.IP_h463.LB
#r22b_const R22D.E1G.IP_h463.LBR E1G.IP_h463.LBR
#r22b_const R22D.E1G.IP_h463.UB E1G.IP_h463.UB
#r22b_const R22D.E1G.IP_h463.UBR E1G.IP_h463.UBR
#r22b_const R22D.E1G.IP_h463.EXT E1G.IP_h463.EXT
#r22b_const R22D.E1G.IP_h463.Em E1G.IP_h463.Em
#r22b_const R22D.E1G.IP_h463.GE E1G.IP_h463.GE
#print axioms R22B.R22D_E1G_SL_h463_chunk_eq
#print axioms R22B.R22D_E1G_IP_h463_GE_eq
