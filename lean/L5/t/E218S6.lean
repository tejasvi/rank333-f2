module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S6_C0
public import L5.t.E218S6_C1
public import L5.t.E218S6_C2
public import L5.t.E218S6_C3
public import L5.t.E218S6_C4
public import L5.t.E218S6_C5
public import L5.t.E218S6_C6
public import L5.t.E218S6_C7
public import L5.t.E218S6_C8
public import L5.t.E218S6_C9
public import L5.t.E218S6_C10
public import L5.t.E218S6_C11
public import L5.t.E218S6_C12
public import L5.t.E218S6_C13
public import L5.t.E218S6_C14
public import L5.t.E218S6_C15
public import L5.t.E218S6_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S6
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 611 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 611 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 37 47 m0 519 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 84 6 m0 519 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 90 1 m0 519 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 91 23 m0 611 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 169 m0 = true :=
    chunkT_join _ _ _ 0 114 55 m0 611 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 169 3 m0 611 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 172 3 m0 611 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 175 19 m0 611 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 251 m0 = true :=
    chunkT_join _ _ _ 0 194 57 m0 611 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 302 m0 = true :=
    chunkT_join _ _ _ 0 251 51 m0 611 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 366 m0 = true :=
    chunkT_join _ _ _ 0 302 64 m0 611 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 430 m0 = true :=
    chunkT_join _ _ _ 0 366 64 m0 611 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 494 m0 = true :=
    chunkT_join _ _ _ 0 430 64 m0 611 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 558 m0 = true :=
    chunkT_join _ _ _ 0 494 64 m0 611 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 611 m0 = true :=
    chunkT_join _ _ _ 0 558 53 m0 611 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  exact h15
/-- **the leaf has no decomposition** (nested split leaf: main record and 611 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S6
#print axioms E218S6.leaf
