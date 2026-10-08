module
public meta import R22D.Load
public import R22N.Rec
@[expose] public section
-- loaders add thousands of declarations: synchronous elaboration is linear (async: 3-5x CPU and memory, superlinear)
set_option Elab.async false
/-! `R22D.c2t_<l>`, `R22D.CONF1T`, `R22D.c2tN`: copies of `L1.T.c2t_<l>`, `L1.T.CONF1T` (R3RT.TabC3eD), same file. -/
#r22d_l1tables "data/lean/48752ee91aa3a82f686338f91f508896/C3eD.c2t"
