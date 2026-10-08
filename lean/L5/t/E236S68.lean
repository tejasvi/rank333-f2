module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S68_C0
public import L5.t.E236S68_C1
public import L5.t.E236S68_C2
public import L5.t.E236S68_C3
public import L5.t.E236S68_C4
public import L5.t.E236S68_C5
public import L5.t.E236S68_C6
public import L5.t.E236S68_C7
public import L5.t.E236S68_C8
public import L5.t.E236S68_C9
public import L5.t.E236S68_C10
public import L5.t.E236S68_C11
public import L5.t.E236S68_C12
public import L5.t.E236S68_C13
public import L5.t.E236S68_C14
public import L5.t.E236S68_C15
public import L5.t.E236S68_C16
public import L5.t.E236S68_C17
public import L5.t.E236S68_C18
public import L5.t.E236S68_C19
public import L5.t.E236S68_C20
public import L5.t.E236S68_C21
public import L5.t.E236S68_C22
public import L5.t.E236S68_C23
public import L5.t.E236S68_C24
public import L5.t.E236S68_C25
public import L5.t.E236S68_C26
public import L5.t.E236S68_C27
public import L5.t.E236S68_C28
public import L5.t.E236S68_C29
public import L5.t.E236S68_C30
public import L5.t.E236S68_C31
public import L5.t.E236S68_C32
public import L5.t.E236S68_C33
public import L5.t.E236S68_C34
public import L5.t.E236S68_C35
public import L5.t.E236S68_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S68
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2008 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2008 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 25 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 4 7 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true :=
    chunkT_join _ _ _ 0 11 11 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 22 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 86 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 150 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 278 m0 = true :=
    chunkT_join _ _ _ 0 214 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 342 m0 = true :=
    chunkT_join _ _ _ 0 278 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 406 m0 = true :=
    chunkT_join _ _ _ 0 342 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 470 m0 = true :=
    chunkT_join _ _ _ 0 406 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 534 m0 = true :=
    chunkT_join _ _ _ 0 470 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 598 m0 = true :=
    chunkT_join _ _ _ 0 534 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 662 m0 = true :=
    chunkT_join _ _ _ 0 598 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 726 m0 = true :=
    chunkT_join _ _ _ 0 662 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 790 m0 = true :=
    chunkT_join _ _ _ 0 726 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 854 m0 = true :=
    chunkT_join _ _ _ 0 790 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 918 m0 = true :=
    chunkT_join _ _ _ 0 854 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 982 m0 = true :=
    chunkT_join _ _ _ 0 918 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1046 m0 = true :=
    chunkT_join _ _ _ 0 982 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1110 m0 = true :=
    chunkT_join _ _ _ 0 1046 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1174 m0 = true :=
    chunkT_join _ _ _ 0 1110 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1238 m0 = true :=
    chunkT_join _ _ _ 0 1174 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1302 m0 = true :=
    chunkT_join _ _ _ 0 1238 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1366 m0 = true :=
    chunkT_join _ _ _ 0 1302 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1430 m0 = true :=
    chunkT_join _ _ _ 0 1366 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1494 m0 = true :=
    chunkT_join _ _ _ 0 1430 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1558 m0 = true :=
    chunkT_join _ _ _ 0 1494 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1622 m0 = true :=
    chunkT_join _ _ _ 0 1558 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1686 m0 = true :=
    chunkT_join _ _ _ 0 1622 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1750 m0 = true :=
    chunkT_join _ _ _ 0 1686 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1814 m0 = true :=
    chunkT_join _ _ _ 0 1750 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1878 m0 = true :=
    chunkT_join _ _ _ 0 1814 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1942 m0 = true :=
    chunkT_join _ _ _ 0 1878 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 2006 m0 = true :=
    chunkT_join _ _ _ 0 1942 64 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 2008 m0 = true :=
    chunkT_join _ _ _ 0 2006 2 m0 2008 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  exact h35
/-- **the leaf has no decomposition** (nested split leaf: main record and 2008 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S68
#print axioms E236S68.leaf
