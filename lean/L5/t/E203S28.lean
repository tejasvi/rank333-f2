module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S28_C0
public import L5.t.E203S28_C1
public import L5.t.E203S28_C2
public import L5.t.E203S28_C3
public import L5.t.E203S28_C4
public import L5.t.E203S28_C5
public import L5.t.E203S28_C6
public import L5.t.E203S28_C7
public import L5.t.E203S28_C8
public import L5.t.E203S28_C9
public import L5.t.E203S28_C10
public import L5.t.E203S28_C11
public import L5.t.E203S28_C12
public import L5.t.E203S28_C13
public import L5.t.E203S28_C14
public import L5.t.E203S28_C15
public import L5.t.E203S28_C16
public import L5.t.E203S28_C17
public import L5.t.E203S28_C18
public import L5.t.E203S28_C19
public import L5.t.E203S28_C20
public import L5.t.E203S28_C21
public import L5.t.E203S28_C22
public import L5.t.E203S28_C23
public import L5.t.E203S28_C24
public import L5.t.E203S28_C25
public import L5.t.E203S28_C26
public import L5.t.E203S28_C27
public import L5.t.E203S28_C28
public import L5.t.E203S28_C29
public import L5.t.E203S28_C30
public import L5.t.E203S28_C31
public import L5.t.E203S28_C32
public import L5.t.E203S28_C33
public import L5.t.E203S28_C34
public import L5.t.E203S28_C35
public import L5.t.E203S28_C36
public import L5.t.E203S28_C37
public import L5.t.E203S28_C38
public import L5.t.E203S28_C39
public import L5.t.E203S28_C40
public import L5.t.E203S28_C41
public import L5.t.E203S28_C42
public import L5.t.E203S28_C43
public import L5.t.E203S28_C44
public import L5.t.E203S28_C45
public import L5.t.E203S28_C46
public import L5.t.E203S28_C47
public import L5.t.E203S28_C48
public import L5.t.E203S28_C49
public import L5.t.E203S28_C50
public import L5.t.E203S28_C51
public import L5.t.E203S28_C52
public import L5.t.E203S28_C53
public import L5.t.E203S28_C54
public import L5.t.E203S28_C55
public import L5.t.E203S28_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S28
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 307 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 307 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 5 6 m0 307 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 11 2 m0 307 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 13 15 m0 307 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 29 13 m0 307 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 42 10 m0 307 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 52 15 m0 307 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 67 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 68 10 m0 307 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 78 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 79 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 80 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 81 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 82 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 83 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 84 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 85 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 86 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 89 m0 = true :=
    chunkT_join _ _ _ 0 88 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 89 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 90 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 91 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 92 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 93 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 94 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 96 m0 = true :=
    chunkT_join _ _ _ 0 95 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 97 m0 = true :=
    chunkT_join _ _ _ 0 96 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 97 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 98 6 m0 307 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 110 m0 = true :=
    chunkT_join _ _ _ 0 104 6 m0 307 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 116 m0 = true :=
    chunkT_join _ _ _ 0 110 6 m0 307 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 116 3 m0 307 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 126 m0 = true :=
    chunkT_join _ _ _ 0 119 7 m0 307 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 144 m0 = true :=
    chunkT_join _ _ _ 0 126 18 m0 307 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 147 m0 = true :=
    chunkT_join _ _ _ 0 144 3 m0 307 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 156 m0 = true :=
    chunkT_join _ _ _ 0 147 9 m0 307 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 156 20 m0 307 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 182 m0 = true :=
    chunkT_join _ _ _ 0 176 6 m0 307 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 191 m0 = true :=
    chunkT_join _ _ _ 0 182 9 m0 307 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 207 m0 = true :=
    chunkT_join _ _ _ 0 191 16 m0 307 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 207 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 218 m0 = true :=
    chunkT_join _ _ _ 0 208 10 m0 307 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 218 3 m0 307 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 231 m0 = true :=
    chunkT_join _ _ _ 0 221 10 m0 307 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 231 3 m0 307 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 242 m0 = true :=
    chunkT_join _ _ _ 0 234 8 m0 307 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 251 m0 = true :=
    chunkT_join _ _ _ 0 242 9 m0 307 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 266 m0 = true :=
    chunkT_join _ _ _ 0 251 15 m0 307 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 287 m0 = true :=
    chunkT_join _ _ _ 0 266 21 m0 307 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 287 10 m0 307 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 297 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 299 m0 = true :=
    chunkT_join _ _ _ 0 298 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 300 m0 = true :=
    chunkT_join _ _ _ 0 299 1 m0 307 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 307 m0 = true :=
    chunkT_join _ _ _ 0 300 7 m0 307 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  exact h55
/-- **the leaf has no decomposition** (nested split leaf: main record and 307 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S28
#print axioms E203S28.leaf
