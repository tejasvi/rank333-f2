module
public import R22Port.U_c660751873af
public import R22B.Cmd
public import R22D.E1G_h465
public import HCap.IP_h465
public import HCap.SL_h465
/-! # R22B.E1G_h465: the module-land copies of the IP `h465` equal the kernel modules `HCap.IP_h465` / `HCap.SL_h465` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h465.chunk E1G.GP_h465.chunk
#r22b_const R22D.E1G.GP_h465.entry E1G.GP_h465.entry
#r22b_const R22D.E1G.GP_h465.N E1G.GP_h465.N
#r22b_const R22D.E1G.SL_h465.chunk E1G.SL_h465.chunk
#r22b_const R22D.E1G.SL_h465.entry E1G.SL_h465.entry
#r22b_const R22D.E1G.SL_h465.N E1G.SL_h465.N
#r22b_const R22D.E1G.IP_h465.R E1G.IP_h465.R
#r22b_const R22D.E1G.IP_h465.N E1G.IP_h465.N
#r22b_const R22D.E1G.IP_h465.VT E1G.IP_h465.VT
#r22b_const R22D.E1G.IP_h465.DOM E1G.IP_h465.DOM
#r22b_const R22D.E1G.IP_h465.LB E1G.IP_h465.LB
#r22b_const R22D.E1G.IP_h465.LBR E1G.IP_h465.LBR
#r22b_const R22D.E1G.IP_h465.UB E1G.IP_h465.UB
#r22b_const R22D.E1G.IP_h465.UBR E1G.IP_h465.UBR
#r22b_const R22D.E1G.IP_h465.EXT E1G.IP_h465.EXT
#r22b_const R22D.E1G.IP_h465.Em E1G.IP_h465.Em
#r22b_const R22D.E1G.IP_h465.GE E1G.IP_h465.GE
#print axioms R22B.R22D_E1G_SL_h465_chunk_eq
#print axioms R22B.R22D_E1G_IP_h465_GE_eq
