module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S108_C0
public import L5.t.E236S108_C1
public import L5.t.E236S108_C2
public import L5.t.E236S108_C3
public import L5.t.E236S108_C4
public import L5.t.E236S108_C5
public import L5.t.E236S108_C6
public import L5.t.E236S108_C7
public import L5.t.E236S108_C8
public import L5.t.E236S108_C9
public import L5.t.E236S108_C10
public import L5.t.E236S108_C11
public import L5.t.E236S108_C12
public import L5.t.E236S108_C13
public import L5.t.E236S108_C14
public import L5.t.E236S108_C15
public import L5.t.E236S108_C16
public import L5.t.E236S108_C17
public import L5.t.E236S108_C18
public import L5.t.E236S108_C19
public import L5.t.E236S108_C20
public import L5.t.E236S108_C21
public import L5.t.E236S108_C22
public import L5.t.E236S108_C23
public import L5.t.E236S108_C24
public import L5.t.E236S108_C25
public import L5.t.E236S108_C26
public import L5.t.E236S108_C27
public import L5.t.E236S108_C28
public import L5.t.E236S108_C29
public import L5.t.E236S108_C30
public import L5.t.E236S108_C31
public import L5.t.E236S108_C32
public import L5.t.E236S108_C33
public import L5.t.E236S108_C34
public import L5.t.E236S108_C35
public import L5.t.E236S108_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S108
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1767 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1767 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 11 23 m0 214 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 34 6 m0 214 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 40 1 m0 214 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 41 8 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 49 4 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 53 6 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 59 14 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 73 17 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 90 32 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 122 48 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 170 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 234 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 362 m0 = true :=
    chunkT_join _ _ _ 0 298 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 426 m0 = true :=
    chunkT_join _ _ _ 0 362 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 490 m0 = true :=
    chunkT_join _ _ _ 0 426 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 554 m0 = true :=
    chunkT_join _ _ _ 0 490 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 618 m0 = true :=
    chunkT_join _ _ _ 0 554 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 682 m0 = true :=
    chunkT_join _ _ _ 0 618 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 746 m0 = true :=
    chunkT_join _ _ _ 0 682 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 810 m0 = true :=
    chunkT_join _ _ _ 0 746 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 874 m0 = true :=
    chunkT_join _ _ _ 0 810 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 938 m0 = true :=
    chunkT_join _ _ _ 0 874 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1002 m0 = true :=
    chunkT_join _ _ _ 0 938 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1066 m0 = true :=
    chunkT_join _ _ _ 0 1002 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1130 m0 = true :=
    chunkT_join _ _ _ 0 1066 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1194 m0 = true :=
    chunkT_join _ _ _ 0 1130 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1258 m0 = true :=
    chunkT_join _ _ _ 0 1194 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1322 m0 = true :=
    chunkT_join _ _ _ 0 1258 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1386 m0 = true :=
    chunkT_join _ _ _ 0 1322 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1450 m0 = true :=
    chunkT_join _ _ _ 0 1386 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1514 m0 = true :=
    chunkT_join _ _ _ 0 1450 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1578 m0 = true :=
    chunkT_join _ _ _ 0 1514 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1642 m0 = true :=
    chunkT_join _ _ _ 0 1578 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1706 m0 = true :=
    chunkT_join _ _ _ 0 1642 64 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1767 m0 = true :=
    chunkT_join _ _ _ 0 1706 61 m0 1767 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  exact h35
/-- **the leaf has no decomposition** (nested split leaf: main record and 1767 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S108
#print axioms E236S108.leaf
