module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S2_C0
public import L5.t.E203S2_C1
public import L5.t.E203S2_C2
public import L5.t.E203S2_C3
public import L5.t.E203S2_C4
public import L5.t.E203S2_C5
public import L5.t.E203S2_C6
public import L5.t.E203S2_C7
public import L5.t.E203S2_C8
public import L5.t.E203S2_C9
public import L5.t.E203S2_C10
public import L5.t.E203S2_C11
public import L5.t.E203S2_C12
public import L5.t.E203S2_C13
public import L5.t.E203S2_C14
public import L5.t.E203S2_C15
public import L5.t.E203S2_C16
public import L5.t.E203S2_C17
public import L5.t.E203S2_C18
public import L5.t.E203S2_C19
public import L5.t.E203S2_C20
public import L5.t.E203S2_C21
public import L5.t.E203S2_C22
public import L5.t.E203S2_C23
public import L5.t.E203S2_C24
public import L5.t.E203S2_C25
public import L5.t.E203S2_C26
public import L5.t.E203S2_C27
public import L5.t.E203S2_C28
public import L5.t.E203S2_C29
public import L5.t.E203S2_C30
public import L5.t.E203S2_C31
public import L5.t.E203S2_C32
public import L5.t.E203S2_C33
public import L5.t.E203S2_C34
public import L5.t.E203S2_C35
public import L5.t.E203S2_C36
public import L5.t.E203S2_C37
public import L5.t.E203S2_C38
public import L5.t.E203S2_C39
public import L5.t.E203S2_C40
public import L5.t.E203S2_C41
public import L5.t.E203S2_C42
public import L5.t.E203S2_C43
public import L5.t.E203S2_C44
public import L5.t.E203S2_C45
public import L5.t.E203S2_C46
public import L5.t.E203S2_C47
public import L5.t.E203S2_C48
public import L5.t.E203S2_C49
public import L5.t.E203S2_C50
public import L5.t.E203S2_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S2
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 754 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 754 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 7 1 m0 538 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 8 1 m0 538 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 9 11 m0 646 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 20 7 m0 646 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 27 7 m0 646 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 34 12 m0 646 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 46 6 m0 646 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 56 m0 = true :=
    chunkT_join _ _ _ 0 52 4 m0 646 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 56 16 m0 646 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 72 13 m0 646 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 85 1 m0 646 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 86 1 m0 646 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 646 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 88 10 m0 754 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 100 m0 = true :=
    chunkT_join _ _ _ 0 98 2 m0 754 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 100 4 m0 754 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 112 m0 = true :=
    chunkT_join _ _ _ 0 104 8 m0 754 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 124 m0 = true :=
    chunkT_join _ _ _ 0 112 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 133 m0 = true :=
    chunkT_join _ _ _ 0 124 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 133 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 163 m0 = true :=
    chunkT_join _ _ _ 0 142 21 m0 754 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 166 m0 = true :=
    chunkT_join _ _ _ 0 163 3 m0 754 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 166 9 m0 754 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 175 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 197 m0 = true :=
    chunkT_join _ _ _ 0 187 10 m0 754 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 197 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 209 3 m0 754 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 222 m0 = true :=
    chunkT_join _ _ _ 0 212 10 m0 754 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 244 m0 = true :=
    chunkT_join _ _ _ 0 222 22 m0 754 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 248 m0 = true :=
    chunkT_join _ _ _ 0 244 4 m0 754 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 259 m0 = true :=
    chunkT_join _ _ _ 0 248 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 267 m0 = true :=
    chunkT_join _ _ _ 0 259 8 m0 754 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 274 m0 = true :=
    chunkT_join _ _ _ 0 267 7 m0 754 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 288 m0 = true :=
    chunkT_join _ _ _ 0 274 14 m0 754 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 303 m0 = true :=
    chunkT_join _ _ _ 0 288 15 m0 754 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 303 27 m0 754 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 330 23 m0 754 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 370 m0 = true :=
    chunkT_join _ _ _ 0 353 17 m0 754 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 390 m0 = true :=
    chunkT_join _ _ _ 0 370 20 m0 754 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 390 14 m0 754 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 404 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 428 m0 = true :=
    chunkT_join _ _ _ 0 415 13 m0 754 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 428 7 m0 754 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 446 m0 = true :=
    chunkT_join _ _ _ 0 435 11 m0 754 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 460 m0 = true :=
    chunkT_join _ _ _ 0 446 14 m0 754 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 472 m0 = true :=
    chunkT_join _ _ _ 0 460 12 m0 754 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 488 m0 = true :=
    chunkT_join _ _ _ 0 472 16 m0 754 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 513 m0 = true :=
    chunkT_join _ _ _ 0 488 25 m0 754 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 537 m0 = true :=
    chunkT_join _ _ _ 0 513 24 m0 754 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 754 m0 = true :=
    chunkT_join _ _ _ 0 537 217 m0 754 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  exact h50
/-- **the leaf has no decomposition** (nested split leaf: main record and 754 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S2
#print axioms E203S2.leaf
