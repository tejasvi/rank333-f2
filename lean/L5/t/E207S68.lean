module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S68_C0
public import L5.t.E207S68_C1
public import L5.t.E207S68_C2
public import L5.t.E207S68_C3
public import L5.t.E207S68_C4
public import L5.t.E207S68_C5
public import L5.t.E207S68_C6
public import L5.t.E207S68_C7
public import L5.t.E207S68_C8
public import L5.t.E207S68_C9
public import L5.t.E207S68_C10
public import L5.t.E207S68_C11
public import L5.t.E207S68_C12
public import L5.t.E207S68_C13
public import L5.t.E207S68_C14
public import L5.t.E207S68_C15
public import L5.t.E207S68_C16
public import L5.t.E207S68_C17
public import L5.t.E207S68_C18
public import L5.t.E207S68_C19
public import L5.t.E207S68_C20
public import L5.t.E207S68_C21
public import L5.t.E207S68_C22
public import L5.t.E207S68_C23
public import L5.t.E207S68_C24
public import L5.t.E207S68_C25
public import L5.t.E207S68_C26
public import L5.t.E207S68_C27
public import L5.t.E207S68_C28
public import L5.t.E207S68_C29
public import L5.t.E207S68_C30
public import L5.t.E207S68_C31
public import L5.t.E207S68_C32
public import L5.t.E207S68_C33
public import L5.t.E207S68_C34
public import L5.t.E207S68_C35
public import L5.t.E207S68_C36
public import L5.t.E207S68_C37
public import L5.t.E207S68_C38
public import L5.t.E207S68_C39
public import L5.t.E207S68_C40
public import L5.t.E207S68_C41
public import L5.t.E207S68_C42
public import L5.t.E207S68_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S68
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 653 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 653 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 7 5 m0 231 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 231 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 13 1 m0 231 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 14 6 m0 265 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 20 16 m0 265 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 36 1 m0 265 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 37 1 m0 265 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 38 2 m0 442 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 40 2 m0 442 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 42 1 m0 442 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 43 1 m0 442 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 44 4 m0 442 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 48 12 m0 442 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 60 1 m0 442 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 61 5 m0 476 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 66 2 m0 476 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 68 3 m0 476 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 71 1 m0 476 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 72 8 m0 653 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 80 11 m0 653 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 91 3 m0 653 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 94 5 m0 653 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 124 m0 = true :=
    chunkT_join _ _ _ 0 99 25 m0 653 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 130 m0 = true :=
    chunkT_join _ _ _ 0 124 6 m0 653 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 130 8 m0 653 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 138 8 m0 653 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 146 4 m0 653 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 154 m0 = true :=
    chunkT_join _ _ _ 0 150 4 m0 653 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 154 1 m0 653 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 160 m0 = true :=
    chunkT_join _ _ _ 0 155 5 m0 653 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 160 16 m0 653 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 183 m0 = true :=
    chunkT_join _ _ _ 0 176 7 m0 653 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 183 15 m0 653 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 217 m0 = true :=
    chunkT_join _ _ _ 0 198 19 m0 653 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 217 9 m0 653 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 290 m0 = true :=
    chunkT_join _ _ _ 0 226 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 354 m0 = true :=
    chunkT_join _ _ _ 0 290 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 418 m0 = true :=
    chunkT_join _ _ _ 0 354 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 482 m0 = true :=
    chunkT_join _ _ _ 0 418 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 546 m0 = true :=
    chunkT_join _ _ _ 0 482 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 610 m0 = true :=
    chunkT_join _ _ _ 0 546 64 m0 653 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 653 m0 = true :=
    chunkT_join _ _ _ 0 610 43 m0 653 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  exact h42
/-- **the leaf has no decomposition** (nested split leaf: main record and 653 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S68
#print axioms E207S68.leaf
