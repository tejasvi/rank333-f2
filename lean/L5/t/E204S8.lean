module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S8_C0
public import L5.t.E204S8_C1
public import L5.t.E204S8_C2
public import L5.t.E204S8_C3
public import L5.t.E204S8_C4
public import L5.t.E204S8_C5
public import L5.t.E204S8_C6
public import L5.t.E204S8_C7
public import L5.t.E204S8_C8
public import L5.t.E204S8_C9
public import L5.t.E204S8_C10
public import L5.t.E204S8_C11
public import L5.t.E204S8_C12
public import L5.t.E204S8_C13
public import L5.t.E204S8_C14
public import L5.t.E204S8_C15
public import L5.t.E204S8_C16
public import L5.t.E204S8_C17
public import L5.t.E204S8_C18
public import L5.t.E204S8_C19
public import L5.t.E204S8_C20
public import L5.t.E204S8_C21
public import L5.t.E204S8_C22
public import L5.t.E204S8_C23
public import L5.t.E204S8_C24
public import L5.t.E204S8_C25
public import L5.t.E204S8_C26
public import L5.t.E204S8_C27
public import L5.t.E204S8_C28
public import L5.t.E204S8_C29
public import L5.t.E204S8_C30
public import L5.t.E204S8_C31
public import L5.t.E204S8_C32
public import L5.t.E204S8_C33
public import L5.t.E204S8_C34
public import L5.t.E204S8_C35
public import L5.t.E204S8_C36
public import L5.t.E204S8_C37
public import L5.t.E204S8_C38
public import L5.t.E204S8_C39
public import L5.t.E204S8_C40
public import L5.t.E204S8_C41
public import L5.t.E204S8_C42
public import L5.t.E204S8_C43
public import L5.t.E204S8_C44
public import L5.t.E204S8_C45
public import L5.t.E204S8_C46
public import L5.t.E204S8_C47
public import L5.t.E204S8_C48
public import L5.t.E204S8_C49
public import L5.t.E204S8_C50
public import L5.t.E204S8_C51
public import L5.t.E204S8_C52
public import L5.t.E204S8_C53
public import L5.t.E204S8_C54
public import L5.t.E204S8_C55
public import L5.t.E204S8_C56
public import L5.t.E204S8_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S8
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1080 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1080 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 9 1 m0 528 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 679 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true :=
    chunkT_join _ _ _ 0 11 10 m0 804 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 21 7 m0 804 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 28 7 m0 804 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 35 16 m0 804 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 51 13 m0 804 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 64 21 m0 804 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 85 2 m0 804 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 804 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 88 2 m0 804 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 90 1 m0 804 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 100 m0 = true :=
    chunkT_join _ _ _ 0 91 9 m0 929 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 102 m0 = true :=
    chunkT_join _ _ _ 0 100 2 m0 929 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 106 m0 = true :=
    chunkT_join _ _ _ 0 102 4 m0 929 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 117 m0 = true :=
    chunkT_join _ _ _ 0 106 11 m0 929 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 117 15 m0 929 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 145 m0 = true :=
    chunkT_join _ _ _ 0 132 13 m0 929 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 145 17 m0 929 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 165 m0 = true :=
    chunkT_join _ _ _ 0 162 3 m0 929 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 177 m0 = true :=
    chunkT_join _ _ _ 0 165 12 m0 929 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 184 m0 = true :=
    chunkT_join _ _ _ 0 177 7 m0 929 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 193 m0 = true :=
    chunkT_join _ _ _ 0 184 9 m0 929 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 193 1 m0 929 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 194 1 m0 929 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 195 1 m0 929 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 196 2 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 198 1 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 199 3 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 202 9 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 223 m0 = true :=
    chunkT_join _ _ _ 0 211 12 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 230 m0 = true :=
    chunkT_join _ _ _ 0 223 7 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 230 4 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 248 m0 = true :=
    chunkT_join _ _ _ 0 234 14 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 251 m0 = true :=
    chunkT_join _ _ _ 0 248 3 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 251 5 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 256 7 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 278 m0 = true :=
    chunkT_join _ _ _ 0 263 15 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 278 19 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 318 m0 = true :=
    chunkT_join _ _ _ 0 297 21 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 339 m0 = true :=
    chunkT_join _ _ _ 0 318 21 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 356 m0 = true :=
    chunkT_join _ _ _ 0 339 17 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 372 m0 = true :=
    chunkT_join _ _ _ 0 356 16 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 372 17 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 389 13 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 413 m0 = true :=
    chunkT_join _ _ _ 0 402 11 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 422 m0 = true :=
    chunkT_join _ _ _ 0 413 9 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 431 m0 = true :=
    chunkT_join _ _ _ 0 422 9 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 442 m0 = true :=
    chunkT_join _ _ _ 0 431 11 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 458 m0 = true :=
    chunkT_join _ _ _ 0 442 16 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 479 m0 = true :=
    chunkT_join _ _ _ 0 458 21 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 501 m0 = true :=
    chunkT_join _ _ _ 0 479 22 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 524 m0 = true :=
    chunkT_join _ _ _ 0 501 23 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 665 m0 = true :=
    chunkT_join _ _ _ 0 524 141 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 958 m0 = true :=
    chunkT_join _ _ _ 0 665 293 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1080 m0 = true :=
    chunkT_join _ _ _ 0 958 122 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  exact h56
/-- **the leaf has no decomposition** (nested split leaf: main record and 1080 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S8
#print axioms E204S8.leaf
