module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S216_C0
public import L5.t.E236S216_C1
public import L5.t.E236S216_C2
public import L5.t.E236S216_C3
public import L5.t.E236S216_C4
public import L5.t.E236S216_C5
public import L5.t.E236S216_C6
public import L5.t.E236S216_C7
public import L5.t.E236S216_C8
public import L5.t.E236S216_C9
public import L5.t.E236S216_C10
public import L5.t.E236S216_C11
public import L5.t.E236S216_C12
public import L5.t.E236S216_C13
public import L5.t.E236S216_C14
public import L5.t.E236S216_C15
public import L5.t.E236S216_C16
public import L5.t.E236S216_C17
public import L5.t.E236S216_C18
public import L5.t.E236S216_C19
public import L5.t.E236S216_C20
public import L5.t.E236S216_C21
public import L5.t.E236S216_C22
public import L5.t.E236S216_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S216
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1032 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1032 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 16 1 m0 78 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 17 8 m0 1031 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 25 10 m0 1031 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 35 6 m0 1031 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 41 1 m0 1031 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 42 24 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 130 m0 = true :=
    chunkT_join _ _ _ 0 66 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 130 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 194 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 322 m0 = true :=
    chunkT_join _ _ _ 0 258 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 322 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 450 m0 = true :=
    chunkT_join _ _ _ 0 386 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 514 m0 = true :=
    chunkT_join _ _ _ 0 450 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 578 m0 = true :=
    chunkT_join _ _ _ 0 514 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 642 m0 = true :=
    chunkT_join _ _ _ 0 578 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 706 m0 = true :=
    chunkT_join _ _ _ 0 642 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 770 m0 = true :=
    chunkT_join _ _ _ 0 706 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 834 m0 = true :=
    chunkT_join _ _ _ 0 770 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 898 m0 = true :=
    chunkT_join _ _ _ 0 834 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 962 m0 = true :=
    chunkT_join _ _ _ 0 898 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1026 m0 = true :=
    chunkT_join _ _ _ 0 962 64 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1032 m0 = true :=
    chunkT_join _ _ _ 0 1026 6 m0 1032 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  exact h22
/-- **the leaf has no decomposition** (nested split leaf: main record and 1032 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S216
#print axioms E236S216.leaf
