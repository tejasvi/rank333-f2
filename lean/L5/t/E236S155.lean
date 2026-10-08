module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S155_C0
public import L5.t.E236S155_C1
public import L5.t.E236S155_C2
public import L5.t.E236S155_C3
public import L5.t.E236S155_C4
public import L5.t.E236S155_C5
public import L5.t.E236S155_C6
public import L5.t.E236S155_C7
public import L5.t.E236S155_C8
public import L5.t.E236S155_C9
public import L5.t.E236S155_C10
public import L5.t.E236S155_C11
public import L5.t.E236S155_C12
public import L5.t.E236S155_C13
public import L5.t.E236S155_C14
public import L5.t.E236S155_C15
public import L5.t.E236S155_C16
public import L5.t.E236S155_C17
public import L5.t.E236S155_C18
public import L5.t.E236S155_C19
public import L5.t.E236S155_C20
public import L5.t.E236S155_C21
public import L5.t.E236S155_C22
public import L5.t.E236S155_C23
public import L5.t.E236S155_C24
public import L5.t.E236S155_C25
public import L5.t.E236S155_C26
public import L5.t.E236S155_C27
public import L5.t.E236S155_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S155
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1231 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1231 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 89 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 839 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 839 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 4 6 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 10 8 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 18 9 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 27 13 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 40 33 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 136 m0 = true :=
    chunkT_join _ _ _ 0 73 63 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 136 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 264 m0 = true :=
    chunkT_join _ _ _ 0 200 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 328 m0 = true :=
    chunkT_join _ _ _ 0 264 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 392 m0 = true :=
    chunkT_join _ _ _ 0 328 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 456 m0 = true :=
    chunkT_join _ _ _ 0 392 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 520 m0 = true :=
    chunkT_join _ _ _ 0 456 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 584 m0 = true :=
    chunkT_join _ _ _ 0 520 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 648 m0 = true :=
    chunkT_join _ _ _ 0 584 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 712 m0 = true :=
    chunkT_join _ _ _ 0 648 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 776 m0 = true :=
    chunkT_join _ _ _ 0 712 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 840 m0 = true :=
    chunkT_join _ _ _ 0 776 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 904 m0 = true :=
    chunkT_join _ _ _ 0 840 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 968 m0 = true :=
    chunkT_join _ _ _ 0 904 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1032 m0 = true :=
    chunkT_join _ _ _ 0 968 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1096 m0 = true :=
    chunkT_join _ _ _ 0 1032 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1160 m0 = true :=
    chunkT_join _ _ _ 0 1096 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1224 m0 = true :=
    chunkT_join _ _ _ 0 1160 64 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1231 m0 = true :=
    chunkT_join _ _ _ 0 1224 7 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  exact h27
/-- **the leaf has no decomposition** (nested split leaf: main record and 1231 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S155
#print axioms E236S155.leaf
