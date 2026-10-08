module
public meta import R22D.Load
public import R22N.Rec
@[expose] public section
-- loaders add thousands of declarations: synchronous elaboration is linear (async: 3-5x CPU and memory, superlinear)
set_option Elab.async false
/-! `R22D.h_<l>`, `R22D.suf_<l>`, `R22D.hN`, `R22D.sufN`: copies of `L1.T.h_<l>`, `L1.T.suf_<l>` (L1.HypTables), same file. -/
#r22d_l1hyp "data/lean/005cc84a5d646b05d14573e82a813714/hyp7.bin"
