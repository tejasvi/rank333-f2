module
public import R22Port.U_0ddf0e5bb4a4
public import R22B.Cmd
public import R22D.L1Tab
public import R22D.L1Hyp
public import R3RT.TabC3eD
public import L1.HypTables
/-! # R22B.L1: the module-land L1 tables equal the kernel track's (`rfl`, 2,045 theorems) -/
@[expose] public section
#r22b_eqs "c2t" L1.T.c2t 511
#r22b_eqs "CONF1T" L1.T.CONF1T 0
#r22b_eqs "h" L1.T.h 511
#r22b_eqs "suf" L1.T.suf 511
#r22b_arr "c2tN" L1.T.c2t 511
#r22b_arr "hN" L1.T.h 511
#r22b_arr "sufN" L1.T.suf 511
#print axioms R22B.c2t_eq_510
#print axioms R22B.c2tN_eq
#print axioms R22B.suf_eq_0
