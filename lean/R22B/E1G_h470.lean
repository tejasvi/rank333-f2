module
public import R22Port.U_89a24ceddaa0
public import R22B.Cmd
public import R22D.E1G_h470
public import HCap.IP_h470
public import HCap.SL_h470
/-! # R22B.E1G_h470: the module-land copies of the IP `h470` equal the kernel modules `HCap.IP_h470` / `HCap.SL_h470` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h470.chunk E1G.GP_h470.chunk
#r22b_const R22D.E1G.GP_h470.entry E1G.GP_h470.entry
#r22b_const R22D.E1G.GP_h470.N E1G.GP_h470.N
#r22b_const R22D.E1G.SL_h470.chunk E1G.SL_h470.chunk
#r22b_const R22D.E1G.SL_h470.entry E1G.SL_h470.entry
#r22b_const R22D.E1G.SL_h470.N E1G.SL_h470.N
#r22b_const R22D.E1G.IP_h470.R E1G.IP_h470.R
#r22b_const R22D.E1G.IP_h470.N E1G.IP_h470.N
#r22b_const R22D.E1G.IP_h470.VT E1G.IP_h470.VT
#r22b_const R22D.E1G.IP_h470.DOM E1G.IP_h470.DOM
#r22b_const R22D.E1G.IP_h470.LB E1G.IP_h470.LB
#r22b_const R22D.E1G.IP_h470.LBR E1G.IP_h470.LBR
#r22b_const R22D.E1G.IP_h470.UB E1G.IP_h470.UB
#r22b_const R22D.E1G.IP_h470.UBR E1G.IP_h470.UBR
#r22b_const R22D.E1G.IP_h470.EXT E1G.IP_h470.EXT
#r22b_const R22D.E1G.IP_h470.Em E1G.IP_h470.Em
#r22b_const R22D.E1G.IP_h470.GE E1G.IP_h470.GE
#print axioms R22B.R22D_E1G_SL_h470_chunk_eq
#print axioms R22B.R22D_E1G_IP_h470_GE_eq
