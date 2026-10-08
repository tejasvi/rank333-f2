module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S179_C0
public import L5.t.E284S179_C1
public import L5.t.E284S179_C2
public import L5.t.E284S179_C3
public import L5.t.E284S179_C4
public import L5.t.E284S179_C5
public import L5.t.E284S179_C6
public import L5.t.E284S179_C7
public import L5.t.E284S179_C8
public import L5.t.E284S179_C9
public import L5.t.E284S179_C10
public import L5.t.E284S179_C11
public import L5.t.E284S179_C12
public import L5.t.E284S179_C13
public import L5.t.E284S179_C14
public import L5.t.E284S179_C15
public import L5.t.E284S179_C16
public import L5.t.E284S179_C17
public import L5.t.E284S179_C18
public import L5.t.E284S179_C19
public import L5.t.E284S179_C20
public import L5.t.E284S179_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S179
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 842 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 38 2 m0 842 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 40 15 m0 842 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 55 12 m0 842 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 97 m0 = true :=
    chunkT_join _ _ _ 0 67 30 m0 842 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 97 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 225 m0 = true :=
    chunkT_join _ _ _ 0 161 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 251 m0 = true :=
    chunkT_join _ _ _ 0 225 26 m0 842 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 251 5 m0 842 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 264 m0 = true :=
    chunkT_join _ _ _ 0 256 8 m0 842 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 287 m0 = true :=
    chunkT_join _ _ _ 0 264 23 m0 842 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 334 m0 = true :=
    chunkT_join _ _ _ 0 287 47 m0 842 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 334 50 m0 842 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 448 m0 = true :=
    chunkT_join _ _ _ 0 384 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 490 m0 = true :=
    chunkT_join _ _ _ 0 448 42 m0 842 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 554 m0 = true :=
    chunkT_join _ _ _ 0 490 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 618 m0 = true :=
    chunkT_join _ _ _ 0 554 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 682 m0 = true :=
    chunkT_join _ _ _ 0 618 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 746 m0 = true :=
    chunkT_join _ _ _ 0 682 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 810 m0 = true :=
    chunkT_join _ _ _ 0 746 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true :=
    chunkT_join _ _ _ 0 810 32 m0 842 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  exact h20
/-- **the leaf has no decomposition** (nested split leaf: main record and 842 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S179
#print axioms E284S179.leaf
