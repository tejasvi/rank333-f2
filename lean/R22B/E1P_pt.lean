module
public import R22Port.U_10d178d90cda
public import R22B.Cmd
public import R22D.E1P_pt
public import E1P.IP_pt
public import E1P.SL_pt
/-! # R22B.E1P_pt: the module-land point-IP copies equal the kernel track's (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1P.SL_pt.chunk E1P.SL_pt.chunk
#r22b_const R22D.E1P.SL_pt.entry E1P.SL_pt.entry
#r22b_const R22D.E1P.SL_pt.N E1P.SL_pt.N
#r22b_const R22D.E1P.GP_pt.chunk E1P.GP_pt.chunk
#r22b_const R22D.E1P.GP_pt.entry E1P.GP_pt.entry
#r22b_const R22D.E1P.GP_pt.N E1P.GP_pt.N
#r22b_const R22D.E1P.IP_pt.R E1P.IP_pt.R
#r22b_const R22D.E1P.IP_pt.N E1P.IP_pt.N
#r22b_const R22D.E1P.IP_pt.VT E1P.IP_pt.VT
#r22b_const R22D.E1P.IP_pt.DOM E1P.IP_pt.DOM
#r22b_const R22D.E1P.IP_pt.LB E1P.IP_pt.LB
#r22b_const R22D.E1P.IP_pt.LBR E1P.IP_pt.LBR
#r22b_const R22D.E1P.IP_pt.UB E1P.IP_pt.UB
#r22b_const R22D.E1P.IP_pt.UBR E1P.IP_pt.UBR
#r22b_const R22D.E1P.IP_pt.Em E1P.IP_pt.Em
#r22b_const R22D.E1P.IP_pt.GE E1P.IP_pt.GE
#print axioms R22B.R22D_E1P_SL_pt_chunk_eq
