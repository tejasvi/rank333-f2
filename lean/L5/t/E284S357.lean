module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S357_C0
public import L5.t.E284S357_C1
public import L5.t.E284S357_C2
public import L5.t.E284S357_C3
public import L5.t.E284S357_C4
public import L5.t.E284S357_C5
public import L5.t.E284S357_C6
public import L5.t.E284S357_C7
public import L5.t.E284S357_C8
public import L5.t.E284S357_C9
public import L5.t.E284S357_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S357
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 208 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 10 13 m0 208 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 23 23 m0 208 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 46 27 m0 208 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 73 26 m0 208 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 99 20 m0 208 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 148 m0 = true :=
    chunkT_join _ _ _ 0 119 29 m0 208 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 177 m0 = true :=
    chunkT_join _ _ _ 0 148 29 m0 208 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 177 26 m0 208 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 203 5 m0 208 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  exact h9
/-- **the leaf has no decomposition** (nested split leaf: main record and 208 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S357
#print axioms E284S357.leaf
