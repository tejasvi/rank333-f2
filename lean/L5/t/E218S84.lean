module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S84_C0
public import L5.t.E218S84_C1
public import L5.t.E218S84_C2
public import L5.t.E218S84_C3
public import L5.t.E218S84_C4
public import L5.t.E218S84_C5
public import L5.t.E218S84_C6
public import L5.t.E218S84_C7
public import L5.t.E218S84_C8
public import L5.t.E218S84_C9
public import L5.t.E218S84_C10
public import L5.t.E218S84_C11
public import L5.t.E218S84_C12
public import L5.t.E218S84_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S84
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 214 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 98 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 13 2 m0 213 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 15 1 m0 213 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 16 13 m0 214 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 29 16 m0 214 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 45 10 m0 214 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 55 2 m0 214 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 57 5 m0 214 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 62 14 m0 214 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 140 m0 = true :=
    chunkT_join _ _ _ 0 76 64 m0 214 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 204 m0 = true :=
    chunkT_join _ _ _ 0 140 64 m0 214 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 204 10 m0 214 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  exact h12
/-- **the leaf has no decomposition** (nested split leaf: main record and 214 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S84
#print axioms E218S84.leaf
