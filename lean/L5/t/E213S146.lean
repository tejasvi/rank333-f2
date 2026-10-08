module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S146_C0
public import L5.t.E213S146_C1
public import L5.t.E213S146_C2
public import L5.t.E213S146_C3
public import L5.t.E213S146_C4
public import L5.t.E213S146_C5
public import L5.t.E213S146_C6
public import L5.t.E213S146_C7
public import L5.t.E213S146_C8
public import L5.t.E213S146_C9
public import L5.t.E213S146_C10
public import L5.t.E213S146_C11
public import L5.t.E213S146_C12
public import L5.t.E213S146_C13
public import L5.t.E213S146_C14
public import L5.t.E213S146_C15
public import L5.t.E213S146_C16
public import L5.t.E213S146_C17
public import L5.t.E213S146_C18
public import L5.t.E213S146_C19
public import L5.t.E213S146_C20
public import L5.t.E213S146_C21
public import L5.t.E213S146_C22
public import L5.t.E213S146_C23
public import L5.t.E213S146_C24
public import L5.t.E213S146_C25
public import L5.t.E213S146_C26
public import L5.t.E213S146_C27
public import L5.t.E213S146_C28
public import L5.t.E213S146_C29
public import L5.t.E213S146_C30
public import L5.t.E213S146_C31
public import L5.t.E213S146_C32
public import L5.t.E213S146_C33
public import L5.t.E213S146_C34
public import L5.t.E213S146_C35
public import L5.t.E213S146_C36
public import L5.t.E213S146_C37
public import L5.t.E213S146_C38
public import L5.t.E213S146_C39
public import L5.t.E213S146_C40
public import L5.t.E213S146_C41
public import L5.t.E213S146_C42
public import L5.t.E213S146_C43
public import L5.t.E213S146_C44
public import L5.t.E213S146_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S146
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1491 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1491 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 122 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 4 1 m0 179 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 179 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 6 4 m0 906 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 906 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 906 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 906 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 13 1 m0 906 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 14 6 m0 1395 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 20 8 m0 1395 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 1395 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 29 3 m0 1479 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 32 3 m0 1479 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 35 7 m0 1479 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 42 1 m0 1479 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 43 1 m0 1490 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 44 9 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 53 2 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 55 20 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 75 8 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 83 3 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 118 m0 = true :=
    chunkT_join _ _ _ 0 86 32 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 182 m0 = true :=
    chunkT_join _ _ _ 0 118 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 182 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 310 m0 = true :=
    chunkT_join _ _ _ 0 246 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 374 m0 = true :=
    chunkT_join _ _ _ 0 310 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 374 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 502 m0 = true :=
    chunkT_join _ _ _ 0 438 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 566 m0 = true :=
    chunkT_join _ _ _ 0 502 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 630 m0 = true :=
    chunkT_join _ _ _ 0 566 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 694 m0 = true :=
    chunkT_join _ _ _ 0 630 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 758 m0 = true :=
    chunkT_join _ _ _ 0 694 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 822 m0 = true :=
    chunkT_join _ _ _ 0 758 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 886 m0 = true :=
    chunkT_join _ _ _ 0 822 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 950 m0 = true :=
    chunkT_join _ _ _ 0 886 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1014 m0 = true :=
    chunkT_join _ _ _ 0 950 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1078 m0 = true :=
    chunkT_join _ _ _ 0 1014 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1142 m0 = true :=
    chunkT_join _ _ _ 0 1078 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1206 m0 = true :=
    chunkT_join _ _ _ 0 1142 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1270 m0 = true :=
    chunkT_join _ _ _ 0 1206 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1334 m0 = true :=
    chunkT_join _ _ _ 0 1270 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1398 m0 = true :=
    chunkT_join _ _ _ 0 1334 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 1462 m0 = true :=
    chunkT_join _ _ _ 0 1398 64 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1491 m0 = true :=
    chunkT_join _ _ _ 0 1462 29 m0 1491 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  exact h44
/-- **the leaf has no decomposition** (nested split leaf: main record and 1491 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S146
#print axioms E213S146.leaf
