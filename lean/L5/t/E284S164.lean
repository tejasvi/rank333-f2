module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S164_C0
public import L5.t.E284S164_C1
public import L5.t.E284S164_C2
public import L5.t.E284S164_C3
public import L5.t.E284S164_C4
public import L5.t.E284S164_C5
public import L5.t.E284S164_C6
public import L5.t.E284S164_C7
public import L5.t.E284S164_C8
public import L5.t.E284S164_C9
public import L5.t.E284S164_C10
public import L5.t.E284S164_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S164
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 389 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 9 30 m0 169 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 39 10 m0 169 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 49 1 m0 169 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 50 24 m0 389 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true :=
    chunkT_join _ _ _ 0 74 51 m0 389 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 189 m0 = true :=
    chunkT_join _ _ _ 0 125 64 m0 389 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 189 64 m0 389 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 317 m0 = true :=
    chunkT_join _ _ _ 0 253 64 m0 389 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 317 64 m0 389 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 381 8 m0 389 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  exact h10
/-- **the leaf has no decomposition** (nested split leaf: main record and 389 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S164
#print axioms E284S164.leaf
