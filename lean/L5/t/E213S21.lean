module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S21_C0
public import L5.t.E213S21_C1
public import L5.t.E213S21_C2
public import L5.t.E213S21_C3
public import L5.t.E213S21_C4
public import L5.t.E213S21_C5
public import L5.t.E213S21_C6
public import L5.t.E213S21_C7
public import L5.t.E213S21_C8
public import L5.t.E213S21_C9
public import L5.t.E213S21_C10
public import L5.t.E213S21_C11
public import L5.t.E213S21_C12
public import L5.t.E213S21_C13
public import L5.t.E213S21_C14
public import L5.t.E213S21_C15
public import L5.t.E213S21_C16
public import L5.t.E213S21_C17
public import L5.t.E213S21_C18
public import L5.t.E213S21_C19
public import L5.t.E213S21_C20
public import L5.t.E213S21_C21
public import L5.t.E213S21_C22
public import L5.t.E213S21_C23
public import L5.t.E213S21_C24
public import L5.t.E213S21_C25
public import L5.t.E213S21_C26
public import L5.t.E213S21_C27
public import L5.t.E213S21_C28
public import L5.t.E213S21_C29
public import L5.t.E213S21_C30
public import L5.t.E213S21_C31
public import L5.t.E213S21_C32
public import L5.t.E213S21_C33
public import L5.t.E213S21_C34
public import L5.t.E213S21_C35
public import L5.t.E213S21_C36
public import L5.t.E213S21_C37
public import L5.t.E213S21_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S21
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1733 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1733 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 41 39 m0 587 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 80 4 m0 587 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 84 1 m0 587 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 85 19 m0 1326 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 124 m0 = true :=
    chunkT_join _ _ _ 0 104 20 m0 1326 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 149 m0 = true :=
    chunkT_join _ _ _ 0 124 25 m0 1326 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 151 m0 = true :=
    chunkT_join _ _ _ 0 149 2 m0 1326 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 152 m0 = true :=
    chunkT_join _ _ _ 0 151 1 m0 1326 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 169 m0 = true :=
    chunkT_join _ _ _ 0 152 17 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 169 10 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 179 21 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 250 m0 = true :=
    chunkT_join _ _ _ 0 200 50 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 314 m0 = true :=
    chunkT_join _ _ _ 0 250 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 348 m0 = true :=
    chunkT_join _ _ _ 0 314 34 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 348 23 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 371 63 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 498 m0 = true :=
    chunkT_join _ _ _ 0 434 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 562 m0 = true :=
    chunkT_join _ _ _ 0 498 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 626 m0 = true :=
    chunkT_join _ _ _ 0 562 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 690 m0 = true :=
    chunkT_join _ _ _ 0 626 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 754 m0 = true :=
    chunkT_join _ _ _ 0 690 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 818 m0 = true :=
    chunkT_join _ _ _ 0 754 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 882 m0 = true :=
    chunkT_join _ _ _ 0 818 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 946 m0 = true :=
    chunkT_join _ _ _ 0 882 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1010 m0 = true :=
    chunkT_join _ _ _ 0 946 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1074 m0 = true :=
    chunkT_join _ _ _ 0 1010 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1138 m0 = true :=
    chunkT_join _ _ _ 0 1074 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1202 m0 = true :=
    chunkT_join _ _ _ 0 1138 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1266 m0 = true :=
    chunkT_join _ _ _ 0 1202 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1330 m0 = true :=
    chunkT_join _ _ _ 0 1266 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1394 m0 = true :=
    chunkT_join _ _ _ 0 1330 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1458 m0 = true :=
    chunkT_join _ _ _ 0 1394 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1522 m0 = true :=
    chunkT_join _ _ _ 0 1458 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1586 m0 = true :=
    chunkT_join _ _ _ 0 1522 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1650 m0 = true :=
    chunkT_join _ _ _ 0 1586 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1714 m0 = true :=
    chunkT_join _ _ _ 0 1650 64 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1733 m0 = true :=
    chunkT_join _ _ _ 0 1714 19 m0 1733 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  exact h37
/-- **the leaf has no decomposition** (nested split leaf: main record and 1733 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S21
#print axioms E213S21.leaf
