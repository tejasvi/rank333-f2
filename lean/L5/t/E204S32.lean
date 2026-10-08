module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S32_C0
public import L5.t.E204S32_C1
public import L5.t.E204S32_C2
public import L5.t.E204S32_C3
public import L5.t.E204S32_C4
public import L5.t.E204S32_C5
public import L5.t.E204S32_C6
public import L5.t.E204S32_C7
public import L5.t.E204S32_C8
public import L5.t.E204S32_C9
public import L5.t.E204S32_C10
public import L5.t.E204S32_C11
public import L5.t.E204S32_C12
public import L5.t.E204S32_C13
public import L5.t.E204S32_C14
public import L5.t.E204S32_C15
public import L5.t.E204S32_C16
public import L5.t.E204S32_C17
public import L5.t.E204S32_C18
public import L5.t.E204S32_C19
public import L5.t.E204S32_C20
public import L5.t.E204S32_C21
public import L5.t.E204S32_C22
public import L5.t.E204S32_C23
public import L5.t.E204S32_C24
public import L5.t.E204S32_C25
public import L5.t.E204S32_C26
public import L5.t.E204S32_C27
public import L5.t.E204S32_C28
public import L5.t.E204S32_C29
public import L5.t.E204S32_C30
public import L5.t.E204S32_C31
public import L5.t.E204S32_C32
public import L5.t.E204S32_C33
public import L5.t.E204S32_C34
public import L5.t.E204S32_C35
public import L5.t.E204S32_C36
public import L5.t.E204S32_C37
public import L5.t.E204S32_C38
public import L5.t.E204S32_C39
public import L5.t.E204S32_C40
public import L5.t.E204S32_C41
public import L5.t.E204S32_C42
public import L5.t.E204S32_C43
public import L5.t.E204S32_C44
public import L5.t.E204S32_C45
public import L5.t.E204S32_C46
public import L5.t.E204S32_C47
public import L5.t.E204S32_C48
public import L5.t.E204S32_C49
public import L5.t.E204S32_C50
public import L5.t.E204S32_C51
public import L5.t.E204S32_C52
public import L5.t.E204S32_C53
public import L5.t.E204S32_C54
public import L5.t.E204S32_C55
public import L5.t.E204S32_C56
public import L5.t.E204S32_C57
public import L5.t.E204S32_C58
public import L5.t.E204S32_C59
public import L5.t.E204S32_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S32
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 298 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 2 9 m0 298 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 11 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 13 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 23 5 m0 298 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 28 7 m0 298 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 35 11 m0 298 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 46 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 47 12 m0 298 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 59 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 61 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 67 5 m0 298 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 72 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 74 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 75 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 76 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 77 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 78 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 79 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 80 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 81 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 82 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 83 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 84 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 85 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 86 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 89 m0 = true :=
    chunkT_join _ _ _ 0 88 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 89 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 90 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 91 2 m0 298 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 93 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 102 m0 = true :=
    chunkT_join _ _ _ 0 94 8 m0 298 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 110 m0 = true :=
    chunkT_join _ _ _ 0 102 8 m0 298 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 110 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 117 m0 = true :=
    chunkT_join _ _ _ 0 114 3 m0 298 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 120 m0 = true :=
    chunkT_join _ _ _ 0 117 3 m0 298 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 130 m0 = true :=
    chunkT_join _ _ _ 0 120 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 145 m0 = true :=
    chunkT_join _ _ _ 0 130 15 m0 298 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 145 16 m0 298 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 161 9 m0 298 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 170 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 176 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 180 22 m0 298 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 202 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 203 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 213 m0 = true :=
    chunkT_join _ _ _ 0 209 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 223 m0 = true :=
    chunkT_join _ _ _ 0 213 10 m0 298 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 224 m0 = true :=
    chunkT_join _ _ _ 0 223 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 224 4 m0 298 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 247 m0 = true :=
    chunkT_join _ _ _ 0 228 19 m0 298 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 247 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 268 m0 = true :=
    chunkT_join _ _ _ 0 253 15 m0 298 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 289 m0 = true :=
    chunkT_join _ _ _ 0 268 21 m0 298 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 290 m0 = true :=
    chunkT_join _ _ _ 0 289 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 291 m0 = true :=
    chunkT_join _ _ _ 0 290 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 292 m0 = true :=
    chunkT_join _ _ _ 0 291 1 m0 298 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 292 6 m0 298 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  exact h59
/-- **the leaf has no decomposition** (nested split leaf: main record and 298 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S32
#print axioms E204S32.leaf
