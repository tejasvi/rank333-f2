module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S310_C0
public import L5.t.E284S310_C1
public import L5.t.E284S310_C2
public import L5.t.E284S310_C3
public import L5.t.E284S310_C4
public import L5.t.E284S310_C5
public import L5.t.E284S310_C6
public import L5.t.E284S310_C7
public import L5.t.E284S310_C8
public import L5.t.E284S310_C9
public import L5.t.E284S310_C10
public import L5.t.E284S310_C11
public import L5.t.E284S310_C12
public import L5.t.E284S310_C13
public import L5.t.E284S310_C14
public import L5.t.E284S310_C15
public import L5.t.E284S310_C16
public import L5.t.E284S310_C17
public import L5.t.E284S310_C18
public import L5.t.E284S310_C19
public import L5.t.E284S310_C20
public import L5.t.E284S310_C21
public import L5.t.E284S310_C22
public import L5.t.E284S310_C23
public import L5.t.E284S310_C24
public import L5.t.E284S310_C25
public import L5.t.E284S310_C26
public import L5.t.E284S310_C27
public import L5.t.E284S310_C28
public import L5.t.E284S310_C29
public import L5.t.E284S310_C30
public import L5.t.E284S310_C31
public import L5.t.E284S310_C32
public import L5.t.E284S310_C33
public import L5.t.E284S310_C34
public import L5.t.E284S310_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S310
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1359 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1359 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 21 29 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 50 4 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 54 5 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 59 6 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 70 m0 = true :=
    chunkT_join _ _ _ 0 65 5 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 70 11 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 81 13 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 109 m0 = true :=
    chunkT_join _ _ _ 0 94 15 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 160 m0 = true :=
    chunkT_join _ _ _ 0 109 51 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 160 16 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 215 m0 = true :=
    chunkT_join _ _ _ 0 176 39 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 279 m0 = true :=
    chunkT_join _ _ _ 0 215 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 323 m0 = true :=
    chunkT_join _ _ _ 0 279 44 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 333 m0 = true :=
    chunkT_join _ _ _ 0 323 10 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 344 m0 = true :=
    chunkT_join _ _ _ 0 333 11 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 360 m0 = true :=
    chunkT_join _ _ _ 0 344 16 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 360 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 488 m0 = true :=
    chunkT_join _ _ _ 0 424 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 552 m0 = true :=
    chunkT_join _ _ _ 0 488 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 612 m0 = true :=
    chunkT_join _ _ _ 0 552 60 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 639 m0 = true :=
    chunkT_join _ _ _ 0 612 27 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 703 m0 = true :=
    chunkT_join _ _ _ 0 639 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 767 m0 = true :=
    chunkT_join _ _ _ 0 703 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 831 m0 = true :=
    chunkT_join _ _ _ 0 767 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 884 m0 = true :=
    chunkT_join _ _ _ 0 831 53 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 908 m0 = true :=
    chunkT_join _ _ _ 0 884 24 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 972 m0 = true :=
    chunkT_join _ _ _ 0 908 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1036 m0 = true :=
    chunkT_join _ _ _ 0 972 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1100 m0 = true :=
    chunkT_join _ _ _ 0 1036 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1164 m0 = true :=
    chunkT_join _ _ _ 0 1100 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1228 m0 = true :=
    chunkT_join _ _ _ 0 1164 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1292 m0 = true :=
    chunkT_join _ _ _ 0 1228 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1356 m0 = true :=
    chunkT_join _ _ _ 0 1292 64 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1359 m0 = true :=
    chunkT_join _ _ _ 0 1356 3 m0 1359 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  exact h34
/-- **the leaf has no decomposition** (nested split leaf: main record and 1359 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S310
#print axioms E284S310.leaf
