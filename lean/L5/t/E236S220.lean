module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S220_C0
public import L5.t.E236S220_C1
public import L5.t.E236S220_C2
public import L5.t.E236S220_C3
public import L5.t.E236S220_C4
public import L5.t.E236S220_C5
public import L5.t.E236S220_C6
public import L5.t.E236S220_C7
public import L5.t.E236S220_C8
public import L5.t.E236S220_C9
public import L5.t.E236S220_C10
public import L5.t.E236S220_C11
public import L5.t.E236S220_C12
public import L5.t.E236S220_C13
public import L5.t.E236S220_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S220
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 549 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 549 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 1 18 m0 328 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 19 1 m0 328 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 20 17 m0 466 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 37 1 m0 466 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 38 12 m0 549 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 50 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 114 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 242 m0 = true :=
    chunkT_join _ _ _ 0 178 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 306 m0 = true :=
    chunkT_join _ _ _ 0 242 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 370 m0 = true :=
    chunkT_join _ _ _ 0 306 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 370 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 498 m0 = true :=
    chunkT_join _ _ _ 0 434 64 m0 549 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 549 m0 = true :=
    chunkT_join _ _ _ 0 498 51 m0 549 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  exact h13
/-- **the leaf has no decomposition** (nested split leaf: main record and 549 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S220
#print axioms E236S220.leaf
