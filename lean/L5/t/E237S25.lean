module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S25_C0
public import L5.t.E237S25_C1
public import L5.t.E237S25_C2
public import L5.t.E237S25_C3
public import L5.t.E237S25_C4
public import L5.t.E237S25_C5
public import L5.t.E237S25_C6
public import L5.t.E237S25_C7
public import L5.t.E237S25_C8
public import L5.t.E237S25_C9
public import L5.t.E237S25_C10
public import L5.t.E237S25_C11
public import L5.t.E237S25_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E237S25
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 169 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 169 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 169 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 2 2 m0 169 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 4 9 m0 169 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 13 5 m0 169 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 18 14 m0 169 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 32 3 m0 169 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 35 1 m0 169 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 36 10 m0 169 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 46 57 m0 169 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 167 m0 = true :=
    chunkT_join _ _ _ 0 103 64 m0 169 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 169 m0 = true :=
    chunkT_join _ _ _ 0 167 2 m0 169 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  exact h11
/-- **the leaf has no decomposition** (nested split leaf: main record and 169 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E237S25
#print axioms E237S25.leaf
