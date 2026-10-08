module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S4_C0
public import L5.t.E284S4_C1
public import L5.t.E284S4_C2
public import L5.t.E284S4_C3
public import L5.t.E284S4_C4
public import L5.t.E284S4_C5
public import L5.t.E284S4_C6
public import L5.t.E284S4_C7
public import L5.t.E284S4_C8
public import L5.t.E284S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S4
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 443 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 443 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 443 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 128 64 m0 443 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 192 13 m0 443 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 227 m0 = true :=
    chunkT_join _ _ _ 0 205 22 m0 443 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 267 m0 = true :=
    chunkT_join _ _ _ 0 227 40 m0 443 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 331 m0 = true :=
    chunkT_join _ _ _ 0 267 64 m0 443 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 395 m0 = true :=
    chunkT_join _ _ _ 0 331 64 m0 443 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 443 m0 = true :=
    chunkT_join _ _ _ 0 395 48 m0 443 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  exact h8
/-- **the leaf has no decomposition** (nested split leaf: main record and 443 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S4
#print axioms E284S4.leaf
