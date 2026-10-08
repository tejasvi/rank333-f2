module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S90_C0
public import L5.t.E218S90_C1
public import L5.t.E218S90_C2
public import L5.t.E218S90_C3
public import L5.t.E218S90_C4
public import L5.t.E218S90_C5
public import L5.t.E218S90_C6
public import L5.t.E218S90_C7
public import L5.t.E218S90_C8
public import L5.t.E218S90_C9
public import L5.t.E218S90_C10
public import L5.t.E218S90_C11
public import L5.t.E218S90_C12
public import L5.t.E218S90_C13
public import L5.t.E218S90_C14
public import L5.t.E218S90_C15
public import L5.t.E218S90_C16
public import L5.t.E218S90_C17
public import L5.t.E218S90_C18
public import L5.t.E218S90_C19
public import L5.t.E218S90_C20
public import L5.t.E218S90_C21
public import L5.t.E218S90_C22
public import L5.t.E218S90_C23
public import L5.t.E218S90_C24
public import L5.t.E218S90_C25
public import L5.t.E218S90_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S90
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 616 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 18 5 m0 215 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 23 19 m0 215 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 42 3 m0 215 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 45 1 m0 215 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 46 3 m0 564 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 49 14 m0 564 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 63 28 m0 564 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 91 7 m0 564 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 98 1 m0 564 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 99 9 m0 616 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 127 m0 = true :=
    chunkT_join _ _ _ 0 108 19 m0 616 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 137 m0 = true :=
    chunkT_join _ _ _ 0 127 10 m0 616 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 143 m0 = true :=
    chunkT_join _ _ _ 0 137 6 m0 616 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 171 m0 = true :=
    chunkT_join _ _ _ 0 143 28 m0 616 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 171 1 m0 616 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 172 3 m0 616 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 197 m0 = true :=
    chunkT_join _ _ _ 0 175 22 m0 616 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 197 17 m0 616 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 278 m0 = true :=
    chunkT_join _ _ _ 0 214 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 342 m0 = true :=
    chunkT_join _ _ _ 0 278 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 406 m0 = true :=
    chunkT_join _ _ _ 0 342 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 470 m0 = true :=
    chunkT_join _ _ _ 0 406 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 534 m0 = true :=
    chunkT_join _ _ _ 0 470 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 598 m0 = true :=
    chunkT_join _ _ _ 0 534 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true :=
    chunkT_join _ _ _ 0 598 18 m0 616 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  exact h25
/-- **the leaf has no decomposition** (nested split leaf: main record and 616 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S90
#print axioms E218S90.leaf
