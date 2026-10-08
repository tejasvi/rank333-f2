module
public import R22Port.U_8f9fce12691f
public import R22B.Cmd
public import R22D.E1G_h485
public import HCap.IP_h485
public import HCap.SL_h485
/-! # R22B.E1G_h485: the module-land copies of the IP `h485` equal the kernel modules `HCap.IP_h485` / `HCap.SL_h485` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1G.GP_h485.chunk E1G.GP_h485.chunk
#r22b_const R22D.E1G.GP_h485.entry E1G.GP_h485.entry
#r22b_const R22D.E1G.GP_h485.N E1G.GP_h485.N
#r22b_const R22D.E1G.SL_h485.chunk E1G.SL_h485.chunk
#r22b_const R22D.E1G.SL_h485.entry E1G.SL_h485.entry
#r22b_const R22D.E1G.SL_h485.N E1G.SL_h485.N
#r22b_const R22D.E1G.IP_h485.R E1G.IP_h485.R
#r22b_const R22D.E1G.IP_h485.N E1G.IP_h485.N
#r22b_const R22D.E1G.IP_h485.VT E1G.IP_h485.VT
#r22b_const R22D.E1G.IP_h485.DOM E1G.IP_h485.DOM
#r22b_const R22D.E1G.IP_h485.LB E1G.IP_h485.LB
#r22b_const R22D.E1G.IP_h485.LBR E1G.IP_h485.LBR
#r22b_const R22D.E1G.IP_h485.UB E1G.IP_h485.UB
#r22b_const R22D.E1G.IP_h485.UBR E1G.IP_h485.UBR
#r22b_const R22D.E1G.IP_h485.EXT E1G.IP_h485.EXT
#r22b_const R22D.E1G.IP_h485.Em E1G.IP_h485.Em
#r22b_const R22D.E1G.IP_h485.GE E1G.IP_h485.GE
#print axioms R22B.R22D_E1G_SL_h485_chunk_eq
#print axioms R22B.R22D_E1G_IP_h485_GE_eq
