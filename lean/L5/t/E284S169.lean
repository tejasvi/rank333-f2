module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S169_C0
public import L5.t.E284S169_C1
public import L5.t.E284S169_C2
public import L5.t.E284S169_C3
public import L5.t.E284S169_C4
public import L5.t.E284S169_C5
public import L5.t.E284S169_C6
public import L5.t.E284S169_C7
public import L5.t.E284S169_C8
public import L5.t.E284S169_C9
public import L5.t.E284S169_C10
public import L5.t.E284S169_C11
public import L5.t.E284S169_C12
public import L5.t.E284S169_C13
public import L5.t.E284S169_C14
public import L5.t.E284S169_C15
public import L5.t.E284S169_C16
public import L5.t.E284S169_C17
public import L5.t.E284S169_C18
public import L5.t.E284S169_C19
public import L5.t.E284S169_C20
public import L5.t.E284S169_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S169
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 842 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 40 5 m0 842 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 45 5 m0 842 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 50 17 m0 842 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 67 25 m0 842 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 92 54 m0 842 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 146 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 274 m0 = true :=
    chunkT_join _ _ _ 0 210 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 338 m0 = true :=
    chunkT_join _ _ _ 0 274 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 345 m0 = true :=
    chunkT_join _ _ _ 0 338 7 m0 842 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 350 m0 = true :=
    chunkT_join _ _ _ 0 345 5 m0 842 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 363 m0 = true :=
    chunkT_join _ _ _ 0 350 13 m0 842 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 363 18 m0 842 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 445 m0 = true :=
    chunkT_join _ _ _ 0 381 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 506 m0 = true :=
    chunkT_join _ _ _ 0 445 61 m0 842 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 570 m0 = true :=
    chunkT_join _ _ _ 0 506 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 634 m0 = true :=
    chunkT_join _ _ _ 0 570 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 698 m0 = true :=
    chunkT_join _ _ _ 0 634 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 762 m0 = true :=
    chunkT_join _ _ _ 0 698 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 826 m0 = true :=
    chunkT_join _ _ _ 0 762 64 m0 842 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true :=
    chunkT_join _ _ _ 0 826 16 m0 842 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  exact h20
/-- **the leaf has no decomposition** (nested split leaf: main record and 842 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S169
#print axioms E284S169.leaf
