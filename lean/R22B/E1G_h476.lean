module
public import R22Port.U_bad05220c516
public import R22B.Cmd
public import R22D.E1G_h476
public import HCap.IP_h476
public import HCap.SL_h476
/-! # R22B.E1G_h476: the module-land copies of the IP `h476` equal the kernel modules `HCap.IP_h476` / `HCap.SL_h476` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h476.chunk E1G.GP_h476.chunk
#r22b_const R22D.E1G.GP_h476.entry E1G.GP_h476.entry
#r22b_const R22D.E1G.GP_h476.N E1G.GP_h476.N
#r22b_const R22D.E1G.SL_h476.chunk E1G.SL_h476.chunk
#r22b_const R22D.E1G.SL_h476.entry E1G.SL_h476.entry
#r22b_const R22D.E1G.SL_h476.N E1G.SL_h476.N
#r22b_const R22D.E1G.IP_h476.R E1G.IP_h476.R
#r22b_const R22D.E1G.IP_h476.N E1G.IP_h476.N
#r22b_const R22D.E1G.IP_h476.VT E1G.IP_h476.VT
#r22b_const R22D.E1G.IP_h476.DOM E1G.IP_h476.DOM
#r22b_const R22D.E1G.IP_h476.LB E1G.IP_h476.LB
#r22b_const R22D.E1G.IP_h476.LBR E1G.IP_h476.LBR
#r22b_const R22D.E1G.IP_h476.UB E1G.IP_h476.UB
#r22b_const R22D.E1G.IP_h476.UBR E1G.IP_h476.UBR
#r22b_const R22D.E1G.IP_h476.EXT E1G.IP_h476.EXT
#r22b_const R22D.E1G.IP_h476.Em E1G.IP_h476.Em
#r22b_const R22D.E1G.IP_h476.GE E1G.IP_h476.GE
#print axioms R22B.R22D_E1G_SL_h476_chunk_eq
#print axioms R22B.R22D_E1G_IP_h476_GE_eq
