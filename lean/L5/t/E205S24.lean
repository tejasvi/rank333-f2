module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S24_C0
public import L5.t.E205S24_C1
public import L5.t.E205S24_C2
public import L5.t.E205S24_C3
public import L5.t.E205S24_C4
public import L5.t.E205S24_C5
public import L5.t.E205S24_C6
public import L5.t.E205S24_C7
public import L5.t.E205S24_C8
public import L5.t.E205S24_C9
public import L5.t.E205S24_C10
public import L5.t.E205S24_C11
public import L5.t.E205S24_C12
public import L5.t.E205S24_C13
public import L5.t.E205S24_C14
public import L5.t.E205S24_C15
public import L5.t.E205S24_C16
public import L5.t.E205S24_C17
public import L5.t.E205S24_C18
public import L5.t.E205S24_C19
public import L5.t.E205S24_C20
public import L5.t.E205S24_C21
public import L5.t.E205S24_C22
public import L5.t.E205S24_C23
public import L5.t.E205S24_C24
public import L5.t.E205S24_C25
public import L5.t.E205S24_C26
public import L5.t.E205S24_C27
public import L5.t.E205S24_C28
public import L5.t.E205S24_C29
public import L5.t.E205S24_C30
public import L5.t.E205S24_C31
public import L5.t.E205S24_C32
public import L5.t.E205S24_C33
public import L5.t.E205S24_C34
public import L5.t.E205S24_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E205S24
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1068 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1068 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 47 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 626 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 4 1 m0 626 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 6 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 7 2 m0 845 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 9 6 m0 845 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 15 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 16 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 17 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 18 1 m0 845 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 19 4 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 23 2 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 25 5 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 30 2 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 32 5 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 37 4 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 41 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 169 m0 = true :=
    chunkT_join _ _ _ 0 105 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 233 m0 = true :=
    chunkT_join _ _ _ 0 169 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 233 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 361 m0 = true :=
    chunkT_join _ _ _ 0 297 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 425 m0 = true :=
    chunkT_join _ _ _ 0 361 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 489 m0 = true :=
    chunkT_join _ _ _ 0 425 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 553 m0 = true :=
    chunkT_join _ _ _ 0 489 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 617 m0 = true :=
    chunkT_join _ _ _ 0 553 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 681 m0 = true :=
    chunkT_join _ _ _ 0 617 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 745 m0 = true :=
    chunkT_join _ _ _ 0 681 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 809 m0 = true :=
    chunkT_join _ _ _ 0 745 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 873 m0 = true :=
    chunkT_join _ _ _ 0 809 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 937 m0 = true :=
    chunkT_join _ _ _ 0 873 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1001 m0 = true :=
    chunkT_join _ _ _ 0 937 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1065 m0 = true :=
    chunkT_join _ _ _ 0 1001 64 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1068 m0 = true :=
    chunkT_join _ _ _ 0 1065 3 m0 1068 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  exact h34
/-- **the leaf has no decomposition** (nested split leaf: main record and 1068 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E205S24
#print axioms E205S24.leaf
