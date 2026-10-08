module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S250_C0
public import L5.t.E236S250_C1
public import L5.t.E236S250_C2
public import L5.t.E236S250_C3
public import L5.t.E236S250_C4
public import L5.t.E236S250_C5
public import L5.t.E236S250_C6
public import L5.t.E236S250_C7
public import L5.t.E236S250_C8
public import L5.t.E236S250_C9
public import L5.t.E236S250_C10
public import L5.t.E236S250_C11
public import L5.t.E236S250_C12
public import L5.t.E236S250_C13
public import L5.t.E236S250_C14
public import L5.t.E236S250_C15
public import L5.t.E236S250_C16
public import L5.t.E236S250_C17
public import L5.t.E236S250_C18
public import L5.t.E236S250_C19
public import L5.t.E236S250_C20
public import L5.t.E236S250_C21
public import L5.t.E236S250_C22
public import L5.t.E236S250_C23
public import L5.t.E236S250_C24
public import L5.t.E236S250_C25
public import L5.t.E236S250_C26
public import L5.t.E236S250_C27
public import L5.t.E236S250_C28
public import L5.t.E236S250_C29
public import L5.t.E236S250_C30
public import L5.t.E236S250_C31
public import L5.t.E236S250_C32
public import L5.t.E236S250_C33
public import L5.t.E236S250_C34
public import L5.t.E236S250_C35
public import L5.t.E236S250_C36
public import L5.t.E236S250_C37
public import L5.t.E236S250_C38
public import L5.t.E236S250_C39
public import L5.t.E236S250_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S250
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1908 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1908 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 23 1 m0 125 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 24 1 m0 906 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 25 4 m0 1743 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 29 1 m0 1743 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 30 1 m0 1743 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 31 5 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 36 12 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 48 9 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 57 5 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 62 29 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 91 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 219 m0 = true :=
    chunkT_join _ _ _ 0 155 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 283 m0 = true :=
    chunkT_join _ _ _ 0 219 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 347 m0 = true :=
    chunkT_join _ _ _ 0 283 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true :=
    chunkT_join _ _ _ 0 347 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 475 m0 = true :=
    chunkT_join _ _ _ 0 411 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 539 m0 = true :=
    chunkT_join _ _ _ 0 475 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 603 m0 = true :=
    chunkT_join _ _ _ 0 539 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 667 m0 = true :=
    chunkT_join _ _ _ 0 603 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 731 m0 = true :=
    chunkT_join _ _ _ 0 667 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 795 m0 = true :=
    chunkT_join _ _ _ 0 731 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 859 m0 = true :=
    chunkT_join _ _ _ 0 795 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 923 m0 = true :=
    chunkT_join _ _ _ 0 859 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 987 m0 = true :=
    chunkT_join _ _ _ 0 923 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1051 m0 = true :=
    chunkT_join _ _ _ 0 987 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1115 m0 = true :=
    chunkT_join _ _ _ 0 1051 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1179 m0 = true :=
    chunkT_join _ _ _ 0 1115 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1243 m0 = true :=
    chunkT_join _ _ _ 0 1179 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1307 m0 = true :=
    chunkT_join _ _ _ 0 1243 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1371 m0 = true :=
    chunkT_join _ _ _ 0 1307 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1435 m0 = true :=
    chunkT_join _ _ _ 0 1371 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1499 m0 = true :=
    chunkT_join _ _ _ 0 1435 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1563 m0 = true :=
    chunkT_join _ _ _ 0 1499 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1627 m0 = true :=
    chunkT_join _ _ _ 0 1563 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1691 m0 = true :=
    chunkT_join _ _ _ 0 1627 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1755 m0 = true :=
    chunkT_join _ _ _ 0 1691 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1819 m0 = true :=
    chunkT_join _ _ _ 0 1755 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1883 m0 = true :=
    chunkT_join _ _ _ 0 1819 64 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1908 m0 = true :=
    chunkT_join _ _ _ 0 1883 25 m0 1908 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  exact h39
/-- **the leaf has no decomposition** (nested split leaf: main record and 1908 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S250
#print axioms E236S250.leaf
