module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S3_C0
public import L5.t.E203S3_C1
public import L5.t.E203S3_C2
public import L5.t.E203S3_C3
public import L5.t.E203S3_C4
public import L5.t.E203S3_C5
public import L5.t.E203S3_C6
public import L5.t.E203S3_C7
public import L5.t.E203S3_C8
public import L5.t.E203S3_C9
public import L5.t.E203S3_C10
public import L5.t.E203S3_C11
public import L5.t.E203S3_C12
public import L5.t.E203S3_C13
public import L5.t.E203S3_C14
public import L5.t.E203S3_C15
public import L5.t.E203S3_C16
public import L5.t.E203S3_C17
public import L5.t.E203S3_C18
public import L5.t.E203S3_C19
public import L5.t.E203S3_C20
public import L5.t.E203S3_C21
public import L5.t.E203S3_C22
public import L5.t.E203S3_C23
public import L5.t.E203S3_C24
public import L5.t.E203S3_C25
public import L5.t.E203S3_C26
public import L5.t.E203S3_C27
public import L5.t.E203S3_C28
public import L5.t.E203S3_C29
public import L5.t.E203S3_C30
public import L5.t.E203S3_C31
public import L5.t.E203S3_C32
public import L5.t.E203S3_C33
public import L5.t.E203S3_C34
public import L5.t.E203S3_C35
public import L5.t.E203S3_C36
public import L5.t.E203S3_C37
public import L5.t.E203S3_C38
public import L5.t.E203S3_C39
public import L5.t.E203S3_C40
public import L5.t.E203S3_C41
public import L5.t.E203S3_C42
public import L5.t.E203S3_C43
public import L5.t.E203S3_C44
public import L5.t.E203S3_C45
public import L5.t.E203S3_C46
public import L5.t.E203S3_C47
public import L5.t.E203S3_C48
public import L5.t.E203S3_C49
public import L5.t.E203S3_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S3
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 754 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 754 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 8 4 m0 538 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 12 12 m0 538 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 24 8 m0 538 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 32 17 m0 538 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 49 1 m0 538 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 50 5 m0 538 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 55 16 m0 538 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 71 16 m0 538 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 538 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 89 m0 = true :=
    chunkT_join _ _ _ 0 88 1 m0 538 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 89 10 m0 646 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 99 6 m0 646 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 113 m0 = true :=
    chunkT_join _ _ _ 0 105 8 m0 646 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 127 m0 = true :=
    chunkT_join _ _ _ 0 113 14 m0 646 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 127 5 m0 646 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 132 6 m0 646 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 138 23 m0 646 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 161 1 m0 646 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 165 m0 = true :=
    chunkT_join _ _ _ 0 162 3 m0 754 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 166 m0 = true :=
    chunkT_join _ _ _ 0 165 1 m0 754 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 166 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 181 m0 = true :=
    chunkT_join _ _ _ 0 175 6 m0 754 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 181 6 m0 754 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 187 3 m0 754 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 190 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 201 10 m0 754 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 217 m0 = true :=
    chunkT_join _ _ _ 0 211 6 m0 754 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 233 m0 = true :=
    chunkT_join _ _ _ 0 217 16 m0 754 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 233 13 m0 754 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 254 m0 = true :=
    chunkT_join _ _ _ 0 246 8 m0 754 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 254 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 275 m0 = true :=
    chunkT_join _ _ _ 0 263 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 288 m0 = true :=
    chunkT_join _ _ _ 0 275 13 m0 754 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 300 m0 = true :=
    chunkT_join _ _ _ 0 288 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 327 m0 = true :=
    chunkT_join _ _ _ 0 300 27 m0 754 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 349 m0 = true :=
    chunkT_join _ _ _ 0 327 22 m0 754 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 368 m0 = true :=
    chunkT_join _ _ _ 0 349 19 m0 754 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 368 21 m0 754 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 389 15 m0 754 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 404 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 430 m0 = true :=
    chunkT_join _ _ _ 0 415 15 m0 754 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 439 m0 = true :=
    chunkT_join _ _ _ 0 430 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 453 m0 = true :=
    chunkT_join _ _ _ 0 439 14 m0 754 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 461 m0 = true :=
    chunkT_join _ _ _ 0 453 8 m0 754 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 472 m0 = true :=
    chunkT_join _ _ _ 0 461 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 487 m0 = true :=
    chunkT_join _ _ _ 0 472 15 m0 754 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 509 m0 = true :=
    chunkT_join _ _ _ 0 487 22 m0 754 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 536 m0 = true :=
    chunkT_join _ _ _ 0 509 27 m0 754 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 754 m0 = true :=
    chunkT_join _ _ _ 0 536 218 m0 754 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  exact h49
/-- **the leaf has no decomposition** (nested split leaf: main record and 754 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S3
#print axioms E203S3.leaf
