module
public import R22Port.U_8362200454e6
public import R22B.Cmd
public import R22D.E1G_h420
public import HCap.IP_h420
public import HCap.SL_h420
/-! # R22B.E1G_h420: the module-land copies of the IP `h420` equal the kernel modules `HCap.IP_h420` / `HCap.SL_h420` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h420.chunk E1G.GP_h420.chunk
#r22b_const R22D.E1G.GP_h420.entry E1G.GP_h420.entry
#r22b_const R22D.E1G.GP_h420.N E1G.GP_h420.N
#r22b_const R22D.E1G.SL_h420.chunk E1G.SL_h420.chunk
#r22b_const R22D.E1G.SL_h420.entry E1G.SL_h420.entry
#r22b_const R22D.E1G.SL_h420.N E1G.SL_h420.N
#r22b_const R22D.E1G.IP_h420.R E1G.IP_h420.R
#r22b_const R22D.E1G.IP_h420.N E1G.IP_h420.N
#r22b_const R22D.E1G.IP_h420.VT E1G.IP_h420.VT
#r22b_const R22D.E1G.IP_h420.DOM E1G.IP_h420.DOM
#r22b_const R22D.E1G.IP_h420.LB E1G.IP_h420.LB
#r22b_const R22D.E1G.IP_h420.LBR E1G.IP_h420.LBR
#r22b_const R22D.E1G.IP_h420.UB E1G.IP_h420.UB
#r22b_const R22D.E1G.IP_h420.UBR E1G.IP_h420.UBR
#r22b_const R22D.E1G.IP_h420.EXT E1G.IP_h420.EXT
#r22b_const R22D.E1G.IP_h420.Em E1G.IP_h420.Em
#r22b_const R22D.E1G.IP_h420.GE E1G.IP_h420.GE
#print axioms R22B.R22D_E1G_SL_h420_chunk_eq
#print axioms R22B.R22D_E1G_IP_h420_GE_eq
