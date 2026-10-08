module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S9_C0
public import L5.t.E204S9_C1
public import L5.t.E204S9_C2
public import L5.t.E204S9_C3
public import L5.t.E204S9_C4
public import L5.t.E204S9_C5
public import L5.t.E204S9_C6
public import L5.t.E204S9_C7
public import L5.t.E204S9_C8
public import L5.t.E204S9_C9
public import L5.t.E204S9_C10
public import L5.t.E204S9_C11
public import L5.t.E204S9_C12
public import L5.t.E204S9_C13
public import L5.t.E204S9_C14
public import L5.t.E204S9_C15
public import L5.t.E204S9_C16
public import L5.t.E204S9_C17
public import L5.t.E204S9_C18
public import L5.t.E204S9_C19
public import L5.t.E204S9_C20
public import L5.t.E204S9_C21
public import L5.t.E204S9_C22
public import L5.t.E204S9_C23
public import L5.t.E204S9_C24
public import L5.t.E204S9_C25
public import L5.t.E204S9_C26
public import L5.t.E204S9_C27
public import L5.t.E204S9_C28
public import L5.t.E204S9_C29
public import L5.t.E204S9_C30
public import L5.t.E204S9_C31
public import L5.t.E204S9_C32
public import L5.t.E204S9_C33
public import L5.t.E204S9_C34
public import L5.t.E204S9_C35
public import L5.t.E204S9_C36
public import L5.t.E204S9_C37
public import L5.t.E204S9_C38
public import L5.t.E204S9_C39
public import L5.t.E204S9_C40
public import L5.t.E204S9_C41
public import L5.t.E204S9_C42
public import L5.t.E204S9_C43
public import L5.t.E204S9_C44
public import L5.t.E204S9_C45
public import L5.t.E204S9_C46
public import L5.t.E204S9_C47
public import L5.t.E204S9_C48
public import L5.t.E204S9_C49
public import L5.t.E204S9_C50
public import L5.t.E204S9_C51
public import L5.t.E204S9_C52
public import L5.t.E204S9_C53
public import L5.t.E204S9_C54
public import L5.t.E204S9_C55
public import L5.t.E204S9_C56
public import L5.t.E204S9_C57
public import L5.t.E204S9_C58
public import L5.t.E204S9_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S9
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1080 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1080 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 10 2 m0 528 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 12 8 m0 528 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 20 8 m0 528 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 28 14 m0 528 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 42 12 m0 528 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 54 18 m0 528 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 72 1 m0 528 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 73 2 m0 679 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 75 1 m0 679 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 76 8 m0 804 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 84 8 m0 804 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 92 12 m0 804 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 118 m0 = true :=
    chunkT_join _ _ _ 0 104 14 m0 804 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 139 m0 = true :=
    chunkT_join _ _ _ 0 118 21 m0 804 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 139 7 m0 804 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 147 m0 = true :=
    chunkT_join _ _ _ 0 146 1 m0 804 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 147 3 m0 929 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 151 m0 = true :=
    chunkT_join _ _ _ 0 150 1 m0 929 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true :=
    chunkT_join _ _ _ 0 151 8 m0 929 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 164 m0 = true :=
    chunkT_join _ _ _ 0 159 5 m0 929 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 164 8 m0 929 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 172 4 m0 929 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 191 m0 = true :=
    chunkT_join _ _ _ 0 176 15 m0 929 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 191 3 m0 929 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 194 1 m0 929 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 195 1 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 196 2 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 198 2 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 200 1 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 201 1 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 202 6 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 215 m0 = true :=
    chunkT_join _ _ _ 0 208 7 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 215 13 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 233 m0 = true :=
    chunkT_join _ _ _ 0 228 5 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 233 1 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 239 m0 = true :=
    chunkT_join _ _ _ 0 234 5 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 252 m0 = true :=
    chunkT_join _ _ _ 0 239 13 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 255 m0 = true :=
    chunkT_join _ _ _ 0 252 3 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 255 8 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 279 m0 = true :=
    chunkT_join _ _ _ 0 263 16 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 285 m0 = true :=
    chunkT_join _ _ _ 0 279 6 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 304 m0 = true :=
    chunkT_join _ _ _ 0 285 19 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 328 m0 = true :=
    chunkT_join _ _ _ 0 304 24 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 347 m0 = true :=
    chunkT_join _ _ _ 0 328 19 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 364 m0 = true :=
    chunkT_join _ _ _ 0 347 17 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 380 m0 = true :=
    chunkT_join _ _ _ 0 364 16 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true :=
    chunkT_join _ _ _ 0 380 18 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 409 m0 = true :=
    chunkT_join _ _ _ 0 398 11 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 409 14 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 432 m0 = true :=
    chunkT_join _ _ _ 0 423 9 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 446 m0 = true :=
    chunkT_join _ _ _ 0 432 14 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 465 m0 = true :=
    chunkT_join _ _ _ 0 446 19 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 486 m0 = true :=
    chunkT_join _ _ _ 0 465 21 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 506 m0 = true :=
    chunkT_join _ _ _ 0 486 20 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 545 m0 = true :=
    chunkT_join _ _ _ 0 506 39 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 761 m0 = true :=
    chunkT_join _ _ _ 0 545 216 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1008 m0 = true :=
    chunkT_join _ _ _ 0 761 247 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1080 m0 = true :=
    chunkT_join _ _ _ 0 1008 72 m0 1080 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  exact h58
/-- **the leaf has no decomposition** (nested split leaf: main record and 1080 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S9
#print axioms E204S9.leaf
