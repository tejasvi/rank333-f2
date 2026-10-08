module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S27_C0
public import L5.t.E204S27_C1
public import L5.t.E204S27_C2
public import L5.t.E204S27_C3
public import L5.t.E204S27_C4
public import L5.t.E204S27_C5
public import L5.t.E204S27_C6
public import L5.t.E204S27_C7
public import L5.t.E204S27_C8
public import L5.t.E204S27_C9
public import L5.t.E204S27_C10
public import L5.t.E204S27_C11
public import L5.t.E204S27_C12
public import L5.t.E204S27_C13
public import L5.t.E204S27_C14
public import L5.t.E204S27_C15
public import L5.t.E204S27_C16
public import L5.t.E204S27_C17
public import L5.t.E204S27_C18
public import L5.t.E204S27_C19
public import L5.t.E204S27_C20
public import L5.t.E204S27_C21
public import L5.t.E204S27_C22
public import L5.t.E204S27_C23
public import L5.t.E204S27_C24
public import L5.t.E204S27_C25
public import L5.t.E204S27_C26
public import L5.t.E204S27_C27
public import L5.t.E204S27_C28
public import L5.t.E204S27_C29
public import L5.t.E204S27_C30
public import L5.t.E204S27_C31
public import L5.t.E204S27_C32
public import L5.t.E204S27_C33
public import L5.t.E204S27_C34
public import L5.t.E204S27_C35
public import L5.t.E204S27_C36
public import L5.t.E204S27_C37
public import L5.t.E204S27_C38
public import L5.t.E204S27_C39
public import L5.t.E204S27_C40
public import L5.t.E204S27_C41
public import L5.t.E204S27_C42
public import L5.t.E204S27_C43
public import L5.t.E204S27_C44
public import L5.t.E204S27_C45
public import L5.t.E204S27_C46
public import L5.t.E204S27_C47
public import L5.t.E204S27_C48
public import L5.t.E204S27_C49
public import L5.t.E204S27_C50
public import L5.t.E204S27_C51
public import L5.t.E204S27_C52
public import L5.t.E204S27_C53
public import L5.t.E204S27_C54
public import L5.t.E204S27_C55
public import L5.t.E204S27_C56
public import L5.t.E204S27_C57
public import L5.t.E204S27_C58
public import L5.t.E204S27_C59
public import L5.t.E204S27_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S27
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 298 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 1 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 3 8 m0 298 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 12 12 m0 298 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 24 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 25 7 m0 298 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 32 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 36 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 37 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 38 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 39 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 40 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 41 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 42 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 43 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 44 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 45 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 46 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 47 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 48 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 49 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 50 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 51 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 52 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 53 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 54 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 56 m0 = true :=
    chunkT_join _ _ _ 0 55 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 56 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 57 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 67 7 m0 298 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 74 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 76 3 m0 298 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 79 20 m0 298 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 99 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 105 9 m0 298 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 114 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true :=
    chunkT_join _ _ _ 0 115 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 129 m0 = true :=
    chunkT_join _ _ _ 0 125 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 134 m0 = true :=
    chunkT_join _ _ _ 0 129 5 m0 298 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 157 m0 = true :=
    chunkT_join _ _ _ 0 134 23 m0 298 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 157 13 m0 298 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 170 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 174 5 m0 298 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 179 11 m0 298 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 190 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 194 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 196 3 m0 298 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 199 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 224 m0 = true :=
    chunkT_join _ _ _ 0 209 15 m0 298 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 224 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 237 m0 = true :=
    chunkT_join _ _ _ 0 234 3 m0 298 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 241 m0 = true :=
    chunkT_join _ _ _ 0 237 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 266 m0 = true :=
    chunkT_join _ _ _ 0 241 25 m0 298 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 278 m0 = true :=
    chunkT_join _ _ _ 0 266 12 m0 298 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 279 m0 = true :=
    chunkT_join _ _ _ 0 278 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 280 m0 = true :=
    chunkT_join _ _ _ 0 279 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 281 m0 = true :=
    chunkT_join _ _ _ 0 280 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 291 m0 = true :=
    chunkT_join _ _ _ 0 281 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 291 7 m0 298 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  exact h59
/-- **the leaf has no decomposition** (nested split leaf: main record and 298 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S27
#print axioms E204S27.leaf
