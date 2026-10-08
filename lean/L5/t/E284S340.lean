module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S340_C0
public import L5.t.E284S340_C1
public import L5.t.E284S340_C2
public import L5.t.E284S340_C3
public import L5.t.E284S340_C4
public import L5.t.E284S340_C5
public import L5.t.E284S340_C6
public import L5.t.E284S340_C7
public import L5.t.E284S340_C8
public import L5.t.E284S340_C9
public import L5.t.E284S340_C10
public import L5.t.E284S340_C11
public import L5.t.E284S340_C12
public import L5.t.E284S340_C13
public import L5.t.E284S340_C14
public import L5.t.E284S340_C15
public import L5.t.E284S340_C16
public import L5.t.E284S340_C17
public import L5.t.E284S340_C18
public import L5.t.E284S340_C19
public import L5.t.E284S340_C20
public import L5.t.E284S340_C21
public import L5.t.E284S340_C22
public import L5.t.E284S340_C23
public import L5.t.E284S340_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S340
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1301 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1301 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 15 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 3 9 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 12 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 140 m0 = true :=
    chunkT_join _ _ _ 0 76 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 204 m0 = true :=
    chunkT_join _ _ _ 0 140 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 268 m0 = true :=
    chunkT_join _ _ _ 0 204 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 332 m0 = true :=
    chunkT_join _ _ _ 0 268 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 396 m0 = true :=
    chunkT_join _ _ _ 0 332 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 460 m0 = true :=
    chunkT_join _ _ _ 0 396 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 524 m0 = true :=
    chunkT_join _ _ _ 0 460 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true :=
    chunkT_join _ _ _ 0 524 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 652 m0 = true :=
    chunkT_join _ _ _ 0 588 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 716 m0 = true :=
    chunkT_join _ _ _ 0 652 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 780 m0 = true :=
    chunkT_join _ _ _ 0 716 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 844 m0 = true :=
    chunkT_join _ _ _ 0 780 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 908 m0 = true :=
    chunkT_join _ _ _ 0 844 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 972 m0 = true :=
    chunkT_join _ _ _ 0 908 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1036 m0 = true :=
    chunkT_join _ _ _ 0 972 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1100 m0 = true :=
    chunkT_join _ _ _ 0 1036 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1164 m0 = true :=
    chunkT_join _ _ _ 0 1100 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1228 m0 = true :=
    chunkT_join _ _ _ 0 1164 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1292 m0 = true :=
    chunkT_join _ _ _ 0 1228 64 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1301 m0 = true :=
    chunkT_join _ _ _ 0 1292 9 m0 1301 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  exact h23
/-- **the leaf has no decomposition** (nested split leaf: main record and 1301 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S340
#print axioms E284S340.leaf
