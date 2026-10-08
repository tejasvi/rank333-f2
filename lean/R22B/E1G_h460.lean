module
public import R22Port.U_222a87406cb9
public import R22B.Cmd
public import R22D.E1G_h460
public import HCap.IP_h460
public import HCap.SL_h460
/-! # R22B.E1G_h460: the module-land copies of the IP `h460` equal the kernel modules `HCap.IP_h460` / `HCap.SL_h460` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h460.chunk E1G.GP_h460.chunk
#r22b_const R22D.E1G.GP_h460.entry E1G.GP_h460.entry
#r22b_const R22D.E1G.GP_h460.N E1G.GP_h460.N
#r22b_const R22D.E1G.SL_h460.chunk E1G.SL_h460.chunk
#r22b_const R22D.E1G.SL_h460.entry E1G.SL_h460.entry
#r22b_const R22D.E1G.SL_h460.N E1G.SL_h460.N
#r22b_const R22D.E1G.IP_h460.R E1G.IP_h460.R
#r22b_const R22D.E1G.IP_h460.N E1G.IP_h460.N
#r22b_const R22D.E1G.IP_h460.VT E1G.IP_h460.VT
#r22b_const R22D.E1G.IP_h460.DOM E1G.IP_h460.DOM
#r22b_const R22D.E1G.IP_h460.LB E1G.IP_h460.LB
#r22b_const R22D.E1G.IP_h460.LBR E1G.IP_h460.LBR
#r22b_const R22D.E1G.IP_h460.UB E1G.IP_h460.UB
#r22b_const R22D.E1G.IP_h460.UBR E1G.IP_h460.UBR
#r22b_const R22D.E1G.IP_h460.EXT E1G.IP_h460.EXT
#r22b_const R22D.E1G.IP_h460.Em E1G.IP_h460.Em
#r22b_const R22D.E1G.IP_h460.GE E1G.IP_h460.GE
#print axioms R22B.R22D_E1G_SL_h460_chunk_eq
#print axioms R22B.R22D_E1G_IP_h460_GE_eq
