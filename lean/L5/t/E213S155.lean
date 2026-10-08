module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S155_C0
public import L5.t.E213S155_C1
public import L5.t.E213S155_C2
public import L5.t.E213S155_C3
public import L5.t.E213S155_C4
public import L5.t.E213S155_C5
public import L5.t.E213S155_C6
public import L5.t.E213S155_C7
public import L5.t.E213S155_C8
public import L5.t.E213S155_C9
public import L5.t.E213S155_C10
public import L5.t.E213S155_C11
public import L5.t.E213S155_C12
public import L5.t.E213S155_C13
public import L5.t.E213S155_C14
public import L5.t.E213S155_C15
public import L5.t.E213S155_C16
public import L5.t.E213S155_C17
public import L5.t.E213S155_C18
public import L5.t.E213S155_C19
public import L5.t.E213S155_C20
public import L5.t.E213S155_C21
public import L5.t.E213S155_C22
public import L5.t.E213S155_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S155
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 958 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 958 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 25 27 m0 958 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 52 23 m0 958 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 139 m0 = true :=
    chunkT_join _ _ _ 0 75 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 139 22 m0 958 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 161 37 m0 958 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 198 3 m0 958 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 220 m0 = true :=
    chunkT_join _ _ _ 0 201 19 m0 958 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 220 33 m0 958 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 317 m0 = true :=
    chunkT_join _ _ _ 0 253 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 317 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 381 22 m0 958 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 418 m0 = true :=
    chunkT_join _ _ _ 0 403 15 m0 958 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 449 m0 = true :=
    chunkT_join _ _ _ 0 418 31 m0 958 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 471 m0 = true :=
    chunkT_join _ _ _ 0 449 22 m0 958 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 512 m0 = true :=
    chunkT_join _ _ _ 0 471 41 m0 958 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 576 m0 = true :=
    chunkT_join _ _ _ 0 512 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 640 m0 = true :=
    chunkT_join _ _ _ 0 576 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 704 m0 = true :=
    chunkT_join _ _ _ 0 640 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 768 m0 = true :=
    chunkT_join _ _ _ 0 704 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 832 m0 = true :=
    chunkT_join _ _ _ 0 768 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 896 m0 = true :=
    chunkT_join _ _ _ 0 832 64 m0 958 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 958 m0 = true :=
    chunkT_join _ _ _ 0 896 62 m0 958 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  exact h22
/-- **the leaf has no decomposition** (nested split leaf: main record and 958 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S155
#print axioms E213S155.leaf
