module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S303_C0
public import L5.t.E284S303_C1
public import L5.t.E284S303_C2
public import L5.t.E284S303_C3
public import L5.t.E284S303_C4
public import L5.t.E284S303_C5
public import L5.t.E284S303_C6
public import L5.t.E284S303_C7
public import L5.t.E284S303_C8
public import L5.t.E284S303_C9
public import L5.t.E284S303_C10
public import L5.t.E284S303_C11
public import L5.t.E284S303_C12
public import L5.t.E284S303_C13
public import L5.t.E284S303_C14
public import L5.t.E284S303_C15
public import L5.t.E284S303_C16
public import L5.t.E284S303_C17
public import L5.t.E284S303_C18
public import L5.t.E284S303_C19
public import L5.t.E284S303_C20
public import L5.t.E284S303_C21
public import L5.t.E284S303_C22
public import L5.t.E284S303_C23
public import L5.t.E284S303_C24
public import L5.t.E284S303_C25
public import L5.t.E284S303_C26
public import L5.t.E284S303_C27
public import L5.t.E284S303_C28
public import L5.t.E284S303_C29
public import L5.t.E284S303_C30
public import L5.t.E284S303_C31
public import L5.t.E284S303_C32
public import L5.t.E284S303_C33
public import L5.t.E284S303_C34
public import L5.t.E284S303_C35
public import L5.t.E284S303_C36
public import L5.t.E284S303_C37
public import L5.t.E284S303_C38
public import L5.t.E284S303_C39
public import L5.t.E284S303_C40
public import L5.t.E284S303_C41
public import L5.t.E284S303_C42
public import L5.t.E284S303_C43
public import L5.t.E284S303_C44
public import L5.t.E284S303_C45
public import L5.t.E284S303_C46
public import L5.t.E284S303_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S303
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2120 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2120 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 46 3 m0 1162 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 49 1 m0 1162 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 50 5 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 56 m0 = true :=
    chunkT_join _ _ _ 0 55 1 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 56 6 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 62 3 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 65 16 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 81 1 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 82 1 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 83 9 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 92 11 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 153 m0 = true :=
    chunkT_join _ _ _ 0 103 50 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 153 52 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 269 m0 = true :=
    chunkT_join _ _ _ 0 205 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 333 m0 = true :=
    chunkT_join _ _ _ 0 269 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 382 m0 = true :=
    chunkT_join _ _ _ 0 333 49 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 428 m0 = true :=
    chunkT_join _ _ _ 0 382 46 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 428 6 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 445 m0 = true :=
    chunkT_join _ _ _ 0 434 11 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 477 m0 = true :=
    chunkT_join _ _ _ 0 445 32 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 521 m0 = true :=
    chunkT_join _ _ _ 0 477 44 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 585 m0 = true :=
    chunkT_join _ _ _ 0 521 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 649 m0 = true :=
    chunkT_join _ _ _ 0 585 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 713 m0 = true :=
    chunkT_join _ _ _ 0 649 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 777 m0 = true :=
    chunkT_join _ _ _ 0 713 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 841 m0 = true :=
    chunkT_join _ _ _ 0 777 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 905 m0 = true :=
    chunkT_join _ _ _ 0 841 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 969 m0 = true :=
    chunkT_join _ _ _ 0 905 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1033 m0 = true :=
    chunkT_join _ _ _ 0 969 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1097 m0 = true :=
    chunkT_join _ _ _ 0 1033 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1160 m0 = true :=
    chunkT_join _ _ _ 0 1097 63 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1224 m0 = true :=
    chunkT_join _ _ _ 0 1160 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1288 m0 = true :=
    chunkT_join _ _ _ 0 1224 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1352 m0 = true :=
    chunkT_join _ _ _ 0 1288 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1416 m0 = true :=
    chunkT_join _ _ _ 0 1352 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1480 m0 = true :=
    chunkT_join _ _ _ 0 1416 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1544 m0 = true :=
    chunkT_join _ _ _ 0 1480 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1608 m0 = true :=
    chunkT_join _ _ _ 0 1544 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1672 m0 = true :=
    chunkT_join _ _ _ 0 1608 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1736 m0 = true :=
    chunkT_join _ _ _ 0 1672 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1800 m0 = true :=
    chunkT_join _ _ _ 0 1736 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1864 m0 = true :=
    chunkT_join _ _ _ 0 1800 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 1928 m0 = true :=
    chunkT_join _ _ _ 0 1864 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1992 m0 = true :=
    chunkT_join _ _ _ 0 1928 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2056 m0 = true :=
    chunkT_join _ _ _ 0 1992 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2120 m0 = true :=
    chunkT_join _ _ _ 0 2056 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  exact h46
/-- **the leaf has no decomposition** (nested split leaf: main record and 2120 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S303
#print axioms E284S303.leaf
