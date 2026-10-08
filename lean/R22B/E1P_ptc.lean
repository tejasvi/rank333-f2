module
public import R22Port.U_18dce691910c
public import R22B.Cmd
public import R22D.E1P_ptc
public import HPt.IP_ptc
public import HPt.SL_ptc
/-! # R22B.E1P_ptc: the module-land copies of the IP `ptc` equal the kernel modules `HPt.IP_ptc` / `HPt.SL_ptc` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1P.GP_ptc.chunk E1P.GP_ptc.chunk
#r22b_const R22D.E1P.GP_ptc.entry E1P.GP_ptc.entry
#r22b_const R22D.E1P.GP_ptc.N E1P.GP_ptc.N
#r22b_const R22D.E1P.SL_ptc.chunk E1P.SL_ptc.chunk
#r22b_const R22D.E1P.SL_ptc.entry E1P.SL_ptc.entry
#r22b_const R22D.E1P.SL_ptc.N E1P.SL_ptc.N
#r22b_const R22D.E1P.IP_ptc.R E1P.IP_ptc.R
#r22b_const R22D.E1P.IP_ptc.N E1P.IP_ptc.N
#r22b_const R22D.E1P.IP_ptc.VT E1P.IP_ptc.VT
#r22b_const R22D.E1P.IP_ptc.DOM E1P.IP_ptc.DOM
#r22b_const R22D.E1P.IP_ptc.LB E1P.IP_ptc.LB
#r22b_const R22D.E1P.IP_ptc.LBR E1P.IP_ptc.LBR
#r22b_const R22D.E1P.IP_ptc.UB E1P.IP_ptc.UB
#r22b_const R22D.E1P.IP_ptc.UBR E1P.IP_ptc.UBR
#r22b_const R22D.E1P.IP_ptc.Em E1P.IP_ptc.Em
#r22b_const R22D.E1P.IP_ptc.GE E1P.IP_ptc.GE
#print axioms R22B.R22D_E1P_SL_ptc_chunk_eq
#print axioms R22B.R22D_E1P_IP_ptc_GE_eq
