module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S318_C0
public import L5.t.E284S318_C1
public import L5.t.E284S318_C2
public import L5.t.E284S318_C3
public import L5.t.E284S318_C4
public import L5.t.E284S318_C5
public import L5.t.E284S318_C6
public import L5.t.E284S318_C7
public import L5.t.E284S318_C8
public import L5.t.E284S318_C9
public import L5.t.E284S318_C10
public import L5.t.E284S318_C11
public import L5.t.E284S318_C12
public import L5.t.E284S318_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S318
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 483 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 483 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 38 15 m0 459 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 53 1 m0 459 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 54 26 m0 471 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 144 m0 = true :=
    chunkT_join _ _ _ 0 80 64 m0 471 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 145 m0 = true :=
    chunkT_join _ _ _ 0 144 1 m0 471 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 171 m0 = true :=
    chunkT_join _ _ _ 0 145 26 m0 483 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 235 m0 = true :=
    chunkT_join _ _ _ 0 171 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 299 m0 = true :=
    chunkT_join _ _ _ 0 235 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 322 m0 = true :=
    chunkT_join _ _ _ 0 299 23 m0 483 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 322 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 450 m0 = true :=
    chunkT_join _ _ _ 0 386 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 483 m0 = true :=
    chunkT_join _ _ _ 0 450 33 m0 483 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  exact h12
/-- **the leaf has no decomposition** (nested split leaf: main record and 483 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S318
#print axioms E284S318.leaf
