module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S31_C0
public import L5.t.E218S31_C1
public import L5.t.E218S31_C2
public import L5.t.E218S31_C3
public import L5.t.E218S31_C4
public import L5.t.E218S31_C5
public import L5.t.E218S31_C6
public import L5.t.E218S31_C7
public import L5.t.E218S31_C8
public import L5.t.E218S31_C9
public import L5.t.E218S31_C10
public import L5.t.E218S31_C11
public import L5.t.E218S31_C12
public import L5.t.E218S31_C13
public import L5.t.E218S31_C14
public import L5.t.E218S31_C15
public import L5.t.E218S31_C16
public import L5.t.E218S31_C17
public import L5.t.E218S31_C18
public import L5.t.E218S31_C19
public import L5.t.E218S31_C20
public import L5.t.E218S31_C21
public import L5.t.E218S31_C22
public import L5.t.E218S31_C23
public import L5.t.E218S31_C24
public import L5.t.E218S31_C25
public import L5.t.E218S31_C26
public import L5.t.E218S31_C27
public import L5.t.E218S31_C28
public import L5.t.E218S31_C29
public import L5.t.E218S31_C30
public import L5.t.E218S31_C31
public import L5.t.E218S31_C32
public import L5.t.E218S31_C33
public import L5.t.E218S31_C34
public import L5.t.E218S31_C35
public import L5.t.E218S31_C36
public import L5.t.E218S31_C37
public import L5.t.E218S31_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S31
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1739 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1739 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 27 41 m0 936 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 68 47 m0 936 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 115 17 m0 936 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 133 m0 = true :=
    chunkT_join _ _ _ 0 132 1 m0 936 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 135 m0 = true :=
    chunkT_join _ _ _ 0 133 2 m0 994 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 136 m0 = true :=
    chunkT_join _ _ _ 0 135 1 m0 994 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 136 14 m0 994 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 153 m0 = true :=
    chunkT_join _ _ _ 0 150 3 m0 994 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 153 8 m0 994 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 161 13 m0 994 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 185 m0 = true :=
    chunkT_join _ _ _ 0 174 11 m0 994 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 249 m0 = true :=
    chunkT_join _ _ _ 0 185 64 m0 994 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 291 m0 = true :=
    chunkT_join _ _ _ 0 249 42 m0 994 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 292 m0 = true :=
    chunkT_join _ _ _ 0 291 1 m0 994 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 337 m0 = true :=
    chunkT_join _ _ _ 0 292 45 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 401 m0 = true :=
    chunkT_join _ _ _ 0 337 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 465 m0 = true :=
    chunkT_join _ _ _ 0 401 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 529 m0 = true :=
    chunkT_join _ _ _ 0 465 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 593 m0 = true :=
    chunkT_join _ _ _ 0 529 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 657 m0 = true :=
    chunkT_join _ _ _ 0 593 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 721 m0 = true :=
    chunkT_join _ _ _ 0 657 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 785 m0 = true :=
    chunkT_join _ _ _ 0 721 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 849 m0 = true :=
    chunkT_join _ _ _ 0 785 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 913 m0 = true :=
    chunkT_join _ _ _ 0 849 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 977 m0 = true :=
    chunkT_join _ _ _ 0 913 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1041 m0 = true :=
    chunkT_join _ _ _ 0 977 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1105 m0 = true :=
    chunkT_join _ _ _ 0 1041 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1169 m0 = true :=
    chunkT_join _ _ _ 0 1105 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1233 m0 = true :=
    chunkT_join _ _ _ 0 1169 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1297 m0 = true :=
    chunkT_join _ _ _ 0 1233 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1361 m0 = true :=
    chunkT_join _ _ _ 0 1297 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1425 m0 = true :=
    chunkT_join _ _ _ 0 1361 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1489 m0 = true :=
    chunkT_join _ _ _ 0 1425 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1553 m0 = true :=
    chunkT_join _ _ _ 0 1489 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1617 m0 = true :=
    chunkT_join _ _ _ 0 1553 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1681 m0 = true :=
    chunkT_join _ _ _ 0 1617 64 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1739 m0 = true :=
    chunkT_join _ _ _ 0 1681 58 m0 1739 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  exact h37
/-- **the leaf has no decomposition** (nested split leaf: main record and 1739 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S31
#print axioms E218S31.leaf
