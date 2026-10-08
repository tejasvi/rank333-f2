module
public import R22Port.U_fdaacd459f1f
public import R22B.Cmd
public import R22D.E1G_h464
public import HCap.IP_h464
public import HCap.SL_h464
/-! # R22B.E1G_h464: the module-land copies of the IP `h464` equal the kernel modules `HCap.IP_h464` / `HCap.SL_h464` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h464.chunk E1G.GP_h464.chunk
#r22b_const R22D.E1G.GP_h464.entry E1G.GP_h464.entry
#r22b_const R22D.E1G.GP_h464.N E1G.GP_h464.N
#r22b_const R22D.E1G.SL_h464.chunk E1G.SL_h464.chunk
#r22b_const R22D.E1G.SL_h464.entry E1G.SL_h464.entry
#r22b_const R22D.E1G.SL_h464.N E1G.SL_h464.N
#r22b_const R22D.E1G.IP_h464.R E1G.IP_h464.R
#r22b_const R22D.E1G.IP_h464.N E1G.IP_h464.N
#r22b_const R22D.E1G.IP_h464.VT E1G.IP_h464.VT
#r22b_const R22D.E1G.IP_h464.DOM E1G.IP_h464.DOM
#r22b_const R22D.E1G.IP_h464.LB E1G.IP_h464.LB
#r22b_const R22D.E1G.IP_h464.LBR E1G.IP_h464.LBR
#r22b_const R22D.E1G.IP_h464.UB E1G.IP_h464.UB
#r22b_const R22D.E1G.IP_h464.UBR E1G.IP_h464.UBR
#r22b_const R22D.E1G.IP_h464.EXT E1G.IP_h464.EXT
#r22b_const R22D.E1G.IP_h464.Em E1G.IP_h464.Em
#r22b_const R22D.E1G.IP_h464.GE E1G.IP_h464.GE
#print axioms R22B.R22D_E1G_SL_h464_chunk_eq
#print axioms R22B.R22D_E1G_IP_h464_GE_eq
