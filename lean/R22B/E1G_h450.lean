module
public import R22Port.U_3b0b2ceda78c
public import R22B.Cmd
public import R22D.E1G_h450
public import HCap.IP_h450
public import HCap.SL_h450
/-! # R22B.E1G_h450: the module-land copies of the IP `h450` equal the kernel modules `HCap.IP_h450` / `HCap.SL_h450` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h450.chunk E1G.GP_h450.chunk
#r22b_const R22D.E1G.GP_h450.entry E1G.GP_h450.entry
#r22b_const R22D.E1G.GP_h450.N E1G.GP_h450.N
#r22b_const R22D.E1G.SL_h450.chunk E1G.SL_h450.chunk
#r22b_const R22D.E1G.SL_h450.entry E1G.SL_h450.entry
#r22b_const R22D.E1G.SL_h450.N E1G.SL_h450.N
#r22b_const R22D.E1G.IP_h450.R E1G.IP_h450.R
#r22b_const R22D.E1G.IP_h450.N E1G.IP_h450.N
#r22b_const R22D.E1G.IP_h450.VT E1G.IP_h450.VT
#r22b_const R22D.E1G.IP_h450.DOM E1G.IP_h450.DOM
#r22b_const R22D.E1G.IP_h450.LB E1G.IP_h450.LB
#r22b_const R22D.E1G.IP_h450.LBR E1G.IP_h450.LBR
#r22b_const R22D.E1G.IP_h450.UB E1G.IP_h450.UB
#r22b_const R22D.E1G.IP_h450.UBR E1G.IP_h450.UBR
#r22b_const R22D.E1G.IP_h450.EXT E1G.IP_h450.EXT
#r22b_const R22D.E1G.IP_h450.Em E1G.IP_h450.Em
#r22b_const R22D.E1G.IP_h450.GE E1G.IP_h450.GE
#print axioms R22B.R22D_E1G_SL_h450_chunk_eq
#print axioms R22B.R22D_E1G_IP_h450_GE_eq
