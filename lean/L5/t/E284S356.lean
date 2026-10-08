module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S356_C0
public import L5.t.E284S356_C1
public import L5.t.E284S356_C2
public import L5.t.E284S356_C3
public import L5.t.E284S356_C4
public import L5.t.E284S356_C5
public import L5.t.E284S356_C6
public import L5.t.E284S356_C7
public import L5.t.E284S356_C8
public import L5.t.E284S356_C9
public import L5.t.E284S356_C10
public import L5.t.E284S356_C11
public import L5.t.E284S356_C12
public import L5.t.E284S356_C13
public import L5.t.E284S356_C14
public import L5.t.E284S356_C15
public import L5.t.E284S356_C16
public import L5.t.E284S356_C17
public import L5.t.E284S356_C18
public import L5.t.E284S356_C19
public import L5.t.E284S356_C20
public import L5.t.E284S356_C21
public import L5.t.E284S356_C22
public import L5.t.E284S356_C23
public import L5.t.E284S356_C24
public import L5.t.E284S356_C25
public import L5.t.E284S356_C26
public import L5.t.E284S356_C27
public import L5.t.E284S356_C28
public import L5.t.E284S356_C29
public import L5.t.E284S356_C30
public import L5.t.E284S356_C31
public import L5.t.E284S356_C32
public import L5.t.E284S356_C33
public import L5.t.E284S356_C34
public import L5.t.E284S356_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S356
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1670 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1670 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 43 34 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 77 64 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 141 64 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 269 m0 = true :=
    chunkT_join _ _ _ 0 205 64 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 333 m0 = true :=
    chunkT_join _ _ _ 0 269 64 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 363 m0 = true :=
    chunkT_join _ _ _ 0 333 30 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 363 21 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 384 1 m0 1266 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 388 m0 = true :=
    chunkT_join _ _ _ 0 385 3 m0 1468 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 388 1 m0 1468 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 401 m0 = true :=
    chunkT_join _ _ _ 0 389 12 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 401 9 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 427 m0 = true :=
    chunkT_join _ _ _ 0 410 17 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 449 m0 = true :=
    chunkT_join _ _ _ 0 427 22 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 513 m0 = true :=
    chunkT_join _ _ _ 0 449 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 577 m0 = true :=
    chunkT_join _ _ _ 0 513 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 641 m0 = true :=
    chunkT_join _ _ _ 0 577 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 705 m0 = true :=
    chunkT_join _ _ _ 0 641 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 745 m0 = true :=
    chunkT_join _ _ _ 0 705 40 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 809 m0 = true :=
    chunkT_join _ _ _ 0 745 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 873 m0 = true :=
    chunkT_join _ _ _ 0 809 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 937 m0 = true :=
    chunkT_join _ _ _ 0 873 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1001 m0 = true :=
    chunkT_join _ _ _ 0 937 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1065 m0 = true :=
    chunkT_join _ _ _ 0 1001 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1129 m0 = true :=
    chunkT_join _ _ _ 0 1065 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1193 m0 = true :=
    chunkT_join _ _ _ 0 1129 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1257 m0 = true :=
    chunkT_join _ _ _ 0 1193 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1321 m0 = true :=
    chunkT_join _ _ _ 0 1257 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1385 m0 = true :=
    chunkT_join _ _ _ 0 1321 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1449 m0 = true :=
    chunkT_join _ _ _ 0 1385 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1513 m0 = true :=
    chunkT_join _ _ _ 0 1449 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1577 m0 = true :=
    chunkT_join _ _ _ 0 1513 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1641 m0 = true :=
    chunkT_join _ _ _ 0 1577 64 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1670 m0 = true :=
    chunkT_join _ _ _ 0 1641 29 m0 1670 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  exact h34
/-- **the leaf has no decomposition** (nested split leaf: main record and 1670 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S356
#print axioms E284S356.leaf
