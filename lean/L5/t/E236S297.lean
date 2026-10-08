module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S297_C0
public import L5.t.E236S297_C1
public import L5.t.E236S297_C2
public import L5.t.E236S297_C3
public import L5.t.E236S297_C4
public import L5.t.E236S297_C5
public import L5.t.E236S297_C6
public import L5.t.E236S297_C7
public import L5.t.E236S297_C8
public import L5.t.E236S297_C9
public import L5.t.E236S297_C10
public import L5.t.E236S297_C11
public import L5.t.E236S297_C12
public import L5.t.E236S297_C13
public import L5.t.E236S297_C14
public import L5.t.E236S297_C15
public import L5.t.E236S297_C16
public import L5.t.E236S297_C17
public import L5.t.E236S297_C18
public import L5.t.E236S297_C19
public import L5.t.E236S297_C20
public import L5.t.E236S297_C21
public import L5.t.E236S297_C22
public import L5.t.E236S297_C23
public import L5.t.E236S297_C24
public import L5.t.E236S297_C25
public import L5.t.E236S297_C26
public import L5.t.E236S297_C27
public import L5.t.E236S297_C28
public import L5.t.E236S297_C29
public import L5.t.E236S297_C30
public import L5.t.E236S297_C31
public import L5.t.E236S297_C32
public import L5.t.E236S297_C33
public import L5.t.E236S297_C34
public import L5.t.E236S297_C35
public import L5.t.E236S297_C36
public import L5.t.E236S297_C37
public import L5.t.E236S297_C38
public import L5.t.E236S297_C39
public import L5.t.E236S297_C40
public import L5.t.E236S297_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S297
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1864 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1864 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 440 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 440 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 3 2 m0 1217 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 1217 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 6 4 m0 1622 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 10 2 m0 1622 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 1622 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 13 5 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 18 21 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 39 25 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 64 4 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 97 m0 = true :=
    chunkT_join _ _ _ 0 68 29 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 97 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 225 m0 = true :=
    chunkT_join _ _ _ 0 161 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 289 m0 = true :=
    chunkT_join _ _ _ 0 225 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 289 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 417 m0 = true :=
    chunkT_join _ _ _ 0 353 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 481 m0 = true :=
    chunkT_join _ _ _ 0 417 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 545 m0 = true :=
    chunkT_join _ _ _ 0 481 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 609 m0 = true :=
    chunkT_join _ _ _ 0 545 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 673 m0 = true :=
    chunkT_join _ _ _ 0 609 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 737 m0 = true :=
    chunkT_join _ _ _ 0 673 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 801 m0 = true :=
    chunkT_join _ _ _ 0 737 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 865 m0 = true :=
    chunkT_join _ _ _ 0 801 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 929 m0 = true :=
    chunkT_join _ _ _ 0 865 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 993 m0 = true :=
    chunkT_join _ _ _ 0 929 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1057 m0 = true :=
    chunkT_join _ _ _ 0 993 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1121 m0 = true :=
    chunkT_join _ _ _ 0 1057 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1185 m0 = true :=
    chunkT_join _ _ _ 0 1121 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1249 m0 = true :=
    chunkT_join _ _ _ 0 1185 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1313 m0 = true :=
    chunkT_join _ _ _ 0 1249 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1377 m0 = true :=
    chunkT_join _ _ _ 0 1313 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1441 m0 = true :=
    chunkT_join _ _ _ 0 1377 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1505 m0 = true :=
    chunkT_join _ _ _ 0 1441 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1569 m0 = true :=
    chunkT_join _ _ _ 0 1505 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1633 m0 = true :=
    chunkT_join _ _ _ 0 1569 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1697 m0 = true :=
    chunkT_join _ _ _ 0 1633 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1761 m0 = true :=
    chunkT_join _ _ _ 0 1697 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1825 m0 = true :=
    chunkT_join _ _ _ 0 1761 64 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1864 m0 = true :=
    chunkT_join _ _ _ 0 1825 39 m0 1864 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  exact h40
/-- **the leaf has no decomposition** (nested split leaf: main record and 1864 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S297
#print axioms E236S297.leaf
