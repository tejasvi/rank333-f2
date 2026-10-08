module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S128_C0
public import L5.t.E236S128_C1
public import L5.t.E236S128_C2
public import L5.t.E236S128_C3
public import L5.t.E236S128_C4
public import L5.t.E236S128_C5
public import L5.t.E236S128_C6
public import L5.t.E236S128_C7
public import L5.t.E236S128_C8
public import L5.t.E236S128_C9
public import L5.t.E236S128_C10
public import L5.t.E236S128_C11
public import L5.t.E236S128_C12
public import L5.t.E236S128_C13
public import L5.t.E236S128_C14
public import L5.t.E236S128_C15
public import L5.t.E236S128_C16
public import L5.t.E236S128_C17
public import L5.t.E236S128_C18
public import L5.t.E236S128_C19
public import L5.t.E236S128_C20
public import L5.t.E236S128_C21
public import L5.t.E236S128_C22
public import L5.t.E236S128_C23
public import L5.t.E236S128_C24
public import L5.t.E236S128_C25
public import L5.t.E236S128_C26
public import L5.t.E236S128_C27
public import L5.t.E236S128_C28
public import L5.t.E236S128_C29
public import L5.t.E236S128_C30
public import L5.t.E236S128_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S128
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 398 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 6 2 m0 195 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 8 1 m0 195 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 9 2 m0 319 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 319 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 12 6 m0 319 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 18 7 m0 319 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 25 9 m0 319 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 34 8 m0 319 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 42 12 m0 319 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 54 6 m0 319 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 60 4 m0 319 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 64 1 m0 319 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 65 2 m0 368 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 67 8 m0 368 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 75 19 m0 368 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 106 m0 = true :=
    chunkT_join _ _ _ 0 94 12 m0 368 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 106 9 m0 368 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 120 m0 = true :=
    chunkT_join _ _ _ 0 115 5 m0 368 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 120 1 m0 368 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 131 m0 = true :=
    chunkT_join _ _ _ 0 121 10 m0 398 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 137 m0 = true :=
    chunkT_join _ _ _ 0 131 6 m0 398 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 137 5 m0 398 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 145 m0 = true :=
    chunkT_join _ _ _ 0 142 3 m0 398 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 157 m0 = true :=
    chunkT_join _ _ _ 0 145 12 m0 398 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 157 18 m0 398 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 175 15 m0 398 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 190 22 m0 398 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 276 m0 = true :=
    chunkT_join _ _ _ 0 212 64 m0 398 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 340 m0 = true :=
    chunkT_join _ _ _ 0 276 64 m0 398 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true :=
    chunkT_join _ _ _ 0 340 58 m0 398 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  exact h30
/-- **the leaf has no decomposition** (nested split leaf: main record and 398 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S128
#print axioms E236S128.leaf
