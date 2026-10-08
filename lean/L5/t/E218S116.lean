module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S116_C0
public import L5.t.E218S116_C1
public import L5.t.E218S116_C2
public import L5.t.E218S116_C3
public import L5.t.E218S116_C4
public import L5.t.E218S116_C5
public import L5.t.E218S116_C6
public import L5.t.E218S116_C7
public import L5.t.E218S116_C8
public import L5.t.E218S116_C9
public import L5.t.E218S116_C10
public import L5.t.E218S116_C11
public import L5.t.E218S116_C12
public import L5.t.E218S116_C13
public import L5.t.E218S116_C14
public import L5.t.E218S116_C15
public import L5.t.E218S116_C16
public import L5.t.E218S116_C17
public import L5.t.E218S116_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S116
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 219 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 219 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 9 19 m0 219 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 219 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 29 2 m0 219 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 31 2 m0 219 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 33 2 m0 219 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 35 3 m0 219 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 38 8 m0 219 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 46 1 m0 219 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 47 4 m0 219 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 51 4 m0 219 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 55 28 m0 219 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 83 25 m0 219 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 126 m0 = true :=
    chunkT_join _ _ _ 0 108 18 m0 219 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 143 m0 = true :=
    chunkT_join _ _ _ 0 126 17 m0 219 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 143 30 m0 219 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 173 33 m0 219 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 219 m0 = true :=
    chunkT_join _ _ _ 0 206 13 m0 219 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 219 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S116
#print axioms E218S116.leaf
