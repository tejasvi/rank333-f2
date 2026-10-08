module
public import R22Port.U_b337ccc47433
public import R22B.Cmd
public import R22D.E1_e303
public import E1.IP_e303
public import E1.SL_e303
/-! # R22B.E1_e303: the module-land copies of the IP `e303` equal the kernel modules `E1.IP_e303` / `E1.SL_e303` (`rfl`) -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.E1.SL_e303.chunk E1.SL_e303.chunk
#r22b_const R22D.E1.SL_e303.entry E1.SL_e303.entry
#r22b_const R22D.E1.SL_e303.N E1.SL_e303.N
#r22b_const R22D.E1.IP_e303.R E1.IP_e303.R
#r22b_const R22D.E1.IP_e303.N E1.IP_e303.N
#r22b_const R22D.E1.IP_e303.VT E1.IP_e303.VT
#r22b_const R22D.E1.IP_e303.DOM E1.IP_e303.DOM
#r22b_const R22D.E1.IP_e303.LB E1.IP_e303.LB
#r22b_const R22D.E1.IP_e303.LBR E1.IP_e303.LBR
#r22b_const R22D.E1.IP_e303.GP E1.IP_e303.GP
#r22b_const R22D.E1.IP_e303.UB E1.IP_e303.UB
#r22b_const R22D.E1.IP_e303.UBR E1.IP_e303.UBR
#r22b_const R22D.E1.IP_e303.Em E1.IP_e303.Em
#r22b_const R22D.E1.IP_e303.GE E1.IP_e303.GE
#r22b_const R22D.E1.IP_e303.EXT E1.IP_e303.EXT
#print axioms R22B.R22D_E1_SL_e303_chunk_eq
#print axioms R22B.R22D_E1_IP_e303_GE_eq
